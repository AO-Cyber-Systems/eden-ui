<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Tooltip from './Tooltip.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Tooltip',
    component: Tooltip,
    tags: ['autodocs'],
    argTypes: {
      type: {
        control: { type: 'select' },
        options: ['dark', 'light', 'auto'],
        description: 'The type/theme of the tooltip',
      },
      color: {
        control: { type: 'select' },
        options: ['default', 'primary', 'secondary', 'gray', 'red', 'green', 'blue', 'yellow', 'purple'],
        description: 'The color of the tooltip',
      },
      placement: {
        control: { type: 'select' },
        options: ['top', 'top-start', 'top-end', 'right', 'right-start', 'right-end', 'bottom', 'bottom-start', 'bottom-end', 'left', 'left-start', 'left-end'],
        description: 'The placement of the tooltip',
      },
      trigger: {
        control: { type: 'select' },
        options: ['hover', 'click', 'focus'],
        description: 'The trigger event for the tooltip',
      },
      arrow: {
        control: 'boolean',
        description: 'Whether to show the arrow',
      },
    },
    args: {
      type: 'dark',
      placement: 'top',
      trigger: 'hover',
      arrow: true,
    },
  });
</script>

<!-- Default Tooltip -->
<Story name="Default">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Tooltip {...args}>
        {#snippet trigger()}
          <Button color="primary">Hover me</Button>
        {/snippet}
        Tooltip content goes here
      </Tooltip>
    </div>
  {/snippet}
</Story>

<!-- Placement Variants -->
<Story name="Placement Variants">
  {#snippet children(args)}
    <div class="grid grid-cols-3 gap-4 py-16">
      <div class="flex justify-center">
        <Tooltip placement="top">
          {#snippet trigger()}
            <Button color="alternative">Top</Button>
          {/snippet}
          Tooltip on top
        </Tooltip>
      </div>
      <div class="flex justify-center">
        <Tooltip placement="right">
          {#snippet trigger()}
            <Button color="alternative">Right</Button>
          {/snippet}
          Tooltip on right
        </Tooltip>
      </div>
      <div class="flex justify-center">
        <Tooltip placement="bottom">
          {#snippet trigger()}
            <Button color="alternative">Bottom</Button>
          {/snippet}
          Tooltip on bottom
        </Tooltip>
      </div>
      <div class="flex justify-center col-start-2">
        <Tooltip placement="left">
          {#snippet trigger()}
            <Button color="alternative">Left</Button>
          {/snippet}
          Tooltip on left
        </Tooltip>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Type Variants -->
<Story name="Type Variants">
  {#snippet children(args)}
    <div class="flex justify-center gap-4 py-16">
      <Tooltip type="dark">
        {#snippet trigger()}
          <Button color="dark">Dark</Button>
        {/snippet}
        Dark tooltip (default)
      </Tooltip>
      <Tooltip type="light">
        {#snippet trigger()}
          <Button color="light">Light</Button>
        {/snippet}
        Light tooltip
      </Tooltip>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap justify-center gap-4 py-16">
      <Tooltip color="primary">
        {#snippet trigger()}
          <Button color="primary">Primary</Button>
        {/snippet}
        Primary colored tooltip
      </Tooltip>
      <Tooltip color="red">
        {#snippet trigger()}
          <Button color="red">Red</Button>
        {/snippet}
        Red colored tooltip
      </Tooltip>
      <Tooltip color="green">
        {#snippet trigger()}
          <Button color="green">Green</Button>
        {/snippet}
        Green colored tooltip
      </Tooltip>
      <Tooltip color="blue">
        {#snippet trigger()}
          <Button color="blue">Blue</Button>
        {/snippet}
        Blue colored tooltip
      </Tooltip>
      <Tooltip color="yellow">
        {#snippet trigger()}
          <Button color="yellow">Yellow</Button>
        {/snippet}
        Yellow colored tooltip
      </Tooltip>
    </div>
  {/snippet}
</Story>

<!-- Click Trigger -->
<Story name="Click Trigger">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Tooltip trigger="click">
        {#snippet trigger()}
          <Button color="primary">Click me</Button>
        {/snippet}
        This tooltip appears on click
      </Tooltip>
    </div>
  {/snippet}
</Story>

<!-- Without Arrow -->
<Story name="Without Arrow">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Tooltip arrow={false}>
        {#snippet trigger()}
          <Button color="alternative">No Arrow</Button>
        {/snippet}
        Tooltip without arrow
      </Tooltip>
    </div>
  {/snippet}
</Story>

<!-- On Icons -->
<Story name="On Icons">
  {#snippet children(args)}
    <div class="flex justify-center gap-6 py-16">
      <Tooltip>
        {#snippet trigger()}
          <button class="p-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
            </svg>
          </button>
        {/snippet}
        Home
      </Tooltip>
      <Tooltip>
        {#snippet trigger()}
          <button class="p-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
            </svg>
          </button>
        {/snippet}
        Settings
      </Tooltip>
      <Tooltip>
        {#snippet trigger()}
          <button class="p-2 text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
            <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
            </svg>
          </button>
        {/snippet}
        Help
      </Tooltip>
    </div>
  {/snippet}
</Story>

<!-- On Text -->
<Story name="On Text">
  {#snippet children(args)}
    <div class="py-8">
      <p class="text-gray-600 dark:text-gray-400">
        You can add tooltips to any
        <Tooltip>
          {#snippet trigger()}
            <span class="text-blue-600 underline decoration-dotted cursor-help">inline text</span>
          {/snippet}
          This is helpful for defining terms or providing additional context
        </Tooltip>
        to provide additional information without cluttering the interface.
      </p>
    </div>
  {/snippet}
</Story>

<!-- Multi-line Content -->
<Story name="Multi-line Content">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Tooltip placement="bottom" class="max-w-xs">
        {#snippet trigger()}
          <Button color="primary">Detailed Info</Button>
        {/snippet}
        <div>
          <p class="font-semibold mb-1">Important Information</p>
          <p class="text-sm">This tooltip contains multiple lines of text to explain something in more detail.</p>
        </div>
      </Tooltip>
    </div>
  {/snippet}
</Story>
