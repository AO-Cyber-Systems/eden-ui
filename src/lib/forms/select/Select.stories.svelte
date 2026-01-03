<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Select from './Select.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Select',
    component: Select,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the select',
      },
      underline: {
        control: 'boolean',
        description: 'Whether to show underline style',
      },
      clearable: {
        control: 'boolean',
        description: 'Whether the select is clearable',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the select is disabled',
      },
    },
    args: {
      size: 'md',
      underline: false,
      clearable: false,
      disabled: false,
    },
  });

  const countries = [
    { value: 'us', name: 'United States' },
    { value: 'ca', name: 'Canada' },
    { value: 'uk', name: 'United Kingdom' },
    { value: 'de', name: 'Germany' },
    { value: 'fr', name: 'France' },
    { value: 'jp', name: 'Japan' },
  ];

  let selectedCountry = $state('');
</script>

<!-- Default Select -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="country-select" class="mb-2">Select a country</Label>
      <Select {...args} id="country-select" items={countries} bind:value={selectedCountry} />
      <Helper>Choose your country from the list</Helper>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Small</Label>
        <Select size="sm" items={countries} placeholder="Select country..." />
      </div>
      <div>
        <Label class="mb-2">Medium (default)</Label>
        <Select size="md" items={countries} placeholder="Select country..." />
      </div>
      <div>
        <Label class="mb-2">Large</Label>
        <Select size="lg" items={countries} placeholder="Select country..." />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Underline Style -->
<Story name="Underline Style">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="underline-select" class="mb-2">Country</Label>
      <Select id="underline-select" underline items={countries} placeholder="Select country..." />
    </div>
  {/snippet}
</Story>

<!-- Clearable Select -->
<Story name="Clearable">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="clearable-select" class="mb-2">Clearable Select</Label>
      <Select id="clearable-select" items={countries} clearable placeholder="Select country..." />
      <Helper>Click the X to clear the selection</Helper>
    </div>
  {/snippet}
</Story>

<!-- Disabled Select -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="disabled-select" class="mb-2">Disabled Select</Label>
      <Select id="disabled-select" items={countries} disabled value="us" />
    </div>
  {/snippet}
</Story>

<!-- With Disabled Options -->
<Story name="With Disabled Options">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="partial-disabled" class="mb-2">Select with disabled options</Label>
      <Select
        id="partial-disabled"
        items={[
          { value: 'free', name: 'Free Plan' },
          { value: 'pro', name: 'Pro Plan' },
          { value: 'enterprise', name: 'Enterprise Plan', disabled: true },
        ]}
        placeholder="Choose a plan..."
      />
      <Helper>Enterprise plan is not available for your account</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Children (Manual Options) -->
<Story name="With Manual Options">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="manual-select" class="mb-2">Priority Level</Label>
      <Select id="manual-select" placeholder="Select priority...">
        <option value="low">Low</option>
        <option value="medium">Medium</option>
        <option value="high">High</option>
        <option value="critical">Critical</option>
      </Select>
    </div>
  {/snippet}
</Story>

<!-- Form Example -->
<Story name="Form Example">
  {#snippet children(args)}
    <form class="max-w-md space-y-4">
      <div>
        <Label for="form-country" class="mb-2">Country</Label>
        <Select id="form-country" items={countries} placeholder="Select country..." />
      </div>
      <div>
        <Label for="form-language" class="mb-2">Language</Label>
        <Select
          id="form-language"
          items={[
            { value: 'en', name: 'English' },
            { value: 'es', name: 'Spanish' },
            { value: 'fr', name: 'French' },
            { value: 'de', name: 'German' },
          ]}
          placeholder="Select language..."
        />
      </div>
      <div>
        <Label for="form-timezone" class="mb-2">Timezone</Label>
        <Select
          id="form-timezone"
          items={[
            { value: 'utc', name: 'UTC' },
            { value: 'est', name: 'Eastern Time' },
            { value: 'pst', name: 'Pacific Time' },
            { value: 'cet', name: 'Central European Time' },
          ]}
          placeholder="Select timezone..."
        />
      </div>
    </form>
  {/snippet}
</Story>

