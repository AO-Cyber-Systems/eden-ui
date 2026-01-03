<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Blog',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/blog/Default.svelte';
  import Cards from '../../routes/docs-examples/blocks/marketing/blog/Cards.svelte';
  import Featured from '../../routes/docs-examples/blocks/marketing/blog/Featured.svelte';
  import List from '../../routes/docs-examples/blocks/marketing/blog/List.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Cards" layout={{ type: 'single', iframe: true }}>
  <Cards />
</Hst.Story>

<Hst.Story title="Featured" layout={{ type: 'single', iframe: true }}>
  <Featured />
</Hst.Story>

<Hst.Story title="List" layout={{ type: 'single', iframe: true }}>
  <List />
</Hst.Story>
