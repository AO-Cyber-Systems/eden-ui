---
layout: componentLayout
title: Portfolio Sections - Flowbite Svelte Blocks
breadcrumb_title: Portfolio Sections
component_title: Portfolio
dir: Blocks
description: Showcase projects and work samples with gallery layouts, filtering, and lightbox functionality
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/portfolio';
</script>

Portfolio sections display your best work and past projects. These components help potential clients or employers understand your capabilities through visual examples.

## Default portfolio

A grid layout displaying project thumbnails with hover overlays.

```svelte example
{#include Default.svelte}
```

## Portfolio cards

Card-based layout with project details and hover effects.

```svelte example
{#include Cards.svelte}
```

## Masonry portfolio

A Pinterest-style masonry layout for varied image sizes.

```svelte example
{#include Masonry.svelte}
```
