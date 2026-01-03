<script lang="ts">
  import { Button, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Dropdown, DropdownItem, Badge } from "flowbite-svelte";
  import { ChevronDownOutline, ChevronUpOutline, BarsArrowDownOutline, ChevronUpDownOutline } from "flowbite-svelte-icons";

  type SortDirection = "asc" | "desc" | null;
  type SortField = "name" | "price" | "stock" | "date" | null;

  let sortField = $state<SortField>(null);
  let sortDirection = $state<SortDirection>(null);

  interface Product {
    id: number;
    name: string;
    category: string;
    price: number;
    stock: number;
    date: string;
    status: string;
  }

  const products: Product[] = [
    { id: 1, name: "Apple iMac 27&quot;", category: "Electronics", price: 2999, stock: 12, date: "2026-01-02", status: "In Stock" },
    { id: 2, name: "MacBook Pro 16&quot;", category: "Electronics", price: 2499, stock: 8, date: "2026-01-01", status: "In Stock" },
    { id: 3, name: "iPhone 15 Pro", category: "Electronics", price: 999, stock: 0, date: "2025-12-28", status: "Out of Stock" },
    { id: 4, name: "Dell XPS 15", category: "Electronics", price: 1499, stock: 5, date: "2025-12-25", status: "Low Stock" },
    { id: 5, name: "Sony WH-1000XM4", category: "Electronics", price: 349, stock: 25, date: "2025-12-20", status: "In Stock" }
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

  const sortedProducts = $derived(() => {
    if (!sortField || !sortDirection) return products;

    return [...products].sort((a, b) => {
      const aVal = a[sortField!];
      const bVal = b[sortField!];

      if (typeof aVal === "string" && typeof bVal === "string") {
        return sortDirection === "asc"
          ? aVal.localeCompare(bVal)
          : bVal.localeCompare(aVal);
      }

      if (typeof aVal === "number" && typeof bVal === "number") {
        return sortDirection === "asc" ? aVal - bVal : bVal - aVal;
      }

      return 0;
    });
  });

  function getSortIcon(field: SortField) {
    if (sortField !== field) return ChevronUpDownOutline;
    return sortDirection === "asc" ? ChevronUpOutline : ChevronDownOutline;
  }

  const statusColors: Record<string, "green" | "red" | "yellow"> = {
    "In Stock": "green",
    "Out of Stock": "red",
    "Low Stock": "yellow"
  };
</script>

<div class="space-y-6 p-4">
  <!-- Quick Sort Options -->
  <div class="flex items-center gap-4">
    <span class="text-sm text-gray-500 dark:text-gray-400">Sort by:</span>
    <Button color="alternative" size="sm">
      <BarsArrowDownOutline class="me-2 h-4 w-4" />
      {sortField ? `${sortField.charAt(0).toUpperCase() + sortField.slice(1)} (${sortDirection === "asc" ? "A-Z" : "Z-A"})` : "Select..."}
      <ChevronDownOutline class="ms-2 h-4 w-4" />
    </Button>
    <Dropdown>
      <DropdownItem onclick={() => { sortField = "name"; sortDirection = "asc"; }}>Name (A-Z)</DropdownItem>
      <DropdownItem onclick={() => { sortField = "name"; sortDirection = "desc"; }}>Name (Z-A)</DropdownItem>
      <DropdownItem onclick={() => { sortField = "price"; sortDirection = "asc"; }}>Price (Low to High)</DropdownItem>
      <DropdownItem onclick={() => { sortField = "price"; sortDirection = "desc"; }}>Price (High to Low)</DropdownItem>
      <DropdownItem onclick={() => { sortField = "stock"; sortDirection = "desc"; }}>Stock (High to Low)</DropdownItem>
      <DropdownItem onclick={() => { sortField = "date"; sortDirection = "desc"; }}>Newest First</DropdownItem>
      <DropdownItem onclick={() => { sortField = "date"; sortDirection = "asc"; }}>Oldest First</DropdownItem>
    </Dropdown>

    {#if sortField}
      <button
        class="text-sm text-primary-600 hover:underline dark:text-primary-500"
        onclick={() => { sortField = null; sortDirection = null; }}
      >
        Clear sort
      </button>
    {/if}
  </div>

  <!-- Sortable Table -->
  <div class="rounded-lg bg-white shadow dark:bg-gray-800">
    <Table hoverable>
      <TableHead>
        <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("name")}>
          <div class="flex items-center">
            Product Name
            <svelte:component this={getSortIcon("name")} class="ms-2 h-4 w-4" />
          </div>
        </TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("price")}>
          <div class="flex items-center">
            Price
            <svelte:component this={getSortIcon("price")} class="ms-2 h-4 w-4" />
          </div>
        </TableHeadCell>
        <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("stock")}>
          <div class="flex items-center">
            Stock
            <svelte:component this={getSortIcon("stock")} class="ms-2 h-4 w-4" />
          </div>
        </TableHeadCell>
        <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("date")}>
          <div class="flex items-center">
            Date Added
            <svelte:component this={getSortIcon("date")} class="ms-2 h-4 w-4" />
          </div>
        </TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each sortedProducts() as product}
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">
              {product.name}
            </TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>${product.price.toLocaleString()}</TableBodyCell>
            <TableBodyCell>{product.stock}</TableBodyCell>
            <TableBodyCell>{product.date}</TableBodyCell>
            <TableBodyCell>
              <Badge color={statusColors[product.status]}>{product.status}</Badge>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </div>

  <!-- Sort Indicator -->
  {#if sortField}
    <div class="flex items-center gap-2 rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
      <span class="text-sm text-gray-600 dark:text-gray-400">
        Sorted by <span class="font-medium text-gray-900 dark:text-white">{sortField}</span>
        ({sortDirection === "asc" ? "ascending" : "descending"})
      </span>
    </div>
  {/if}
</div>
