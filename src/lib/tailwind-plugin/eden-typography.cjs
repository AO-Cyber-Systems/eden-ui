// @ts-nocheck
/**
 * Eden UI - Typography Plugin
 *
 * A Tailwind CSS plugin for beautiful typographic defaults.
 * Originally extracted from flowbite-typography (fork of @tailwindcss/typography).
 *
 * Usage:
 *   Add the `format` class to any block of HTML content to apply
 *   typographic styles. Supports size variants (format-sm, format-lg)
 *   and color themes (format-blue, format-red, etc.).
 *
 * This is a Tailwind v3 plugin - TypeScript checking is disabled for
 * compatibility with runtime usage.
 *
 * @module eden-typography
 * @license MIT
 */

const plugin = require('tailwindcss/plugin');
const merge = require('lodash.merge');
const castArray = require('lodash.castarray');
const styles = require('./typography-styles');

const computed = {
    // Reserved for future "magic properties"
    // Example: bulletColor: (color) => ({ 'ul > li::before': { backgroundColor: color } }),
};

function inWhere(selector, { className, prefix }) {
    let prefixedNot = prefix(`.not-${className}`).slice(1);
    let selectorPrefix = selector.startsWith('>') ? `.${className} ` : '';

    if (selector.endsWith('::before')) {
        return `:where(${selectorPrefix}${selector.slice(0, -8)}):not(:where([class~="${prefixedNot}"] *))::before`;
    }

    if (selector.endsWith('::after')) {
        return `:where(${selectorPrefix}${selector.slice(0, -7)}):not(:where([class~="${prefixedNot}"] *))::after`;
    }

    if (selector.endsWith('::marker')) {
        return `:where(${selectorPrefix}${selector.slice(0, -8)}):not(:where([class~="${prefixedNot}"] *))::marker`;
    }

    return `:where(${selectorPrefix}${selector}):not(:where([class~="${prefixedNot}"] *))`;
}

function isObject(value) {
    return typeof value === 'object' && value !== null;
}

function configToCss(config = {}, { target, className, prefix }) {
    function updateSelector(k, v) {
        if (target === 'legacy') {
            return [k, v];
        }

        if (Array.isArray(v)) {
            return [k, v];
        }

        if (isObject(v)) {
            let nested = Object.values(v).some(isObject);
            if (nested) {
                return [
                    inWhere(k, { className, prefix }),
                    v,
                    Object.fromEntries(Object.entries(v).map(([k, v]) => updateSelector(k, v))),
                ];
            }

            return [inWhere(k, { className, prefix }), v];
        }

        return [k, v];
    }

    return Object.fromEntries(
        Object.entries(
            merge(
                {},
                ...Object.keys(config)
                    .filter((key) => computed[key])
                    .map((key) => computed[key](config[key])),
                ...castArray(config.css || {})
            )
        ).map(([k, v]) => updateSelector(k, v))
    );
}

module.exports = plugin.withOptions(
    ({ className = 'format', target = 'modern' } = {}) => {
        return function ({ addVariant, addComponents, theme, prefix }) {
            let modifiers = theme('typography');

            let options = { className, prefix };

            // Add element-specific variants for targeting prose elements
            for (let [name, ...selectors] of [
                ['headings', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'th'],
                ['h1'],
                ['h2'],
                ['h3'],
                ['h4'],
                ['h5'],
                ['h6'],
                ['p'],
                ['a'],
                ['blockquote'],
                ['figure'],
                ['figcaption'],
                ['strong'],
                ['em'],
                ['code'],
                ['pre'],
                ['ol'],
                ['ul'],
                ['li'],
                ['table'],
                ['thead'],
                ['tr'],
                ['th'],
                ['td'],
                ['img'],
                ['video'],
                ['hr'],
                ['lead', '[class~="lead"]'],
            ]) {
                selectors = selectors.length === 0 ? [name] : selectors;

                let selector =
                    target === 'legacy'
                        ? selectors.map((selector) => `& ${selector}`)
                        : selectors.join(', ');

                addVariant(
                    `${className}-${name}`,
                    target === 'legacy' ? selector : `& :is(${inWhere(selector, options)})`
                );
            }

            // Add typography components for each modifier
            addComponents(
                Object.keys(modifiers).map((modifier) => ({
                    [modifier === 'DEFAULT' ? `.${className}` : `.${className}-${modifier}`]:
                        configToCss(modifiers[modifier], {
                            target,
                            className,
                            prefix,
                        }),
                }))
            );
        };
    },
    () => {
        return {
            theme: { typography: styles },
        };
    }
);
