<script lang="ts">
  import { Button, Drawer, Label, Input, Textarea, Select, Toggle, CloseButton } from "flowbite-svelte";
  import { PlusOutline, TrashBinOutline, ImageOutline } from "flowbite-svelte-icons";
  import { sineIn } from "svelte/easing";

  let showDrawer = $state(false);
  let productName = $state("");
  let brand = $state("");
  let price = $state("");
  let category = $state("");
  let description = $state("");
  let inStock = $state(true);

  const categories = [
    { value: "", name: "Select category" },
    { value: "electronics", name: "Electronics" },
    { value: "clothing", name: "Clothing" },
    { value: "home", name: "Home & Garden" }
  ];

  const transitionParams = {
    x: 320,
    duration: 200,
    easing: sineIn
  };

  function handleSubmit() {
    showDrawer = false;
  }
</script>

<div class="p-4">
  <Button onclick={() => showDrawer = true}>
    <PlusOutline class="me-2 h-4 w-4" />
    Add Product
  </Button>
</div>

<Drawer
  placement="right"
  transitionType="fly"
  {transitionParams}
  bind:hidden={showDrawer}
  id="create-drawer"
  class="w-full max-w-md"
>
  <div class="flex items-center justify-between border-b border-gray-200 pb-4 dark:border-gray-700">
    <h5 class="text-xl font-semibold text-gray-900 dark:text-white">
      Add New Product
    </h5>
    <CloseButton onclick={() => showDrawer = true} />
  </div>

  <form onsubmit={(e) => { e.preventDefault(); handleSubmit(); }} class="mt-6 space-y-6">
    <!-- Image Upload Area -->
    <div class="flex items-center justify-center">
      <label
        class="flex h-32 w-full cursor-pointer flex-col items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-50 hover:bg-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:hover:bg-gray-600"
      >
        <div class="flex flex-col items-center justify-center pb-6 pt-5">
          <ImageOutline class="mb-3 h-8 w-8 text-gray-400" />
          <p class="text-sm text-gray-500 dark:text-gray-400">
            <span class="font-semibold">Click to upload</span> product image
          </p>
        </div>
        <input type="file" class="hidden" accept="image/*" />
      </label>
    </div>

    <div>
      <Label for="drawer-name" class="mb-2">Product Name</Label>
      <Input id="drawer-name" bind:value={productName} placeholder="Apple iMac 25&quot;" required />
    </div>

    <div>
      <Label for="drawer-brand" class="mb-2">Brand</Label>
      <Input id="drawer-brand" bind:value={brand} placeholder="Apple" />
    </div>

    <div class="grid grid-cols-2 gap-4">
      <div>
        <Label for="drawer-price" class="mb-2">Price</Label>
        <Input id="drawer-price" type="number" bind:value={price} placeholder="2999" />
      </div>
      <div>
        <Label for="drawer-category" class="mb-2">Category</Label>
        <Select id="drawer-category" items={categories} bind:value={category} />
      </div>
    </div>

    <div>
      <Label for="drawer-description" class="mb-2">Description</Label>
      <Textarea
        id="drawer-description"
        bind:value={description}
        placeholder="Enter product description..."
        rows={4}
      />
    </div>

    <div class="flex items-center justify-between">
      <Label>In Stock</Label>
      <Toggle bind:checked={inStock} />
    </div>

    <div class="flex gap-3">
      <Button type="submit" class="flex-1">
        <PlusOutline class="me-2 h-4 w-4" />
        Add Product
      </Button>
      <Button color="alternative" onclick={() => showDrawer = true}>
        Cancel
      </Button>
    </div>
  </form>
</Drawer>
