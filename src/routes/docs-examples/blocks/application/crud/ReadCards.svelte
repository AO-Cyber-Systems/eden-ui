<script lang="ts">
  import { Button, Card, Badge, Input, Select, Dropdown, DropdownItem } from "flowbite-svelte";
  import { SearchOutline, PlusOutline, GridOutline, ListOutline, ChevronDownOutline, PenOutline, TrashBinOutline, EyeOutline, DotsVerticalOutline } from "flowbite-svelte-icons";

  let searchQuery = $state("");
  let viewMode = $state<"grid" | "list">("grid");

  const products = [
    {
      id: 1,
      name: "Apple iMac 27&quot;",
      category: "Electronics",
      price: "$2,999",
      stock: 12,
      status: "In Stock",
      image: "https://flowbite.s3.amazonaws.com/blocks/e-commerce/imac-front.svg",
      rating: 4.8
    },
    {
      id: 2,
      name: "Apple MacBook Pro 16&quot;",
      category: "Electronics",
      price: "$1,999",
      stock: 8,
      status: "In Stock",
      image: "https://flowbite.s3.amazonaws.com/blocks/e-commerce/macbook-pro-dark.svg",
      rating: 4.9
    },
    {
      id: 3,
      name: "iPhone 15 Pro Max",
      category: "Electronics",
      price: "$1,199",
      stock: 0,
      status: "Out of Stock",
      image: "https://flowbite.s3.amazonaws.com/blocks/e-commerce/iphone-light.svg",
      rating: 4.7
    },
    {
      id: 4,
      name: "iPad Pro 12.9&quot;",
      category: "Electronics",
      price: "$1,099",
      stock: 15,
      status: "In Stock",
      image: "https://flowbite.s3.amazonaws.com/blocks/e-commerce/ipad-dark.svg",
      rating: 4.6
    },
    {
      id: 5,
      name: "Apple Watch Ultra",
      category: "Electronics",
      price: "$799",
      stock: 3,
      status: "Low Stock",
      image: "https://flowbite.s3.amazonaws.com/blocks/e-commerce/apple-watch-dark.svg",
      rating: 4.5
    },
    {
      id: 6,
      name: "AirPods Pro 2",
      category: "Electronics",
      price: "$249",
      stock: 45,
      status: "In Stock",
      image: "https://flowbite.s3.amazonaws.com/blocks/e-commerce/airpods-dark.svg",
      rating: 4.8
    }
  ];

  const statusColors: Record<string, "green" | "red" | "yellow"> = {
    "In Stock": "green",
    "Out of Stock": "red",
    "Low Stock": "yellow"
  };
</script>

<div class="p-4">
  <!-- Header -->
  <div class="mb-6 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
    <div class="flex flex-1 items-center gap-4">
      <div class="relative w-full max-w-xs">
        <Input bind:value={searchQuery} placeholder="Search products...">
          {#snippet left()}
            <SearchOutline class="h-5 w-5 text-gray-500" />
          {/snippet}
        </Input>
      </div>
      <Button color="alternative" size="sm">
        Category
        <ChevronDownOutline class="ms-2 h-4 w-4" />
      </Button>
      <Dropdown>
        <DropdownItem>All Categories</DropdownItem>
        <DropdownItem>Electronics</DropdownItem>
        <DropdownItem>Clothing</DropdownItem>
      </Dropdown>
    </div>
    <div class="flex items-center gap-2">
      <!-- View Toggle -->
      <div class="flex rounded-lg border border-gray-200 dark:border-gray-700">
        <button
          class="rounded-l-lg p-2 {viewMode === 'grid' ? 'bg-gray-100 dark:bg-gray-700' : ''}"
          onclick={() => viewMode = "grid"}
        >
          <GridOutline class="h-5 w-5 text-gray-500 dark:text-gray-400" />
        </button>
        <button
          class="rounded-r-lg p-2 {viewMode === 'list' ? 'bg-gray-100 dark:bg-gray-700' : ''}"
          onclick={() => viewMode = "list"}
        >
          <ListOutline class="h-5 w-5 text-gray-500 dark:text-gray-400" />
        </button>
      </div>
      <Button>
        <PlusOutline class="me-2 h-4 w-4" />
        Add Product
      </Button>
    </div>
  </div>

  <!-- Products Grid -->
  <div class={viewMode === "grid" ? "grid gap-4 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4" : "space-y-4"}>
    {#each products as product}
      {#if viewMode === "grid"}
        <Card class="relative p-4">
          <div class="absolute right-2 top-2">
            <Button size="xs" color="alternative" class="!p-1.5">
              <DotsVerticalOutline class="h-4 w-4" />
            </Button>
            <Dropdown>
              <DropdownItem><EyeOutline class="me-2 h-4 w-4" />View</DropdownItem>
              <DropdownItem><PenOutline class="me-2 h-4 w-4" />Edit</DropdownItem>
              <DropdownItem class="text-red-600"><TrashBinOutline class="me-2 h-4 w-4" />Delete</DropdownItem>
            </Dropdown>
          </div>
          <div class="mb-4 flex h-32 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-700">
            <img src={product.image} alt={product.name} class="h-24 w-24 object-contain" />
          </div>
          <Badge color={statusColors[product.status]} class="mb-2">{product.status}</Badge>
          <h3 class="mb-1 text-lg font-semibold text-gray-900 dark:text-white">{product.name}</h3>
          <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">{product.category}</p>
          <div class="flex items-center justify-between">
            <span class="text-xl font-bold text-gray-900 dark:text-white">{product.price}</span>
            <div class="flex items-center text-yellow-400">
              <svg class="h-4 w-4" fill="currentColor" viewBox="0 0 20 20">
                <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
              </svg>
              <span class="ms-1 text-sm text-gray-600 dark:text-gray-400">{product.rating}</span>
            </div>
          </div>
        </Card>
      {:else}
        <Card class="p-4">
          <div class="flex items-center gap-4">
            <div class="flex h-20 w-20 flex-shrink-0 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-700">
              <img src={product.image} alt={product.name} class="h-14 w-14 object-contain" />
            </div>
            <div class="flex-1">
              <div class="flex items-start justify-between">
                <div>
                  <h3 class="text-lg font-semibold text-gray-900 dark:text-white">{product.name}</h3>
                  <p class="text-sm text-gray-500 dark:text-gray-400">{product.category}</p>
                </div>
                <Badge color={statusColors[product.status]}>{product.status}</Badge>
              </div>
              <div class="mt-2 flex items-center justify-between">
                <span class="text-xl font-bold text-gray-900 dark:text-white">{product.price}</span>
                <div class="flex gap-2">
                  <Button size="xs" color="alternative"><EyeOutline class="h-4 w-4" /></Button>
                  <Button size="xs" color="alternative"><PenOutline class="h-4 w-4" /></Button>
                  <Button size="xs" color="red"><TrashBinOutline class="h-4 w-4" /></Button>
                </div>
              </div>
            </div>
          </div>
        </Card>
      {/if}
    {/each}
  </div>

  <!-- Load More -->
  <div class="mt-6 text-center">
    <Button color="alternative">Load More Products</Button>
  </div>
</div>
