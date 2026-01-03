<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import CheckboxButton from './CheckboxButton.svelte';

  const { Story } = defineMeta({
    title: 'Forms/CheckboxButton',
    component: CheckboxButton,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'alternative', 'dark', 'light', 'green', 'red', 'yellow', 'purple'],
        description: 'The color of the button',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The size of the button',
      },
      pill: {
        control: 'boolean',
        description: 'Use pill shape',
      },
      outline: {
        control: 'boolean',
        description: 'Use outline style',
      },
    },
    args: {
      color: 'primary',
      size: 'md',
      pill: false,
      outline: false,
    },
  });

  let checked1 = $state(false);
  let checked2 = $state(true);
  let group = $state([]);
</script>

<!-- Default CheckboxButton -->
<Story name="Default">
  {#snippet children(args)}
    <div class="flex gap-4">
      <CheckboxButton {...args} bind:checked={checked1}>
        Click me
      </CheckboxButton>
      <p class="text-sm text-gray-500 dark:text-gray-400 self-center">
        Checked: {checked1}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <CheckboxButton color="primary">Primary</CheckboxButton>
      <CheckboxButton color="alternative">Alternative</CheckboxButton>
      <CheckboxButton color="dark">Dark</CheckboxButton>
      <CheckboxButton color="light">Light</CheckboxButton>
      <CheckboxButton color="green">Green</CheckboxButton>
      <CheckboxButton color="red">Red</CheckboxButton>
      <CheckboxButton color="yellow">Yellow</CheckboxButton>
      <CheckboxButton color="purple">Purple</CheckboxButton>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap items-center gap-4">
      <CheckboxButton size="xs">Extra Small</CheckboxButton>
      <CheckboxButton size="sm">Small</CheckboxButton>
      <CheckboxButton size="md">Medium</CheckboxButton>
      <CheckboxButton size="lg">Large</CheckboxButton>
      <CheckboxButton size="xl">Extra Large</CheckboxButton>
    </div>
  {/snippet}
</Story>

<!-- Pill Shape -->
<Story name="Pill Shape">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <CheckboxButton pill color="primary">Primary</CheckboxButton>
      <CheckboxButton pill color="green">Green</CheckboxButton>
      <CheckboxButton pill color="red">Red</CheckboxButton>
      <CheckboxButton pill color="purple">Purple</CheckboxButton>
    </div>
  {/snippet}
</Story>

<!-- Outline Style -->
<Story name="Outline Style">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <CheckboxButton outline color="primary">Primary</CheckboxButton>
      <CheckboxButton outline color="green">Green</CheckboxButton>
      <CheckboxButton outline color="red">Red</CheckboxButton>
      <CheckboxButton outline color="purple">Purple</CheckboxButton>
    </div>
  {/snippet}
</Story>

<!-- Group Selection -->
<Story name="Group Selection">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex flex-wrap gap-4">
        <CheckboxButton bind:group value="apple">Apple</CheckboxButton>
        <CheckboxButton bind:group value="banana">Banana</CheckboxButton>
        <CheckboxButton bind:group value="orange">Orange</CheckboxButton>
        <CheckboxButton bind:group value="grape">Grape</CheckboxButton>
      </div>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Selected: {group.length > 0 ? group.join(', ') : 'None'}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Feature Selection Example -->
<Story name="Feature Selection">
  {#snippet children(args)}
    <div class="space-y-4 max-w-lg">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white">Select features</h3>
      <div class="flex flex-wrap gap-3">
        <CheckboxButton outline color="primary" size="sm">Dark Mode</CheckboxButton>
        <CheckboxButton outline color="primary" size="sm">Notifications</CheckboxButton>
        <CheckboxButton outline color="primary" size="sm">Auto-save</CheckboxButton>
        <CheckboxButton outline color="primary" size="sm">Cloud Sync</CheckboxButton>
        <CheckboxButton outline color="primary" size="sm">Two-Factor Auth</CheckboxButton>
      </div>
    </div>
  {/snippet}
</Story>

