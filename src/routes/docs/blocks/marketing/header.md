---
layout: componentLayout
title: Header Sections - Flowbite Svelte Blocks
breadcrumb_title: Header Sections
component_title: Header
dir: Blocks
description: Navigation header components featuring responsive menus, dropdowns, and search functionality for your website
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/header';
</script>

Header sections provide primary navigation and branding for your website. These components are fully responsive and include mobile menu support, dropdowns, and optional search functionality.

## Default header

A standard navigation header with logo, menu items, and CTA button.

```svelte example
{#include Default.svelte}
```

## Centered header

A symmetrical layout with centered logo and split navigation.

```svelte example
{#include Centered.svelte}
```

## Header with dropdown

Features dropdown menus for multi-level navigation structures.

```svelte example
{#include WithDropdown.svelte}
```

## Header with search

Includes an integrated search bar for content-rich websites.

```svelte example
{#include WithSearch.svelte}
```
