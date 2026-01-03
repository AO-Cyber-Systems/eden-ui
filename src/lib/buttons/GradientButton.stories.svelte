<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import GradientButton from './GradientButton.svelte';

  const { Story } = defineMeta({
    title: 'Components/GradientButton',
    component: GradientButton,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['blue', 'green', 'cyan', 'teal', 'lime', 'red', 'pink', 'purple', 'purpleToBlue', 'cyanToBlue', 'greenToBlue', 'purpleToPink', 'pinkToOrange', 'tealToLime', 'redToYellow'],
        description: 'The gradient color of the button',
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
        description: 'Renders an outlined version with gradient border',
      },
      shadow: {
        control: 'boolean',
        description: 'Adds a colored shadow',
      },
      disabled: {
        control: 'boolean',
        description: 'Disables the button',
      },
    },
    args: {
      color: 'blue',
      size: 'md',
      pill: false,
      outline: false,
      shadow: false,
      disabled: false,
    },
  });
</script>

<!-- Default Gradient Button -->
<Story name="Default">
  {#snippet children(args)}
    <GradientButton {...args}>Gradient Button</GradientButton>
  {/snippet}
</Story>

<!-- Solid Gradients -->
<Story name="Solid Colors">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <GradientButton color="blue">Blue</GradientButton>
      <GradientButton color="green">Green</GradientButton>
      <GradientButton color="cyan">Cyan</GradientButton>
      <GradientButton color="teal">Teal</GradientButton>
      <GradientButton color="lime">Lime</GradientButton>
      <GradientButton color="red">Red</GradientButton>
      <GradientButton color="pink">Pink</GradientButton>
      <GradientButton color="purple">Purple</GradientButton>
    </div>
  {/snippet}
</Story>

<!-- Duo-tone Gradients -->
<Story name="Duo-tone Gradients">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <GradientButton color="purpleToBlue">Purple to Blue</GradientButton>
      <GradientButton color="cyanToBlue">Cyan to Blue</GradientButton>
      <GradientButton color="greenToBlue">Green to Blue</GradientButton>
      <GradientButton color="purpleToPink">Purple to Pink</GradientButton>
      <GradientButton color="pinkToOrange">Pink to Orange</GradientButton>
      <GradientButton color="tealToLime">Teal to Lime</GradientButton>
      <GradientButton color="redToYellow">Red to Yellow</GradientButton>
    </div>
  {/snippet}
</Story>

<!-- Outline Gradients -->
<Story name="Outline" args={{ outline: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <GradientButton {...args} color="blue">Blue</GradientButton>
      <GradientButton {...args} color="green">Green</GradientButton>
      <GradientButton {...args} color="cyan">Cyan</GradientButton>
      <GradientButton {...args} color="purple">Purple</GradientButton>
      <GradientButton {...args} color="purpleToBlue">Purple to Blue</GradientButton>
      <GradientButton {...args} color="pinkToOrange">Pink to Orange</GradientButton>
    </div>
  {/snippet}
</Story>

<!-- With Shadow -->
<Story name="With Shadow" args={{ shadow: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <GradientButton {...args} color="blue">Blue Shadow</GradientButton>
      <GradientButton {...args} color="green">Green Shadow</GradientButton>
      <GradientButton {...args} color="purple">Purple Shadow</GradientButton>
      <GradientButton {...args} color="pink">Pink Shadow</GradientButton>
    </div>
  {/snippet}
</Story>

<!-- Pill Style -->
<Story name="Pill" args={{ pill: true }}>
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <GradientButton {...args} color="blue">Blue Pill</GradientButton>
      <GradientButton {...args} color="purpleToBlue">Purple to Blue</GradientButton>
      <GradientButton {...args} color="pinkToOrange">Pink to Orange</GradientButton>
    </div>
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex items-center gap-4 flex-wrap">
      <GradientButton color="blue" size="xs">Extra Small</GradientButton>
      <GradientButton color="blue" size="sm">Small</GradientButton>
      <GradientButton color="blue" size="md">Medium</GradientButton>
      <GradientButton color="blue" size="lg">Large</GradientButton>
      <GradientButton color="blue" size="xl">Extra Large</GradientButton>
    </div>
  {/snippet}
</Story>

<!-- Disabled -->
<Story name="Disabled" args={{ disabled: true }}>
  {#snippet children(args)}
    <GradientButton {...args} color="blue">Disabled</GradientButton>
  {/snippet}
</Story>

<!-- With Icon -->
<Story name="With Icon">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <GradientButton color="blue">
        <svg class="w-4 h-4 me-2" fill="currentColor" viewBox="0 0 20 20">
          <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 8.207-4 4a1 1 0 0 1-1.414 0l-2-2a1 1 0 0 1 1.414-1.414L9 10.586l3.293-3.293a1 1 0 0 1 1.414 1.414Z"/>
        </svg>
        Confirm
      </GradientButton>
      <GradientButton color="purpleToBlue">
        Download
        <svg class="w-4 h-4 ms-2" fill="currentColor" viewBox="0 0 20 20">
          <path d="M14.707 7.793a1 1 0 0 0-1.414 0L11 10.086V1.5a1 1 0 0 0-2 0v8.586L6.707 7.793a1 1 0 1 0-1.414 1.414l4 4a1 1 0 0 0 1.414 0l4-4a1 1 0 0 0 0-1.414Z"/>
          <path d="M18 12h-2.55l-2.975 2.975a3.5 3.5 0 0 1-4.95 0L4.55 12H2a2 2 0 0 0-2 2v4a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-4a2 2 0 0 0-2-2Zm-3 5a1 1 0 1 1 0-2 1 1 0 0 1 0 2Z"/>
        </svg>
      </GradientButton>
    </div>
  {/snippet}
</Story>
