---
layout: componentLayout
title: CTA Sections - Flowbite Svelte Blocks
breadcrumb_title: CTA Sections
component_title: CTA
dir: Blocks
description: Call-to-action sections designed to convert visitors into customers with compelling messaging and prominent action buttons
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/cta';
</script>

Call-to-action (CTA) sections are critical conversion elements that guide users toward desired actions. These components combine persuasive copy with visually prominent buttons to maximize engagement and conversions.

## Default CTA

A centered CTA section with headline, description, and action buttons. Clean and effective for most use cases.

```svelte example
{#include Default.svelte}
```

## CTA with image

Features a supporting image alongside the call-to-action content for added visual impact.

```svelte example
{#include WithImage.svelte}
```

## CTA with form

Includes an inline form (typically email capture) for newsletter signups or lead generation.

```svelte example
{#include WithForm.svelte}
```

## CTA with stats

Incorporates social proof through key metrics and statistics to build credibility.

```svelte example
{#include WithStats.svelte}
```

## Split CTA

A two-column layout that separates content from action elements for visual hierarchy.

```svelte example
{#include Split.svelte}
```

## Minimal CTA

A streamlined, minimalist approach focusing on essential elements only.

```svelte example
{#include Minimal.svelte}
```

## Gradient CTA

Uses gradient backgrounds for a modern, attention-grabbing appearance.

```svelte example
{#include Gradient.svelte}
```
