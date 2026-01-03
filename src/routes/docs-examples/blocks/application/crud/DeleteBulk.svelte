<script lang="ts">
  import { Button, Modal, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Checkbox, Badge } from "flowbite-svelte";
  import { TrashBinOutline, ExclamationCircleOutline } from "flowbite-svelte-icons";

  let showModal = $state(false);
  let selectedItems = $state<number[]>([]);

  const products = [
    { id: 1, name: "Apple iMac 27&quot;", category: "Electronics", price: "$2,999", status: "In Stock" },
    { id: 2, name: "MacBook Pro 16&quot;", category: "Electronics", price: "$2,499", status: "In Stock" },
    { id: 3, name: "iPhone 15 Pro", category: "Electronics", price: "$999", status: "Out of Stock" },
    { id: 4, name: "iPad Air", category: "Electronics", price: "$599", status: "Low Stock" },
    { id: 5, name: "AirPods Pro", category: "Electronics", price: "$249", status: "In Stock" }
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

  function handleBulkDelete() {
    // Handle bulk delete logic
    selectedItems = [];
    showModal = false;
  }

  const selectedProducts = $derived(products.filter(p => selectedItems.includes(p.id)));
</script>

<div class="rounded-lg bg-white p-4 shadow dark:bg-gray-800">
  <div class="mb-4 flex items-center justify-between">
    <div>
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Bulk Delete</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Select multiple items to delete at once</p>
    </div>
    {#if selectedItems.length > 0}
      <Button color="red" onclick={() => showModal = true}>
        <TrashBinOutline class="me-2 h-4 w-4" />
        Delete {selectedItems.length} Item{selectedItems.length > 1 ? 's' : ''}
      </Button>
    {/if}
  </div>

  <!-- Selection Summary -->
  {#if selectedItems.length > 0}
    <div class="mb-4 flex items-center justify-between rounded-lg bg-red-50 p-3 dark:bg-red-900/20">
      <div class="flex items-center gap-2">
        <ExclamationCircleOutline class="h-5 w-5 text-red-600 dark:text-red-400" />
        <span class="text-sm text-red-800 dark:text-red-300">
          {selectedItems.length} item{selectedItems.length > 1 ? 's' : ''} selected for deletion
        </span>
      </div>
      <button
        class="text-sm font-medium text-red-600 hover:underline dark:text-red-400"
        onclick={() => selectedItems = []}
      >
        Clear selection
      </button>
    </div>
  {/if}

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
        <TableBodyRow class={selectedItems.includes(product.id) ? "bg-red-50 dark:bg-red-900/10" : ""}>
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
            <Badge color={product.status === "In Stock" ? "green" : product.status === "Out of Stock" ? "red" : "yellow"}>
              {product.status}
            </Badge>
          </TableBodyCell>
        </TableBodyRow>
      {/each}
    </TableBody>
  </Table>
</div>

<!-- Bulk Delete Confirmation Modal -->
<Modal bind:open={showModal} size="md">
  {#snippet header()}
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      Confirm Bulk Delete
    </h3>
  {/snippet}

  <div class="space-y-4">
    <div class="flex items-start gap-4">
      <div class="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 dark:bg-red-900">
        <TrashBinOutline class="h-6 w-6 text-red-600 dark:text-red-400" />
      </div>
      <div>
        <p class="text-gray-600 dark:text-gray-400">
          You are about to delete <span class="font-semibold">{selectedItems.length} product{selectedItems.length > 1 ? 's' : ''}</span>. This action cannot be undone.
        </p>
      </div>
    </div>

    <!-- Items to be deleted -->
    <div class="max-h-48 overflow-y-auto rounded-lg border border-gray-200 dark:border-gray-700">
      <ul class="divide-y divide-gray-200 dark:divide-gray-700">
        {#each selectedProducts as product}
          <li class="flex items-center justify-between p-3">
            <span class="text-sm font-medium text-gray-900 dark:text-white">{product.name}</span>
            <span class="text-sm text-gray-500 dark:text-gray-400">{product.price}</span>
          </li>
        {/each}
      </ul>
    </div>

    <div class="rounded-lg border border-red-200 bg-red-50 p-3 dark:border-red-800 dark:bg-red-900/20">
      <p class="text-sm text-red-800 dark:text-red-300">
        <span class="font-medium">Warning:</span> All associated data including orders, reviews, and inventory records will be permanently removed.
      </p>
    </div>
  </div>

  <div class="mt-6 flex justify-end gap-2">
    <Button color="alternative" onclick={() => showModal = false}>
      Cancel
    </Button>
    <Button color="red" onclick={handleBulkDelete}>
      <TrashBinOutline class="me-2 h-4 w-4" />
      Delete {selectedItems.length} Item{selectedItems.length > 1 ? 's' : ''}
    </Button>
  </div>
</Modal>
