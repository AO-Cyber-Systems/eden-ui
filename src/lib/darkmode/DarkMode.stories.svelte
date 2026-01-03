<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import DarkMode from './DarkMode.svelte';

  const { Story } = defineMeta({
    title: 'Components/DarkMode',
    component: DarkMode,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the dark mode toggle button',
      },
    },
    args: {
      size: 'md',
    },
  });
</script>

<!-- Default Dark Mode Toggle -->
<Story name="Default">
  {#snippet children(args)}
    <DarkMode {...args} />
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <div class="flex flex-col items-center gap-2">
        <DarkMode size="sm" />
        <span class="text-sm text-gray-500">Small</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <DarkMode size="md" />
        <span class="text-sm text-gray-500">Medium</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <DarkMode size="lg" />
        <span class="text-sm text-gray-500">Large</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- In Navbar Context -->
<Story name="In Navbar Context">
  {#snippet children(args)}
    <nav class="bg-white dark:bg-gray-900 border-b border-gray-200 dark:border-gray-700 px-4 py-2.5">
      <div class="flex justify-between items-center">
        <span class="text-xl font-semibold text-gray-900 dark:text-white">Brand</span>
        <div class="flex items-center gap-4">
          <a href="#" class="text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white">Home</a>
          <a href="#" class="text-gray-600 dark:text-gray-300 hover:text-gray-900 dark:hover:text-white">About</a>
          <DarkMode />
        </div>
      </div>
    </nav>
  {/snippet}
</Story>

<!-- With Custom Styling -->
<Story name="Custom Styling">
  {#snippet children(args)}
    <DarkMode class="p-3 rounded-full bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700" />
  {/snippet}
</Story>

<!-- Side by Side Comparison -->
<Story name="Theme Preview">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <div class="flex items-center justify-between p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <span class="text-gray-900 dark:text-white">Toggle theme</span>
        <DarkMode />
      </div>
      <div class="p-4 bg-white dark:bg-gray-900 border border-gray-200 dark:border-gray-700 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Theme Preview</h3>
        <p class="text-gray-600 dark:text-gray-400">
          Click the toggle above to switch between light and dark themes.
          The changes are persisted in localStorage.
        </p>
      </div>
    </div>
  {/snippet}
</Story>
