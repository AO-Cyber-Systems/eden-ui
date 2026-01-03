---
layout: componentLayout
title: Content Sections - Flowbite Svelte Blocks
breadcrumb_title: Content Sections
component_title: Content
dir: Blocks
description: Rich content sections featuring text, images, statistics, and media galleries for informative pages
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/content';
</script>

Content sections present detailed information in engaging layouts. These components combine text, images, and statistics to tell your story effectively.

## Default content

A standard content section with heading and rich text.

```svelte example
{#include Default.svelte}
```

## Two-column content

A side-by-side layout balancing text and visual elements.

```svelte example
{#include TwoColumn.svelte}
```

## Content with image

Features a large image alongside descriptive content.

```svelte example
{#include WithImage.svelte}
```

## Stats content

Incorporates key statistics and metrics within the content.

```svelte example
{#include Stats.svelte}
```

## Content gallery

Includes a media gallery within the content section.

```svelte example
{#include Gallery.svelte}
```
