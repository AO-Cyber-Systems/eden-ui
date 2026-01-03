---
layout: componentLayout
breadcrumb_title: Quickstart - Eden UI
title: Quickstart - Eden UI
component_title: Quickstart
dir: Pages
description: Learn how to get started with the free and open-source Eden UI component library based on the utility classes from Tailwind CSS
---

<script lang="ts">
  import { A, P, List, Li } from '$lib'
  import { LlmLink } from '../../utils'
</script>

You can install Eden UI by using the <A href='/docs/extend/eden-ui-starter'>Eden UI starter</A> or from scratch.

## Getting started

Learn how to get started with Eden UI by following the quickstart guide and start leveraging the interactive Svelte components coupled with Tailwind CSS.

### Using SvelteKit

You can install SvelteKit or Svelte to start your app. For SvelteKit:

```bash example
// install tailwindcss also
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

Update your main CSS file to support Tailwind CSS and Eden UI. You can also customize the primary color by modifying the appropriate color values. See more details in the [introduction page](/docs/pages/introduction#configuration).

#### SvelteKit Projects

The location of your main CSS file determines the correct path for `@source` directives:

**If your CSS file is at `src/app.css`:**

```css
@import "tailwindcss";
@plugin "eden-ui/plugins/eden-plugin";
@custom-variant dark (&:where(.dark, .dark *));
/* ... */
@source "../node_modules/eden-ui/dist";
```

**If your CSS file is at `src/routes/+layout.css`:**
```css
@import "tailwindcss";
@plugin "eden-ui/plugins/eden-plugin";
@custom-variant dark (&:where(.dark, .dark *));
/* ... */
@source "../../node_modules/eden-ui/dist";
```

#### Other Project Types

For non-SvelteKit projects (Vite, Svelte standalone, etc.), adjust the path based on your CSS file location relative to `node_modules`.

Now you should be able to work with Eden UI and import components such as the navbar, dropdown, modal, and more.

<div class="h-8" ></div>

Now you are ready to go! Add the following to `src/routes/+page.svelte` and if you see the following image, then your setting is complete.

```svelte example
<script lang="ts">
  import { Alert } from "eden-ui";
</script>

<div class="p-8">
  <Alert>
    <span class="font-medium">Info alert!</span>
    Change a few things up and try submitting again.
  </Alert>
</div>
```

## Starters

You can use one of starter repo for a quick start.

<List tag='ul' class='space-y-1 my-4'>
<Li><A href='https://github.com/ao-cyber-systems/eden-ui-starter'>Eden UI SvelteKit Starter</A></Li>
</List>

## LLM Link

<LlmLink />
