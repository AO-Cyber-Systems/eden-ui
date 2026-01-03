<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Badge from './Badge.svelte';

  const { Story } = defineMeta({
    title: 'Components/Badge',
    component: Badge,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose', 'dark'],
        description: 'The color variant of the badge',
      },
      large: {
        control: 'boolean',
        description: 'Whether the badge is large size',
      },
      border: {
        control: 'boolean',
        description: 'Whether the badge has a border',
      },
      rounded: {
        control: 'boolean',
        description: 'Whether the badge is fully rounded (pill)',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the badge can be dismissed',
      },
    },
    args: {
      color: 'primary',
      large: false,
      border: false,
      rounded: false,
      dismissable: false,
    },
  });
</script>

<!-- Default Badge -->
<Story name="Default">
  {#snippet children(args)}
    <Badge {...args}>Default</Badge>
  {/snippet}
</Story>

<!-- All Colors -->
<Story name="All Colors">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge color="primary">Primary</Badge>
      <Badge color="secondary">Secondary</Badge>
      <Badge color="dark">Dark</Badge>
      <Badge color="gray">Gray</Badge>
      <Badge color="red">Red</Badge>
      <Badge color="orange">Orange</Badge>
      <Badge color="yellow">Yellow</Badge>
      <Badge color="green">Green</Badge>
      <Badge color="teal">Teal</Badge>
      <Badge color="blue">Blue</Badge>
      <Badge color="indigo">Indigo</Badge>
      <Badge color="purple">Purple</Badge>
      <Badge color="pink">Pink</Badge>
    </div>
  {/snippet}
</Story>

<!-- Large Badges -->
<Story name="Large" args={{ large: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge {...args} color="primary">Large Primary</Badge>
      <Badge {...args} color="blue">Large Blue</Badge>
      <Badge {...args} color="green">Large Green</Badge>
      <Badge {...args} color="red">Large Red</Badge>
    </div>
  {/snippet}
</Story>

<!-- With Border -->
<Story name="With Border" args={{ border: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge {...args} color="primary">Primary</Badge>
      <Badge {...args} color="blue">Blue</Badge>
      <Badge {...args} color="green">Green</Badge>
      <Badge {...args} color="red">Red</Badge>
      <Badge {...args} color="yellow">Yellow</Badge>
    </div>
  {/snippet}
</Story>

<!-- Rounded (Pill) -->
<Story name="Rounded Pill" args={{ rounded: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge {...args} color="primary">Primary Pill</Badge>
      <Badge {...args} color="blue">Blue Pill</Badge>
      <Badge {...args} color="green">Green Pill</Badge>
      <Badge {...args} color="red">Red Pill</Badge>
    </div>
  {/snippet}
</Story>

<!-- Dismissable -->
<Story name="Dismissable" args={{ dismissable: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge {...args} color="primary">Dismissable</Badge>
      <Badge {...args} color="blue" large>Large Dismissable</Badge>
    </div>
  {/snippet}
</Story>

<!-- As Link -->
<Story name="As Link">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge href="#" color="primary">Link Badge</Badge>
      <Badge href="#" color="blue">Another Link</Badge>
    </div>
  {/snippet}
</Story>

<!-- Badge with Icon -->
<Story name="With Icon">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Badge color="gray">
        <svg class="w-2.5 h-2.5 me-1.5" fill="currentColor" viewBox="0 0 20 20">
          <path d="M10 0a10 10 0 1 0 10 10A10.011 10.011 0 0 0 10 0Zm3.982 13.982a1 1 0 0 1-1.414 0l-3.274-3.274A1.012 1.012 0 0 1 9 10V6a1 1 0 0 1 2 0v3.586l2.982 2.982a1 1 0 0 1 0 1.414Z"/>
        </svg>
        3 days ago
      </Badge>
      <Badge color="green">
        <svg class="w-2.5 h-2.5 me-1.5" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
        </svg>
        Verified
      </Badge>
    </div>
  {/snippet}
</Story>
