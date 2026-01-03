<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Error Pages',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Error403 from '../../routes/docs-examples/blocks/marketing/error/403.svelte';
  import Error404 from '../../routes/docs-examples/blocks/marketing/error/404.svelte';
  import Error500 from '../../routes/docs-examples/blocks/marketing/error/500.svelte';
  import ComingSoon from '../../routes/docs-examples/blocks/marketing/error/ComingSoon.svelte';
  import Illustration from '../../routes/docs-examples/blocks/marketing/error/Illustration.svelte';
  import Maintenance from '../../routes/docs-examples/blocks/marketing/error/Maintenance.svelte';
</script>

<Hst.Story title="403 Forbidden" layout={{ type: 'single', iframe: true }}>
  <Error403 />
</Hst.Story>

<Hst.Story title="404 Not Found" layout={{ type: 'single', iframe: true }}>
  <Error404 />
</Hst.Story>

<Hst.Story title="500 Server Error" layout={{ type: 'single', iframe: true }}>
  <Error500 />
</Hst.Story>

<Hst.Story title="Coming Soon" layout={{ type: 'single', iframe: true }}>
  <ComingSoon />
</Hst.Story>

<Hst.Story title="With Illustration" layout={{ type: 'single', iframe: true }}>
  <Illustration />
</Hst.Story>

<Hst.Story title="Maintenance" layout={{ type: 'single', iframe: true }}>
  <Maintenance />
</Hst.Story>
