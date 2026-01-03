<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Marketing/Testimonial',
    group: 'marketing'
  };
</script>

<script lang="ts">
  import Default from '../../routes/docs-examples/blocks/marketing/testimonial/Default.svelte';
  import Carousel from '../../routes/docs-examples/blocks/marketing/testimonial/Carousel.svelte';
  import Featured from '../../routes/docs-examples/blocks/marketing/testimonial/Featured.svelte';
  import WithLogos from '../../routes/docs-examples/blocks/marketing/testimonial/WithLogos.svelte';
</script>

<Hst.Story title="Default" layout={{ type: 'single', iframe: true }}>
  <Default />
</Hst.Story>

<Hst.Story title="Carousel" layout={{ type: 'single', iframe: true }}>
  <Carousel />
</Hst.Story>

<Hst.Story title="Featured" layout={{ type: 'single', iframe: true }}>
  <Featured />
</Hst.Story>

<Hst.Story title="With Logos" layout={{ type: 'single', iframe: true }}>
  <WithLogos />
</Hst.Story>
