<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Team',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/team/Default.svelte';
  import Cards from '../../routes/docs-examples/blocks/marketing/team/Cards.svelte';
  import Horizontal from '../../routes/docs-examples/blocks/marketing/team/Horizontal.svelte';
  import WithImages from '../../routes/docs-examples/blocks/marketing/team/WithImages.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Cards" layout={{ type: 'single', iframe: true }}>
  <Cards />
</Hst.Story>

<Hst.Story title="Horizontal" layout={{ type: 'single', iframe: true }}>
  <Horizontal />
</Hst.Story>

<Hst.Story title="With Images" layout={{ type: 'single', iframe: true }}>
  <WithImages />
</Hst.Story>
