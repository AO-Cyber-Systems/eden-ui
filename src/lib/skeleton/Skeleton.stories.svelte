<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Skeleton from './Skeleton.svelte';
  import CardPlaceholder from './CardPlaceholder.svelte';
  import ImagePlaceholder from './ImagePlaceholder.svelte';
  import ListPlaceholder from './ListPlaceholder.svelte';
  import TestimonialPlaceholder from './TestimonialPlaceholder.svelte';
  import TextPlaceholder from './TextPlaceholder.svelte';
  import VideoPlaceholder from './VideoPlaceholder.svelte';
  import WidgetPlaceholder from './WidgetPlaceholder.svelte';

  const { Story } = defineMeta({
    title: 'Components/Skeleton',
    component: Skeleton,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'Size variant affecting max-width and spacing',
      },
    },
    args: {
      size: 'sm',
    },
  });
</script>

<!-- Default Skeleton -->
<Story name="Default">
  {#snippet children(args)}
    <Skeleton {...args} />
  {/snippet}
</Story>

<!-- Skeleton Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small (default)</p>
        <Skeleton size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium</p>
        <Skeleton size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large</p>
        <Skeleton size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Card Placeholder -->
<Story name="Card Placeholder">
  {#snippet children(args)}
    <div class="max-w-sm">
      <CardPlaceholder />
    </div>
  {/snippet}
</Story>

<!-- Card Placeholder Size Variants -->
<Story name="Card Placeholder Sizes">
  {#snippet children(args)}
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small</p>
        <CardPlaceholder size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium</p>
        <CardPlaceholder size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large</p>
        <CardPlaceholder size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Image Placeholder -->
<Story name="Image Placeholder">
  {#snippet children(args)}
    <ImagePlaceholder />
  {/snippet}
</Story>

<!-- Image Placeholder Variants -->
<Story name="Image Placeholder Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">With content (default)</p>
        <ImagePlaceholder />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Image only</p>
        <ImagePlaceholder imgOnly />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Rounded</p>
        <ImagePlaceholder rounded />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small size</p>
        <ImagePlaceholder size="sm" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- List Placeholder -->
<Story name="List Placeholder">
  {#snippet children(args)}
    <ListPlaceholder />
  {/snippet}
</Story>

<!-- List Placeholder Variants -->
<Story name="List Placeholder Variants">
  {#snippet children(args)}
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">3 items</p>
        <ListPlaceholder itemNumber={3} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">5 items (default)</p>
        <ListPlaceholder itemNumber={5} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Rounded</p>
        <ListPlaceholder rounded />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small size</p>
        <ListPlaceholder size="sm" itemNumber={4} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Testimonial Placeholder -->
<Story name="Testimonial Placeholder">
  {#snippet children(args)}
    <TestimonialPlaceholder />
  {/snippet}
</Story>

<!-- Text Placeholder -->
<Story name="Text Placeholder">
  {#snippet children(args)}
    <TextPlaceholder />
  {/snippet}
</Story>

<!-- Text Placeholder Size Variants -->
<Story name="Text Placeholder Sizes">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small</p>
        <TextPlaceholder size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium</p>
        <TextPlaceholder size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large</p>
        <TextPlaceholder size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Video Placeholder -->
<Story name="Video Placeholder">
  {#snippet children(args)}
    <VideoPlaceholder />
  {/snippet}
</Story>

<!-- Video Placeholder Size Variants -->
<Story name="Video Placeholder Sizes">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small</p>
        <VideoPlaceholder size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium</p>
        <VideoPlaceholder size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large</p>
        <VideoPlaceholder size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Widget Placeholder -->
<Story name="Widget Placeholder">
  {#snippet children(args)}
    <WidgetPlaceholder />
  {/snippet}
</Story>

<!-- All Placeholders Showcase -->
<Story name="All Placeholders">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Skeleton</h3>
        <Skeleton />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Card Placeholder</h3>
        <div class="max-w-sm">
          <CardPlaceholder />
        </div>
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Image Placeholder</h3>
        <ImagePlaceholder />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">List Placeholder</h3>
        <ListPlaceholder itemNumber={3} />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Testimonial Placeholder</h3>
        <TestimonialPlaceholder />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Text Placeholder</h3>
        <TextPlaceholder />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Video Placeholder</h3>
        <VideoPlaceholder />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Widget Placeholder</h3>
        <WidgetPlaceholder />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Loading States Example -->
<Story name="Loading States Example">
  {#snippet children(args)}
    <div class="space-y-8">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        These placeholders can be used to show loading states while content is being fetched.
      </p>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        <!-- Product Card Loading -->
        <div class="p-4 border rounded-lg dark:border-gray-700">
          <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-3">Product Loading</h4>
          <CardPlaceholder size="sm" />
        </div>

        <!-- List Loading -->
        <div class="p-4 border rounded-lg dark:border-gray-700">
          <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-3">List Loading</h4>
          <ListPlaceholder itemNumber={4} size="sm" />
        </div>

        <!-- Video Loading -->
        <div class="p-4 border rounded-lg dark:border-gray-700">
          <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-3">Video Loading</h4>
          <VideoPlaceholder size="sm" />
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Dashboard Loading Example -->
<Story name="Dashboard Loading">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Example of a dashboard loading state using multiple placeholder components.
      </p>

      <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        <!-- Main Content -->
        <div class="lg:col-span-2 space-y-6">
          <div class="p-4 bg-white dark:bg-gray-800 rounded-lg shadow">
            <Skeleton size="md" />
          </div>
          <div class="p-4 bg-white dark:bg-gray-800 rounded-lg shadow">
            <ImagePlaceholder />
          </div>
        </div>

        <!-- Sidebar -->
        <div class="space-y-6">
          <div class="p-4 bg-white dark:bg-gray-800 rounded-lg shadow">
            <ListPlaceholder itemNumber={4} size="sm" />
          </div>
          <div class="p-4 bg-white dark:bg-gray-800 rounded-lg shadow">
            <WidgetPlaceholder />
          </div>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

