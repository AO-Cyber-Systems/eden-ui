<script lang="ts">
  import { Button, Input, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Badge } from "flowbite-svelte";
  import { PenOutline, CheckOutline, CloseOutline } from "flowbite-svelte-icons";

  interface Product {
    id: number;
    name: string;
    price: number;
    stock: number;
    status: string;
  }

  let products = $state<Product[]>([
    { id: 1, name: "Apple iMac 27&quot;", price: 2999, stock: 12, status: "In Stock" },
    { id: 2, name: "MacBook Pro 16&quot;", price: 2499, stock: 8, status: "In Stock" },
    { id: 3, name: "iPhone 15 Pro", price: 999, stock: 0, status: "Out of Stock" },
    { id: 4, name: "iPad Air", price: 599, stock: 3, status: "Low Stock" }
  ]);

  let editingId = $state<number | null>(null);
  let editValues = $state<{ name: string; price: number; stock: number }>({ name: "", price: 0, stock: 0 });

  function startEdit(product: Product) {
    editingId = product.id;
    editValues = { name: product.name, price: product.price, stock: product.stock };
  }

  function cancelEdit() {
    editingId = null;
  }

  function saveEdit() {
    if (editingId !== null) {
      products = products.map(p => {
        if (p.id === editingId) {
          const stock = editValues.stock;
          const status = stock === 0 ? "Out of Stock" : stock < 5 ? "Low Stock" : "In Stock";
          return { ...p, ...editValues, status };
        }
        return p;
      });
      editingId = null;
    }
  }

  const statusColors: Record<string, "green" | "red" | "yellow"> = {
    "In Stock": "green",
    "Out of Stock": "red",
    "Low Stock": "yellow"
  };
</script>

<div class="rounded-lg bg-white p-4 shadow dark:bg-gray-800">
  <div class="mb-4">
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Inline Editing</h3>
    <p class="text-sm text-gray-500 dark:text-gray-400">Click the edit button to modify values directly in the table</p>
  </div>

  <Table>
    <TableHead>
      <TableHeadCell>Product Name</TableHeadCell>
      <TableHeadCell>Price</TableHeadCell>
      <TableHeadCell>Stock</TableHeadCell>
      <TableHeadCell>Status</TableHeadCell>
      <TableHeadCell>Actions</TableHeadCell>
    </TableHead>
    <TableBody>
      {#each products as product}
        <TableBodyRow>
          <TableBodyCell>
            {#if editingId === product.id}
              <Input
                bind:value={editValues.name}
                size="sm"
                class="max-w-xs"
              />
            {:else}
              <span class="font-medium text-gray-900 dark:text-white">{product.name}</span>
            {/if}
          </TableBodyCell>
          <TableBodyCell>
            {#if editingId === product.id}
              <Input
                type="number"
                bind:value={editValues.price}
                size="sm"
                class="w-24"
              />
            {:else}
              ${product.price.toLocaleString()}
            {/if}
          </TableBodyCell>
          <TableBodyCell>
            {#if editingId === product.id}
              <Input
                type="number"
                bind:value={editValues.stock}
                size="sm"
                class="w-20"
              />
            {:else}
              {product.stock}
            {/if}
          </TableBodyCell>
          <TableBodyCell>
            <Badge color={statusColors[product.status]}>{product.status}</Badge>
          </TableBodyCell>
          <TableBodyCell>
            {#if editingId === product.id}
              <div class="flex gap-1">
                <Button size="xs" color="green" onclick={saveEdit}>
                  <CheckOutline class="h-4 w-4" />
                </Button>
                <Button size="xs" color="alternative" onclick={cancelEdit}>
                  <CloseOutline class="h-4 w-4" />
                </Button>
              </div>
            {:else}
              <Button size="xs" color="alternative" onclick={() => startEdit(product)}>
                <PenOutline class="h-4 w-4" />
              </Button>
            {/if}
          </TableBodyCell>
        </TableBodyRow>
      {/each}
    </TableBody>
  </Table>

  <div class="mt-4 rounded-lg bg-gray-50 p-3 dark:bg-gray-900">
    <p class="text-sm text-gray-600 dark:text-gray-400">
      <span class="font-medium">Tip:</span> Press Enter to save or Escape to cancel while editing
    </p>
  </div>
</div>
