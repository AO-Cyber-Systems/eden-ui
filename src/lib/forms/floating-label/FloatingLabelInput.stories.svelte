<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import FloatingLabelInput from './FloatingLabelInput.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/FloatingLabelInput',
    component: FloatingLabelInput,
    tags: ['autodocs'],
    argTypes: {
      variant: {
        control: { type: 'select' },
        options: ['standard', 'filled', 'outlined'],
        description: 'The variant style of the input',
      },
      size: {
        control: { type: 'select' },
        options: ['small', 'default'],
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
    },
    args: {
      variant: 'standard',
      size: 'default',
      color: 'default',
      clearable: false,
    },
  });

  let email = $state('');
</script>

<!-- Default Floating Label -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <FloatingLabelInput {...args} bind:value={email}>Email address</FloatingLabelInput>
    </div>
  {/snippet}
</Story>

<!-- Variant Styles -->
<Story name="Variants">
  {#snippet children(args)}
    <div class="space-y-8 max-w-md">
      <div>
        <FloatingLabelInput variant="standard">Standard variant</FloatingLabelInput>
      </div>
      <div>
        <FloatingLabelInput variant="filled">Filled variant</FloatingLabelInput>
      </div>
      <div>
        <FloatingLabelInput variant="outlined">Outlined variant</FloatingLabelInput>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-8 max-w-md">
      <div>
        <FloatingLabelInput variant="outlined" size="small">Small size</FloatingLabelInput>
      </div>
      <div>
        <FloatingLabelInput variant="outlined" size="default">Default size</FloatingLabelInput>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color/State Variants -->
<Story name="State Variants">
  {#snippet children(args)}
    <div class="space-y-8 max-w-md">
      <div>
        <FloatingLabelInput variant="outlined" color="default">Default state</FloatingLabelInput>
      </div>
      <div>
        <FloatingLabelInput variant="outlined" color="green">Success state</FloatingLabelInput>
        <Helper color="green">This field is valid</Helper>
      </div>
      <div>
        <FloatingLabelInput variant="outlined" color="red">Error state</FloatingLabelInput>
        <Helper color="red">Please enter a valid value</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Clearable -->
<Story name="Clearable">
  {#snippet children(args)}
    <div class="max-w-md">
      <FloatingLabelInput variant="outlined" clearable>Clearable input</FloatingLabelInput>
      <Helper>Type something and click the X to clear</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Autocomplete -->
<Story name="With Autocomplete">
  {#snippet children(args)}
    <div class="max-w-md">
      <FloatingLabelInput
        variant="outlined"
        data={['JavaScript', 'TypeScript', 'Python', 'Rust', 'Go', 'Java', 'C++', 'Ruby']}
        maxSuggestions={5}
      >
        Programming language
      </FloatingLabelInput>
      <Helper>Start typing to see suggestions</Helper>
    </div>
  {/snippet}
</Story>

<!-- Login Form Example -->
<Story name="Login Form">
  {#snippet children(args)}
    <form class="space-y-6 max-w-sm">
      <FloatingLabelInput variant="outlined" type="email">Email address</FloatingLabelInput>
      <FloatingLabelInput variant="outlined" type="password">Password</FloatingLabelInput>
      <button type="submit" class="w-full text-white bg-blue-600 hover:bg-blue-700 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
        Sign in
      </button>
    </form>
  {/snippet}
</Story>

<!-- All Variants Comparison -->
<Story name="All Variants Comparison">
  {#snippet children(args)}
    <div class="grid grid-cols-3 gap-8 max-w-3xl">
      <div class="space-y-8">
        <h3 class="text-sm font-medium text-gray-900 dark:text-white">Standard</h3>
        <FloatingLabelInput variant="standard">Default</FloatingLabelInput>
        <FloatingLabelInput variant="standard" color="green">Success</FloatingLabelInput>
        <FloatingLabelInput variant="standard" color="red">Error</FloatingLabelInput>
      </div>
      <div class="space-y-8">
        <h3 class="text-sm font-medium text-gray-900 dark:text-white">Filled</h3>
        <FloatingLabelInput variant="filled">Default</FloatingLabelInput>
        <FloatingLabelInput variant="filled" color="green">Success</FloatingLabelInput>
        <FloatingLabelInput variant="filled" color="red">Error</FloatingLabelInput>
      </div>
      <div class="space-y-8">
        <h3 class="text-sm font-medium text-gray-900 dark:text-white">Outlined</h3>
        <FloatingLabelInput variant="outlined">Default</FloatingLabelInput>
        <FloatingLabelInput variant="outlined" color="green">Success</FloatingLabelInput>
        <FloatingLabelInput variant="outlined" color="red">Error</FloatingLabelInput>
      </div>
    </div>
  {/snippet}
</Story>

