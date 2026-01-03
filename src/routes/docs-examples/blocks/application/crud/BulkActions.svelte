<script lang="ts">
  import { Button, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Checkbox, Badge, Dropdown, DropdownItem, DropdownDivider } from "flowbite-svelte";
  import { ChevronDownOutline, TrashBinOutline, ArchiveBoxOutline, TagOutline, DocumentDuplicateOutline, ArrowDownTrayOutline, PenOutline } from "flowbite-svelte-icons";

  let selectedItems = $state<number[]>([]);

  const products = [
    { id: 1, name: "Apple iMac 27&quot;", category: "Electronics", price: "$2,999", status: "Published" },
    { id: 2, name: "MacBook Pro 16&quot;", category: "Electronics", price: "$2,499", status: "Published" },
    { id: 3, name: "iPhone 15 Pro", category: "Electronics", price: "$999", status: "Draft" },
    { id: 4, name: "iPad Air", category: "Electronics", price: "$599", status: "Published" },
    { id: 5, name: "AirPods Pro", category: "Electronics", price: "$249", status: "Archived" }
  ];

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

  function performBulkAction(action: string) {
    console.log(`Performing ${action} on items:`, selectedItems);
    // Handle the action
    selectedItems = [];
  }

  const statusColors: Record<string, "green" | "yellow" | "gray"> = {
    "Published": "green",
    "Draft": "yellow",
    "Archived": "gray"
  };
</script>

<div class="rounded-lg bg-white shadow dark:bg-gray-800">
  <!-- Bulk Action Bar -->
  <div class="flex items-center justify-between border-b border-gray-200 p-4 dark:border-gray-700">
    <div class="flex items-center gap-4">
      {#if selectedItems.length > 0}
        <span class="text-sm font-medium text-gray-700 dark:text-gray-300">
          {selectedItems.length} item{selectedItems.length > 1 ? 's' : ''} selected
        </span>
      {:else}
        <span class="text-sm text-gray-500 dark:text-gray-400">
          Select items to perform bulk actions
        </span>
      {/if}
    </div>

    <div class="flex items-center gap-2">
      {#if selectedItems.length > 0}
        <!-- Quick Actions -->
        <Button size="sm" color="alternative" onclick={() => performBulkAction("publish")}>
          Publish
        </Button>
        <Button size="sm" color="alternative" onclick={() => performBulkAction("archive")}>
          <ArchiveBoxOutline class="me-1 h-4 w-4" />
          Archive
        </Button>
        <Button size="sm" color="red" onclick={() => performBulkAction("delete")}>
          <TrashBinOutline class="me-1 h-4 w-4" />
          Delete
        </Button>

        <!-- More Actions Dropdown -->
        <Button size="sm" color="alternative">
          More Actions
          <ChevronDownOutline class="ms-2 h-4 w-4" />
        </Button>
        <Dropdown>
          <DropdownItem onclick={() => performBulkAction("duplicate")}>
            <DocumentDuplicateOutline class="me-2 h-4 w-4" />
            Duplicate
          </DropdownItem>
          <DropdownItem onclick={() => performBulkAction("export")}>
            <ArrowDownTrayOutline class="me-2 h-4 w-4" />
            Export
          </DropdownItem>
          <DropdownItem onclick={() => performBulkAction("tag")}>
            <TagOutline class="me-2 h-4 w-4" />
            Add Tags
          </DropdownItem>
          <DropdownItem onclick={() => performBulkAction("edit")}>
            <PenOutline class="me-2 h-4 w-4" />
            Bulk Edit
          </DropdownItem>
          <DropdownDivider />
          <DropdownItem onclick={() => selectedItems = []}>
            Clear Selection
          </DropdownItem>
        </Dropdown>
      {:else}
        <Button size="sm" color="alternative">
          <ArrowDownTrayOutline class="me-2 h-4 w-4" />
          Export All
        </Button>
      {/if}
    </div>
  </div>

  <!-- Table -->
  <Table hoverable>
    <TableHead>
      <TableHeadCell class="!p-4">
        <Checkbox
          checked={selectedItems.length === products.length && products.length > 0}
          onchange={toggleAll}
        />
      </TableHeadCell>
      <TableHeadCell>Product</TableHeadCell>
      <TableHeadCell>Category</TableHeadCell>
      <TableHeadCell>Price</TableHeadCell>
      <TableHeadCell>Status</TableHeadCell>
    </TableHead>
    <TableBody>
      {#each products as product}
        <TableBodyRow class={selectedItems.includes(product.id) ? "bg-primary-50 dark:bg-primary-900/10" : ""}>
          <TableBodyCell class="!p-4">
            <Checkbox
              checked={selectedItems.includes(product.id)}
              onchange={() => toggleItem(product.id)}
            />
          </TableBodyCell>
          <TableBodyCell class="font-medium text-gray-900 dark:text-white">
            {product.name}
          </TableBodyCell>
          <TableBodyCell>{product.category}</TableBodyCell>
          <TableBodyCell>{product.price}</TableBodyCell>
          <TableBodyCell>
            <Badge color={statusColors[product.status]}>{product.status}</Badge>
          </TableBodyCell>
        </TableBodyRow>
      {/each}
    </TableBody>
  </Table>

  <!-- Footer with selection info -->
  <div class="flex items-center justify-between border-t border-gray-200 p-4 dark:border-gray-700">
    <div class="flex items-center gap-4">
      <button
        class="text-sm text-primary-600 hover:underline dark:text-primary-500"
        onclick={toggleAll}
      >
        {selectedItems.length === products.length ? "Deselect all" : "Select all"} ({products.length})
      </button>
    </div>
    <span class="text-sm text-gray-500 dark:text-gray-400">
      {products.length} items total
    </span>
  </div>
</div>
