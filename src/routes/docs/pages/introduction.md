---
layout: componentLayout
breadcrumb_title: Svelte UI Components - Eden UI
title: Eden UI - Component Library
component_title: Introduction
dir: Pages
description: Learn more about the free and open-source Eden UI component library and start building modern web applications using native Svelte components based on Tailwind CSS
---

<script lang="ts">
  import { LlmLink } from '../../utils'
</script>

[Eden UI](https://github.com/ao-cyber-systems/eden-ui) is a free and open-source UI component library built with native Svelte components and Tailwind CSS. Developed by AO Cyber Systems, Eden UI provides a comprehensive set of interactive elements for building modern web applications.

This library features hundreds of interactive elements such as navbars, dropdowns, modals, and sidebars all handled by Svelte and based on the utility classes from Tailwind CSS.

## Getting started

Learn how to get started with Eden UI by following the quickstart guide and start leveraging the interactive Svelte components coupled with Tailwind CSS.

### Using SvelteKit

You can install SvelteKit or Svelte to start your app. For SvelteKit:

```bash example
// install tailwindcss as well
npx sv create my-app
cd my-app
pnpm install
```

### Using Svelte

If you want to get started with Svelte:

```bash
npm create vite@latest myapp -- --template svelte
cd myapp
pnpm install
```

#### Install Tailwind CSS

If your svelte project doesn't have `tailwindcss` installed, install it using NPM:

```bash
npx sv add tailwindcss
pnpm install
```

Run a local development server by running:

```bash
pnpm dev
```

### Install Eden UI

Run the following command to install Eden UI:

```sh
pnpm i -D eden-ui
```

### Configuration

Update your main CSS file to support Tailwind CSS and Eden UI. You can also customize the primary color by modifying the appropriate color values.

#### SvelteKit Projects

The location of your main CSS file determines the correct path for `@source` directives:

**If your CSS file is at `src/app.css`:**

```css
@import "tailwindcss";

@plugin "eden-ui/plugins/eden-plugin";

@custom-variant dark (&:where(.dark, .dark *));

@theme {
  --color-primary-50: #fff5f2;
  --color-primary-100: #fff1ee;
  --color-primary-200: #ffe4de;
  --color-primary-300: #ffd5cc;
  --color-primary-400: #ffbcad;
  --color-primary-500: #fe795d;
  --color-primary-600: #ef562f;
  --color-primary-700: #eb4f27;
  --color-primary-800: #cc4522;
  --color-primary-900: #a5371b;

  --color-secondary-50: #f0f9ff;
  --color-secondary-100: #e0f2fe;
  --color-secondary-200: #bae6fd;
  --color-secondary-300: #7dd3fc;
  --color-secondary-400: #38bdf8;
  --color-secondary-500: #0ea5e9;
  --color-secondary-600: #0284c7;
  --color-secondary-700: #0369a1;
  --color-secondary-800: #075985;
  --color-secondary-900: #0c4a6e;
}

@source "../node_modules/eden-ui/dist";

@layer base {
  /* disable chrome cancel button */
  input[type="search"]::-webkit-search-cancel-button {
    display: none;
  }
}
```

**If your CSS file is at `src/routes/+layout.css`:**
```css
@import "tailwindcss";

@plugin "eden-ui/plugins/eden-plugin";

@custom-variant dark (&:where(.dark, .dark *));

@theme {
  --color-primary-50: #fff5f2;
  --color-primary-100: #fff1ee;
  --color-primary-200: #ffe4de;
  --color-primary-300: #ffd5cc;
  --color-primary-400: #ffbcad;
  --color-primary-500: #fe795d;
  --color-primary-600: #ef562f;
  --color-primary-700: #eb4f27;
  --color-primary-800: #cc4522;
  --color-primary-900: #a5371b;

  --color-secondary-50: #f0f9ff;
  --color-secondary-100: #e0f2fe;
  --color-secondary-200: #bae6fd;
  --color-secondary-300: #7dd3fc;
  --color-secondary-400: #38bdf8;
  --color-secondary-500: #0ea5e9;
  --color-secondary-600: #0284c7;
  --color-secondary-700: #0369a1;
  --color-secondary-800: #075985;
  --color-secondary-900: #0c4a6e;
}

@source "../../node_modules/eden-ui/dist";

@layer base {
  /* disable chrome cancel button */
  input[type="search"]::-webkit-search-cancel-button {
    display: none;
  }
}
```

> **Note:** The `@source` directive tells Tailwind CSS v4 to scan these directories for utility classes. The path is relative to your CSS file location:
> - `src/app.css` → one level up to root (`../`)
> - `src/routes/+layout.css` → two levels up to root (`../../`)

#### Other Project Types

For non-SvelteKit projects (Vite, Svelte standalone, etc.), adjust the path based on your CSS file location relative to `node_modules`.

Now you should be able to work with Eden UI and import components such as the navbar, dropdown, modal, and more.

## Svelte

Svelte is a modern and growing front-end compiler. Developers build boilerplate-free components using languages HTML, CSS and JavaScript. Svelte compiles your code to tiny, framework-less vanilla JS.

## Tailwind CSS

Eden UI leverages the utility classes from the popular [Tailwind CSS](https://tailwindcss.com) framework allowing greater customization capabilities directly from a component level in Svelte.

## UI Components

Eden UI has a rich collection of commonly used components coded with Svelte that leverage the utility classes from Tailwind CSS and you can check out the full list of components by navigating through the components section in the sidebar on the left side of the page.

## Contributing

Eden UI is a free and open-source UI component library built with Svelte native components and contributions are more than welcome.

Check out [contributing guide](/docs/pages/how-to-contribute) to learn how you can be a part of the open-source community.

## License

Eden UI is a free and open-source UI component library licensed under the [MIT License](https://github.com/ao-cyber-systems/eden-ui/blob/main/LICENSE).

## LLM Link

<LlmLink />
