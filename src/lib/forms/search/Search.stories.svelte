<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Search from './Search.svelte';
  import Button from '$lib/buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Search',
    component: Search,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the search input',
      },
      clearable: {
        control: 'boolean',
        description: 'Whether the search input has a clear button',
      },
    },
    args: {
      size: 'md',
      clearable: false,
    },
  });

  let searchValue = $state('');
</script>

<!-- Default Search -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Search {...args} bind:value={searchValue} />
      {#if searchValue}
        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
          Searching for: "{searchValue}"
        </p>
      {/if}
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Small</p>
        <Search size="sm" placeholder="Small search..." />
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Medium (default)</p>
        <Search size="md" placeholder="Medium search..." />
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Large</p>
        <Search size="lg" placeholder="Large search..." />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Clearable -->
<Story name="Clearable">
  {#snippet children(args)}
    <div class="max-w-md">
      <Search clearable placeholder="Type and clear..." />
    </div>
  {/snippet}
</Story>

<!-- With Button -->
<Story name="With Button">
  {#snippet children(args)}
    <div class="max-w-md">
      <Search placeholder="Search products...">
        <Button size="sm">Search</Button>
      </Search>
    </div>
  {/snippet}
</Story>

<!-- Custom Placeholder -->
<Story name="Custom Placeholders">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <Search placeholder="Search for products..." />
      <Search placeholder="Find users by name..." />
      <Search placeholder="Search documentation..." />
      <Search placeholder="Type to filter..." />
    </div>
  {/snippet}
</Story>

<!-- Search Form Example -->
<Story name="Search Form">
  {#snippet children(args)}
    <form class="max-w-lg">
      <div class="flex gap-2">
        <Search class="flex-1" placeholder="Search articles, tutorials, and more...">
          <Button type="submit" size="sm" color="blue">
            Search
          </Button>
        </Search>
      </div>
    </form>
  {/snippet}
</Story>

<!-- Header Search Example -->
<Story name="Header Search">
  {#snippet children(args)}
    <nav class="bg-gray-100 dark:bg-gray-800 p-4 rounded-lg">
      <div class="flex items-center justify-between">
        <span class="text-lg font-semibold text-gray-900 dark:text-white">Logo</span>
        <div class="w-64">
          <Search size="sm" placeholder="Search..." clearable />
        </div>
        <div class="flex gap-2">
          <Button size="sm" color="light">Login</Button>
          <Button size="sm">Sign Up</Button>
        </div>
      </div>
    </nav>
  {/snippet}
</Story>

