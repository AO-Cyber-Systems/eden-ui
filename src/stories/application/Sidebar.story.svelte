<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Application/Sidebar',
    group: 'application'
  };
</script>

<script lang="ts">
  import BasicSidebar from '../../routes/docs-examples/blocks/application/sidebar/BasicSidebar.svelte';
  import CollapsibleSidebar from '../../routes/docs-examples/blocks/application/sidebar/CollapsibleSidebar.svelte';
  import DashboardLayout from '../../routes/docs-examples/blocks/application/sidebar/DashboardLayout.svelte';
  import IconSidebar from '../../routes/docs-examples/blocks/application/sidebar/IconSidebar.svelte';
  import MultiLevelSidebar from '../../routes/docs-examples/blocks/application/sidebar/MultiLevelSidebar.svelte';
</script>

<Hst.Story title="Basic Sidebar" layout={{ type: 'single', iframe: true }}>
  <BasicSidebar />
</Hst.Story>

<Hst.Story title="Collapsible Sidebar" layout={{ type: 'single', iframe: true }}>
  <CollapsibleSidebar />
</Hst.Story>

<Hst.Story title="Dashboard Layout" layout={{ type: 'single', iframe: true }}>
  <DashboardLayout />
</Hst.Story>

<Hst.Story title="Icon Sidebar" layout={{ type: 'single', iframe: true }}>
  <IconSidebar />
</Hst.Story>

<Hst.Story title="Multi-Level Sidebar" layout={{ type: 'single', iframe: true }}>
  <MultiLevelSidebar />
</Hst.Story>
