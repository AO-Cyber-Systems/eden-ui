<script lang="ts">
  import { Button, Modal, Card } from "flowbite-svelte";
  import { TrashBinOutline, ExclamationCircleOutline } from "flowbite-svelte-icons";

  let showModal = $state(false);
  let showPopupModal = $state(false);

  const product = {
    name: "Apple iMac 27&quot;",
    sku: "IMAC-27-2024",
    price: "$2,999"
  };

  function handleDelete() {
    // Handle delete logic
    showModal = false;
    showPopupModal = false;
  }
</script>

<div class="space-y-8 p-4">
  <!-- Style 1: Standard Delete Modal -->
  <Card class="p-6">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Standard Delete Modal</h3>
    <Button color="red" onclick={() => showModal = true}>
      <TrashBinOutline class="me-2 h-4 w-4" />
      Delete Product
    </Button>
  </Card>

  <!-- Style 2: Popup Confirmation -->
  <Card class="p-6">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Popup Delete Confirmation</h3>
    <Button color="red" onclick={() => showPopupModal = true}>
      <TrashBinOutline class="me-2 h-4 w-4" />
      Delete with Popup
    </Button>
  </Card>
</div>

<!-- Standard Delete Modal -->
<Modal bind:open={showModal} size="md" class="w-full">
  {#snippet header()}
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      Delete Product
    </h3>
  {/snippet}

  <div class="space-y-4">
    <div class="flex items-start gap-4">
      <div class="flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full bg-red-100 dark:bg-red-900">
        <TrashBinOutline class="h-6 w-6 text-red-600 dark:text-red-400" />
      </div>
      <div>
        <p class="text-gray-600 dark:text-gray-400">
          Are you sure you want to delete this product? This action cannot be undone.
        </p>
      </div>
    </div>

    <!-- Product Info -->
    <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
      <div class="grid grid-cols-2 gap-2 text-sm">
        <div>
          <span class="text-gray-500 dark:text-gray-400">Product:</span>
          <span class="ms-2 font-medium text-gray-900 dark:text-white">{product.name}</span>
        </div>
        <div>
          <span class="text-gray-500 dark:text-gray-400">SKU:</span>
          <span class="ms-2 font-medium text-gray-900 dark:text-white">{product.sku}</span>
        </div>
        <div>
          <span class="text-gray-500 dark:text-gray-400">Price:</span>
          <span class="ms-2 font-medium text-gray-900 dark:text-white">{product.price}</span>
        </div>
      </div>
    </div>

    <div class="rounded-lg border border-red-200 bg-red-50 p-3 dark:border-red-800 dark:bg-red-900/20">
      <p class="text-sm text-red-800 dark:text-red-300">
        <span class="font-medium">Warning:</span> Deleting this product will also remove all associated orders, reviews, and analytics data.
      </p>
    </div>
  </div>

  <div class="mt-6 flex justify-end gap-2">
    <Button color="alternative" onclick={() => showModal = false}>
      Cancel
    </Button>
    <Button color="red" onclick={handleDelete}>
      <TrashBinOutline class="me-2 h-4 w-4" />
      Yes, Delete Product
    </Button>
  </div>
</Modal>

<!-- Popup Delete Confirmation -->
<Modal bind:open={showPopupModal} size="sm" class="text-center">
  <div class="p-6">
    <ExclamationCircleOutline class="mx-auto mb-4 h-14 w-14 text-gray-400 dark:text-gray-200" />
    <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">
      Are you sure you want to delete this product?
    </h3>
    <div class="flex justify-center gap-4">
      <Button color="red" onclick={handleDelete}>Yes, I'm sure</Button>
      <Button color="alternative" onclick={() => showPopupModal = false}>No, cancel</Button>
    </div>
  </div>
</Modal>
