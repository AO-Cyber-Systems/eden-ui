<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Input from './Input.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Input',
    component: Input,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the input',
      },
      color: {
        control: { type: 'select' },
        options: ['default', 'green', 'red'],
        description: 'The color/state of the input',
      },
      clearable: {
        control: 'boolean',
        description: 'Whether the input has a clear button',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the input is disabled',
      },
    },
    args: {
      size: 'md',
      color: 'default',
      clearable: false,
      disabled: false,
    },
  });

  let inputValue = $state('');
</script>

<!-- Default Input -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="default-input" class="mb-2">Default Input</Label>
      <Input {...args} id="default-input" placeholder="Enter text..." bind:value={inputValue} />
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label for="small-input" class="mb-2">Small</Label>
        <Input size="sm" id="small-input" placeholder="Small input" />
      </div>
      <div>
        <Label for="medium-input" class="mb-2">Medium (default)</Label>
        <Input size="md" id="medium-input" placeholder="Medium input" />
      </div>
      <div>
        <Label for="large-input" class="mb-2">Large</Label>
        <Input size="lg" id="large-input" placeholder="Large input" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color/State Variants -->
<Story name="State Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label for="default-state" class="mb-2">Default</Label>
        <Input color="default" id="default-state" placeholder="Default state" />
      </div>
      <div>
        <Label for="success-state" color="green" class="mb-2">Success</Label>
        <Input color="green" id="success-state" placeholder="Success state" />
        <Helper color="green">This is valid input</Helper>
      </div>
      <div>
        <Label for="error-state" color="red" class="mb-2">Error</Label>
        <Input color="red" id="error-state" placeholder="Error state" />
        <Helper color="red">Please enter a valid value</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Left Icon -->
<Story name="With Left Icon">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="icon-input" class="mb-2">Email</Label>
      <Input id="icon-input" type="email" placeholder="name@example.com">
        {#snippet left()}
          <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
          </svg>
        {/snippet}
      </Input>
    </div>
  {/snippet}
</Story>

<!-- With Right Icon -->
<Story name="With Right Icon">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="search-input" class="mb-2">Search</Label>
      <Input id="search-input" type="search" placeholder="Search...">
        {#snippet right()}
          <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"/>
          </svg>
        {/snippet}
      </Input>
    </div>
  {/snippet}
</Story>

<!-- Clearable Input -->
<Story name="Clearable">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="clearable-input" class="mb-2">Clearable Input</Label>
      <Input id="clearable-input" placeholder="Type something..." clearable />
      <Helper>Click the X button to clear the input</Helper>
    </div>
  {/snippet}
</Story>

<!-- Disabled Input -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="disabled-input" class="mb-2">Disabled Input</Label>
      <Input id="disabled-input" placeholder="Cannot edit..." disabled value="Disabled content" />
    </div>
  {/snippet}
</Story>

<!-- Input Types -->
<Story name="Input Types">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label for="text-input" class="mb-2">Text</Label>
        <Input id="text-input" type="text" placeholder="Enter text" />
      </div>
      <div>
        <Label for="email-input" class="mb-2">Email</Label>
        <Input id="email-input" type="email" placeholder="email@example.com" />
      </div>
      <div>
        <Label for="password-input" class="mb-2">Password</Label>
        <Input id="password-input" type="password" placeholder="••••••••" />
      </div>
      <div>
        <Label for="number-input" class="mb-2">Number</Label>
        <Input id="number-input" type="number" placeholder="42" />
      </div>
      <div>
        <Label for="tel-input" class="mb-2">Phone</Label>
        <Input id="tel-input" type="tel" placeholder="+1 (555) 000-0000" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Combobox/Autocomplete -->
<Story name="With Autocomplete">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="autocomplete-input" class="mb-2">Programming Language</Label>
      <Input
        id="autocomplete-input"
        placeholder="Start typing..."
        data={['JavaScript', 'TypeScript', 'Python', 'Rust', 'Go', 'Java', 'C++', 'Ruby']}
        maxSuggestions={5}
      />
      <Helper>Try typing to see suggestions</Helper>
    </div>
  {/snippet}
</Story>

