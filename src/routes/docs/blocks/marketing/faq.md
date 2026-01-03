---
layout: componentLayout
title: FAQ Sections - Flowbite Svelte Blocks
breadcrumb_title: FAQ Sections
component_title: FAQ
dir: Blocks
description: Frequently asked questions sections with accordion layouts and categorized content to help users find answers quickly
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/faq';
</script>

FAQ sections reduce support burden by proactively answering common questions. These components use expandable accordions and organized categories to help users find information quickly.

## Default FAQ

A simple accordion-based FAQ section with expandable answers.

```svelte example
{#include Default.svelte}
```

## Two-column FAQ

A side-by-side layout displaying more questions in less vertical space.

```svelte example
{#include TwoColumn.svelte}
```

## Categorized FAQ

Questions organized by category with tabbed or sectioned navigation.

```svelte example
{#include Categorized.svelte}
```

## FAQ with sidebar

Features a sidebar navigation for quick access to different question categories.

```svelte example
{#include WithSidebar.svelte}
```
