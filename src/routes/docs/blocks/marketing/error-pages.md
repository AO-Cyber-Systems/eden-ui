---
layout: componentLayout
title: Error Pages - Flowbite Svelte Blocks
breadcrumb_title: Error Pages
component_title: Error Pages
dir: Blocks
description: Error and status page components including 404, 500, maintenance mode, and coming soon pages
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/error';
</script>

Error pages provide a better user experience when something goes wrong. These components help users understand what happened and guide them back to working content.

## 404 Not Found

A page displayed when the requested content cannot be found.

```svelte example
{#include 404.svelte}
```

## 403 Forbidden

Displayed when the user lacks permission to access the resource.

```svelte example
{#include 403.svelte}
```

## 500 Server Error

Shown when an internal server error occurs.

```svelte example
{#include 500.svelte}
```

## Maintenance page

A friendly page for scheduled downtime and system maintenance.

```svelte example
{#include Maintenance.svelte}
```

## Coming soon

A teaser page for upcoming features or launches with email capture.

```svelte example
{#include ComingSoon.svelte}
```

## Error with illustration

Features custom illustrations for a more engaging error experience.

```svelte example
{#include Illustration.svelte}
```
