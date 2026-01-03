<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Radio from './Radio.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Radio',
    component: Radio,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color of the radio button',
      },
      inline: {
        control: 'boolean',
        description: 'Whether radio buttons are displayed inline',
      },
    },
    args: {
      color: 'primary',
      inline: false,
    },
  });

  let selectedPlan = $state('starter');
  let selectedColor = $state('blue');
</script>

<!-- Default Radio -->
<Story name="Default">
  {#snippet children(args)}
    <div class="space-y-2">
      <Radio {...args} name="plan" value="starter" bind:group={selectedPlan}>Starter Plan</Radio>
      <Radio {...args} name="plan" value="pro" bind:group={selectedPlan}>Pro Plan</Radio>
      <Radio {...args} name="plan" value="enterprise" bind:group={selectedPlan}>Enterprise Plan</Radio>
      <p class="text-sm text-gray-500 mt-2">Selected: {selectedPlan}</p>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-2">
      <Radio color="primary" name="color" value="primary" bind:group={selectedColor}>Primary</Radio>
      <Radio color="red" name="color" value="red" bind:group={selectedColor}>Red</Radio>
      <Radio color="green" name="color" value="green" bind:group={selectedColor}>Green</Radio>
      <Radio color="blue" name="color" value="blue" bind:group={selectedColor}>Blue</Radio>
      <Radio color="purple" name="color" value="purple" bind:group={selectedColor}>Purple</Radio>
    </div>
  {/snippet}
</Story>

<!-- Inline Radio Buttons -->
<Story name="Inline">
  {#snippet children(args)}
    <div>
      <p class="text-sm font-medium text-gray-900 dark:text-white mb-3">Select size:</p>
      <div class="flex gap-4">
        <Radio inline name="size" value="sm">Small</Radio>
        <Radio inline name="size" value="md">Medium</Radio>
        <Radio inline name="size" value="lg">Large</Radio>
        <Radio inline name="size" value="xl">Extra Large</Radio>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Disabled State -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="space-y-2">
      <Radio name="disabled" value="enabled">Enabled option</Radio>
      <Radio name="disabled" value="disabled" disabled>Disabled option</Radio>
      <Radio name="disabled" value="checked-disabled" disabled checked>Disabled and checked</Radio>
    </div>
  {/snippet}
</Story>

<!-- With Helper Text -->
<Story name="With Helper Text">
  {#snippet children(args)}
    <div class="space-y-4">
      <div>
        <Radio name="subscription" value="monthly">
          Monthly billing
        </Radio>
        <Helper class="ps-6">Pay month-to-month, cancel anytime</Helper>
      </div>
      <div>
        <Radio name="subscription" value="yearly">
          Yearly billing
        </Radio>
        <Helper class="ps-6">Save 20% with annual payment</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Radio Card Style -->
<Story name="Card Style">
  {#snippet children(args)}
    <div class="grid grid-cols-3 gap-4 max-w-xl">
      <label class="flex flex-col items-center p-4 border rounded-lg cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 dark:border-gray-700">
        <Radio name="delivery" value="standard" class="mb-2" />
        <span class="text-sm font-medium text-gray-900 dark:text-white">Standard</span>
        <span class="text-xs text-gray-500">3-5 days</span>
      </label>
      <label class="flex flex-col items-center p-4 border rounded-lg cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 dark:border-gray-700">
        <Radio name="delivery" value="express" class="mb-2" />
        <span class="text-sm font-medium text-gray-900 dark:text-white">Express</span>
        <span class="text-xs text-gray-500">1-2 days</span>
      </label>
      <label class="flex flex-col items-center p-4 border rounded-lg cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800 dark:border-gray-700">
        <Radio name="delivery" value="overnight" class="mb-2" />
        <span class="text-sm font-medium text-gray-900 dark:text-white">Overnight</span>
        <span class="text-xs text-gray-500">Next day</span>
      </label>
    </div>
  {/snippet}
</Story>

