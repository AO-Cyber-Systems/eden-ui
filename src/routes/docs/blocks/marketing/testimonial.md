---
layout: componentLayout
title: Testimonial Sections - Flowbite Svelte Blocks
breadcrumb_title: Testimonial Sections
component_title: Testimonial
dir: Blocks
description: Build trust and credibility with testimonial components featuring customer quotes, ratings, and social proof elements
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/testimonial';
</script>

Testimonial sections provide social proof by showcasing positive feedback from satisfied customers. These components help build trust and credibility, which are crucial for converting potential customers.

## Default testimonials

A grid layout displaying multiple customer testimonials with avatars and ratings.

```svelte example
{#include Default.svelte}
```

## Featured testimonial

A prominent, single testimonial design perfect for highlighting key customer success stories.

```svelte example
{#include Featured.svelte}
```

## Testimonial carousel

A rotating carousel displaying testimonials one at a time with navigation controls.

```svelte example
{#include Carousel.svelte}
```

## Testimonials with logos

Combines customer testimonials with company logos for enhanced credibility.

```svelte example
{#include WithLogos.svelte}
```
