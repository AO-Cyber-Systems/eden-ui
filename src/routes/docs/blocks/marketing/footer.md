---
layout: componentLayout
title: Footer Sections - Flowbite Svelte Blocks
breadcrumb_title: Footer Sections
component_title: Footer
dir: Blocks
description: Complete your website with professional footer components featuring navigation links, social icons, and legal information
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/footer';
</script>

Footer sections provide essential navigation, contact information, and legal notices at the bottom of your pages. A well-designed footer improves user experience and SEO while maintaining brand consistency.

## Default footer

A comprehensive footer with navigation columns, logo, and copyright notice.

```svelte example
{#include Default.svelte}
```

## Multi-column footer

An expanded footer with multiple navigation columns for large websites.

```svelte example
{#include MultiColumn.svelte}
```

## Footer with newsletter

Includes a newsletter signup form for email list building.

```svelte example
{#include WithNewsletter.svelte}
```

## Footer with social

Features prominent social media links for community engagement.

```svelte example
{#include WithSocial.svelte}
```

## Minimal footer

A streamlined footer for simpler pages or applications.

```svelte example
{#include Minimal.svelte}
```
