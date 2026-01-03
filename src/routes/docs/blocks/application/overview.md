---
layout: componentLayout
title: Application UI Blocks - Flowbite Svelte
breadcrumb_title: Application UI
component_title: Application UI Overview
dir: Blocks
description: Pre-built application interface components for admin panels, dashboards, and web applications
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
</script>

Application UI blocks are pre-built interface components designed for admin panels, dashboards, and web applications. Each block follows best practices for usability and can be integrated into your application with minimal customization.

## Available sections

### Dashboard Widgets
Stats cards, charts, activity feeds, and data visualization components.
- [View Dashboard Widgets](/docs/blocks/application/dashboard)

### CRUD Operations
Complete Create, Read, Update, Delete interfaces for data management.
- [View CRUD Components](/docs/blocks/application/crud)

### Table Layouts
Advanced tables with sorting, filtering, and pagination.
- [View Table Layouts](/docs/blocks/application/tables)

### Sidebar Navigation
Collapsible sidebars with multi-level navigation.
- [View Sidebar Navigation](/docs/blocks/application/sidebar)

### Authentication Pages
Sign in, sign up, password reset, and two-factor authentication.
- [View Authentication Pages](/docs/blocks/application/auth)

### Settings Pages
Profile, account, notifications, security, and billing settings.
- [View Settings Pages](/docs/blocks/application/settings)

## Usage

Import application blocks directly into your Svelte application:

```svelte
<script>
  import StatsCards from './dashboard/StatsCards.svelte';
  import BasicSidebar from './sidebar/BasicSidebar.svelte';
  import ProfileSettings from './settings/ProfileSettings.svelte';
</script>

<BasicSidebar />
<main>
  <StatsCards />
  <ProfileSettings />
</main>
```

## Layout patterns

### Dashboard layout
Combine sidebar navigation with dashboard widgets for a complete admin interface:

```svelte
<script>
  import DashboardLayout from './sidebar/DashboardLayout.svelte';
  import StatsCards from './dashboard/StatsCards.svelte';
  import Charts from './dashboard/Charts.svelte';
  import ActivityFeed from './dashboard/ActivityFeed.svelte';
</script>

<DashboardLayout>
  <StatsCards />
  <Charts />
  <ActivityFeed />
</DashboardLayout>
```

### Settings layout
Organize settings pages with tabbed or sidebar navigation:

```svelte
<script>
  import ProfileSettings from './settings/ProfileSettings.svelte';
  import SecuritySettings from './settings/SecuritySettings.svelte';
  import NotificationSettings from './settings/NotificationSettings.svelte';

  let activeTab = 'profile';
</script>

{#if activeTab === 'profile'}
  <ProfileSettings />
{:else if activeTab === 'security'}
  <SecuritySettings />
{:else if activeTab === 'notifications'}
  <NotificationSettings />
{/if}
```

## Data integration

Application blocks work with any data source. Replace mock data with your API calls:

```svelte
<script>
  import DataTable from './tables/DataTable.svelte';

  let data = $state([]);

  $effect(() => {
    fetch('/api/users')
      .then(res => res.json())
      .then(users => data = users);
  });
</script>

<DataTable {data} />
```

## Customization

Each block uses Tailwind CSS classes and can be customized by:
- Modifying colors to match your brand
- Adjusting layouts for different screen sizes
- Adding additional fields or actions
- Integrating with your state management solution
