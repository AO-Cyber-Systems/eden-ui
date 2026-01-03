<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import MultiSelect from './MultiSelect.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/MultiSelect',
    component: MultiSelect,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the select',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the select is disabled',
      },
    },
    args: {
      size: 'md',
      disabled: false,
    },
  });

  const fruits = [
    { value: 'apple', name: 'Apple' },
    { value: 'banana', name: 'Banana' },
    { value: 'orange', name: 'Orange' },
    { value: 'grape', name: 'Grape' },
    { value: 'mango', name: 'Mango' },
    { value: 'pineapple', name: 'Pineapple' },
  ];

  const countries = [
    { value: 'us', name: 'United States' },
    { value: 'uk', name: 'United Kingdom' },
    { value: 'ca', name: 'Canada' },
    { value: 'au', name: 'Australia' },
    { value: 'de', name: 'Germany' },
    { value: 'fr', name: 'France' },
    { value: 'jp', name: 'Japan' },
  ];

  const skills = [
    { value: 'js', name: 'JavaScript' },
    { value: 'ts', name: 'TypeScript' },
    { value: 'py', name: 'Python' },
    { value: 'rust', name: 'Rust' },
    { value: 'go', name: 'Go' },
    { value: 'java', name: 'Java' },
    { value: 'csharp', name: 'C#', disabled: true },
  ];

  let selectedFruits = $state([]);
  let selectedCountries = $state(['us']);
  let selectedSkills = $state([]);
</script>

<!-- Default MultiSelect -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Select fruits</Label>
      <MultiSelect {...args} items={fruits} bind:value={selectedFruits} placeholder="Choose fruits..." />
      <Helper>
        Selected: {selectedFruits.length > 0 ? selectedFruits.join(', ') : 'None'}
      </Helper>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Small</Label>
        <MultiSelect size="sm" items={fruits} value={[]} placeholder="Small select..." />
      </div>
      <div>
        <Label class="mb-2">Medium (default)</Label>
        <MultiSelect size="md" items={fruits} value={[]} placeholder="Medium select..." />
      </div>
      <div>
        <Label class="mb-2">Large</Label>
        <MultiSelect size="lg" items={fruits} value={[]} placeholder="Large select..." />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Preselected Values -->
<Story name="Preselected Values">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Select countries</Label>
      <MultiSelect items={countries} bind:value={selectedCountries} placeholder="Choose countries..." />
      <Helper>Pre-selected: United States</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Disabled Items -->
<Story name="Disabled Items">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Select skills</Label>
      <MultiSelect items={skills} bind:value={selectedSkills} placeholder="Choose skills..." />
      <Helper>C# is disabled and cannot be selected</Helper>
    </div>
  {/snippet}
</Story>

<!-- Disabled State -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Disabled MultiSelect</Label>
      <MultiSelect items={fruits} value={['apple', 'banana']} disabled placeholder="Cannot select..." />
    </div>
  {/snippet}
</Story>

<!-- Skills Form Example -->
<Story name="Skills Form">
  {#snippet children(args)}
    <form class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Primary Skills</Label>
        <MultiSelect items={skills} value={[]} placeholder="Select your main skills..." />
        <Helper>Select skills you're most proficient in</Helper>
      </div>
      <div>
        <Label class="mb-2">Secondary Skills</Label>
        <MultiSelect items={skills} value={[]} placeholder="Select additional skills..." />
        <Helper>Select skills you have some experience with</Helper>
      </div>
    </form>
  {/snippet}
</Story>

<!-- Location Preferences Example -->
<Story name="Location Preferences">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md p-4 border rounded-lg dark:border-gray-700">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white">Location Preferences</h3>
      <div>
        <Label class="mb-2">Preferred Countries</Label>
        <MultiSelect items={countries} value={[]} placeholder="Where would you like to work?" />
      </div>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        We'll prioritize opportunities in your selected locations.
      </p>
    </div>
  {/snippet}
</Story>

