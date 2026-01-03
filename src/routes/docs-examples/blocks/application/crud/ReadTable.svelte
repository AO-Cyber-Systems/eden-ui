<script lang="ts">
  import { Button, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Checkbox, Badge, Input, Select, Dropdown, DropdownItem, DropdownDivider } from "flowbite-svelte";
  import { SearchOutline, PlusOutline, ChevronDownOutline, DotsVerticalOutline, PenOutline, TrashBinOutline, EyeOutline } from "flowbite-svelte-icons";

  let searchQuery = $state("");
  let selectedItems = $state<number[]>([]);

  const products = [
    { id: 1, name: "Apple iMac 27&quot;", category: "Electronics", brand: "Apple", price: "$2,999", stock: 12, status: "In Stock" },
    { id: 2, name: "Apple MacBook Pro", category: "Electronics", brand: "Apple", price: "$1,999", stock: 8, status: "In Stock" },
    { id: 3, name: "Samsung Galaxy S21", category: "Electronics", brand: "Samsung", price: "$799", stock: 0, status: "Out of Stock" },
    { id: 4, name: "Dell XPS 15", category: "Electronics", brand: "Dell", price: "$1,499", stock: 5, status: "Low Stock" },
    { id: 5, name: "Sony WH-1000XM4", category: "Electronics", brand: "Sony", price: "$349", stock: 25, status: "In Stock" },
    { id: 6, name: "iPad Pro 12.9&quot;", category: "Electronics", brand: "Apple", price: "$1,099", stock: 15, status: "In Stock" }
  ];

  const statusColors: Record<string, "green" | "red" | "yellow"> = {
    "In Stock": "green",
    "Out of Stock": "red",
    "Low Stock": "yellow"
  };

  function toggleAll() {
    if (selectedItems.length === products.length) {
      selectedItems = [];
    } else {
      selectedItems = products.map(p => p.id);
    }
  }

  function toggleItem(id: number) {
    if (selectedItems.includes(id)) {
      selectedItems = selectedItems.filter(i => i !== id);
    } else {
      selectedItems = [...selectedItems, id];
    }
  }
</script>

<div class="rounded-lg bg-white p-4 shadow dark:bg-gray-800">
  <!-- Header -->
  <div class="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
    <div class="flex flex-1 items-center gap-4">
      <div class="relative w-full max-w-xs">
        <Input
          bind:value={searchQuery}
          placeholder="Search products..."
          class="ps-10"
        >
          {#snippet left()}
            <SearchOutline class="h-5 w-5 text-gray-500 dark:text-gray-400" />
          {/snippet}
        </Input>
      </div>
      <Button color="alternative" size="sm">
        Filter
        <ChevronDownOutline class="ms-2 h-4 w-4" />
      </Button>
      <Dropdown>
        <DropdownItem>All Categories</DropdownItem>
        <DropdownItem>Electronics</DropdownItem>
        <DropdownItem>Clothing</DropdownItem>
        <DropdownItem>Home & Garden</DropdownItem>
      </Dropdown>
    </div>
    <Button>
      <PlusOutline class="me-2 h-4 w-4" />
      Add Product
    </Button>
  </div>

  <!-- Bulk Actions -->
  {#if selectedItems.length > 0}
    <div class="mb-4 flex items-center gap-4 rounded-lg bg-gray-50 p-3 dark:bg-gray-700">
      <span class="text-sm text-gray-700 dark:text-gray-300">
        {selectedItems.length} item(s) selected
      </span>
      <Button size="xs" color="red">
        <TrashBinOutline class="me-1 h-3 w-3" />
        Delete Selected
      </Button>
      <Button size="xs" color="alternative">Export</Button>
    </div>
  {/if}

  <!-- Table -->
  <Table hoverable>
    <TableHead>
      <TableHeadCell class="!p-4">
        <Checkbox checked={selectedItems.length === products.length} onchange={toggleAll} />
      </TableHeadCell>
      <TableHeadCell>Product</TableHeadCell>
      <TableHeadCell>Category</TableHeadCell>
      <TableHeadCell>Brand</TableHeadCell>
      <TableHeadCell>Price</TableHeadCell>
      <TableHeadCell>Stock</TableHeadCell>
      <TableHeadCell>Status</TableHeadCell>
      <TableHeadCell>
        <span class="sr-only">Actions</span>
      </TableHeadCell>
    </TableHead>
    <TableBody>
      {#each products as product}
        <TableBodyRow>
          <TableBodyCell class="!p-4">
            <Checkbox checked={selectedItems.includes(product.id)} onchange={() => toggleItem(product.id)} />
          </TableBodyCell>
          <TableBodyCell class="whitespace-nowrap font-medium text-gray-900 dark:text-white">
            {product.name}
          </TableBodyCell>
          <TableBodyCell>{product.category}</TableBodyCell>
          <TableBodyCell>{product.brand}</TableBodyCell>
          <TableBodyCell>{product.price}</TableBodyCell>
          <TableBodyCell>{product.stock}</TableBodyCell>
          <TableBodyCell>
            <Badge color={statusColors[product.status]}>{product.status}</Badge>
          </TableBodyCell>
          <TableBodyCell>
            <Button size="xs" color="alternative" class="!p-2">
              <DotsVerticalOutline class="h-4 w-4" />
            </Button>
            <Dropdown>
              <DropdownItem>
                <EyeOutline class="me-2 h-4 w-4" />
                View
              </DropdownItem>
              <DropdownItem>
                <PenOutline class="me-2 h-4 w-4" />
                Edit
              </DropdownItem>
              <DropdownDivider />
              <DropdownItem class="text-red-600 dark:text-red-500">
                <TrashBinOutline class="me-2 h-4 w-4" />
                Delete
              </DropdownItem>
            </Dropdown>
          </TableBodyCell>
        </TableBodyRow>
      {/each}
    </TableBody>
  </Table>

  <!-- Pagination -->
  <div class="mt-4 flex items-center justify-between">
    <span class="text-sm text-gray-700 dark:text-gray-400">
      Showing <span class="font-semibold text-gray-900 dark:text-white">1-6</span> of
      <span class="font-semibold text-gray-900 dark:text-white">100</span>
    </span>
    <div class="flex gap-2">
      <Button color="alternative" size="sm" disabled>Previous</Button>
      <Button color="alternative" size="sm">Next</Button>
    </div>
  </div>
</div>
