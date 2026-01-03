<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Label from './Label.svelte';
  import Input from '../input-field/Input.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Label',
    component: Label,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['gray', 'green', 'red', 'disabled'],
        description: 'The color of the label',
      },
      show: {
        control: 'boolean',
        description: 'Whether to show the label wrapper',
      },
    },
    args: {
      color: 'gray',
      show: true,
    },
  });
</script>

<!-- Default Label -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label {...args} for="default-input" class="mb-2">Default Label</Label>
      <Input id="default-input" placeholder="Enter text..." />
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label for="gray-input" color="gray" class="mb-2">Gray Label</Label>
        <Input id="gray-input" placeholder="Default input" />
      </div>
      <div>
        <Label for="green-input" color="green" class="mb-2">Success Label</Label>
        <Input id="green-input" color="green" placeholder="Valid input" />
      </div>
      <div>
        <Label for="red-input" color="red" class="mb-2">Error Label</Label>
        <Input id="red-input" color="red" placeholder="Invalid input" />
      </div>
      <div>
        <Label for="disabled-input" color="disabled" class="mb-2">Disabled Label</Label>
        <Input id="disabled-input" disabled placeholder="Disabled input" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Without Show (Renders Children Only) -->
<Story name="Hidden Wrapper">
  {#snippet children(args)}
    <div class="max-w-md">
      <p class="text-sm text-gray-500 mb-2">With show=false, only children render (no label wrapper):</p>
      <Label show={false}>
        <span class="text-gray-700 dark:text-gray-300">This text has no label wrapper</span>
      </Label>
    </div>
  {/snippet}
</Story>

<!-- Form Example -->
<Story name="Form Example">
  {#snippet children(args)}
    <form class="space-y-4 max-w-md">
      <div>
        <Label for="first-name" class="mb-2">First Name <span class="text-red-500">*</span></Label>
        <Input id="first-name" placeholder="John" required />
      </div>
      <div>
        <Label for="last-name" class="mb-2">Last Name <span class="text-red-500">*</span></Label>
        <Input id="last-name" placeholder="Doe" required />
      </div>
      <div>
        <Label for="email-form" class="mb-2">Email <span class="text-red-500">*</span></Label>
        <Input id="email-form" type="email" placeholder="john@example.com" required />
      </div>
      <div>
        <Label for="company" class="mb-2">Company <span class="text-gray-400">(optional)</span></Label>
        <Input id="company" placeholder="Acme Inc." />
      </div>
    </form>
  {/snippet}
</Story>

