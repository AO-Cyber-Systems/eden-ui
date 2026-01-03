<script lang="ts">
  import { Button, Card } from "flowbite-svelte";
  import { PlusOutline, SearchOutline, FolderOpenOutline, FilterOutline, CloudArrowUpOutline, ExclamationCircleOutline } from "flowbite-svelte-icons";
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- No Results Found -->
  <Card class="p-8 text-center">
    <div class="mb-4 flex justify-center">
      <div class="rounded-full bg-gray-100 p-4 dark:bg-gray-800">
        <SearchOutline class="h-8 w-8 text-gray-400" />
      </div>
    </div>
    <h3 class="mb-2 text-lg font-semibold text-gray-900 dark:text-white">No results found</h3>
    <p class="mb-4 text-gray-500 dark:text-gray-400">
      We couldn't find any products matching "wireless headphones". Try adjusting your search or filters.
    </p>
    <div class="flex justify-center gap-2">
      <Button color="alternative">Clear Search</Button>
      <Button color="alternative">Remove Filters</Button>
    </div>
  </Card>

  <!-- Empty List -->
  <Card class="p-8 text-center">
    <div class="mb-4 flex justify-center">
      <div class="rounded-full bg-primary-100 p-4 dark:bg-primary-900">
        <FolderOpenOutline class="h-8 w-8 text-primary-600 dark:text-primary-400" />
      </div>
    </div>
    <h3 class="mb-2 text-lg font-semibold text-gray-900 dark:text-white">No products yet</h3>
    <p class="mb-4 text-gray-500 dark:text-gray-400">
      Get started by adding your first product to the catalog.
    </p>
    <Button>
      <PlusOutline class="me-2 h-4 w-4" />
      Add First Product
    </Button>
  </Card>

  <!-- Filtered Empty State -->
  <Card class="p-8 text-center">
    <div class="mb-4 flex justify-center">
      <div class="rounded-full bg-amber-100 p-4 dark:bg-amber-900">
        <FilterOutline class="h-8 w-8 text-amber-600 dark:text-amber-400" />
      </div>
    </div>
    <h3 class="mb-2 text-lg font-semibold text-gray-900 dark:text-white">No matching products</h3>
    <p class="mb-4 text-gray-500 dark:text-gray-400">
      No products match the current filter criteria. Try adjusting your filters or create a new product.
    </p>
    <div class="flex justify-center gap-2">
      <Button color="alternative">
        <FilterOutline class="me-2 h-4 w-4" />
        Clear Filters
      </Button>
      <Button>
        <PlusOutline class="me-2 h-4 w-4" />
        Add Product
      </Button>
    </div>
  </Card>

  <!-- Upload Empty State -->
  <Card class="p-8 text-center">
    <div class="mb-4 flex justify-center">
      <div class="rounded-full bg-blue-100 p-4 dark:bg-blue-900">
        <CloudArrowUpOutline class="h-8 w-8 text-blue-600 dark:text-blue-400" />
      </div>
    </div>
    <h3 class="mb-2 text-lg font-semibold text-gray-900 dark:text-white">No files uploaded</h3>
    <p class="mb-4 text-gray-500 dark:text-gray-400">
      Upload product images, documents, or other files to get started.
    </p>
    <Button>
      <CloudArrowUpOutline class="me-2 h-4 w-4" />
      Upload Files
    </Button>
  </Card>

  <!-- Error State -->
  <Card class="p-8 text-center">
    <div class="mb-4 flex justify-center">
      <div class="rounded-full bg-red-100 p-4 dark:bg-red-900">
        <ExclamationCircleOutline class="h-8 w-8 text-red-600 dark:text-red-400" />
      </div>
    </div>
    <h3 class="mb-2 text-lg font-semibold text-gray-900 dark:text-white">Failed to load products</h3>
    <p class="mb-4 text-gray-500 dark:text-gray-400">
      There was an error loading the product list. Please try again or contact support if the problem persists.
    </p>
    <div class="flex justify-center gap-2">
      <Button color="alternative">Contact Support</Button>
      <Button>Try Again</Button>
    </div>
  </Card>

  <!-- Empty with Illustration -->
  <Card class="p-8 text-center lg:col-span-2">
    <div class="mb-6 flex justify-center">
      <svg class="h-40 w-40 text-gray-200 dark:text-gray-700" viewBox="0 0 200 200" fill="none">
        <!-- Box illustration -->
        <rect x="40" y="60" width="120" height="100" rx="4" fill="currentColor" />
        <path d="M40 80 L100 40 L160 80" stroke="currentColor" stroke-width="4" fill="none" />
        <path d="M100 40 L100 80" stroke="currentColor" stroke-width="4" />
        <rect x="70" y="100" width="60" height="30" rx="2" fill="white" opacity="0.3" />
        <!-- Sparkles -->
        <circle cx="30" cy="50" r="4" fill="#FCD34D" />
        <circle cx="170" cy="40" r="3" fill="#FCD34D" />
        <circle cx="180" cy="100" r="5" fill="#FCD34D" />
      </svg>
    </div>
    <h3 class="mb-2 text-xl font-semibold text-gray-900 dark:text-white">Your inventory is empty</h3>
    <p class="mx-auto mb-6 max-w-md text-gray-500 dark:text-gray-400">
      Start building your product catalog by adding items manually or importing from a file. We support CSV, Excel, and JSON formats.
    </p>
    <div class="flex flex-wrap justify-center gap-3">
      <Button>
        <PlusOutline class="me-2 h-4 w-4" />
        Add Product
      </Button>
      <Button color="alternative">
        <CloudArrowUpOutline class="me-2 h-4 w-4" />
        Import Products
      </Button>
      <Button color="alternative">View Documentation</Button>
    </div>
  </Card>
</div>
