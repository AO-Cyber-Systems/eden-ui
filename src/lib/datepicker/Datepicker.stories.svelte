<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Datepicker from './Datepicker.svelte';

  const { Story } = defineMeta({
    title: 'Components/Datepicker',
    component: Datepicker,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'The color theme of the datepicker',
      },
      placeholder: {
        control: 'text',
        description: 'Placeholder text for the input',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the datepicker is disabled',
      },
      required: {
        control: 'boolean',
        description: 'Whether the datepicker is required',
      },
      inline: {
        control: 'boolean',
        description: 'Whether to display inline without input',
      },
      range: {
        control: 'boolean',
        description: 'Enable date range selection',
      },
      showActionButtons: {
        control: 'boolean',
        description: 'Show Today, Clear, and Apply buttons',
      },
      autohide: {
        control: 'boolean',
        description: 'Auto-hide after selection',
      },
      firstDayOfWeek: {
        control: { type: 'select' },
        options: [0, 1, 2, 3, 4, 5, 6],
        description: 'First day of week (0 = Sunday, 1 = Monday, etc.)',
      },
    },
    args: {
      color: 'primary',
      placeholder: 'Select date',
      disabled: false,
      required: false,
      inline: false,
      range: false,
      showActionButtons: false,
      autohide: true,
      firstDayOfWeek: 0,
    },
  });

  let value = $state();
  let rangeFrom = $state();
  let rangeTo = $state();
</script>

<!-- Default Datepicker -->
<Story name="Default">
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <Datepicker {...args} bind:value />
      {#if value}
        <p class="mt-4 text-sm text-gray-600 dark:text-gray-400">
          Selected: {value.toLocaleDateString()}
        </p>
      {/if}
    </div>
  {/snippet}
</Story>

<!-- With Title -->
<Story name="With Title">
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <Datepicker title="Select a Date" bind:value />
    </div>
  {/snippet}
</Story>

<!-- Inline -->
<Story name="Inline" args={{ inline: true }}>
  {#snippet children(args)}
    <div class="inline-block">
      <Datepicker {...args} bind:value />
    </div>
  {/snippet}
</Story>

<!-- With Action Buttons -->
<Story name="With Action Buttons" args={{ showActionButtons: true }}>
  {#snippet children(args)}
    <div class="min-h-[450px]">
      <Datepicker {...args} bind:value />
    </div>
  {/snippet}
</Story>

<!-- Date Range -->
<Story name="Date Range" args={{ range: true }}>
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <Datepicker {...args} bind:rangeFrom bind:rangeTo placeholder="Select date range" />
      {#if rangeFrom && rangeTo}
        <p class="mt-4 text-sm text-gray-600 dark:text-gray-400">
          Range: {rangeFrom.toLocaleDateString()} - {rangeTo.toLocaleDateString()}
        </p>
      {/if}
    </div>
  {/snippet}
</Story>

<!-- Monday First -->
<Story name="Monday First" args={{ firstDayOfWeek: 1 }}>
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <Datepicker {...args} bind:value />
    </div>
  {/snippet}
</Story>

<!-- With Available Range -->
<Story name="Limited Date Range">
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <p class="mb-2 text-sm text-gray-600 dark:text-gray-400">
        Only dates in the next 30 days are available
      </p>
      <Datepicker
        bind:value
        availableFrom={new Date()}
        availableTo={new Date(Date.now() + 30 * 24 * 60 * 60 * 1000)}
      />
    </div>
  {/snippet}
</Story>

<!-- Disabled -->
<Story name="Disabled" args={{ disabled: true }}>
  {#snippet children(args)}
    <Datepicker {...args} />
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-col gap-4 min-h-[400px]">
      <div>
        <p class="mb-1 text-sm font-medium">Primary</p>
        <Datepicker color="primary" placeholder="Primary color" />
      </div>
      <div>
        <p class="mb-1 text-sm font-medium">Green</p>
        <Datepicker color="green" placeholder="Green color" />
      </div>
      <div>
        <p class="mb-1 text-sm font-medium">Red</p>
        <Datepicker color="red" placeholder="Red color" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- In Form Context -->
<Story name="In Form Context">
  {#snippet children(args)}
    <form class="max-w-md space-y-4 min-h-[400px]">
      <div>
        <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Name</label>
        <input type="text" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:text-white" placeholder="John Doe" />
      </div>
      <div>
        <label class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Birth Date</label>
        <Datepicker required placeholder="Select birth date" />
      </div>
      <button type="submit" class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-primary-600 dark:hover:bg-primary-700 focus:outline-none dark:focus:ring-primary-800">
        Submit
      </button>
    </form>
  {/snippet}
</Story>
