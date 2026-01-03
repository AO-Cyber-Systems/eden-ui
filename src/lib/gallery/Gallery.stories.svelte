<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Gallery from './Gallery.svelte';

  const { Story } = defineMeta({
    title: 'Components/Gallery',
    component: Gallery,
    tags: ['autodocs'],
    argTypes: {},
    args: {},
  });

  const defaultImages = [
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-1.jpg', alt: 'Gallery image 1' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-2.jpg', alt: 'Gallery image 2' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-3.jpg', alt: 'Gallery image 3' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-4.jpg', alt: 'Gallery image 4' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-5.jpg', alt: 'Gallery image 5' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/square/image-6.jpg', alt: 'Gallery image 6' },
  ];

  const masonryImages = [
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-1.jpg', alt: 'Masonry image 1' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-2.jpg', alt: 'Masonry image 2' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-3.jpg', alt: 'Masonry image 3' },
    { src: 'https://flowbite.s3.amazonaws.com/docs/gallery/masonry/image-4.jpg', alt: 'Masonry image 4' },
  ];
</script>

<!-- Default Gallery -->
<Story name="Default">
  {#snippet children(args)}
    <Gallery items={defaultImages} class="grid-cols-2 gap-4 md:grid-cols-3" />
  {/snippet}
</Story>

<!-- Two Columns -->
<Story name="Two Columns">
  {#snippet children(args)}
    <Gallery items={defaultImages.slice(0, 4)} class="grid-cols-2 gap-4" />
  {/snippet}
</Story>

<!-- Four Columns -->
<Story name="Four Columns">
  {#snippet children(args)}
    <Gallery items={[...defaultImages, ...defaultImages.slice(0, 2)]} class="grid-cols-2 gap-4 md:grid-cols-4" />
  {/snippet}
</Story>

<!-- With Custom Figure -->
<Story name="With Custom Figure">
  {#snippet children(args)}
    <Gallery items={defaultImages.slice(0, 3)} class="grid-cols-3 gap-4">
      {#snippet figure(item)}
        <figure class="relative overflow-hidden rounded-lg group cursor-pointer">
          <img
            src={item.src}
            alt={item.alt}
            class="w-full h-auto transition-transform duration-300 group-hover:scale-110"
          />
          <figcaption class="absolute bottom-0 left-0 right-0 bg-black/60 text-white p-2 text-sm opacity-0 group-hover:opacity-100 transition-opacity">
            {item.alt}
          </figcaption>
        </figure>
      {/snippet}
    </Gallery>
  {/snippet}
</Story>

<!-- Rounded Images -->
<Story name="Rounded Images">
  {#snippet children(args)}
    <Gallery items={defaultImages} class="grid-cols-3 gap-4" classes={{ image: 'rounded-lg' }} />
  {/snippet}
</Story>

<!-- With Gap Variants -->
<Story name="Gap Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Small gap (gap-2)</p>
        <Gallery items={defaultImages.slice(0, 3)} class="grid-cols-3 gap-2" />
      </div>
      <div>
        <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Medium gap (gap-4)</p>
        <Gallery items={defaultImages.slice(0, 3)} class="grid-cols-3 gap-4" />
      </div>
      <div>
        <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">Large gap (gap-8)</p>
        <Gallery items={defaultImages.slice(0, 3)} class="grid-cols-3 gap-8" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Featured Image -->
<Story name="Featured Image">
  {#snippet children(args)}
    <div class="grid grid-cols-4 gap-4">
      <div class="col-span-4 md:col-span-2 md:row-span-2">
        <img
          src="https://flowbite.s3.amazonaws.com/docs/gallery/featured/image.jpg"
          alt="Featured"
          class="w-full h-full object-cover rounded-lg"
        />
      </div>
      <Gallery items={defaultImages.slice(0, 4)} class="col-span-4 md:col-span-2 grid-cols-2 gap-4" />
    </div>
  {/snippet}
</Story>
