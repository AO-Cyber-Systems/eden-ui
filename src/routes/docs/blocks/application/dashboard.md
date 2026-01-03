---
layout: componentLayout
title: Dashboard Widgets - Flowbite Svelte Blocks
breadcrumb_title: Dashboard Widgets
component_title: Dashboard
dir: Blocks
description: Build powerful admin dashboards with stats cards, charts, activity feeds, and data visualization widgets
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/application/dashboard';
</script>

Dashboard widgets provide at-a-glance insights into key metrics and data. These components help administrators and users quickly understand system status, performance, and trends.

## Stats cards

Display key performance indicators with trend indicators and comparisons.

```svelte example
{#include StatsCards.svelte}
```

## Charts

Data visualization components including line, bar, and area charts.

```svelte example
{#include Charts.svelte}
```

## Activity feed

A timeline of recent actions and events within the system.

```svelte example
{#include ActivityFeed.svelte}
```

## Data overview

Summary cards showing aggregated data and quick insights.

```svelte example
{#include DataOverview.svelte}
```

## Progress indicators

Visual progress bars and completion metrics for ongoing tasks.

```svelte example
{#include ProgressIndicators.svelte}
```

## Quick actions

Shortcut buttons and cards for frequently used actions.

```svelte example
{#include QuickActions.svelte}
```
