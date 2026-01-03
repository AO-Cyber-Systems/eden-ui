<script lang="ts">
  import { Button, Input, Select, Badge, Card, Dropdown, DropdownItem, DropdownDivider, Checkbox, Label, Range } from "flowbite-svelte";
  import { SearchOutline, FilterOutline, CloseOutline, ChevronDownOutline } from "flowbite-svelte-icons";

  let searchQuery = $state("");
  let selectedCategory = $state("");
  let selectedStatus = $state("");
  let minPrice = $state(0);
  let maxPrice = $state(5000);
  let showAdvancedFilters = $state(false);

  // Active filters
  let selectedBrands = $state<string[]>([]);
  let inStockOnly = $state(false);

  const categories = [
    { value: "", name: "All Categories" },
    { value: "electronics", name: "Electronics" },
    { value: "clothing", name: "Clothing" },
    { value: "home", name: "Home & Garden" }
  ];

  const statuses = [
    { value: "", name: "All Status" },
    { value: "in_stock", name: "In Stock" },
    { value: "low_stock", name: "Low Stock" },
    { value: "out_of_stock", name: "Out of Stock" }
  ];

  const brands = ["Apple", "Samsung", "Dell", "Sony", "Microsoft"];

  function toggleBrand(brand: string) {
    if (selectedBrands.includes(brand)) {
      selectedBrands = selectedBrands.filter(b => b !== brand);
    } else {
      selectedBrands = [...selectedBrands, brand];
    }
  }

  function clearAllFilters() {
    searchQuery = "";
    selectedCategory = "";
    selectedStatus = "";
    minPrice = 0;
    maxPrice = 5000;
    selectedBrands = [];
    inStockOnly = false;
  }

  const activeFilterCount = $derived(
    (selectedCategory ? 1 : 0) +
    (selectedStatus ? 1 : 0) +
    selectedBrands.length +
    (inStockOnly ? 1 : 0) +
    (minPrice > 0 || maxPrice < 5000 ? 1 : 0)
  );
</script>

