---
layout: componentLayout
title: Banner Sections - Flowbite Svelte Blocks
breadcrumb_title: Banner Sections
component_title: Banner
dir: Blocks
description: Announcement banners and promotional sections for important messages, cookie consent, and time-sensitive offers
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/banner';
</script>

Banner sections display important announcements, promotional offers, and consent notices. These components are designed to be attention-grabbing while remaining dismissible to maintain user experience.

## Default banner

A simple announcement banner for general messages and updates.

```svelte example
{#include Default.svelte}
```

## Sticky banner

A fixed-position banner that remains visible while scrolling.

```svelte example
{#include Sticky.svelte}
```

## Cookie consent

A GDPR-compliant cookie consent banner with accept/reject options.

```svelte example
{#include CookieConsent.svelte}
```
