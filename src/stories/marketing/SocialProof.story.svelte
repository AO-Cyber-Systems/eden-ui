<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Social Proof',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/social-proof/Default.svelte';
  import Stats from '../../routes/docs-examples/blocks/marketing/social-proof/Stats.svelte';
  import WithAvatars from '../../routes/docs-examples/blocks/marketing/social-proof/WithAvatars.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Stats" layout={{ type: 'single', iframe: true }}>
  <Stats />
</Hst.Story>

<Hst.Story title="With Avatars" layout={{ type: 'single', iframe: true }}>
  <WithAvatars />
</Hst.Story>
