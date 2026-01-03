<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Alert from './Alert.svelte';

  const { Story } = defineMeta({
    title: 'Components/Alert',
    component: Alert,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color variant of the alert',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg'],
        description: 'The size of the alert',
      },
      rounded: {
        control: 'boolean',
        description: 'Whether the alert has rounded corners',
      },
      border: {
        control: 'boolean',
        description: 'Whether the alert has a border accent',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the alert can be dismissed',
      },
    },
    args: {
      color: 'primary',
      size: 'md',
      rounded: true,
      border: false,
      dismissable: false,
    },
  });
</script>

<!-- Default Alert -->
<Story name="Default">
  {#snippet children(args)}
    <Alert {...args}>
      <span class="font-medium">Default alert!</span> This is a standard alert message.
    </Alert>
  {/snippet}
</Story>

<!-- All Colors -->
<Story name="All Colors">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <Alert color="primary">Primary alert</Alert>
      <Alert color="blue">Blue alert</Alert>
      <Alert color="red">Red alert - danger/error</Alert>
      <Alert color="green">Green alert - success</Alert>
      <Alert color="yellow">Yellow alert - warning</Alert>
      <Alert color="gray">Gray alert - info</Alert>
      <Alert color="purple">Purple alert</Alert>
      <Alert color="pink">Pink alert</Alert>
    </div>
  {/snippet}
</Story>

<!-- With Border -->
<Story name="With Border" args={{ border: true }}>
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <Alert color="blue" border>
        <span class="font-medium">Info!</span> Blue alert with border accent.
      </Alert>
      <Alert color="red" border>
        <span class="font-medium">Error!</span> Red alert with border accent.
      </Alert>
      <Alert color="green" border>
        <span class="font-medium">Success!</span> Green alert with border accent.
      </Alert>
      <Alert color="yellow" border>
        <span class="font-medium">Warning!</span> Yellow alert with border accent.
      </Alert>
    </div>
  {/snippet}
</Story>

<!-- Dismissable -->
<Story name="Dismissable" args={{ dismissable: true }}>
  {#snippet children(args)}
    <Alert {...args} color="blue">
      <span class="font-medium">Dismissable!</span> Click the X to dismiss this alert.
    </Alert>
  {/snippet}
</Story>

<!-- With Icon -->
<Story name="With Icon">
  {#snippet children(args)}
    <Alert color="blue">
      {#snippet icon()}
        <svg class="w-4 h-4 me-2 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
          <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
        </svg>
      {/snippet}
      <span class="font-medium">Info alert!</span> This alert has an icon.
    </Alert>
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <Alert size="xs" color="blue">Extra small alert</Alert>
      <Alert size="sm" color="blue">Small alert</Alert>
      <Alert size="md" color="blue">Medium alert (default)</Alert>
      <Alert size="lg" color="blue">Large alert</Alert>
    </div>
  {/snippet}
</Story>
