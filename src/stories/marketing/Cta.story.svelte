<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/CTA',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/cta/Default.svelte';
  import Gradient from '../../routes/docs-examples/blocks/marketing/cta/Gradient.svelte';
  import Minimal from '../../routes/docs-examples/blocks/marketing/cta/Minimal.svelte';
  import Split from '../../routes/docs-examples/blocks/marketing/cta/Split.svelte';
  import WithForm from '../../routes/docs-examples/blocks/marketing/cta/WithForm.svelte';
  import WithImage from '../../routes/docs-examples/blocks/marketing/cta/WithImage.svelte';
  import WithStats from '../../routes/docs-examples/blocks/marketing/cta/WithStats.svelte';
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

<Hst.Story title="Split" layout={{ type: 'single', iframe: true }}>
  <Split />
</Hst.Story>

<Hst.Story title="With Form" layout={{ type: 'single', iframe: true }}>
  <WithForm />
</Hst.Story>

<Hst.Story title="With Image" layout={{ type: 'single', iframe: true }}>
  <WithImage />
</Hst.Story>

<Hst.Story title="With Stats" layout={{ type: 'single', iframe: true }}>
  <WithStats />
</Hst.Story>
