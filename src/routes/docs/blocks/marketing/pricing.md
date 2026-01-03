---
layout: componentLayout
title: Pricing Sections - Flowbite Svelte Blocks
breadcrumb_title: Pricing Sections
component_title: Pricing
dir: Blocks
description: Display pricing plans and subscription tiers with these flexible pricing table components featuring feature lists and CTAs
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/pricing';
</script>

Pricing sections are essential for SaaS products, subscription services, and any business offering tiered plans. These components clearly present options, highlight recommended plans, and guide users toward conversion.

## Default pricing

A clean three-column pricing table with feature lists and highlighted popular plan.

```svelte example
{#include Default.svelte}
```

## Pricing cards

Card-based layout with visual depth and hover effects for enhanced interactivity.

```svelte example
{#include Cards.svelte}
```

## Pricing with toggle

Includes a monthly/annual billing toggle to show different pricing options.

```svelte example
{#include WithToggle.svelte}
```

## Pricing comparison

A detailed comparison table showing feature availability across all plans.

```svelte example
{#include Comparison.svelte}
```
