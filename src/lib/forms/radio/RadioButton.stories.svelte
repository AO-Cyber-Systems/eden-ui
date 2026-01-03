<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import RadioButton from './RadioButton.svelte';

  const { Story } = defineMeta({
    title: 'Forms/RadioButton',
    component: RadioButton,
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

  let selectedFruit = $state('apple');
  let selectedSize = $state('md');
  let selectedPlan = $state('free');
</script>

<!-- Default RadioButton -->
<Story name="Default">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex flex-wrap gap-4">
        <RadioButton {...args} bind:group={selectedFruit} value="apple">Apple</RadioButton>
        <RadioButton {...args} bind:group={selectedFruit} value="banana">Banana</RadioButton>
        <RadioButton {...args} bind:group={selectedFruit} value="orange">Orange</RadioButton>
      </div>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Selected: {selectedFruit}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <RadioButton color="primary" bind:group={selectedFruit} value="primary">Primary</RadioButton>
      <RadioButton color="alternative" bind:group={selectedFruit} value="alternative">Alternative</RadioButton>
      <RadioButton color="dark" bind:group={selectedFruit} value="dark">Dark</RadioButton>
      <RadioButton color="light" bind:group={selectedFruit} value="light">Light</RadioButton>
      <RadioButton color="green" bind:group={selectedFruit} value="green">Green</RadioButton>
      <RadioButton color="red" bind:group={selectedFruit} value="red">Red</RadioButton>
      <RadioButton color="yellow" bind:group={selectedFruit} value="yellow">Yellow</RadioButton>
      <RadioButton color="purple" bind:group={selectedFruit} value="purple">Purple</RadioButton>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap items-center gap-4">
      <RadioButton size="xs" bind:group={selectedSize} value="xs">Extra Small</RadioButton>
      <RadioButton size="sm" bind:group={selectedSize} value="sm">Small</RadioButton>
      <RadioButton size="md" bind:group={selectedSize} value="md">Medium</RadioButton>
      <RadioButton size="lg" bind:group={selectedSize} value="lg">Large</RadioButton>
      <RadioButton size="xl" bind:group={selectedSize} value="xl">Extra Large</RadioButton>
    </div>
  {/snippet}
</Story>

<!-- Pill Shape -->
<Story name="Pill Shape">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <RadioButton pill color="primary" bind:group={selectedFruit} value="pill1">Option 1</RadioButton>
      <RadioButton pill color="green" bind:group={selectedFruit} value="pill2">Option 2</RadioButton>
      <RadioButton pill color="red" bind:group={selectedFruit} value="pill3">Option 3</RadioButton>
      <RadioButton pill color="purple" bind:group={selectedFruit} value="pill4">Option 4</RadioButton>
    </div>
  {/snippet}
</Story>

<!-- Outline Style -->
<Story name="Outline Style">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <RadioButton outline color="primary" bind:group={selectedFruit} value="outline1">Option 1</RadioButton>
      <RadioButton outline color="green" bind:group={selectedFruit} value="outline2">Option 2</RadioButton>
      <RadioButton outline color="red" bind:group={selectedFruit} value="outline3">Option 3</RadioButton>
      <RadioButton outline color="purple" bind:group={selectedFruit} value="outline4">Option 4</RadioButton>
    </div>
  {/snippet}
</Story>

<!-- Pricing Plan Example -->
<Story name="Pricing Plan">
  {#snippet children(args)}
    <div class="space-y-4 max-w-lg">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white">Select your plan</h3>
      <div class="flex flex-wrap gap-3">
        <RadioButton outline color="primary" bind:group={selectedPlan} value="free">
          Free
        </RadioButton>
        <RadioButton outline color="primary" bind:group={selectedPlan} value="basic">
          Basic - $9/mo
        </RadioButton>
        <RadioButton outline color="primary" bind:group={selectedPlan} value="pro">
          Pro - $29/mo
        </RadioButton>
        <RadioButton outline color="primary" bind:group={selectedPlan} value="enterprise">
          Enterprise - $99/mo
        </RadioButton>
      </div>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Selected plan: {selectedPlan}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Inline Layout -->
<Story name="Inline Layout">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm font-medium text-gray-900 dark:text-white">Choose a color theme:</p>
      <div class="inline-flex gap-0">
        <RadioButton inline color="light" bind:group={selectedFruit} value="inline1">Light</RadioButton>
        <RadioButton inline color="dark" bind:group={selectedFruit} value="inline2">Dark</RadioButton>
        <RadioButton inline color="primary" bind:group={selectedFruit} value="inline3">System</RadioButton>
      </div>
    </div>
  {/snippet}
</Story>

