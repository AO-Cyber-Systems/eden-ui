---
layout: componentLayout
title: CRUD Operations - Flowbite Svelte Blocks
breadcrumb_title: CRUD Operations
component_title: CRUD
dir: Blocks
description: Complete Create, Read, Update, and Delete interface components for managing data in admin panels
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/application/crud';
</script>

CRUD (Create, Read, Update, Delete) components provide the essential building blocks for data management interfaces. These components handle the full lifecycle of data operations in admin panels and applications.

## Read - Table view

Display data in a searchable, sortable table format.

```svelte example
{#include ReadTable.svelte}
```

## Read - Card view

Present data items as cards for visual-heavy content.

```svelte example
{#include ReadCards.svelte}
```

## Read - Detail view

A detailed view of a single data item with all fields.

```svelte example
{#include ReadDetail.svelte}
```

## Create - Modal

A modal dialog for creating new data entries.

```svelte example
{#include CreateModal.svelte}
```

## Create - Drawer

A slide-out drawer for the create form.

```svelte example
{#include CreateDrawer.svelte}
```

## Create - Full page

A dedicated page layout for complex create forms.

```svelte example
{#include CreatePage.svelte}
```

## Update - Modal

A modal dialog for editing existing data.

```svelte example
{#include UpdateModal.svelte}
```

## Update - Drawer

A slide-out drawer for editing data.

```svelte example
{#include UpdateDrawer.svelte}
```

## Update - Inline

Inline editing directly within tables or lists.

```svelte example
{#include UpdateInline.svelte}
```

## Delete - Confirmation

A confirmation dialog for single item deletion.

```svelte example
{#include DeleteConfirm.svelte}
```

## Delete - Bulk

Interface for selecting and deleting multiple items.

```svelte example
{#include DeleteBulk.svelte}
```

## Filters and search

Advanced filtering and search components for data tables.

```svelte example
{#include FiltersAndSearch.svelte}
```

## Sort and order

Column sorting and custom ordering controls.

```svelte example
{#include SortAndOrder.svelte}
```

## Pagination

Navigation controls for paginated data sets.

```svelte example
{#include Pagination.svelte}
```

## Empty states

Placeholder content when no data is available.

```svelte example
{#include EmptyStates.svelte}
```

## Bulk actions

Toolbar for actions on multiple selected items.

```svelte example
{#include BulkActions.svelte}
```
