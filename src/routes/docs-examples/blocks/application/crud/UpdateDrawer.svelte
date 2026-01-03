<script lang="ts">
  import { Button, Drawer, Label, Input, Textarea, Select, Toggle, CloseButton, Badge } from "flowbite-svelte";
  import { PenOutline, TrashBinOutline, ImageOutline } from "flowbite-svelte-icons";
  import { sineIn } from "svelte/easing";

  let showDrawer = $state(false);

  // Pre-populated with existing data
  let productName = $state("Apple iMac 27&quot;");
  let brand = $state("Apple");
  let price = $state("2999");
  let category = $state("electronics");
  let description = $state("The all-in-one for all. Stunningly immersive 27-inch Retina 5K display.");
  let inStock = $state(true);
  let stockQuantity = $state("12");

  const categories = [
    { value: "electronics", name: "Electronics" },
    { value: "clothing", name: "Clothing" },
    { value: "home", name: "Home & Garden" }
  ];

  const transitionParams = {
    x: 384,
    duration: 200,
    easing: sineIn
  };

  function handleSubmit() {
    showDrawer = false;
  }
</script>

<div class="p-4">
  <Button onclick={() => showDrawer = true}>
    <PenOutline class="me-2 h-4 w-4" />
    Edit Product
  </Button>
</div>

<Drawer
  placement="right"
  transitionType="fly"
  {transitionParams}
  bind:hidden={showDrawer}
  id="update-drawer"
  class="w-full max-w-md"
>
  <div class="flex items-center justify-between border-b border-gray-200 pb-4 dark:border-gray-700">
    <div>
      <h5 class="text-xl font-semibold text-gray-900 dark:text-white">
        Edit Product
      </h5>
      <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
        Update product information
      </p>
    </div>
    <CloseButton onclick={() => showDrawer = true} />
  </div>

  <form onsubmit={(e) => { e.preventDefault(); handleSubmit(); }} class="mt-6 space-y-6">
    <!-- Current Image -->
    <div>
      <Label class="mb-2">Product Image</Label>
      <div class="flex items-center gap-4">
        <div class="flex h-20 w-20 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-700">
          <ImageOutline class="h-8 w-8 text-gray-400" />
        </div>
        <div>
          <Button size="sm" color="alternative">Change Image</Button>
          <p class="mt-1 text-xs text-gray-500 dark:text-gray-400">JPG, PNG or GIF. Max 2MB</p>
        </div>
      </div>
    </div>

    <div>
      <Label for="drawer-edit-name" class="mb-2">Product Name</Label>
      <Input id="drawer-edit-name" bind:value={productName} required />
    </div>

    <div>
      <Label for="drawer-edit-brand" class="mb-2">Brand</Label>
      <Input id="drawer-edit-brand" bind:value={brand} />
    </div>

    <div class="grid grid-cols-2 gap-4">
      <div>
        <Label for="drawer-edit-price" class="mb-2">Price ($)</Label>
        <Input id="drawer-edit-price" type="number" bind:value={price} />
      </div>
      <div>
        <Label for="drawer-edit-category" class="mb-2">Category</Label>
        <Select id="drawer-edit-category" items={categories} bind:value={category} />
      </div>
    </div>

    <div>
      <Label for="drawer-edit-description" class="mb-2">Description</Label>
      <Textarea
        id="drawer-edit-description"
        bind:value={description}
        rows={4}
      />
    </div>

    <div class="space-y-3 rounded-lg border border-gray-200 p-4 dark:border-gray-700">
      <div class="flex items-center justify-between">
        <div>
          <p class="font-medium text-gray-900 dark:text-white">In Stock</p>
        </div>
        <Toggle bind:checked={inStock} />
      </div>
      {#if inStock}
        <div>
          <Label for="drawer-edit-quantity" class="mb-2">Stock Quantity</Label>
          <Input id="drawer-edit-quantity" type="number" bind:value={stockQuantity} />
        </div>
      {/if}
    </div>

    <div class="flex gap-3">
      <Button type="submit" class="flex-1">
        Save Changes
      </Button>
      <Button color="alternative" onclick={() => showDrawer = true}>
        Cancel
      </Button>
    </div>

    <div class="border-t border-gray-200 pt-4 dark:border-gray-700">
      <Button color="red" class="w-full">
        <TrashBinOutline class="me-2 h-4 w-4" />
        Delete Product
      </Button>
    </div>
  </form>
</Drawer>
