---
layout: componentLayout
title: Blog Sections - Flowbite Svelte Blocks
breadcrumb_title: Blog Sections
component_title: Blog
dir: Blocks
description: Blog listing and article preview components with featured posts, categories, and author information
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/blog';
</script>

Blog sections display article previews and help visitors discover your content. These components support featured posts, categories, author information, and various layout options to match your content strategy.

## Default blog

A grid layout displaying blog post previews with images and excerpts.

```svelte example
{#include Default.svelte}
```

## Blog cards

Card-based layout with enhanced visual styling and hover effects.

```svelte example
{#include Cards.svelte}
```

## Featured blog

Highlights a featured post prominently with additional recent articles.

```svelte example
{#include Featured.svelte}
```

## Blog list

A vertical list layout ideal for text-heavy content and archives.

```svelte example
{#include List.svelte}
```
