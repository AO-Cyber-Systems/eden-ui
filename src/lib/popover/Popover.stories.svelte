<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Popover from './Popover.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Popover',
    component: Popover,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['default', 'light', 'green', 'red', 'blue', 'purple', 'yellow'],
        description: 'The color theme of the popover',
      },
      placement: {
        control: { type: 'select' },
        options: ['top', 'top-start', 'top-end', 'right', 'right-start', 'right-end', 'bottom', 'bottom-start', 'bottom-end', 'left', 'left-start', 'left-end'],
        description: 'The placement of the popover',
      },
      trigger: {
        control: { type: 'select' },
        options: ['hover', 'click', 'focus'],
        description: 'The trigger event for the popover',
      },
      arrow: {
        control: 'boolean',
        description: 'Whether to show the arrow',
      },
    },
    args: {
      color: 'default',
      placement: 'top',
      trigger: 'hover',
      arrow: true,
    },
  });
</script>

<!-- Default Popover -->
<Story name="Default">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Popover {...args} title="Popover title">
        {#snippet trigger()}
          <Button color="primary">Hover me</Button>
        {/snippet}
        And here's some amazing content. It's very engaging. Right?
      </Popover>
    </div>
  {/snippet}
</Story>

<!-- Placement Variants -->
<Story name="Placement Variants">
  {#snippet children(args)}
    <div class="grid grid-cols-3 gap-4 py-16">
      <div class="flex justify-center">
        <Popover title="Top" placement="top">
          {#snippet trigger()}
            <Button color="alternative">Top</Button>
          {/snippet}
          Popover on top
        </Popover>
      </div>
      <div class="flex justify-center">
        <Popover title="Right" placement="right">
          {#snippet trigger()}
            <Button color="alternative">Right</Button>
          {/snippet}
          Popover on right
        </Popover>
      </div>
      <div class="flex justify-center">
        <Popover title="Bottom" placement="bottom">
          {#snippet trigger()}
            <Button color="alternative">Bottom</Button>
          {/snippet}
          Popover on bottom
        </Popover>
      </div>
      <div class="flex justify-center col-start-2">
        <Popover title="Left" placement="left">
          {#snippet trigger()}
            <Button color="alternative">Left</Button>
          {/snippet}
          Popover on left
        </Popover>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap justify-center gap-4 py-16">
      <Popover title="Default" color="default">
        {#snippet trigger()}
          <Button color="dark">Default</Button>
        {/snippet}
        Default popover style
      </Popover>
      <Popover title="Light" color="light">
        {#snippet trigger()}
          <Button color="light">Light</Button>
        {/snippet}
        Light popover style
      </Popover>
      <Popover title="Green" color="green">
        {#snippet trigger()}
          <Button color="green">Green</Button>
        {/snippet}
        Green popover style
      </Popover>
      <Popover title="Red" color="red">
        {#snippet trigger()}
          <Button color="red">Red</Button>
        {/snippet}
        Red popover style
      </Popover>
      <Popover title="Blue" color="blue">
        {#snippet trigger()}
          <Button color="blue">Blue</Button>
        {/snippet}
        Blue popover style
      </Popover>
    </div>
  {/snippet}
</Story>

<!-- Click Trigger -->
<Story name="Click Trigger">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Popover title="Click Popover" trigger="click">
        {#snippet trigger()}
          <Button color="primary">Click me</Button>
        {/snippet}
        This popover appears on click instead of hover.
      </Popover>
    </div>
  {/snippet}
</Story>

<!-- Without Arrow -->
<Story name="Without Arrow">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Popover title="No Arrow" arrow={false}>
        {#snippet trigger()}
          <Button color="alternative">No Arrow</Button>
        {/snippet}
        This popover has no arrow pointer.
      </Popover>
    </div>
  {/snippet}
</Story>

<!-- Custom Title Snippet -->
<Story name="Custom Title">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Popover>
        {#snippet trigger()}
          <Button color="primary">Custom Title</Button>
        {/snippet}
        {#snippet title()}
          <div class="flex items-center gap-2 px-3 py-2 bg-gray-100 dark:bg-gray-700 border-b border-gray-200 dark:border-gray-600">
            <svg class="w-5 h-5 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
            </svg>
            <span class="font-semibold text-gray-900 dark:text-white">Information</span>
          </div>
        {/snippet}
        This popover uses a custom title snippet.
      </Popover>
    </div>
  {/snippet}
</Story>

<!-- Rich Content -->
<Story name="Rich Content">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Popover title="User Profile" placement="bottom">
        {#snippet trigger()}
          <Button color="primary">View Profile</Button>
        {/snippet}
        <div class="flex items-center gap-3">
          <img class="w-10 h-10 rounded-full" src="https://flowbite.com/docs/images/people/profile-picture-1.jpg" alt="User avatar" />
          <div>
            <p class="font-semibold text-gray-900 dark:text-white">Jese Leos</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">@jeseleos</p>
          </div>
        </div>
        <p class="mt-3 text-sm text-gray-500 dark:text-gray-400">
          Open-source contributor. Building for the web.
        </p>
        <div class="flex gap-4 mt-3 text-sm">
          <div>
            <span class="font-semibold text-gray-900 dark:text-white">127</span>
            <span class="text-gray-500 dark:text-gray-400">Following</span>
          </div>
          <div>
            <span class="font-semibold text-gray-900 dark:text-white">1,234</span>
            <span class="text-gray-500 dark:text-gray-400">Followers</span>
          </div>
        </div>
      </Popover>
    </div>
  {/snippet}
</Story>

<!-- Image Popover -->
<Story name="Image Popover">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <Popover title="Product Preview" placement="right">
        {#snippet trigger()}
          <span class="text-blue-600 hover:underline cursor-pointer">Apple iMac 27"</span>
        {/snippet}
        <div class="w-64">
          <img src="https://flowbite.com/docs/images/products/apple-imac.png" alt="iMac" class="w-full h-auto" />
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            The new iMac delivers outstanding performance with the M3 chip.
          </p>
          <p class="mt-1 text-lg font-semibold text-gray-900 dark:text-white">$1,799</p>
        </div>
      </Popover>
    </div>
  {/snippet}
</Story>
