<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Pricing',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/pricing/Default.svelte';
  import Cards from '../../routes/docs-examples/blocks/marketing/pricing/Cards.svelte';
  import Comparison from '../../routes/docs-examples/blocks/marketing/pricing/Comparison.svelte';
  import WithToggle from '../../routes/docs-examples/blocks/marketing/pricing/WithToggle.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Cards" layout={{ type: 'single', iframe: true }}>
  <Cards />
</Hst.Story>

<Hst.Story title="Comparison" layout={{ type: 'single', iframe: true }}>
  <Comparison />
</Hst.Story>

<Hst.Story title="With Toggle" layout={{ type: 'single', iframe: true }}>
  <WithToggle />
</Hst.Story>
