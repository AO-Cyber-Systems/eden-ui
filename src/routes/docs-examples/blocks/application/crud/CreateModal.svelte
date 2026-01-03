<script lang="ts">
  import { Button, Modal, Label, Input, Textarea, Select } from "flowbite-svelte";
  import { PlusOutline, CloseOutline } from "flowbite-svelte-icons";

  let showModal = $state(false);
  let productName = $state("");
  let productCategory = $state("");
  let productPrice = $state("");
  let productDescription = $state("");

  const categories = [
    { value: "", name: "Select category" },
    { value: "electronics", name: "Electronics" },
    { value: "clothing", name: "Clothing" },
    { value: "home", name: "Home & Garden" },
    { value: "sports", name: "Sports & Outdoors" }
  ];

  function handleSubmit() {
    // Handle form submission
    showModal = false;
    // Reset form
    productName = "";
    productCategory = "";
    productPrice = "";
    productDescription = "";
  }
</script>

<div class="p-4">
  <Button onclick={() => showModal = true}>
    <PlusOutline class="me-2 h-4 w-4" />
    Add Product
  </Button>
</div>

<Modal bind:open={showModal} size="md" class="w-full">
  {#snippet header()}
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
      Create New Product
    </h3>
  {/snippet}

  <form onsubmit={(e) => { e.preventDefault(); handleSubmit(); }}>
    <div class="grid gap-4 sm:grid-cols-2">
      <div class="sm:col-span-2">
        <Label for="name" class="mb-2">Product Name</Label>
        <Input
          id="name"
          bind:value={productName}
          placeholder="Type product name"
          required
        />
      </div>
      <div>
        <Label for="category" class="mb-2">Category</Label>
        <Select id="category" items={categories} bind:value={productCategory} />
      </div>
      <div>
        <Label for="price" class="mb-2">Price</Label>
        <Input
          id="price"
          type="number"
          bind:value={productPrice}
          placeholder="$2999"
          required
        />
      </div>
      <div class="sm:col-span-2">
        <Label for="description" class="mb-2">Description</Label>
        <Textarea
          id="description"
          bind:value={productDescription}
          placeholder="Write product description here"
          rows={4}
        />
      </div>
    </div>
    <div class="mt-4 flex items-center justify-end gap-2">
      <Button color="alternative" onclick={() => showModal = false}>
        Cancel
      </Button>
      <Button type="submit">
        <PlusOutline class="me-2 h-4 w-4" />
        Add Product
      </Button>
    </div>
  </form>
</Modal>
