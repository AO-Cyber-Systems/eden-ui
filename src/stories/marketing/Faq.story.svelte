<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/FAQ',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/faq/Default.svelte';
  import Categorized from '../../routes/docs-examples/blocks/marketing/faq/Categorized.svelte';
  import TwoColumn from '../../routes/docs-examples/blocks/marketing/faq/TwoColumn.svelte';
  import WithSidebar from '../../routes/docs-examples/blocks/marketing/faq/WithSidebar.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Categorized" layout={{ type: 'single', iframe: true }}>
  <Categorized />
</Hst.Story>

<Hst.Story title="Two Column" layout={{ type: 'single', iframe: true }}>
  <TwoColumn />
</Hst.Story>

<Hst.Story title="With Sidebar" layout={{ type: 'single', iframe: true }}>
  <WithSidebar />
</Hst.Story>
