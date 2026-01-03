<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Progressbar from './Progressbar.svelte';

  const { Story } = defineMeta({
    title: 'Components/Progressbar',
    component: Progressbar,
    tags: ['autodocs'],
    argTypes: {
      progress: {
        control: { type: 'range', min: 0, max: 100 },
        description: 'The progress value (0-100)',
      },
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color of the progress bar',
      },
      size: {
        control: 'text',
        description: 'Height class for the progress bar',
      },
      labelInside: {
        control: 'boolean',
        description: 'Show label inside the progress bar',
      },
      labelOutside: {
        control: 'text',
        description: 'Label text to show above the progress bar',
      },
      animate: {
        control: 'boolean',
        description: 'Animate the progress bar value changes',
      },
    },
    args: {
      progress: '45',
      color: 'primary',
      size: 'h-2.5',
      labelInside: false,
      labelOutside: '',
      animate: false,
    },
  });
</script>

<!-- Default Progressbar -->
<Story name="Default">
  {#snippet children(args)}
    <Progressbar {...args} />
  {/snippet}
</Story>

<!-- With Different Progress Values -->
<Story name="Progress Values">
  {#snippet children(args)}
    <div class="space-y-4">
      <Progressbar progress="25" />
      <Progressbar progress="50" />
      <Progressbar progress="75" />
      <Progressbar progress="100" />
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <Progressbar progress="45" color="primary" />
      <Progressbar progress="55" color="red" />
      <Progressbar progress="65" color="green" />
      <Progressbar progress="75" color="yellow" />
      <Progressbar progress="85" color="indigo" />
      <Progressbar progress="95" color="purple" />
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="mb-2 text-sm text-gray-500">Extra Small (h-1)</p>
        <Progressbar progress="50" size="h-1" />
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500">Small (h-2)</p>
        <Progressbar progress="50" size="h-2" />
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500">Default (h-2.5)</p>
        <Progressbar progress="50" />
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500">Large (h-4)</p>
        <Progressbar progress="50" size="h-4" />
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500">Extra Large (h-6)</p>
        <Progressbar progress="50" size="h-6" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Label Inside -->
<Story name="With Label Inside">
  {#snippet children(args)}
    <div class="space-y-4">
      <Progressbar progress="25" labelInside size="h-4" color="primary" />
      <Progressbar progress="50" labelInside size="h-4" color="green" />
      <Progressbar progress="75" labelInside size="h-4" color="red" />
    </div>
  {/snippet}
</Story>

<!-- With Label Outside -->
<Story name="With Label Outside">
  {#snippet children(args)}
    <div class="space-y-6">
      <Progressbar progress="25" labelOutside="Uploading..." />
      <Progressbar progress="50" labelOutside="Processing..." />
      <Progressbar progress="75" labelOutside="Almost done..." />
    </div>
  {/snippet}
</Story>

<!-- Animated -->
<Story name="Animated">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500">These progress bars animate when their values change</p>
      <Progressbar progress="75" animate tweenDuration={800} />
    </div>
  {/snippet}
</Story>

<!-- Progress Steps -->
<Story name="Progress Steps">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <div class="flex justify-between mb-1">
          <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Step 1 of 4</span>
          <span class="text-sm text-gray-500 dark:text-gray-400">Personal Info</span>
        </div>
        <Progressbar progress="25" color="primary" />
      </div>
      <div>
        <div class="flex justify-between mb-1">
          <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Step 2 of 4</span>
          <span class="text-sm text-gray-500 dark:text-gray-400">Account Setup</span>
        </div>
        <Progressbar progress="50" color="primary" />
      </div>
      <div>
        <div class="flex justify-between mb-1">
          <span class="text-sm font-medium text-gray-700 dark:text-gray-300">Step 3 of 4</span>
          <span class="text-sm text-gray-500 dark:text-gray-400">Verification</span>
        </div>
        <Progressbar progress="75" color="primary" />
      </div>
    </div>
  {/snippet}
</Story>
