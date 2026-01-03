<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Table from './Table.svelte';
  import TableHead from './TableHead.svelte';
  import TableHeadCell from './TableHeadCell.svelte';
  import TableBody from './TableBody.svelte';
  import TableBodyRow from './TableBodyRow.svelte';
  import TableBodyCell from './TableBodyCell.svelte';
  import TableSearch from './TableSearch.svelte';

  const { Story } = defineMeta({
    title: 'Components/Table',
    component: Table,
    tags: ['autodocs'],
    argTypes: {
      striped: {
        control: 'boolean',
        description: 'Alternate row background colors',
      },
      hoverable: {
        control: 'boolean',
        description: 'Highlight rows on hover',
      },
      border: {
        control: 'boolean',
        description: 'Show borders between rows',
      },
      shadow: {
        control: 'boolean',
        description: 'Add shadow effect to table container',
      },
      color: {
        control: { type: 'select' },
        options: ['default', 'primary', 'blue', 'green', 'red', 'yellow', 'purple', 'indigo', 'pink'],
        description: 'Color theme for the table',
      },
    },
    args: {
      striped: false,
      hoverable: false,
      border: true,
      shadow: false,
      color: 'default',
    },
  });

  // Sample product data
  const products = [
    { name: 'Apple MacBook Pro 17"', color: 'Silver', category: 'Laptop', price: '$2999' },
    { name: 'Microsoft Surface Pro', color: 'White', category: 'Laptop PC', price: '$1999' },
    { name: 'Magic Mouse 2', color: 'Black', category: 'Accessories', price: '$99' },
    { name: 'Google Pixel Phone', color: 'Gray', category: 'Phone', price: '$799' },
    { name: 'Apple Watch 5', color: 'Red', category: 'Wearables', price: '$999' },
  ];

  // Users data for different examples
  const users = [
    { id: 1, name: 'Neil Sims', email: 'neil.sims@flowbite.com', role: 'Admin', status: 'Active' },
    { id: 2, name: 'Bonnie Green', email: 'bonnie@flowbite.com', role: 'Editor', status: 'Active' },
    { id: 3, name: 'Jese Leos', email: 'jese@flowbite.com', role: 'Viewer', status: 'Inactive' },
    { id: 4, name: 'Thomas Lean', email: 'thomas@flowbite.com', role: 'Editor', status: 'Active' },
  ];

  // Simple data for items prop demo
  const simpleItems = [
    { name: 'Product A', quantity: 10, price: '$50' },
    { name: 'Product B', quantity: 25, price: '$30' },
    { name: 'Product C', quantity: 5, price: '$100' },
  ];

  let searchValue = $state('');
  let filteredProducts = $derived(
    searchValue
      ? products.filter((p) => p.name.toLowerCase().includes(searchValue.toLowerCase()))
      : products
  );

  function handleCellClick(product) {
    console.log('Cell clicked:', product);
  }
</script>

