<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Contact',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/contact/Default.svelte';
  import Support from '../../routes/docs-examples/blocks/marketing/contact/Support.svelte';
  import WithDetails from '../../routes/docs-examples/blocks/marketing/contact/WithDetails.svelte';
  import WithMap from '../../routes/docs-examples/blocks/marketing/contact/WithMap.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Support" layout={{ type: 'single', iframe: true }}>
  <Support />
</Hst.Story>

<Hst.Story title="With Details" layout={{ type: 'single', iframe: true }}>
  <WithDetails />
</Hst.Story>

<Hst.Story title="With Map" layout={{ type: 'single', iframe: true }}>
  <WithMap />
</Hst.Story>
