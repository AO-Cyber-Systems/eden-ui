---
layout: componentLayout
title: Sidebar Navigation - Flowbite Svelte Blocks
breadcrumb_title: Sidebar Navigation
component_title: Sidebar
dir: Blocks
description: Sidebar navigation components with collapsible menus, icons, and multi-level navigation for admin layouts
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/application/sidebar';
</script>

Sidebar navigation provides the primary navigation structure for admin panels and applications. These components support icons, nested menus, and responsive behavior.

## Basic sidebar

A simple sidebar with icon-based navigation links.

```svelte example
{#include BasicSidebar.svelte}
```

## Multi-level sidebar

Expandable menu sections for organizing complex navigation.

```svelte example
{#include MultiLevelSidebar.svelte}
```

## Collapsible sidebar

A sidebar that collapses to icons only for more screen space.

```svelte example
{#include CollapsibleSidebar.svelte}
```

## Icon sidebar

A compact icon-only sidebar with tooltips on hover.

```svelte example
{#include IconSidebar.svelte}
```

## Dashboard layout

Complete dashboard layout with sidebar, navbar, and content area.

```svelte example
{#include DashboardLayout.svelte}
```
