<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Indicator from './Indicator.svelte';
  import Avatar from '../avatar/Avatar.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Indicator',
    component: Indicator,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose', 'none'],
        description: 'The color of the indicator',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The size of the indicator',
      },
      cornerStyle: {
        control: { type: 'select' },
        options: ['circular', 'rounded', 'default'],
        description: 'The corner style of the indicator',
      },
      placement: {
        control: { type: 'select' },
        options: ['top-left', 'top-center', 'top-right', 'center-left', 'center', 'center-right', 'bottom-left', 'bottom-center', 'bottom-right'],
        description: 'The placement of the indicator',
      },
      border: {
        control: 'boolean',
        description: 'Whether to show a border',
      },
      offset: {
        control: 'boolean',
        description: 'Whether to offset the indicator from the edge',
      },
    },
    args: {
      color: 'primary',
      size: 'md',
      cornerStyle: 'circular',
      border: false,
      offset: true,
    },
  });
</script>

<!-- Default Indicator -->
<Story name="Default">
  {#snippet children(args)}
    <Indicator {...args} />
  {/snippet}
</Story>

<!-- Colors -->
<Story name="Colors">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <Indicator color="primary" />
      <Indicator color="secondary" />
      <Indicator color="gray" />
      <Indicator color="red" />
      <Indicator color="orange" />
      <Indicator color="yellow" />
      <Indicator color="green" />
      <Indicator color="teal" />
      <Indicator color="blue" />
      <Indicator color="indigo" />
      <Indicator color="purple" />
      <Indicator color="pink" />
    </div>
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" size="xs" />
        <span class="text-xs text-gray-500">XS</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" size="sm" />
        <span class="text-xs text-gray-500">SM</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" size="md" />
        <span class="text-xs text-gray-500">MD</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" size="lg" />
        <span class="text-xs text-gray-500">LG</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" size="xl" />
        <span class="text-xs text-gray-500">XL</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Border -->
<Story name="With Border">
  {#snippet children(args)}
    <div class="flex gap-4">
      <Indicator color="primary" border />
      <Indicator color="red" border />
      <Indicator color="green" border />
      <Indicator color="yellow" border />
    </div>
  {/snippet}
</Story>

<!-- Corner Styles -->
<Story name="Corner Styles">
  {#snippet children(args)}
    <div class="flex items-center gap-6">
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" cornerStyle="circular" size="lg" />
        <span class="text-xs text-gray-500">Circular</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" cornerStyle="rounded" size="lg" />
        <span class="text-xs text-gray-500">Rounded</span>
      </div>
      <div class="flex flex-col items-center gap-2">
        <Indicator color="primary" cornerStyle="default" size="lg" />
        <span class="text-xs text-gray-500">Default</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Positioning -->
<Story name="Positioning">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-8 py-4">
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="top-left" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="top-center" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="top-right" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="center-left" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="center" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="center-right" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="bottom-left" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="bottom-center" color="red" />
      </div>
      <div class="relative w-16 h-16 bg-gray-200 dark:bg-gray-700 rounded-lg">
        <Indicator placement="bottom-right" color="red" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Avatar -->
<Story name="With Avatar">
  {#snippet children(args)}
    <div class="flex gap-6">
      <div class="relative">
        <Avatar src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
        <Indicator placement="bottom-right" color="green" border />
      </div>
      <div class="relative">
        <Avatar src="https://flowbite.com/docs/images/people/profile-picture-4.jpg" />
        <Indicator placement="bottom-right" color="red" border />
      </div>
      <div class="relative">
        <Avatar src="https://flowbite.com/docs/images/people/profile-picture-3.jpg" />
        <Indicator placement="bottom-right" color="gray" border />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Button (Notification Badge) -->
<Story name="Notification Badge">
  {#snippet children(args)}
    <div class="flex gap-4">
      <div class="relative inline-flex">
        <Button color="primary">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"/>
          </svg>
        </Button>
        <Indicator placement="top-right" color="red" size="sm" border />
      </div>
      <div class="relative inline-flex">
        <Button color="alternative">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10c0 3.866-3.582 7-8 7a8.841 8.841 0 01-4.083-.98L2 17l1.338-3.123C2.493 12.767 2 11.434 2 10c0-3.866 3.582-7 8-7s8 3.134 8 7zM7 9H5v2h2V9zm8 0h-2v2h2V9zM9 9h2v2H9V9z" clip-rule="evenodd"/>
          </svg>
        </Button>
        <Indicator placement="top-right" color="green" size="sm" border />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Text Content -->
<Story name="With Text Content">
  {#snippet children(args)}
    <div class="flex gap-4">
      <Indicator color="red" size="xl" class="text-xs font-bold text-white">5</Indicator>
      <Indicator color="blue" size="xl" class="text-xs font-bold text-white">12</Indicator>
      <Indicator color="green" size="xl" class="text-xs font-bold text-white">99+</Indicator>
    </div>
  {/snippet}
</Story>
