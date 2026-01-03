---
layout: componentLayout
title: Hero Sections - Flowbite Svelte Blocks
breadcrumb_title: Hero Sections
component_title: Hero
dir: Blocks
description: Use these hero section components to showcase the most important content of your website including headlines, CTAs, and multimedia elements
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/hero';
</script>

Hero sections are the first thing visitors see when landing on your website. They should immediately communicate your value proposition and encourage users to take action. These components are built using Flowbite Svelte and Tailwind CSS.

## Default hero

A clean, centered hero section with headline, description, and dual call-to-action buttons. Perfect for landing pages and product showcases.

```svelte example
{#include Default.svelte}
```

## Hero with image

Side-by-side layout featuring a large hero image alongside compelling copy. Ideal for product launches and feature highlights.

```svelte example
{#include WithImage.svelte}
```

## Centered hero

A symmetrical, centered layout that works well for minimalist designs and app landing pages.

```svelte example
{#include Centered.svelte}
```

## Split hero

A two-column layout that divides content and visuals equally, creating visual balance and hierarchy.

```svelte example
{#include Split.svelte}
```

## Hero with badge

Features a promotional badge or tag above the headline to highlight special offers, new features, or announcements.

```svelte example
{#include WithBadge.svelte}
```

## Hero with video

Includes an embedded video player for product demos, explainer videos, or promotional content.

```svelte example
{#include WithVideo.svelte}
```

## Gradient hero

Uses gradient backgrounds for a modern, eye-catching appearance that stands out from traditional designs.

```svelte example
{#include Gradient.svelte}
```
