<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Application/CRUD',
    group: 'application'
  };
</script>

<script lang="ts">
  import ReadTable from '../../routes/docs-examples/blocks/application/crud/ReadTable.svelte';
  import ReadCards from '../../routes/docs-examples/blocks/application/crud/ReadCards.svelte';
  import ReadDetail from '../../routes/docs-examples/blocks/application/crud/ReadDetail.svelte';
  import CreateModal from '../../routes/docs-examples/blocks/application/crud/CreateModal.svelte';
  import CreateDrawer from '../../routes/docs-examples/blocks/application/crud/CreateDrawer.svelte';
  import CreatePage from '../../routes/docs-examples/blocks/application/crud/CreatePage.svelte';
  import UpdateModal from '../../routes/docs-examples/blocks/application/crud/UpdateModal.svelte';
  import UpdateDrawer from '../../routes/docs-examples/blocks/application/crud/UpdateDrawer.svelte';
  import UpdateInline from '../../routes/docs-examples/blocks/application/crud/UpdateInline.svelte';
  import DeleteConfirm from '../../routes/docs-examples/blocks/application/crud/DeleteConfirm.svelte';
  import DeleteBulk from '../../routes/docs-examples/blocks/application/crud/DeleteBulk.svelte';
  import BulkActions from '../../routes/docs-examples/blocks/application/crud/BulkActions.svelte';
  import FiltersAndSearch from '../../routes/docs-examples/blocks/application/crud/FiltersAndSearch.svelte';
  import Pagination from '../../routes/docs-examples/blocks/application/crud/Pagination.svelte';
  import SortAndOrder from '../../routes/docs-examples/blocks/application/crud/SortAndOrder.svelte';
  import EmptyStates from '../../routes/docs-examples/blocks/application/crud/EmptyStates.svelte';
</script>

<Hst.Story title="Read: Table" layout={{ type: 'single', iframe: true }}>
  <ReadTable />
</Hst.Story>

<Hst.Story title="Read: Cards" layout={{ type: 'single', iframe: true }}>
  <ReadCards />
</Hst.Story>

<Hst.Story title="Read: Detail" layout={{ type: 'single', iframe: true }}>
  <ReadDetail />
</Hst.Story>

<Hst.Story title="Create: Modal" layout={{ type: 'single', iframe: true }}>
  <CreateModal />
</Hst.Story>

<Hst.Story title="Create: Drawer" layout={{ type: 'single', iframe: true }}>
  <CreateDrawer />
</Hst.Story>

<Hst.Story title="Create: Page" layout={{ type: 'single', iframe: true }}>
  <CreatePage />
</Hst.Story>

<Hst.Story title="Update: Modal" layout={{ type: 'single', iframe: true }}>
  <UpdateModal />
</Hst.Story>

<Hst.Story title="Update: Drawer" layout={{ type: 'single', iframe: true }}>
  <UpdateDrawer />
</Hst.Story>

<Hst.Story title="Update: Inline" layout={{ type: 'single', iframe: true }}>
  <UpdateInline />
</Hst.Story>

<Hst.Story title="Delete: Confirm" layout={{ type: 'single', iframe: true }}>
  <DeleteConfirm />
</Hst.Story>

<Hst.Story title="Delete: Bulk" layout={{ type: 'single', iframe: true }}>
  <DeleteBulk />
</Hst.Story>

<Hst.Story title="Bulk Actions" layout={{ type: 'single', iframe: true }}>
  <BulkActions />
</Hst.Story>

<Hst.Story title="Filters & Search" layout={{ type: 'single', iframe: true }}>
  <FiltersAndSearch />
</Hst.Story>

<Hst.Story title="Pagination" layout={{ type: 'single', iframe: true }}>
  <Pagination />
</Hst.Story>

<Hst.Story title="Sort & Order" layout={{ type: 'single', iframe: true }}>
  <SortAndOrder />
</Hst.Story>

<Hst.Story title="Empty States" layout={{ type: 'single', iframe: true }}>
  <EmptyStates />
</Hst.Story>
