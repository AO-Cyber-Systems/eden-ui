<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Application/Dashboard',
    group: 'application'
  };
</script>

<script lang="ts">
  import StatsCards from '../../routes/docs-examples/blocks/application/dashboard/StatsCards.svelte';
  import Charts from '../../routes/docs-examples/blocks/application/dashboard/Charts.svelte';
  import DataOverview from '../../routes/docs-examples/blocks/application/dashboard/DataOverview.svelte';
  import ActivityFeed from '../../routes/docs-examples/blocks/application/dashboard/ActivityFeed.svelte';
  import QuickActions from '../../routes/docs-examples/blocks/application/dashboard/QuickActions.svelte';
  import ProgressIndicators from '../../routes/docs-examples/blocks/application/dashboard/ProgressIndicators.svelte';
</script>

<Hst.Story title="Stats Cards" layout={{ type: 'single', iframe: true }}>
  <StatsCards />
</Hst.Story>

<Hst.Story title="Charts" layout={{ type: 'single', iframe: true }}>
  <Charts />
</Hst.Story>

<Hst.Story title="Data Overview" layout={{ type: 'single', iframe: true }}>
  <DataOverview />
</Hst.Story>

<Hst.Story title="Activity Feed" layout={{ type: 'single', iframe: true }}>
  <ActivityFeed />
</Hst.Story>

<Hst.Story title="Quick Actions" layout={{ type: 'single', iframe: true }}>
  <QuickActions />
</Hst.Story>

<Hst.Story title="Progress Indicators" layout={{ type: 'single', iframe: true }}>
  <ProgressIndicators />
</Hst.Story>
