<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Header',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/header/Default.svelte';
  import Centered from '../../routes/docs-examples/blocks/marketing/header/Centered.svelte';
  import WithDropdown from '../../routes/docs-examples/blocks/marketing/header/WithDropdown.svelte';
  import WithSearch from '../../routes/docs-examples/blocks/marketing/header/WithSearch.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Centered" layout={{ type: 'single', iframe: true }}>
  <Centered />
</Hst.Story>

<Hst.Story title="With Dropdown" layout={{ type: 'single', iframe: true }}>
  <WithDropdown />
</Hst.Story>

<Hst.Story title="With Search" layout={{ type: 'single', iframe: true }}>
  <WithSearch />
</Hst.Story>
