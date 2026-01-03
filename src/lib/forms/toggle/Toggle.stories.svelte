<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Toggle from './Toggle.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Toggle',
    component: Toggle,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['small', 'default', 'large'],
        description: 'The size of the toggle',
      },
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color of the toggle',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the toggle is disabled',
      },
    },
    args: {
      size: 'default',
      color: 'primary',
      disabled: false,
    },
  });

  let checked = $state(false);
  let notifications = $state(true);
</script>

<!-- Default Toggle -->
<Story name="Default">
  {#snippet children(args)}
    <Toggle {...args} bind:checked>
      Toggle me
    </Toggle>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <Toggle color="primary" checked>Primary</Toggle>
      <Toggle color="red" checked>Red</Toggle>
      <Toggle color="green" checked>Green</Toggle>
      <Toggle color="blue" checked>Blue</Toggle>
      <Toggle color="purple" checked>Purple</Toggle>
      <Toggle color="orange" checked>Orange</Toggle>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <Toggle size="small" checked>Small toggle</Toggle>
      <Toggle size="default" checked>Default toggle</Toggle>
      <Toggle size="large" checked>Large toggle</Toggle>
    </div>
  {/snippet}
</Story>

<!-- Disabled State -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="space-y-4">
      <Toggle disabled>Disabled off</Toggle>
      <Toggle disabled checked>Disabled on</Toggle>
    </div>
  {/snippet}
</Story>

<!-- With Off Label -->
<Story name="With Off Label">
  {#snippet children(args)}
    <Toggle bind:checked={notifications}>
      {#snippet offLabel()}
        <span class="text-sm font-medium text-gray-900 dark:text-gray-300 me-3">Off</span>
      {/snippet}
      On
    </Toggle>
  {/snippet}
</Story>

<!-- Settings Example -->
<Story name="Settings Example">
  {#snippet children(args)}
    <div class="space-y-4 max-w-sm">
      <div class="flex items-center justify-between">
        <div>
          <p class="text-sm font-medium text-gray-900 dark:text-white">Email notifications</p>
          <p class="text-xs text-gray-500">Receive email updates</p>
        </div>
        <Toggle color="primary" />
      </div>
      <div class="flex items-center justify-between">
        <div>
          <p class="text-sm font-medium text-gray-900 dark:text-white">Push notifications</p>
          <p class="text-xs text-gray-500">Receive push alerts</p>
        </div>
        <Toggle color="primary" checked />
      </div>
      <div class="flex items-center justify-between">
        <div>
          <p class="text-sm font-medium text-gray-900 dark:text-white">Dark mode</p>
          <p class="text-xs text-gray-500">Enable dark theme</p>
        </div>
        <Toggle color="blue" />
      </div>
    </div>
  {/snippet}
</Story>

