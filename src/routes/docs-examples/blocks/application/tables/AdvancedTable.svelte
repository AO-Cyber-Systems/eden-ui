<script lang="ts">
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Card, Button, Input, Select, Badge, Checkbox, Dropdown, DropdownItem, DropdownDivider, Avatar, Toggle } from "flowbite-svelte";
  import { SearchOutline, ChevronDownOutline, ChevronUpOutline, ChevronUpDownOutline, PlusOutline, FilterOutline, DotsHorizontalOutline, PenOutline, TrashBinOutline, EyeOutline, ArrowDownTrayOutline } from "flowbite-svelte-icons";

  type SortField = "name" | "category" | "price" | "stock" | "revenue" | null;
  type SortDirection = "asc" | "desc" | null;

  let searchQuery = $state("");
  let selectedCategory = $state("");
  let selectedStatus = $state("");
  let sortField = $state<SortField>(null);
  let sortDirection = $state<SortDirection>(null);
  let selectedItems = $state<number[]>([]);

  interface Product {
    id: number;
    name: string;
    image: string;
    category: string;
    price: number;
    stock: number;
    revenue: number;
    status: string;
    featured: boolean;
  }

  let products = $state<Product[]>([
    { id: 1, name: "Apple iMac 27&quot;", image: "/api/placeholder/40/40", category: "Electronics", price: 2999, stock: 12, revenue: 35988, status: "Active", featured: true },
    { id: 2, name: "MacBook Pro 16&quot;", image: "/api/placeholder/40/40", category: "Electronics", price: 2499, stock: 8, revenue: 19992, status: "Active", featured: true },
    { id: 3, name: "iPhone 15 Pro", image: "/api/placeholder/40/40", category: "Electronics", price: 999, stock: 0, revenue: 49950, status: "Out of Stock", featured: false },
    { id: 4, name: "Dell XPS 15", image: "/api/placeholder/40/40", category: "Electronics", price: 1499, stock: 5, revenue: 7495, status: "Low Stock", featured: false },
    { id: 5, name: "Nike Air Max", image: "/api/placeholder/40/40", category: "Clothing", price: 179, stock: 45, revenue: 8055, status: "Active", featured: true },
    { id: 6, name: "Sony WH-1000XM4", image: "/api/placeholder/40/40", category: "Electronics", price: 349, stock: 25, revenue: 8725, status: "Active", featured: false },
    { id: 7, name: "Samsung Galaxy S24", image: "/api/placeholder/40/40", category: "Electronics", price: 899, stock: 18, revenue: 16182, status: "Active", featured: true }
  ]);

  const categories = [
    { value: "", name: "All Categories" },
    { value: "Electronics", name: "Electronics" },
    { value: "Clothing", name: "Clothing" }
  ];

  const statuses = [
    { value: "", name: "All Status" },
    { value: "Active", name: "Active" },
    { value: "Out of Stock", name: "Out of Stock" },
    { value: "Low Stock", name: "Low Stock" }
  ];

  function toggleSort(field: SortField) {
    if (sortField === field) {
      if (sortDirection === "asc") {
        sortDirection = "desc";
      } else if (sortDirection === "desc") {
        sortField = null;
        sortDirection = null;
      }
    } else {
      sortField = field;
      sortDirection = "asc";
    }
  }

  function toggleItem(id: number) {
    if (selectedItems.includes(id)) {
      selectedItems = selectedItems.filter(i => i !== id);
    } else {
      selectedItems = [...selectedItems, id];
    }
  }

  function toggleAll() {
    if (selectedItems.length === filteredProducts.length) {
      selectedItems = [];
    } else {
      selectedItems = filteredProducts.map(p => p.id);
    }
  }

  function toggleFeatured(id: number) {
    products = products.map(p =>
      p.id === id ? { ...p, featured: !p.featured } : p
    );
  }

  const filteredProducts = $derived(() => {
    let result = [...products];

    if (searchQuery) {
      result = result.filter(p =>
        p.name.toLowerCase().includes(searchQuery.toLowerCase())
      );
    }

    if (selectedCategory) {
      result = result.filter(p => p.category === selectedCategory);
    }

    if (selectedStatus) {
      result = result.filter(p => p.status === selectedStatus);
    }

    if (sortField && sortDirection) {
      result.sort((a, b) => {
        const aVal = a[sortField!];
        const bVal = b[sortField!];

        if (typeof aVal === "string" && typeof bVal === "string") {
          return sortDirection === "asc" ? aVal.localeCompare(bVal) : bVal.localeCompare(aVal);
        }
        if (typeof aVal === "number" && typeof bVal === "number") {
          return sortDirection === "asc" ? aVal - bVal : bVal - aVal;
        }
        return 0;
      });
    }

    return result;
  });

  function getSortIcon(field: SortField) {
    if (sortField !== field) return ChevronUpDownOutline;
    return sortDirection === "asc" ? ChevronUpOutline : ChevronDownOutline;
  }

  const statusColors: Record<string, "green" | "red" | "yellow"> = {
    "Active": "green",
    "Out of Stock": "red",
    "Low Stock": "yellow"
  };
</script>

