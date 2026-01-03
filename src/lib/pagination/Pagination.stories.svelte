<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Pagination from './Pagination.svelte';
  import PaginationNav from './PaginationNav.svelte';
  import PaginationItem from './PaginationItem.svelte';

  const { Story } = defineMeta({
    title: 'Components/Pagination',
    component: Pagination,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['default', 'small', 'large'],
        description: 'The size of the pagination buttons',
      },
      table: {
        control: 'boolean',
        description: 'Use table style pagination',
      },
    },
    args: {
      size: 'default',
      table: false,
    },
  });

  // State for PaginationNav examples
  let currentPage1 = $state(1);
  let currentPage2 = $state(3);
  let currentPage3 = $state(1);
  let currentPage4 = $state(5);

  // Pages array for Pagination component
  const basicPages = [
    { name: '1', href: '#' },
    { name: '2', href: '#' },
    { name: '3', href: '#' },
    { name: '4', href: '#' },
    { name: '5', href: '#' },
  ];

  const activePages = [
    { name: '1', href: '#' },
    { name: '2', href: '#' },
    { name: '3', href: '#', active: true },
    { name: '4', href: '#' },
    { name: '5', href: '#' },
  ];
</script>

<!-- Default Pagination -->
<Story name="Default">
  {#snippet children(args)}
    <Pagination
      pages={basicPages}
      previous={() => console.log('Previous')}
      next={() => console.log('Next')}
    />
  {/snippet}
</Story>

<!-- With Active Page -->
<Story name="With Active Page">
  {#snippet children(args)}
    <Pagination
      pages={activePages}
      previous={() => console.log('Previous')}
      next={() => console.log('Next')}
    />
  {/snippet}
</Story>

<!-- PaginationNav - Basic -->
<Story name="PaginationNav Default">
  {#snippet children(args)}
    <div class="space-y-4">
      <PaginationNav
        currentPage={currentPage1}
        totalPages={10}
        onPageChange={(page) => currentPage1 = page}
      />
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Current page: {currentPage1}
      </p>
    </div>
  {/snippet}
</Story>

<!-- PaginationNav - With Visible Pages Control -->
<Story name="Visible Pages">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">3 visible pages</p>
        <PaginationNav
          currentPage={currentPage2}
          totalPages={20}
          visiblePages={3}
          onPageChange={(page) => currentPage2 = page}
        />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">5 visible pages (default)</p>
        <PaginationNav
          currentPage={currentPage2}
          totalPages={20}
          visiblePages={5}
          onPageChange={(page) => currentPage2 = page}
        />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">7 visible pages</p>
        <PaginationNav
          currentPage={currentPage2}
          totalPages={20}
          visiblePages={7}
          onPageChange={(page) => currentPage2 = page}
        />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Table Layout -->
<Story name="Table Layout">
  {#snippet children(args)}
    <div class="space-y-4">
      <PaginationNav
        currentPage={currentPage3}
        totalPages={100}
        layout="table"
        onPageChange={(page) => currentPage3 = page}
      />
    </div>
  {/snippet}
</Story>

<!-- With Custom Labels -->
<Story name="Custom Labels">
  {#snippet children(args)}
    <PaginationNav
      currentPage={currentPage4}
      totalPages={10}
      previousLabel="Prev"
      nextLabel="Next"
      onPageChange={(page) => currentPage4 = page}
    />
  {/snippet}
</Story>

<!-- With Icons -->
<Story name="With Icons">
  {#snippet children(args)}
    <PaginationNav
      currentPage={currentPage4}
      totalPages={10}
      onPageChange={(page) => currentPage4 = page}
    >
      {#snippet prevContent()}
        <svg class="w-5 h-5 me-2 rtl:rotate-180" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M7.707 14.707a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l2.293 2.293a1 1 0 010 1.414z" clip-rule="evenodd"></path>
        </svg>
        Previous
      {/snippet}
      {#snippet nextContent()}
        Next
        <svg class="w-5 h-5 ms-2 rtl:rotate-180" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
    </PaginationNav>
  {/snippet}
</Story>

<!-- Table with Pagination -->
<Story name="Table Example">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
          <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th scope="col" class="px-6 py-3">Product name</th>
              <th scope="col" class="px-6 py-3">Color</th>
              <th scope="col" class="px-6 py-3">Category</th>
              <th scope="col" class="px-6 py-3">Price</th>
            </tr>
          </thead>
          <tbody>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">Apple MacBook Pro</th>
              <td class="px-6 py-4">Silver</td>
              <td class="px-6 py-4">Laptop</td>
              <td class="px-6 py-4">$2999</td>
            </tr>
            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">Microsoft Surface Pro</th>
              <td class="px-6 py-4">White</td>
              <td class="px-6 py-4">Laptop PC</td>
              <td class="px-6 py-4">$1999</td>
            </tr>
            <tr class="bg-white dark:bg-gray-800">
              <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">Magic Mouse 2</th>
              <td class="px-6 py-4">Black</td>
              <td class="px-6 py-4">Accessories</td>
              <td class="px-6 py-4">$99</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="flex justify-between items-center">
        <span class="text-sm text-gray-700 dark:text-gray-400">
          Showing <span class="font-semibold text-gray-900 dark:text-white">1</span> to <span class="font-semibold text-gray-900 dark:text-white">3</span> of <span class="font-semibold text-gray-900 dark:text-white">100</span> entries
        </span>
        <PaginationNav
          currentPage={currentPage1}
          totalPages={34}
          onPageChange={(page) => currentPage1 = page}
        />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Standalone PaginationItem -->
<Story name="PaginationItem">
  {#snippet children(args)}
    <div class="flex space-x-2">
      <PaginationItem href="#">1</PaginationItem>
      <PaginationItem href="#">2</PaginationItem>
      <PaginationItem href="#" active>3</PaginationItem>
      <PaginationItem href="#">4</PaginationItem>
      <PaginationItem href="#">5</PaginationItem>
    </div>
  {/snippet}
</Story>

