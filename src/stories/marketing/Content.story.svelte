<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Content',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/content/Default.svelte';
  import Gallery from '../../routes/docs-examples/blocks/marketing/content/Gallery.svelte';
  import Stats from '../../routes/docs-examples/blocks/marketing/content/Stats.svelte';
  import TwoColumn from '../../routes/docs-examples/blocks/marketing/content/TwoColumn.svelte';
  import WithImage from '../../routes/docs-examples/blocks/marketing/content/WithImage.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Gallery" layout={{ type: 'single', iframe: true }}>
  <Gallery />
</Hst.Story>

<Hst.Story title="Stats" layout={{ type: 'single', iframe: true }}>
  <Stats />
</Hst.Story>

<Hst.Story title="Two Column" layout={{ type: 'single', iframe: true }}>
  <TwoColumn />
</Hst.Story>

<Hst.Story title="With Image" layout={{ type: 'single', iframe: true }}>
  <WithImage />
</Hst.Story>
