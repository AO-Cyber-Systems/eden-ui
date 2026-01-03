<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Portfolio',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/portfolio/Default.svelte';
  import Cards from '../../routes/docs-examples/blocks/marketing/portfolio/Cards.svelte';
  import Masonry from '../../routes/docs-examples/blocks/marketing/portfolio/Masonry.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Cards" layout={{ type: 'single', iframe: true }}>
  <Cards />
</Hst.Story>

<Hst.Story title="Masonry" layout={{ type: 'single', iframe: true }}>
  <Masonry />
</Hst.Story>