<div class="space-y-4 p-4">
  <!-- Search Bar -->
  <div class="flex flex-wrap items-center gap-4">
    <div class="relative flex-1">
      <Input
        bind:value={searchQuery}
        placeholder="Search products by name, SKU, or description..."
        size="lg"
      >
        {#snippet left()}
          <SearchOutline class="h-5 w-5 text-gray-500" />
        {/snippet}
        {#snippet right()}
          {#if searchQuery}
            <button onclick={() => searchQuery = ""}>
              <CloseOutline class="h-4 w-4 text-gray-500 hover:text-gray-700" />
            </button>
          {/if}
        {/snippet}
      </Input>
    </div>
    <Button>Search</Button>
  </div>

  <!-- Quick Filters -->
  <div class="flex flex-wrap items-center gap-3">
    <Select items={categories} bind:value={selectedCategory} placeholder="Category" class="w-40" />
    <Select items={statuses} bind:value={selectedStatus} placeholder="Status" class="w-36" />

    <Button color="alternative" onclick={() => showAdvancedFilters = !showAdvancedFilters}>
      <FilterOutline class="me-2 h-4 w-4" />
      Filters
      {#if activeFilterCount > 0}
        <Badge class="ms-2">{activeFilterCount}</Badge>
      {/if}
    </Button>

    {#if activeFilterCount > 0}
      <button
        class="text-sm text-primary-600 hover:underline dark:text-primary-500"
        onclick={clearAllFilters}
      >
        Clear all filters
      </button>
    {/if}
  </div>

  <!-- Active Filter Tags -->
  {#if activeFilterCount > 0}
    <div class="flex flex-wrap gap-2">
      {#if selectedCategory}
        <Badge dismissable onclick={() => selectedCategory = ""}>
          Category: {categories.find(c => c.value === selectedCategory)?.name}
        </Badge>
      {/if}
      {#if selectedStatus}
        <Badge dismissable onclick={() => selectedStatus = ""}>
          Status: {statuses.find(s => s.value === selectedStatus)?.name}
        </Badge>
      {/if}
      {#each selectedBrands as brand}
        <Badge dismissable onclick={() => toggleBrand(brand)}>
          Brand: {brand}
        </Badge>
      {/each}
      {#if inStockOnly}
        <Badge dismissable onclick={() => inStockOnly = false}>
          In Stock Only
        </Badge>
      {/if}
      {#if minPrice > 0 || maxPrice < 5000}
        <Badge dismissable onclick={() => { minPrice = 0; maxPrice = 5000; }}>
          Price: ${minPrice} - ${maxPrice}
        </Badge>
      {/if}
    </div>
  {/if}

  <!-- Advanced Filters Panel -->
  {#if showAdvancedFilters}
    <Card class="p-4">
      <div class="mb-4 flex items-center justify-between">
        <h4 class="text-lg font-semibold text-gray-900 dark:text-white">Advanced Filters</h4>
        <button onclick={() => showAdvancedFilters = false}>
          <CloseOutline class="h-5 w-5 text-gray-500" />
        </button>
      </div>

      <div class="grid gap-6 md:grid-cols-3">
        <!-- Brands -->
        <div>
          <Label class="mb-2 block">Brands</Label>
          <div class="space-y-2">
            {#each brands as brand}
              <div class="flex items-center">
                <Checkbox
                  checked={selectedBrands.includes(brand)}
                  onchange={() => toggleBrand(brand)}
                />
                <span class="ms-2 text-sm text-gray-900 dark:text-white">{brand}</span>
              </div>
            {/each}
          </div>
        </div>

        <!-- Price Range -->
        <div>
          <Label class="mb-2 block">Price Range</Label>
          <div class="space-y-4">
            <div class="flex items-center gap-2">
              <Input type="number" bind:value={minPrice} placeholder="Min" size="sm" class="w-24" />
              <span class="text-gray-500">-</span>
              <Input type="number" bind:value={maxPrice} placeholder="Max" size="sm" class="w-24" />
            </div>
            <Range min={0} max={5000} bind:value={maxPrice} />
            <p class="text-sm text-gray-500 dark:text-gray-400">${minPrice} - ${maxPrice}</p>
          </div>
        </div>

        <!-- Additional Options -->
        <div>
          <Label class="mb-2 block">Options</Label>
          <div class="space-y-2">
            <div class="flex items-center">
              <Checkbox bind:checked={inStockOnly} />
              <span class="ms-2 text-sm text-gray-900 dark:text-white">In Stock Only</span>
            </div>
            <div class="flex items-center">
              <Checkbox />
              <span class="ms-2 text-sm text-gray-900 dark:text-white">On Sale</span>
            </div>
            <div class="flex items-center">
              <Checkbox />
              <span class="ms-2 text-sm text-gray-900 dark:text-white">Featured Products</span>
            </div>
          </div>
        </div>
      </div>

      <div class="mt-6 flex justify-end gap-2">
        <Button color="alternative" onclick={clearAllFilters}>Reset Filters</Button>
        <Button onclick={() => showAdvancedFilters = false}>Apply Filters</Button>
      </div>
    </Card>
  {/if}

  <!-- Results Info -->
  <div class="flex items-center justify-between rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
    <p class="text-sm text-gray-600 dark:text-gray-400">
      Showing <span class="font-semibold text-gray-900 dark:text-white">24</span> of <span class="font-semibold text-gray-900 dark:text-white">1,234</span> results
      {#if searchQuery}
        for "<span class="font-semibold">{searchQuery}</span>"
      {/if}
    </p>
    <div class="flex items-center gap-2">
      <span class="text-sm text-gray-500">Sort by:</span>
      <Button color="alternative" size="sm">
        Newest first
        <ChevronDownOutline class="ms-2 h-4 w-4" />
      </Button>
      <Dropdown>
        <DropdownItem>Newest first</DropdownItem>
        <DropdownItem>Oldest first</DropdownItem>
        <DropdownItem>Price: Low to High</DropdownItem>
        <DropdownItem>Price: High to Low</DropdownItem>
        <DropdownItem>Name: A-Z</DropdownItem>
        <DropdownItem>Name: Z-A</DropdownItem>
      </Dropdown>
    </div>
  </div>
</div>
