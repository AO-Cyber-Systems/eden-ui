---
layout: componentLayout
title: Customer Logos - Flowbite Svelte Blocks
breadcrumb_title: Customer Logos
component_title: Customer Logos
dir: Blocks
description: Display trusted customer and partner logos to build credibility with various layout options
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/customer-logos';
</script>

Customer logo sections showcase the companies and organizations that trust your product or service. These components provide social proof and build credibility with potential customers.

## Default logos

A simple row of customer logos with consistent sizing.

```svelte example
{#include Default.svelte}
```

## Logo grid

A grid layout displaying more logos in an organized format.

```svelte example
{#include Grid.svelte}
```

## Logo carousel

An animated carousel that cycles through customer logos.

```svelte example
{#include Carousel.svelte}
```
