---
layout: componentLayout
title: Social Proof - Flowbite Svelte Blocks
breadcrumb_title: Social Proof
component_title: Social Proof
dir: Blocks
description: Build trust with social proof sections featuring user counts, ratings, reviews, and endorsements
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/social-proof';
</script>

Social proof sections demonstrate that others trust and use your product. These components display metrics, user counts, and endorsements to encourage new users to take action.

## Default social proof

A combined section with ratings, reviews, and user avatars.

```svelte example
{#include Default.svelte}
```

## Stats social proof

Focuses on impressive numbers and key metrics.

```svelte example
{#include Stats.svelte}
```

## Social proof with avatars

Displays user avatars to show real people using your product.

```svelte example
{#include WithAvatars.svelte}
```
