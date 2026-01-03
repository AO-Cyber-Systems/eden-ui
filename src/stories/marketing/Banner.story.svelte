<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Banner',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/banner/Default.svelte';
  import CookieConsent from '../../routes/docs-examples/blocks/marketing/banner/CookieConsent.svelte';
  import Sticky from '../../routes/docs-examples/blocks/marketing/banner/Sticky.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Cookie Consent" layout={{ type: 'single', iframe: true }}>
  <CookieConsent />
</Hst.Story>

<Hst.Story title="Sticky" layout={{ type: 'single', iframe: true }}>
  <Sticky />
</Hst.Story>
