<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Newsletter',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/newsletter/Default.svelte';
  import Gradient from '../../routes/docs-examples/blocks/marketing/newsletter/Gradient.svelte';
  import Minimal from '../../routes/docs-examples/blocks/marketing/newsletter/Minimal.svelte';
  import WithImage from '../../routes/docs-examples/blocks/marketing/newsletter/WithImage.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Gradient" layout={{ type: 'single', iframe: true }}>
  <Gradient />
</Hst.Story>

<Hst.Story title="Minimal" layout={{ type: 'single', iframe: true }}>
  <Minimal />
</Hst.Story>

<Hst.Story title="With Image" layout={{ type: 'single', iframe: true }}>
  <WithImage />
</Hst.Story>
