<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Application/Tables',
    group: 'application'
  };
</script>

<script lang="ts">
  import BasicTable from '../../routes/docs-examples/blocks/application/tables/BasicTable.svelte';
  import StripedTable from '../../routes/docs-examples/blocks/application/tables/StripedTable.svelte';
  import HoverableTable from '../../routes/docs-examples/blocks/application/tables/HoverableTable.svelte';
  import DataTable from '../../routes/docs-examples/blocks/application/tables/DataTable.svelte';
  import AdvancedTable from '../../routes/docs-examples/blocks/application/tables/AdvancedTable.svelte';
</script>

<Hst.Story title="Basic Table" layout={{ type: 'single', iframe: true }}>
  <BasicTable />
</Hst.Story>

<Hst.Story title="Striped Table" layout={{ type: 'single', iframe: true }}>
  <StripedTable />
</Hst.Story>

<Hst.Story title="Hoverable Table" layout={{ type: 'single', iframe: true }}>
  <HoverableTable />
</Hst.Story>

<Hst.Story title="Data Table" layout={{ type: 'single', iframe: true }}>
  <DataTable />
</Hst.Story>

<Hst.Story title="Advanced Table" layout={{ type: 'single', iframe: true }}>
  <AdvancedTable />
</Hst.Story>
