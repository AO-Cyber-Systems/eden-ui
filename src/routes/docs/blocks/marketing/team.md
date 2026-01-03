---
layout: componentLayout
title: Team Sections - Flowbite Svelte Blocks
breadcrumb_title: Team Sections
component_title: Team
dir: Blocks
description: Showcase your team members with profile cards featuring photos, roles, social links, and biographical information
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/team';
</script>

Team sections help humanize your brand by introducing the people behind your product or service. These components display team member photos, roles, and social links to build personal connections with visitors.

## Default team

A grid layout displaying team members with photos and basic information.

```svelte example
{#include Default.svelte}
```

## Team cards

Card-based layout with hover effects and detailed member information.

```svelte example
{#include Cards.svelte}
```

## Team with images

Features larger profile images with overlaid text for visual impact.

```svelte example
{#include WithImages.svelte}
```

## Horizontal team

A horizontal layout displaying team members in a row format.

```svelte example
{#include Horizontal.svelte}
```
