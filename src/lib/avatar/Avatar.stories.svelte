<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Avatar from './Avatar.svelte';

  const { Story } = defineMeta({
    title: 'Components/Avatar',
    component: Avatar,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The size of the avatar',
      },
      cornerStyle: {
        control: { type: 'select' },
        options: ['circular', 'rounded'],
        description: 'The corner style of the avatar',
      },
      border: {
        control: 'boolean',
        description: 'Whether the avatar has a border',
      },
      stacked: {
        control: 'boolean',
        description: 'Whether the avatar is stacked (overlapping)',
      },
    },
    args: {
      size: 'md',
      cornerStyle: 'circular',
      border: false,
      stacked: false,
    },
  });
</script>

<!-- Default Avatar (Placeholder) -->
<Story name="Default">
  {#snippet children(args)}
    <Avatar {...args} />
  {/snippet}
</Story>

<!-- With Image -->
<Story name="With Image">
  {#snippet children(args)}
    <Avatar {...args} src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="User avatar" />
  {/snippet}
</Story>

<!-- All Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <Avatar size="xs" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar size="sm" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar size="md" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar size="lg" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar size="xl" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
    </div>
  {/snippet}
</Story>

<!-- Corner Styles -->
<Story name="Corner Styles">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <Avatar cornerStyle="circular" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar cornerStyle="rounded" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
    </div>
  {/snippet}
</Story>

<!-- With Border -->
<Story name="With Border" args={{ border: true }}>
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <Avatar {...args} src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar {...args} cornerStyle="rounded" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
    </div>
  {/snippet}
</Story>

<!-- With Dot Indicator -->
<Story name="With Dot">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <Avatar dot={{ color: 'green' }} src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar dot={{ color: 'red' }} src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar dot={{ color: 'yellow' }} src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
      <Avatar dot={{ color: 'gray' }} src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
    </div>
  {/snippet}
</Story>

<!-- Stacked Avatars -->
<Story name="Stacked">
  {#snippet children(args)}
    <div class="flex -space-x-4">
      <Avatar stacked src="https://flowbite.com/docs/images/people/profile-picture-1.jpg" />
      <Avatar stacked src="https://flowbite.com/docs/images/people/profile-picture-2.jpg" />
      <Avatar stacked src="https://flowbite.com/docs/images/people/profile-picture-3.jpg" />
      <Avatar stacked src="https://flowbite.com/docs/images/people/profile-picture-4.jpg" />
      <Avatar stacked src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" />
    </div>
  {/snippet}
</Story>

<!-- With Initials -->
<Story name="With Initials">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <Avatar class="bg-blue-600 text-white">
        <span class="text-sm font-medium">JD</span>
      </Avatar>
      <Avatar class="bg-green-600 text-white" size="lg">
        <span class="text-lg font-medium">AB</span>
      </Avatar>
      <Avatar class="bg-purple-600 text-white" cornerStyle="rounded">
        <span class="text-sm font-medium">XY</span>
      </Avatar>
    </div>
  {/snippet}
</Story>

<!-- As Link -->
<Story name="As Link">
  {#snippet children(args)}
    <Avatar href="#" src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="Click me" />
  {/snippet}
</Story>
