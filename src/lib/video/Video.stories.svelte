<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Video from './Video.svelte';

  const { Story } = defineMeta({
    title: 'Components/Video',
    component: Video,
    tags: ['autodocs'],
    argTypes: {
      src: {
        control: 'text',
        description: 'URL of the video source',
      },
      type: {
        control: { type: 'select' },
        options: ['video/mp4', 'video/webm', 'video/ogg'],
        description: 'MIME type of the video',
      },
      trackSrc: {
        control: 'text',
        description: 'URL for caption/subtitle track',
      },
      srclang: {
        control: 'text',
        description: 'Language of the caption track',
      },
      label: {
        control: 'text',
        description: 'Label for the caption track',
      },
      controls: {
        control: 'boolean',
        description: 'Show video controls',
      },
      autoplay: {
        control: 'boolean',
        description: 'Autoplay video on load',
      },
      muted: {
        control: 'boolean',
        description: 'Mute the video',
      },
      loop: {
        control: 'boolean',
        description: 'Loop video playback',
      },
      poster: {
        control: 'text',
        description: 'Poster image URL',
      },
    },
    args: {
      src: 'https://flowbite.com/docs/videos/flowbite.mp4',
      type: 'video/mp4',
      controls: true,
      muted: false,
      loop: false,
    },
  });

  // Sample video URLs for demos
  const sampleVideo = 'https://flowbite.com/docs/videos/flowbite.mp4';
</script>