<div class="p-4">
  <Card class="p-0 overflow-hidden">
    <!-- Header with Search and Filters -->
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <div class="flex flex-col gap-4 md:flex-row md:items-center md:justify-between">
        <div>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Product Inventory</h3>
          <p class="text-sm text-gray-500 dark:text-gray-400">
            Manage your product catalog with advanced features.
          </p>
        </div>
        <div class="flex items-center gap-2">
          <Button color="alternative">
            <ArrowDownTrayOutline class="me-2 h-4 w-4" />
            Export
          </Button>
          <Button>
            <PlusOutline class="me-2 h-4 w-4" />
            Add Product
          </Button>
        </div>
      </div>

      <!-- Filters Row -->
      <div class="mt-4 flex flex-wrap items-center gap-3">
        <div class="flex-1 min-w-64">
          <Input bind:value={searchQuery} placeholder="Search products...">
            {#snippet left()}
              <SearchOutline class="h-4 w-4 text-gray-500" />
            {/snippet}
          </Input>
        </div>
        <Select items={categories} bind:value={selectedCategory} class="w-40" />
        <Select items={statuses} bind:value={selectedStatus} class="w-36" />
        <Button color="alternative">
          <FilterOutline class="me-2 h-4 w-4" />
          More Filters
        </Button>
      </div>
    </div>

    <!-- Bulk Action Bar (when items selected) -->
    {#if selectedItems.length > 0}
      <div class="flex items-center justify-between border-b border-gray-200 bg-primary-50 px-4 py-2 dark:border-gray-700 dark:bg-primary-900/20">
        <span class="text-sm font-medium text-primary-700 dark:text-primary-300">
          {selectedItems.length} item{selectedItems.length > 1 ? 's' : ''} selected
        </span>
        <div class="flex items-center gap-2">
          <Button size="xs" color="alternative">Edit Selected</Button>
          <Button size="xs" color="red">Delete Selected</Button>
        </div>
      </div>
    {/if}

    <!-- Table -->
    <div class="overflow-x-auto">
      <Table hoverable>
        <TableHead>
          <TableHeadCell class="!p-4">
            <Checkbox
              checked={selectedItems.length === filteredProducts().length && filteredProducts().length > 0}
              onchange={toggleAll}
            />
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("name")}>
            <div class="flex items-center">
              Product
              <svelte:component this={getSortIcon("name")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("category")}>
            <div class="flex items-center">
              Category
              <svelte:component this={getSortIcon("category")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("price")}>
            <div class="flex items-center">
              Price
              <svelte:component this={getSortIcon("price")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("stock")}>
            <div class="flex items-center">
              Stock
              <svelte:component this={getSortIcon("stock")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("revenue")}>
            <div class="flex items-center">
              Revenue
              <svelte:component this={getSortIcon("revenue")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell>Status</TableHeadCell>
          <TableHeadCell>Featured</TableHeadCell>
          <TableHeadCell>
            <span class="sr-only">Actions</span>
          </TableHeadCell>
        </TableHead>
        <TableBody>
          {#each filteredProducts() as product}
            <TableBodyRow class={selectedItems.includes(product.id) ? "bg-primary-50 dark:bg-primary-900/10" : ""}>
              <TableBodyCell class="!p-4">
                <Checkbox
                  checked={selectedItems.includes(product.id)}
                  onchange={() => toggleItem(product.id)}
                />
              </TableBodyCell>
              <TableBodyCell>
                <div class="flex items-center gap-3">
                  <div class="h-10 w-10 rounded-lg bg-gray-100 dark:bg-gray-700"></div>
                  <span class="font-medium text-gray-900 dark:text-white">{product.name}</span>
                </div>
              </TableBodyCell>
              <TableBodyCell>
                <Badge color="dark">{product.category}</Badge>
              </TableBodyCell>
              <TableBodyCell class="font-medium">${product.price.toLocaleString()}</TableBodyCell>
              <TableBodyCell>
                <span class={product.stock === 0 ? 'text-red-600 dark:text-red-400' : product.stock < 10 ? 'text-yellow-600 dark:text-yellow-400' : ''}>
                  {product.stock}
                </span>
              </TableBodyCell>
              <TableBodyCell class="font-medium text-green-600 dark:text-green-400">
                ${product.revenue.toLocaleString()}
              </TableBodyCell>
              <TableBodyCell>
                <Badge color={statusColors[product.status]}>{product.status}</Badge>
              </TableBodyCell>
              <TableBodyCell>
                <Toggle checked={product.featured} onchange={() => toggleFeatured(product.id)} />
              </TableBodyCell>
              <TableBodyCell>
                <Button size="xs" color="alternative" class="!p-2">
                  <DotsHorizontalOutline class="h-4 w-4" />
                </Button>
                <Dropdown>
                  <DropdownItem>
                    <EyeOutline class="me-2 h-4 w-4" />View
                  </DropdownItem>
                  <DropdownItem>
                    <PenOutline class="me-2 h-4 w-4" />Edit
                  </DropdownItem>
                  <DropdownDivider />
                  <DropdownItem class="text-red-600 dark:text-red-400">
                    <TrashBinOutline class="me-2 h-4 w-4" />Delete
                  </DropdownItem>
                </Dropdown>
              </TableBodyCell>
            </TableBodyRow>
          {/each}
        </TableBody>
      </Table>
    </div>

    <!-- Footer with Pagination Info -->
    <div class="flex items-center justify-between border-t border-gray-200 p-4 dark:border-gray-700">
      <span class="text-sm text-gray-500 dark:text-gray-400">
        Showing <span class="font-semibold text-gray-900 dark:text-white">1-{filteredProducts().length}</span> of
        <span class="font-semibold text-gray-900 dark:text-white">{products.length}</span> products
      </span>
      <div class="flex items-center gap-2">
        <Button color="alternative" size="sm" disabled>Previous</Button>
        <Button color="alternative" size="sm">Next</Button>
      </div>
    </div>
  </Card>
</div>
