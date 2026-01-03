<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Event Schedule',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/event-schedule/Default.svelte';
  import Grid from '../../routes/docs-examples/blocks/marketing/event-schedule/Grid.svelte';
  import MultiDay from '../../routes/docs-examples/blocks/marketing/event-schedule/MultiDay.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Grid" layout={{ type: 'single', iframe: true }}>
  <Grid />
</Hst.Story>

<Hst.Story title="Multi Day" layout={{ type: 'single', iframe: true }}>
  <MultiDay />
</Hst.Story>