<!-- Default Video -->
<Story name="Default">
  {#snippet children(args)}
    <Video {...args} class="w-full max-w-2xl" />
  {/snippet}
</Story>

<!-- Video with Controls -->
<Story name="With Controls">
  {#snippet children(args)}
    <div class="space-y-4 max-w-2xl">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Standard video player with full controls enabled.
      </p>
      <Video
        src={sampleVideo}
        controls
        class="w-full rounded-lg shadow-lg"
      />
    </div>
  {/snippet}
</Story>

<!-- Autoplay Muted Video -->
<Story name="Autoplay Muted">
  {#snippet children(args)}
    <div class="space-y-4 max-w-2xl">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Video with autoplay requires muted to work on most browsers.
      </p>
      <Video
        src={sampleVideo}
        autoplay
        muted
        controls
        class="w-full rounded-lg"
      />
    </div>
  {/snippet}
</Story>

<!-- Looping Video -->
<Story name="Looping Video">
  {#snippet children(args)}
    <div class="space-y-4 max-w-2xl">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Video that loops continuously - great for background videos.
      </p>
      <Video
        src={sampleVideo}
        loop
        muted
        autoplay
        controls
        class="w-full rounded-lg"
      />
    </div>
  {/snippet}
</Story>

<!-- Video Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small (max-w-sm)</p>
        <Video src={sampleVideo} controls class="w-full max-w-sm rounded-lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium (max-w-md)</p>
        <Video src={sampleVideo} controls class="w-full max-w-md rounded-lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large (max-w-lg)</p>
        <Video src={sampleVideo} controls class="w-full max-w-lg rounded-lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Extra Large (max-w-xl)</p>
        <Video src={sampleVideo} controls class="w-full max-w-xl rounded-lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Video with Rounded Corners -->
<Story name="Rounded Corners">
  {#snippet children(args)}
    <div class="space-y-8 max-w-2xl">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">rounded-lg</p>
        <Video src={sampleVideo} controls class="w-full rounded-lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">rounded-xl</p>
        <Video src={sampleVideo} controls class="w-full rounded-xl" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">rounded-2xl</p>
        <Video src={sampleVideo} controls class="w-full rounded-2xl" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">rounded-3xl</p>
        <Video src={sampleVideo} controls class="w-full rounded-3xl" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Video with Shadow -->
<Story name="With Shadow">
  {#snippet children(args)}
    <div class="space-y-8 max-w-2xl p-4">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">shadow-md</p>
        <Video src={sampleVideo} controls class="w-full rounded-lg shadow-md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">shadow-lg</p>
        <Video src={sampleVideo} controls class="w-full rounded-lg shadow-lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">shadow-xl</p>
        <Video src={sampleVideo} controls class="w-full rounded-lg shadow-xl" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">shadow-2xl</p>
        <Video src={sampleVideo} controls class="w-full rounded-lg shadow-2xl" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Video in Card -->
<Story name="Video in Card">
  {#snippet children(args)}
    <div class="max-w-lg p-5 bg-white border border-gray-200 rounded-lg shadow-md dark:bg-gray-800 dark:border-gray-700">
      <Video src={sampleVideo} controls class="w-full rounded-lg mb-4" />
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Product Demo Video
      </h5>
      <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
        Watch this quick tutorial to learn how our product can streamline your workflow and boost productivity.
      </p>
      <button class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
        Learn more
        <svg class="rtl:rotate-180 w-3.5 h-3.5 ms-2" fill="none" viewBox="0 0 14 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 5h12m0 0L9 1m4 4L9 9"/>
        </svg>
      </button>
    </div>
  {/snippet}
</Story>

<!-- Background Video -->
<Story name="Background Video">
  {#snippet children(args)}
    <div class="relative max-w-2xl overflow-hidden rounded-2xl">
      <Video
        src={sampleVideo}
        autoplay
        muted
        loop
        class="w-full object-cover"
      />
      <div class="absolute inset-0 bg-black/50 flex items-center justify-center">
        <div class="text-center text-white p-8">
          <h2 class="text-4xl font-bold mb-4">Welcome to Our Platform</h2>
          <p class="text-lg mb-6">Experience the future of digital innovation</p>
          <button class="px-6 py-3 bg-white text-gray-900 font-semibold rounded-lg hover:bg-gray-100 transition-colors">
            Get Started
          </button>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Responsive Video -->
<Story name="Responsive Video">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Video that maintains aspect ratio and fills container width.
      </p>
      <div class="aspect-video max-w-3xl">
        <Video
          src={sampleVideo}
          controls
          class="w-full h-full object-cover rounded-lg"
        />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Video Grid -->
<Story name="Video Grid">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Multiple videos in a grid layout.
      </p>
      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div class="space-y-2">
          <Video src={sampleVideo} controls class="w-full rounded-lg" />
          <p class="text-sm font-medium text-gray-900 dark:text-white">Introduction Video</p>
          <p class="text-xs text-gray-500 dark:text-gray-400">Learn the basics</p>
        </div>
        <div class="space-y-2">
          <Video src={sampleVideo} controls class="w-full rounded-lg" />
          <p class="text-sm font-medium text-gray-900 dark:text-white">Advanced Tutorial</p>
          <p class="text-xs text-gray-500 dark:text-gray-400">Deep dive into features</p>
        </div>
        <div class="space-y-2">
          <Video src={sampleVideo} controls class="w-full rounded-lg" />
          <p class="text-sm font-medium text-gray-900 dark:text-white">Best Practices</p>
          <p class="text-xs text-gray-500 dark:text-gray-400">Tips and tricks</p>
        </div>
        <div class="space-y-2">
          <Video src={sampleVideo} controls class="w-full rounded-lg" />
          <p class="text-sm font-medium text-gray-900 dark:text-white">Case Study</p>
          <p class="text-xs text-gray-500 dark:text-gray-400">Real-world examples</p>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Video with Custom Styling -->
<Story name="Custom Styling">
  {#snippet children(args)}
    <div class="space-y-8 max-w-2xl">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">With border</p>
        <Video
          src={sampleVideo}
          controls
          class="w-full rounded-lg border-4 border-blue-500"
        />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">With gradient border (wrapper)</p>
        <div class="p-1 bg-gradient-to-r from-purple-500 to-pink-500 rounded-xl">
          <Video
            src={sampleVideo}
            controls
            class="w-full rounded-lg"
          />
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Grayscale effect</p>
        <Video
          src={sampleVideo}
          controls
          class="w-full rounded-lg grayscale hover:grayscale-0 transition-all duration-300"
        />
      </div>
    </div>
  {/snippet}
</Story>

