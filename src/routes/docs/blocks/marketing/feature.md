---
layout: componentLayout
title: Feature Sections - Flowbite Svelte Blocks
breadcrumb_title: Feature Sections
component_title: Feature
dir: Blocks
description: Showcase your product or service features with these versatile section components using icons, images, and descriptive content
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/feature';
</script>

Feature sections help communicate the benefits and capabilities of your product or service. These components use icons, images, and structured layouts to present information clearly and engagingly.

## Default features

A grid-based layout displaying multiple features with icons and descriptions.

```svelte example
{#include Default.svelte}
```

## Feature with image

Features an image alongside feature cards for visual context and appeal.

```svelte example
{#include WithImage.svelte}
```

## Centered features

A symmetrical, centered layout ideal for highlighting key selling points.

```svelte example
{#include Centered.svelte}
```

## Feature cards

Card-based layout with hover effects and visual depth for interactive feel.

```svelte example
{#include Cards.svelte}
```

## Alternating features

An alternating left-right layout that creates visual rhythm and engagement.

```svelte example
{#include Alternating.svelte}
```

## Timeline features

A vertical timeline layout perfect for showcasing processes, roadmaps, or historical progressions.

```svelte example
{#include Timeline.svelte}
```
