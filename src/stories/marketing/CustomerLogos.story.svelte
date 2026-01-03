<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Customer Logos',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/customer-logos/Default.svelte';
  import Carousel from '../../routes/docs-examples/blocks/marketing/customer-logos/Carousel.svelte';
  import Grid from '../../routes/docs-examples/blocks/marketing/customer-logos/Grid.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Carousel" layout={{ type: 'single', iframe: true }}>
  <Carousel />
</Hst.Story>

<Hst.Story title="Grid" layout={{ type: 'single', iframe: true }}>
  <Grid />
</Hst.Story>
