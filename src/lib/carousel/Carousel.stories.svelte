<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Carousel from './Carousel.svelte';
  import Controls from './Controls.svelte';
  import CarouselIndicators from './CarouselIndicators.svelte';
  import Thumbnails from './Thumbnails.svelte';

  const { Story } = defineMeta({
    title: 'Components/Carousel',
    component: Carousel,
    tags: ['autodocs'],
    argTypes: {
      slideDuration: {
        control: { type: 'number' },
        description: 'Duration of slide transition in milliseconds',
      },
      duration: {
        control: { type: 'number' },
        description: 'Auto-play interval in milliseconds (0 to disable)',
      },
      disableSwipe: {
        control: 'boolean',
        description: 'Disable swipe gestures',
      },
    },
    args: {
      slideDuration: 1000,
      duration: 0,
      disableSwipe: false,
    },
  });

  const images = [
    { src: 'https://flowbite.com/docs/images/carousel/carousel-1.svg', alt: 'Slide 1' },
    { src: 'https://flowbite.com/docs/images/carousel/carousel-2.svg', alt: 'Slide 2' },
    { src: 'https://flowbite.com/docs/images/carousel/carousel-3.svg', alt: 'Slide 3' },
    { src: 'https://flowbite.com/docs/images/carousel/carousel-4.svg', alt: 'Slide 4' },
    { src: 'https://flowbite.com/docs/images/carousel/carousel-5.svg', alt: 'Slide 5' },
  ];
</script>

<!-- Default Carousel -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {...args} {images} class="rounded-lg">
        <Controls />
        <CarouselIndicators />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- Without Controls -->
<Story name="Without Controls">
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {images} class="rounded-lg">
        <CarouselIndicators />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- Auto-play -->
<Story name="Auto-play" args={{ duration: 3000 }}>
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {...args} {images} class="rounded-lg">
        <Controls />
        <CarouselIndicators />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- With Thumbnails -->
<Story name="With Thumbnails">
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {images} class="rounded-lg">
        <Controls />
        <Thumbnails />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- Indicators Only -->
<Story name="Indicators Only">
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {images} class="rounded-lg">
        <CarouselIndicators />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- Controls Only -->
<Story name="Controls Only">
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {images} class="rounded-lg">
        <Controls />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- Disabled Swipe -->
<Story name="Disabled Swipe" args={{ disableSwipe: true }}>
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {...args} {images} class="rounded-lg">
        <Controls />
        <CarouselIndicators />
      </Carousel>
    </div>
  {/snippet}
</Story>

<!-- Fast Transition -->
<Story name="Fast Transition" args={{ slideDuration: 300 }}>
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Carousel {...args} {images} class="rounded-lg">
        <Controls />
        <CarouselIndicators />
      </Carousel>
    </div>
  {/snippet}
</Story>
