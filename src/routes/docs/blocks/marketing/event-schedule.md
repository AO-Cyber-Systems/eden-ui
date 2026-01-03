---
layout: componentLayout
title: Event Schedule - Flowbite Svelte Blocks
breadcrumb_title: Event Schedule
component_title: Event Schedule
dir: Blocks
description: Display conference agendas, meeting schedules, and event timelines with organized layouts
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/event-schedule';
</script>

Event schedule sections help attendees understand when and where activities take place. These components organize time-based information clearly and accessibly.

## Default schedule

A timeline-based schedule showing events in chronological order.

```svelte example
{#include Default.svelte}
```

## Grid schedule

A grid layout organizing events by time and track/location.

```svelte example
{#include Grid.svelte}
```

## Multi-day schedule

A tabbed layout for events spanning multiple days.

```svelte example
{#include MultiDay.svelte}
```
