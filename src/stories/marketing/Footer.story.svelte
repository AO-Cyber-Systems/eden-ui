<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Footer',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/footer/Default.svelte';
  import Minimal from '../../routes/docs-examples/blocks/marketing/footer/Minimal.svelte';
  import MultiColumn from '../../routes/docs-examples/blocks/marketing/footer/MultiColumn.svelte';
  import WithNewsletter from '../../routes/docs-examples/blocks/marketing/footer/WithNewsletter.svelte';
  import WithSocial from '../../routes/docs-examples/blocks/marketing/footer/WithSocial.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Minimal" layout={{ type: 'single', iframe: true }}>
  <Minimal />
</Hst.Story>

<Hst.Story title="Multi Column" layout={{ type: 'single', iframe: true }}>
  <MultiColumn />
</Hst.Story>

<Hst.Story title="With Newsletter" layout={{ type: 'single', iframe: true }}>
  <WithNewsletter />
</Hst.Story>

<Hst.Story title="With Social" layout={{ type: 'single', iframe: true }}>
  <WithSocial />
</Hst.Story>
