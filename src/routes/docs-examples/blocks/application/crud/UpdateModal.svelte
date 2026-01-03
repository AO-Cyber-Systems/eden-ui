<script lang="ts">
  import { Button, Modal, Label, Input, Textarea, Select, Toggle } from "flowbite-svelte";
  import { PenOutline } from "flowbite-svelte-icons";

  let showModal = $state(false);

  // Pre-populated with existing data
  let productName = $state("Apple iMac 27&quot;");
  let productCategory = $state("electronics");
  let productPrice = $state("2999");
  let productDescription = $state("The all-in-one for all. Stunningly immersive 27-inch Retina 5K display.");
  let inStock = $state(true);
  let featured = $state(false);

  const categories = [
    { value: "electronics", name: "Electronics" },
    { value: "clothing", name: "Clothing" },
    { value: "home", name: "Home & Garden" },
    { value: "sports", name: "Sports & Outdoors" }
  ];

  function handleSubmit() {
    showModal = false;
  }
</script>

<div class="p-4">
  <Button onclick={() => showModal = true}>
    <PenOutline class="me-2 h-4 w-4" />
    Edit Product
  </Button>
</div>

<Modal bind:open={showModal} size="lg" class="w-full">
  {#snippet header()}
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      Edit Product
    </h3>
  {/snippet}

  <form onsubmit={(e) => { e.preventDefault(); handleSubmit(); }}>
    <div class="grid gap-4 sm:grid-cols-2">
      <div class="sm:col-span-2">
        <Label for="edit-name" class="mb-2">Product Name</Label>
        <Input
          id="edit-name"
          bind:value={productName}
          placeholder="Type product name"
          required
        />
      </div>
      <div>
        <Label for="edit-category" class="mb-2">Category</Label>
        <Select id="edit-category" items={categories} bind:value={productCategory} />
      </div>
      <div>
        <Label for="edit-price" class="mb-2">Price ($)</Label>
        <Input
          id="edit-price"
          type="number"
          bind:value={productPrice}
          required
        />
      </div>
      <div class="sm:col-span-2">
        <Label for="edit-description" class="mb-2">Description</Label>
        <Textarea
          id="edit-description"
          bind:value={productDescription}
          placeholder="Write product description here"
          rows={4}
        />
      </div>
      <div>
        <div class="flex items-center justify-between rounded-lg border border-gray-200 p-3 dark:border-gray-700">
          <div>
            <p class="font-medium text-gray-900 dark:text-white">In Stock</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Product is available for purchase</p>
          </div>
          <Toggle bind:checked={inStock} />
        </div>
      </div>
      <div>
        <div class="flex items-center justify-between rounded-lg border border-gray-200 p-3 dark:border-gray-700">
          <div>
            <p class="font-medium text-gray-900 dark:text-white">Featured</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Show on homepage</p>
          </div>
          <Toggle bind:checked={featured} />
        </div>
      </div>
    </div>

    <!-- Change indicator -->
    <div class="mt-4 rounded-lg bg-blue-50 p-3 dark:bg-blue-900/20">
      <p class="text-sm text-blue-800 dark:text-blue-300">
        <span class="font-medium">Note:</span> Changes will be saved immediately after clicking "Save Changes"
      </p>
    </div>

    <div class="mt-4 flex items-center justify-end gap-2">
      <Button color="alternative" onclick={() => showModal = false}>
        Cancel
      </Button>
      <Button type="submit">
        Save Changes
      </Button>
    </div>
  </form>
</Modal>
