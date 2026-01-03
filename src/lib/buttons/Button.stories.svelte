<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Button from './Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Button',
    component: Button,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: [
          'primary', 'secondary', 'dark', 'light', 'alternative',
          'gray', 'red', 'orange', 'amber', 'yellow', 'lime',
          'green', 'emerald', 'teal', 'cyan', 'sky', 'blue',
          'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'
        ],
        description: 'The color variant of the button',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The size of the button',
      },
      pill: {
        control: 'boolean',
        description: 'Makes the button fully rounded',
      },
      outline: {
        control: 'boolean',
        description: 'Renders an outlined version',
      },
      shadow: {
        control: 'boolean',
        description: 'Adds a colored shadow',
      },
      disabled: {
        control: 'boolean',
        description: 'Disables the button',
      },
      loading: {
        control: 'boolean',
        description: 'Shows a loading spinner',
      },
    },
    args: {
      color: 'primary',
      size: 'md',
      pill: false,
      outline: false,
      shadow: false,
      disabled: false,
      loading: false,
    },
  });
</script>

<!-- Default Button -->
<Story name="Default">
  {#snippet children(args)}
    <Button {...args}>Button</Button>
  {/snippet}
</Story>

<!-- Primary Button -->
<Story name="Primary" args={{ color: 'primary' }}>
  {#snippet children(args)}
    <Button {...args}>Primary</Button>
  {/snippet}
</Story>

<!-- Secondary Button -->
<Story name="Secondary" args={{ color: 'secondary' }}>
  {#snippet children(args)}
    <Button {...args}>Secondary</Button>
  {/snippet}
</Story>

<!-- All Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex items-center gap-4 flex-wrap">
      <Button size="xs">Extra Small</Button>
      <Button size="sm">Small</Button>
      <Button size="md">Medium</Button>
      <Button size="lg">Large</Button>
      <Button size="xl">Extra Large</Button>
    </div>
  {/snippet}
</Story>

<!-- Pill Buttons -->
<Story name="Pill" args={{ pill: true }}>
  {#snippet children(args)}
    <div class="flex items-center gap-4 flex-wrap">
      <Button pill color="primary">Primary Pill</Button>
      <Button pill color="secondary">Secondary Pill</Button>
      <Button pill color="green">Success Pill</Button>
      <Button pill color="red">Danger Pill</Button>
    </div>
  {/snippet}
</Story>

<!-- Outline Buttons -->
<Story name="Outline" args={{ outline: true }}>
  {#snippet children(args)}
    <div class="flex items-center gap-4 flex-wrap">
      <Button outline color="primary">Primary</Button>
      <Button outline color="secondary">Secondary</Button>
      <Button outline color="green">Success</Button>
      <Button outline color="red">Danger</Button>
      <Button outline color="dark">Dark</Button>
    </div>
  {/snippet}
</Story>

<!-- Shadow Buttons -->
<Story name="With Shadow" args={{ shadow: true }}>
  {#snippet children(args)}
    <div class="flex items-center gap-4 flex-wrap">
      <Button shadow color="primary">Primary</Button>
      <Button shadow color="blue">Blue</Button>
      <Button shadow color="green">Green</Button>
      <Button shadow color="cyan">Cyan</Button>
      <Button shadow color="teal">Teal</Button>
      <Button shadow color="purple">Purple</Button>
    </div>
  {/snippet}
</Story>

<!-- Disabled State -->
<Story name="Disabled" args={{ disabled: true }}>
  {#snippet children(args)}
    <Button {...args}>Disabled Button</Button>
  {/snippet}
</Story>

<!-- Loading State -->
<Story name="Loading" args={{ loading: true }}>
  {#snippet children(args)}
    <Button {...args}>Loading...</Button>
  {/snippet}
</Story>

<!-- All Colors -->
<Story name="All Colors">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Button color="primary">Primary</Button>
      <Button color="secondary">Secondary</Button>
      <Button color="dark">Dark</Button>
      <Button color="light">Light</Button>
      <Button color="alternative">Alternative</Button>
      <Button color="gray">Gray</Button>
      <Button color="red">Red</Button>
      <Button color="orange">Orange</Button>
      <Button color="amber">Amber</Button>
      <Button color="yellow">Yellow</Button>
      <Button color="lime">Lime</Button>
      <Button color="green">Green</Button>
      <Button color="emerald">Emerald</Button>
      <Button color="teal">Teal</Button>
      <Button color="cyan">Cyan</Button>
      <Button color="sky">Sky</Button>
      <Button color="blue">Blue</Button>
      <Button color="indigo">Indigo</Button>
      <Button color="violet">Violet</Button>
      <Button color="purple">Purple</Button>
      <Button color="fuchsia">Fuchsia</Button>
      <Button color="pink">Pink</Button>
      <Button color="rose">Rose</Button>
    </div>
  {/snippet}
</Story>
