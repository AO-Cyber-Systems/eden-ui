<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Feature',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/feature/Default.svelte';
  import Alternating from '../../routes/docs-examples/blocks/marketing/feature/Alternating.svelte';
  import Cards from '../../routes/docs-examples/blocks/marketing/feature/Cards.svelte';
  import Centered from '../../routes/docs-examples/blocks/marketing/feature/Centered.svelte';
  import Timeline from '../../routes/docs-examples/blocks/marketing/feature/Timeline.svelte';
  import WithImage from '../../routes/docs-examples/blocks/marketing/feature/WithImage.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Alternating" layout={{ type: 'single', iframe: true }}>
  <Alternating />
</Hst.Story>

<Hst.Story title="Cards" layout={{ type: 'single', iframe: true }}>
  <Cards />
</Hst.Story>

<Hst.Story title="Centered" layout={{ type: 'single', iframe: true }}>
  <Centered />
</Hst.Story>

<Hst.Story title="Timeline" layout={{ type: 'single', iframe: true }}>
  <Timeline />
</Hst.Story>

<Hst.Story title="With Image" layout={{ type: 'single', iframe: true }}>
  <WithImage />
</Hst.Story>
