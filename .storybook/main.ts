import type { StorybookConfig } from '@storybook/sveltekit';

const config: StorybookConfig = {
  stories: [
    // Eden UI component library stories (primary)
    "../src/lib/**/*.stories.@(js|ts|svelte)",
    "../src/lib/**/*.mdx",
    // Example stories (Storybook demo components)
    "../src/stories/*.stories.@(js|ts|svelte)",
    "../src/stories/*.mdx",
  ],
  addons: [
    "@storybook/addon-svelte-csf",
    "@storybook/addon-docs",
    "@storybook/addon-a11y",
    "@chromatic-com/storybook",
    "@storybook/addon-vitest",
  ],
  framework: "@storybook/sveltekit",
  docs: {
    autodocs: 'tag',
  },
};

export default config;