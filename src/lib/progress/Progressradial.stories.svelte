<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Progressradial from './Progressradial.svelte';

  const { Story } = defineMeta({
    title: 'Components/Progressradial',
    component: Progressradial,
    tags: ['autodocs'],
    argTypes: {
      progress: {
        control: { type: 'range', min: 0, max: 100 },
        description: 'The progress value (0-100)',
      },
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color of the progress indicator',
      },
      size: {
        control: 'text',
        description: 'Size classes for the component',
      },
      thickness: {
        control: { type: 'range', min: 1, max: 20 },
        description: 'Stroke thickness of the circle',
      },
      startingPosition: {
        control: { type: 'select' },
        options: ['top', 'right', 'bottom', 'left'],
        description: 'Starting position of the progress arc',
      },
      labelInside: {
        control: 'boolean',
        description: 'Show percentage label inside the circle',
      },
      labelOutside: {
        control: 'text',
        description: 'Label text to show above the circle',
      },
      animate: {
        control: 'boolean',
        description: 'Animate the progress value changes',
      },
    },
    args: {
      progress: 45,
      color: 'primary',
      size: 'h-24 w-24',
      thickness: 4,
      startingPosition: 'top',
      labelInside: false,
      animate: false,
    },
  });
</script>

<!-- Default Progressradial -->
<Story name="Default">
  {#snippet children(args)}
    <Progressradial {...args} />
  {/snippet}
</Story>

<!-- With Label Inside -->
<Story name="With Label Inside">
  {#snippet children(args)}
    <div class="flex gap-8">
      <Progressradial progress={25} labelInside color="primary" />
      <Progressradial progress={50} labelInside color="green" />
      <Progressradial progress={75} labelInside color="red" />
      <Progressradial progress={100} labelInside color="indigo" />
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-6">
      <Progressradial progress={65} labelInside color="primary" />
      <Progressradial progress={65} labelInside color="red" />
      <Progressradial progress={65} labelInside color="green" />
      <Progressradial progress={65} labelInside color="yellow" />
      <Progressradial progress={65} labelInside color="indigo" />
      <Progressradial progress={65} labelInside color="purple" />
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="flex items-center gap-6">
      <div class="text-center">
        <Progressradial progress={65} labelInside size="h-16 w-16" />
        <p class="mt-2 text-sm text-gray-500">Small</p>
      </div>
      <div class="text-center">
        <Progressradial progress={65} labelInside size="h-24 w-24" />
        <p class="mt-2 text-sm text-gray-500">Default</p>
      </div>
      <div class="text-center">
        <Progressradial progress={65} labelInside size="h-32 w-32" />
        <p class="mt-2 text-sm text-gray-500">Large</p>
      </div>
      <div class="text-center">
        <Progressradial progress={65} labelInside size="h-40 w-40" />
        <p class="mt-2 text-sm text-gray-500">Extra Large</p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Thickness Variants -->
<Story name="Thickness Variants">
  {#snippet children(args)}
    <div class="flex items-center gap-6">
      <div class="text-center">
        <Progressradial progress={65} labelInside thickness={2} />
        <p class="mt-2 text-sm text-gray-500">Thin (2)</p>
      </div>
      <div class="text-center">
        <Progressradial progress={65} labelInside thickness={4} />
        <p class="mt-2 text-sm text-gray-500">Default (4)</p>
      </div>
      <div class="text-center">
        <Progressradial progress={65} labelInside thickness={8} />
        <p class="mt-2 text-sm text-gray-500">Medium (8)</p>
      </div>
      <div class="text-center">
        <Progressradial progress={65} labelInside thickness={12} />
        <p class="mt-2 text-sm text-gray-500">Thick (12)</p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Starting Positions -->
<Story name="Starting Positions">
  {#snippet children(args)}
    <div class="flex items-center gap-6">
      <div class="text-center">
        <Progressradial progress={25} labelInside startingPosition="top" />
        <p class="mt-2 text-sm text-gray-500">Top (default)</p>
      </div>
      <div class="text-center">
        <Progressradial progress={25} labelInside startingPosition="right" />
        <p class="mt-2 text-sm text-gray-500">Right</p>
      </div>
      <div class="text-center">
        <Progressradial progress={25} labelInside startingPosition="bottom" />
        <p class="mt-2 text-sm text-gray-500">Bottom</p>
      </div>
      <div class="text-center">
        <Progressradial progress={25} labelInside startingPosition="left" />
        <p class="mt-2 text-sm text-gray-500">Left</p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Label Outside -->
<Story name="With Label Outside">
  {#snippet children(args)}
    <div class="flex gap-8">
      <Progressradial progress={45} labelOutside="Uploading" />
      <Progressradial progress={75} labelOutside="Processing" />
      <Progressradial progress={100} labelOutside="Complete" color="green" />
    </div>
  {/snippet}
</Story>

<!-- Animated -->
<Story name="Animated">
  {#snippet children(args)}
    <Progressradial progress={85} labelInside animate tweenDuration={800} />
  {/snippet}
</Story>

<!-- Dashboard Stats -->
<Story name="Dashboard Stats">
  {#snippet children(args)}
    <div class="flex gap-8">
      <div class="text-center">
        <Progressradial progress={72} labelInside color="green" size="h-28 w-28" />
        <p class="mt-2 font-medium text-gray-700 dark:text-gray-300">CPU Usage</p>
      </div>
      <div class="text-center">
        <Progressradial progress={45} labelInside color="blue" size="h-28 w-28" />
        <p class="mt-2 font-medium text-gray-700 dark:text-gray-300">Memory</p>
      </div>
      <div class="text-center">
        <Progressradial progress={89} labelInside color="red" size="h-28 w-28" />
        <p class="mt-2 font-medium text-gray-700 dark:text-gray-300">Storage</p>
      </div>
    </div>
  {/snippet}
</Story>
