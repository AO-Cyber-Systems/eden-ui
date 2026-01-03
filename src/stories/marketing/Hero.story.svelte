<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Hero',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/hero/Default.svelte';
  import Centered from '../../routes/docs-examples/blocks/marketing/hero/Centered.svelte';
  import Gradient from '../../routes/docs-examples/blocks/marketing/hero/Gradient.svelte';
  import Split from '../../routes/docs-examples/blocks/marketing/hero/Split.svelte';
  import WithBadge from '../../routes/docs-examples/blocks/marketing/hero/WithBadge.svelte';
  import WithImage from '../../routes/docs-examples/blocks/marketing/hero/WithImage.svelte';
  import WithVideo from '../../routes/docs-examples/blocks/marketing/hero/WithVideo.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Centered" layout={{ type: 'single', iframe: true }}>
  <Centered />
</Hst.Story>

<Hst.Story title="Gradient" layout={{ type: 'single', iframe: true }}>
  <Gradient />
</Hst.Story>

<Hst.Story title="Split" layout={{ type: 'single', iframe: true }}>
  <Split />
</Hst.Story>

<Hst.Story title="With Badge" layout={{ type: 'single', iframe: true }}>
  <WithBadge />
</Hst.Story>

<Hst.Story title="With Image" layout={{ type: 'single', iframe: true }}>
  <WithImage />
</Hst.Story>

<Hst.Story title="With Video" layout={{ type: 'single', iframe: true }}>
  <WithVideo />
</Hst.Story>
