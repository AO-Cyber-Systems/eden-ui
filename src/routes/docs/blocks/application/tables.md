---
layout: componentLayout
title: Table Layouts - Flowbite Svelte Blocks
breadcrumb_title: Table Layouts
component_title: Tables
dir: Blocks
description: Advanced table components with sorting, filtering, pagination, and responsive designs for data display
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/application/tables';
</script>

Table components display structured data in rows and columns. These layouts provide various styles and features for different data presentation needs.

## Basic table

A simple table with headers, rows, and basic styling.

```svelte example
{#include BasicTable.svelte}
```

## Striped table

Alternating row colors for improved readability.

```svelte example
{#include StripedTable.svelte}
```

## Hoverable table

Row highlighting on hover for interactive feel.

```svelte example
{#include HoverableTable.svelte}
```

## Data table

Full-featured table with search, sort, and pagination.

```svelte example
{#include DataTable.svelte}
```

## Advanced table

Complex table with inline actions, status badges, and expandable rows.

```svelte example
{#include AdvancedTable.svelte}
```