<!-- Default Table -->
<Story name="Default">
  {#snippet children(args)}
    <Table {...args}>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Striped Rows -->
<Story name="Striped Rows">
  {#snippet children(args)}
    <Table striped>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Hoverable Rows -->
<Story name="Hoverable Rows">
  {#snippet children(args)}
    <Table hoverable>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Striped and Hoverable -->
<Story name="Striped and Hoverable">
  {#snippet children(args)}
    <Table striped hoverable>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- With Shadow -->
<Story name="With Shadow">
  {#snippet children(args)}
    <Table shadow>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Default</p>
        <Table color="default" striped>
          <TableHead>
            <TableHeadCell>Name</TableHeadCell>
            <TableHeadCell>Category</TableHeadCell>
            <TableHeadCell>Price</TableHeadCell>
          </TableHead>
          <TableBody>
            {#each products.slice(0, 3) as product}
              <TableBodyRow>
                <TableBodyCell>{product.name}</TableBodyCell>
                <TableBodyCell>{product.category}</TableBodyCell>
                <TableBodyCell>{product.price}</TableBodyCell>
              </TableBodyRow>
            {/each}
          </TableBody>
        </Table>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Blue</p>
        <Table color="blue" striped>
          <TableHead>
            <TableHeadCell>Name</TableHeadCell>
            <TableHeadCell>Category</TableHeadCell>
            <TableHeadCell>Price</TableHeadCell>
          </TableHead>
          <TableBody>
            {#each products.slice(0, 3) as product}
              <TableBodyRow>
                <TableBodyCell>{product.name}</TableBodyCell>
                <TableBodyCell>{product.category}</TableBodyCell>
                <TableBodyCell>{product.price}</TableBodyCell>
              </TableBodyRow>
            {/each}
          </TableBody>
        </Table>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Green</p>
        <Table color="green" striped>
          <TableHead>
            <TableHeadCell>Name</TableHeadCell>
            <TableHeadCell>Category</TableHeadCell>
            <TableHeadCell>Price</TableHeadCell>
          </TableHead>
          <TableBody>
            {#each products.slice(0, 3) as product}
              <TableBodyRow>
                <TableBodyCell>{product.name}</TableBodyCell>
                <TableBodyCell>{product.category}</TableBodyCell>
                <TableBodyCell>{product.price}</TableBodyCell>
              </TableBodyRow>
            {/each}
          </TableBody>
        </Table>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Red</p>
        <Table color="red" striped>
          <TableHead>
            <TableHeadCell>Name</TableHeadCell>
            <TableHeadCell>Category</TableHeadCell>
            <TableHeadCell>Price</TableHeadCell>
          </TableHead>
          <TableBody>
            {#each products.slice(0, 3) as product}
              <TableBodyRow>
                <TableBodyCell>{product.name}</TableBodyCell>
                <TableBodyCell>{product.category}</TableBodyCell>
                <TableBodyCell>{product.price}</TableBodyCell>
              </TableBodyRow>
            {/each}
          </TableBody>
        </Table>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Purple</p>
        <Table color="purple" striped>
          <TableHead>
            <TableHeadCell>Name</TableHeadCell>
            <TableHeadCell>Category</TableHeadCell>
            <TableHeadCell>Price</TableHeadCell>
          </TableHead>
          <TableBody>
            {#each products.slice(0, 3) as product}
              <TableBodyRow>
                <TableBodyCell>{product.name}</TableBodyCell>
                <TableBodyCell>{product.category}</TableBodyCell>
                <TableBodyCell>{product.price}</TableBodyCell>
              </TableBodyRow>
            {/each}
          </TableBody>
        </Table>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Using Items Prop (Data-Driven) -->
<Story name="Data-Driven with Items">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Pass an array of objects to the <code class="bg-gray-100 dark:bg-gray-800 px-1 rounded">items</code> prop for automatic table generation.
      </p>
      <Table items={simpleItems} shadow />
    </div>
  {/snippet}
</Story>

<!-- With Caption -->
<Story name="With Caption">
  {#snippet children(args)}
    <Table>
      {#snippet captionSlot()}
        <caption class="p-5 text-lg font-semibold text-left text-gray-900 bg-white dark:text-white dark:bg-gray-800">
          Our Products
          <p class="mt-1 text-sm font-normal text-gray-500 dark:text-gray-400">
            Browse a list of products designed to help you work and play.
          </p>
        </caption>
      {/snippet}
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- With Footer -->
<Story name="With Footer">
  {#snippet children(args)}
    <Table shadow>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Qty</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
        <TableHeadCell>Total</TableHeadCell>
      </TableHead>
      <TableBody>
        <TableBodyRow>
          <TableBodyCell>Apple MacBook Pro 17"</TableBodyCell>
          <TableBodyCell>1</TableBodyCell>
          <TableBodyCell>$2999</TableBodyCell>
          <TableBodyCell>$2999</TableBodyCell>
        </TableBodyRow>
        <TableBodyRow>
          <TableBodyCell>Magic Mouse 2</TableBodyCell>
          <TableBodyCell>2</TableBodyCell>
          <TableBodyCell>$99</TableBodyCell>
          <TableBodyCell>$198</TableBodyCell>
        </TableBodyRow>
      </TableBody>
      {#snippet footerSlot()}
        <tfoot>
          <tr class="font-semibold text-gray-900 dark:text-white bg-gray-50 dark:bg-gray-700">
            <th scope="row" class="px-6 py-3 text-base">Total</th>
            <td class="px-6 py-3">3</td>
            <td class="px-6 py-3"></td>
            <td class="px-6 py-3">$3197</td>
          </tr>
        </tfoot>
      {/snippet}
    </Table>
  {/snippet}
</Story>

<!-- Table Search -->
<Story name="Table Search">
  {#snippet children(args)}
    <TableSearch placeholder="Search for products" bind:inputValue={searchValue}>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each filteredProducts as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {:else}
          <TableBodyRow>
            <TableBodyCell colspan={4}>
              <p class="text-center text-gray-500 dark:text-gray-400 py-4">No products found</p>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </TableSearch>
  {/snippet}
</Story>

<!-- Table Search with Header -->
<Story name="Table Search with Header">
  {#snippet children(args)}
    <TableSearch placeholder="Search users..." striped hoverable>
      {#snippet header()}
        <button class="ml-4 text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 focus:outline-none dark:focus:ring-blue-800">
          Add User
        </button>
      {/snippet}
      <TableHead>
        <TableHeadCell>Name</TableHeadCell>
        <TableHeadCell>Email</TableHeadCell>
        <TableHeadCell>Role</TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each users as user}
          <TableBodyRow>
            <TableBodyCell>{user.name}</TableBodyCell>
            <TableBodyCell>{user.email}</TableBodyCell>
            <TableBodyCell>{user.role}</TableBodyCell>
            <TableBodyCell>
              <span class={user.status === 'Active' ? 'text-green-500' : 'text-red-500'}>
                {user.status}
              </span>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </TableSearch>
  {/snippet}
</Story>

<!-- Clickable Cells -->
<Story name="Clickable Cells">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Click on the "View" button in the Actions column (check console for output).
      </p>
      <Table hoverable>
        <TableHead>
          <TableHeadCell>Product name</TableHeadCell>
          <TableHeadCell>Category</TableHeadCell>
          <TableHeadCell>Price</TableHeadCell>
          <TableHeadCell>Actions</TableHeadCell>
        </TableHead>
        <TableBody>
          {#each products as product}
            <TableBodyRow>
              <TableBodyCell>{product.name}</TableBodyCell>
              <TableBodyCell>{product.category}</TableBodyCell>
              <TableBodyCell>{product.price}</TableBodyCell>
              <TableBodyCell onclick={() => handleCellClick(product)}>
                <span class="text-blue-600 hover:underline cursor-pointer">View</span>
              </TableBodyCell>
            </TableBodyRow>
          {/each}
        </TableBody>
      </Table>
    </div>
  {/snippet}
</Story>

<!-- Without Border -->
<Story name="Without Border">
  {#snippet children(args)}
    <Table border={false}>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Mixed Row Colors -->
<Story name="Mixed Row Colors">
  {#snippet children(args)}
    <Table>
      <TableHead>
        <TableHeadCell>Status</TableHeadCell>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        <TableBodyRow color="green">
          <TableBodyCell>In Stock</TableBodyCell>
          <TableBodyCell>Apple MacBook Pro</TableBodyCell>
          <TableBodyCell>$2999</TableBodyCell>
        </TableBodyRow>
        <TableBodyRow color="yellow">
          <TableBodyCell>Low Stock</TableBodyCell>
          <TableBodyCell>Microsoft Surface</TableBodyCell>
          <TableBodyCell>$1999</TableBodyCell>
        </TableBodyRow>
        <TableBodyRow color="red">
          <TableBodyCell>Out of Stock</TableBodyCell>
          <TableBodyCell>Magic Mouse 2</TableBodyCell>
          <TableBodyCell>$99</TableBodyCell>
        </TableBodyRow>
        <TableBodyRow color="blue">
          <TableBodyCell>Pre-order</TableBodyCell>
          <TableBodyCell>Google Pixel Phone</TableBodyCell>
          <TableBodyCell>$799</TableBodyCell>
        </TableBodyRow>
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Users Table Example -->
<Story name="Users Table Example">
  {#snippet children(args)}
    <div class="max-w-4xl">
      <Table shadow hoverable>
        {#snippet captionSlot()}
          <caption class="p-5 text-lg font-semibold text-left text-gray-900 bg-white dark:text-white dark:bg-gray-800">
            Team Members
            <p class="mt-1 text-sm font-normal text-gray-500 dark:text-gray-400">
              Manage your team members and their account permissions here.
            </p>
          </caption>
        {/snippet}
        <TableHead>
          <TableHeadCell>Name</TableHeadCell>
          <TableHeadCell>Email</TableHeadCell>
          <TableHeadCell>Role</TableHeadCell>
          <TableHeadCell>Status</TableHeadCell>
          <TableHeadCell>
            <span class="sr-only">Actions</span>
          </TableHeadCell>
        </TableHead>
        <TableBody>
          {#each users as user}
            <TableBodyRow>
              <TableBodyCell>
                <div class="flex items-center gap-3">
                  <div class="w-8 h-8 rounded-full bg-gray-200 dark:bg-gray-600 flex items-center justify-center text-sm font-medium">
                    {user.name.charAt(0)}
                  </div>
                  <span class="font-medium text-gray-900 dark:text-white">{user.name}</span>
                </div>
              </TableBodyCell>
              <TableBodyCell>{user.email}</TableBodyCell>
              <TableBodyCell>
                <span class="bg-blue-100 text-blue-800 text-xs font-medium px-2.5 py-0.5 rounded dark:bg-blue-900 dark:text-blue-300">
                  {user.role}
                </span>
              </TableBodyCell>
              <TableBodyCell>
                <div class="flex items-center gap-2">
                  <div class={`w-2 h-2 rounded-full ${user.status === 'Active' ? 'bg-green-500' : 'bg-gray-400'}`}></div>
                  <span class={user.status === 'Active' ? 'text-green-500' : 'text-gray-500'}>{user.status}</span>
                </div>
              </TableBodyCell>
              <TableBodyCell>
                <button class="font-medium text-blue-600 dark:text-blue-500 hover:underline">Edit</button>
              </TableBodyCell>
            </TableBodyRow>
          {/each}
        </TableBody>
      </Table>
    </div>
  {/snippet}
</Story>

<!-- All Features Combined -->
<Story name="All Features Combined">
  {#snippet children(args)}
    <Table shadow striped hoverable color="primary">
      {#snippet captionSlot()}
        <caption class="p-5 text-lg font-semibold text-left text-white bg-primary-700 dark:bg-primary-800">
          Inventory Summary
          <p class="mt-1 text-sm font-normal text-primary-200">
            Complete overview of all products in stock.
          </p>
        </caption>
      {/snippet}
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell>{product.name}</TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
      {#snippet footerSlot()}
        <tfoot>
          <tr class="font-semibold text-white bg-primary-600 dark:bg-primary-700">
            <th scope="row" class="px-6 py-3 text-base">Total Products</th>
            <td class="px-6 py-3"></td>
            <td class="px-6 py-3"></td>
            <td class="px-6 py-3">{products.length} items</td>
          </tr>
        </tfoot>
      {/snippet}
    </Table>
  {/snippet}
</Story>

<!-- Empty State -->
<Story name="Empty State">
  {#snippet children(args)}
    <Table shadow>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        <TableBodyRow>
          <TableBodyCell colspan={4}>
            <div class="flex flex-col items-center justify-center py-12 text-gray-500 dark:text-gray-400">
              <svg class="w-12 h-12 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 13V6a2 2 0 00-2-2H6a2 2 0 00-2 2v7m16 0v5a2 2 0 01-2 2H6a2 2 0 01-2-2v-5m16 0h-2.586a1 1 0 00-.707.293l-2.414 2.414a1 1 0 01-.707.293h-3.172a1 1 0 01-.707-.293l-2.414-2.414A1 1 0 006.586 13H4" />
              </svg>
              <p class="text-lg font-medium">No products found</p>
              <p class="text-sm">Get started by adding your first product.</p>
            </div>
          </TableBodyCell>
        </TableBodyRow>
      </TableBody>
    </Table>
  {/snippet}
</Story>

<!-- Responsive Table -->
<Story name="Responsive Table">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        The table container has <code class="bg-gray-100 dark:bg-gray-800 px-1 rounded">overflow-x-auto</code> for horizontal scrolling on small screens.
      </p>
      <Table shadow>
        <TableHead>
          <TableHeadCell>ID</TableHeadCell>
          <TableHeadCell>Product Name</TableHeadCell>
          <TableHeadCell>Description</TableHeadCell>
          <TableHeadCell>Color</TableHeadCell>
          <TableHeadCell>Category</TableHeadCell>
          <TableHeadCell>Stock</TableHeadCell>
          <TableHeadCell>Price</TableHeadCell>
          <TableHeadCell>Actions</TableHeadCell>
        </TableHead>
        <TableBody>
          {#each products as product, i}
            <TableBodyRow>
              <TableBodyCell>#{i + 1001}</TableBodyCell>
              <TableBodyCell class="whitespace-nowrap">{product.name}</TableBodyCell>
              <TableBodyCell class="min-w-48">High-quality electronics with premium features</TableBodyCell>
              <TableBodyCell>{product.color}</TableBodyCell>
              <TableBodyCell>{product.category}</TableBodyCell>
              <TableBodyCell>In Stock</TableBodyCell>
              <TableBodyCell>{product.price}</TableBodyCell>
              <TableBodyCell>
                <div class="flex gap-2">
                  <button class="text-blue-600 hover:underline">Edit</button>
                  <button class="text-red-600 hover:underline">Delete</button>
                </div>
              </TableBodyCell>
            </TableBodyRow>
          {/each}
        </TableBody>
      </Table>
    </div>
  {/snippet}
</Story>
