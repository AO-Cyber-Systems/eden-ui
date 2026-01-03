<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Checkbox from './Checkbox.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Checkbox',
    component: Checkbox,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color of the checkbox',
      },
      inline: {
        control: 'boolean',
        description: 'Whether checkboxes are displayed inline',
      },
      rounded: {
        control: 'boolean',
        description: 'Whether the checkbox is rounded',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the checkbox is disabled',
      },
    },
    args: {
      color: 'primary',
      inline: false,
      rounded: false,
      disabled: false,
    },
  });

  let checked = $state(false);
  let group = $state([]);
</script>

<!-- Default Checkbox -->
<Story name="Default">
  {#snippet children(args)}
    <Checkbox {...args} bind:checked>
      Accept terms and conditions
    </Checkbox>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-2">
      <Checkbox color="primary" checked>Primary</Checkbox>
      <Checkbox color="red" checked>Red</Checkbox>
      <Checkbox color="green" checked>Green</Checkbox>
      <Checkbox color="blue" checked>Blue</Checkbox>
      <Checkbox color="purple" checked>Purple</Checkbox>
      <Checkbox color="orange" checked>Orange</Checkbox>
    </div>
  {/snippet}
</Story>

<!-- Inline Checkboxes -->
<Story name="Inline">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <Checkbox inline>Option 1</Checkbox>
      <Checkbox inline>Option 2</Checkbox>
      <Checkbox inline>Option 3</Checkbox>
    </div>
  {/snippet}
</Story>

<!-- Checkbox Group -->
<Story name="Checkbox Group">
  {#snippet children(args)}
    <div class="space-y-2">
      <p class="text-sm font-medium text-gray-900 dark:text-white mb-2">Select your interests:</p>
      <Checkbox value="sports" bind:group>Sports</Checkbox>
      <Checkbox value="music" bind:group>Music</Checkbox>
      <Checkbox value="gaming" bind:group>Gaming</Checkbox>
      <Checkbox value="reading" bind:group>Reading</Checkbox>
      <p class="text-sm text-gray-500 mt-2">Selected: {group.join(', ') || 'None'}</p>
    </div>
  {/snippet}
</Story>

<!-- With Choices Array -->
<Story name="With Choices">
  {#snippet children(args)}
    <div>
      <p class="text-sm font-medium text-gray-900 dark:text-white mb-2">Select features:</p>
      <Checkbox
        choices={[
          { value: 'dark-mode', label: 'Dark Mode', checked: true },
          { value: 'notifications', label: 'Notifications' },
          { value: 'auto-save', label: 'Auto Save', checked: true },
        ]}
      />
    </div>
  {/snippet}
</Story>

<!-- Disabled States -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="space-y-2">
      <Checkbox disabled>Disabled unchecked</Checkbox>
      <Checkbox disabled checked>Disabled checked</Checkbox>
    </div>
  {/snippet}
</Story>

<!-- With Helper Text -->
<Story name="With Helper">
  {#snippet children(args)}
    <div class="space-y-4">
      <div>
        <Checkbox id="terms">
          I agree to the <a href="#" class="text-primary-600 hover:underline">terms and conditions</a>
        </Checkbox>
        <Helper class="ps-6">By checking this box, you agree to our terms of service.</Helper>
      </div>
      <div>
        <Checkbox id="newsletter" color="green">Subscribe to newsletter</Checkbox>
        <Helper class="ps-6" color="green">Get weekly updates on new features.</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Rounded Checkbox -->
<Story name="Rounded">
  {#snippet children(args)}
    <div class="space-y-2">
      <Checkbox rounded>Rounded checkbox</Checkbox>
      <Checkbox rounded checked color="green">Rounded and checked</Checkbox>
    </div>
  {/snippet}
</Story>

