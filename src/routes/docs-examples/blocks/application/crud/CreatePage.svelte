<script lang="ts">
  import { Button, Label, Input, Textarea, Select, Toggle, Card, Fileupload, Helper } from "flowbite-svelte";
  import { ArrowLeftOutline, PlusOutline } from "flowbite-svelte-icons";

  let productName = $state("");
  let brand = $state("");
  let price = $state("");
  let sku = $state("");
  let category = $state("");
  let subcategory = $state("");
  let description = $state("");
  let inStock = $state(true);
  let featured = $state(false);
  let weight = $state("");
  let dimensions = $state("");

  const categories = [
    { value: "", name: "Select category" },
    { value: "electronics", name: "Electronics" },
    { value: "clothing", name: "Clothing" },
    { value: "home", name: "Home & Garden" }
  ];
</script>

<div class="mx-auto max-w-4xl p-4">
  <!-- Header -->
  <div class="mb-6 flex items-center justify-between">
    <div class="flex items-center gap-4">
      <Button color="alternative" size="sm">
        <ArrowLeftOutline class="me-2 h-4 w-4" />
        Back
      </Button>
      <div>
        <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Create New Product</h1>
        <p class="text-sm text-gray-500 dark:text-gray-400">Add a new product to your inventory</p>
      </div>
    </div>
    <div class="flex gap-2">
      <Button color="alternative">Save as Draft</Button>
      <Button>
        <PlusOutline class="me-2 h-4 w-4" />
        Publish Product
      </Button>
    </div>
  </div>

  <div class="grid gap-6 lg:grid-cols-3">
    <!-- Main Content -->
    <div class="space-y-6 lg:col-span-2">
      <!-- Basic Information -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Basic Information</h2>
        <div class="grid gap-4 sm:grid-cols-2">
          <div class="sm:col-span-2">
            <Label for="name" class="mb-2">Product Name</Label>
            <Input id="name" bind:value={productName} placeholder="Enter product name" />
          </div>
          <div>
            <Label for="brand" class="mb-2">Brand</Label>
            <Input id="brand" bind:value={brand} placeholder="Brand name" />
          </div>
          <div>
            <Label for="sku" class="mb-2">SKU</Label>
            <Input id="sku" bind:value={sku} placeholder="PRD-001" />
          </div>
          <div>
            <Label for="category" class="mb-2">Category</Label>
            <Select id="category" items={categories} bind:value={category} />
          </div>
          <div>
            <Label for="subcategory" class="mb-2">Subcategory</Label>
            <Select id="subcategory" items={categories} bind:value={subcategory} />
          </div>
        </div>
      </Card>

      <!-- Description -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Description</h2>
        <div>
          <Label for="description" class="mb-2">Product Description</Label>
          <Textarea
            id="description"
            bind:value={description}
            placeholder="Write a detailed description of your product..."
            rows={6}
          />
          <Helper class="mt-2">Write at least 100 characters for better SEO</Helper>
        </div>
      </Card>

      <!-- Media -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Product Images</h2>
        <div class="flex w-full items-center justify-center">
          <label class="flex h-48 w-full cursor-pointer flex-col items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-50 hover:bg-gray-100 dark:border-gray-600 dark:bg-gray-700 dark:hover:border-gray-500 dark:hover:bg-gray-600">
            <div class="flex flex-col items-center justify-center pb-6 pt-5">
              <svg class="mb-4 h-8 w-8 text-gray-500 dark:text-gray-400" fill="none" viewBox="0 0 20 16">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2"/>
              </svg>
              <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
                <span class="font-semibold">Click to upload</span> or drag and drop
              </p>
              <p class="text-xs text-gray-500 dark:text-gray-400">PNG, JPG or WEBP (MAX. 800x400px)</p>
            </div>
            <input type="file" class="hidden" multiple accept="image/*" />
          </label>
        </div>
      </Card>
    </div>

    <!-- Sidebar -->
    <div class="space-y-6">
      <!-- Pricing -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Pricing</h2>
        <div class="space-y-4">
          <div>
            <Label for="price" class="mb-2">Price ($)</Label>
            <Input id="price" type="number" bind:value={price} placeholder="0.00" />
          </div>
          <div>
            <Label for="compare-price" class="mb-2">Compare at Price ($)</Label>
            <Input id="compare-price" type="number" placeholder="0.00" />
            <Helper class="mt-1">Original price before discount</Helper>
          </div>
        </div>
      </Card>

      <!-- Inventory -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Inventory</h2>
        <div class="space-y-4">
          <div class="flex items-center justify-between">
            <Label>Track Inventory</Label>
            <Toggle bind:checked={inStock} />
          </div>
          <div>
            <Label for="quantity" class="mb-2">Quantity</Label>
            <Input id="quantity" type="number" placeholder="0" />
          </div>
        </div>
      </Card>

      <!-- Shipping -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Shipping</h2>
        <div class="space-y-4">
          <div>
            <Label for="weight" class="mb-2">Weight (kg)</Label>
            <Input id="weight" bind:value={weight} placeholder="0.5" />
          </div>
          <div>
            <Label for="dimensions" class="mb-2">Dimensions (cm)</Label>
            <Input id="dimensions" bind:value={dimensions} placeholder="10 x 10 x 5" />
          </div>
        </div>
      </Card>

      <!-- Options -->
      <Card class="p-6">
        <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Options</h2>
        <div class="space-y-4">
          <div class="flex items-center justify-between">
            <div>
              <p class="text-sm font-medium text-gray-900 dark:text-white">Featured Product</p>
              <p class="text-xs text-gray-500 dark:text-gray-400">Show on homepage</p>
            </div>
            <Toggle bind:checked={featured} />
          </div>
        </div>
      </Card>
    </div>
  </div>
</div>
