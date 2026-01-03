<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Spinner from './Spinner.svelte';

  const { Story } = defineMeta({
    title: 'Components/Spinner',
    component: Spinner,
    tags: ['autodocs'],
    argTypes: {
      type: {
        control: { type: 'select' },
        options: ['default', 'dots', 'bars', 'pulse', 'orbit'],
        description: 'The type of spinner animation',
      },
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose', 'white'],
        description: 'The color of the spinner',
      },
      size: {
        control: { type: 'select' },
        options: ['4', '5', '6', '8', '10', '12', '16', '20', '24'],
        description: 'The size of the spinner',
      },
    },
    args: {
      type: 'default',
      color: 'primary',
      size: '8',
    },
  });
</script>

<!-- Default Spinner -->
<Story name="Default">
  {#snippet children(args)}
    <Spinner {...args} />
  {/snippet}
</Story>

<!-- Spinner Types -->
<Story name="Types">
  {#snippet children(args)}
    <div class="flex items-center gap-8">
      <div class="text-center">
        <Spinner type="default" size="10" />
        <p class="mt-2 text-sm text-gray-500">Default</p>
      </div>
      <div class="text-center">
        <Spinner type="dots" size="10" />
        <p class="mt-2 text-sm text-gray-500">Dots</p>
      </div>
      <div class="text-center">
        <Spinner type="bars" size="10" />
        <p class="mt-2 text-sm text-gray-500">Bars</p>
      </div>
      <div class="text-center">
        <Spinner type="pulse" size="10" />
        <p class="mt-2 text-sm text-gray-500">Pulse</p>
      </div>
      <div class="text-center">
        <Spinner type="orbit" size="10" />
        <p class="mt-2 text-sm text-gray-500">Orbit</p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <Spinner color="primary" />
      <Spinner color="red" />
      <Spinner color="green" />
      <Spinner color="yellow" />
      <Spinner color="indigo" />
      <Spinner color="purple" />
      <Spinner color="pink" />
      <Spinner color="gray" />
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <div class="text-center">
        <Spinner size="4" />
        <p class="mt-2 text-xs text-gray-500">4</p>
      </div>
      <div class="text-center">
        <Spinner size="6" />
        <p class="mt-2 text-xs text-gray-500">6</p>
      </div>
      <div class="text-center">
        <Spinner size="8" />
        <p class="mt-2 text-xs text-gray-500">8</p>
      </div>
      <div class="text-center">
        <Spinner size="10" />
        <p class="mt-2 text-xs text-gray-500">10</p>
      </div>
      <div class="text-center">
        <Spinner size="12" />
        <p class="mt-2 text-xs text-gray-500">12</p>
      </div>
      <div class="text-center">
        <Spinner size="16" />
        <p class="mt-2 text-xs text-gray-500">16</p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Button Loading State -->
<Story name="Button Loading">
  {#snippet children(args)}
    <div class="flex gap-4">
      <button class="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700 disabled:opacity-50" disabled>
        <Spinner size="4" color="white" class="mr-2" />
        Loading...
      </button>
      <button class="inline-flex items-center px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-300 rounded-lg hover:bg-gray-100 disabled:opacity-50" disabled>
        <Spinner size="4" color="gray" class="mr-2" />
        Please wait
      </button>
    </div>
  {/snippet}
</Story>

<!-- Spinner Alignment -->
<Story name="Alignment Examples">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex items-center gap-2 text-gray-700 dark:text-gray-300">
        <Spinner size="5" />
        <span>Loading data...</span>
      </div>
      <div class="flex items-center justify-center gap-2 p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <Spinner size="6" />
        <span class="text-gray-600 dark:text-gray-400">Fetching results</span>
      </div>
      <div class="flex flex-col items-center gap-2 p-8 border-2 border-dashed border-gray-300 dark:border-gray-600 rounded-lg">
        <Spinner size="10" color="primary" />
        <span class="text-gray-500">Processing your request</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Page Loading Overlay -->
<Story name="Loading Overlay">
  {#snippet children(args)}
    <div class="relative h-64 bg-gray-100 dark:bg-gray-800 rounded-lg overflow-hidden">
      <div class="absolute inset-0 flex flex-col items-center justify-center bg-white/80 dark:bg-gray-900/80">
        <Spinner size="12" color="primary" />
        <p class="mt-4 text-gray-600 dark:text-gray-400">Loading content...</p>
      </div>
    </div>
  {/snippet}
</Story>
