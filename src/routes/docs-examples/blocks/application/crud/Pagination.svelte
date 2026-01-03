<script lang="ts">
  import { Button, Select, Card } from "flowbite-svelte";
  import { ChevronLeftOutline, ChevronRightOutline, ChevronDoubleLeftOutline, ChevronDoubleRightOutline } from "flowbite-svelte-icons";

  let currentPage = $state(1);
  let itemsPerPage = $state("10");
  const totalItems = 1234;

  const itemsPerPageOptions = [
    { value: "10", name: "10 per page" },
    { value: "25", name: "25 per page" },
    { value: "50", name: "50 per page" },
    { value: "100", name: "100 per page" }
  ];

  const totalPages = $derived(Math.ceil(totalItems / parseInt(itemsPerPage)));
  const startItem = $derived((currentPage - 1) * parseInt(itemsPerPage) + 1);
  const endItem = $derived(Math.min(currentPage * parseInt(itemsPerPage), totalItems));

  function goToPage(page: number) {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
    }
  }

  const visiblePages = $derived(() => {
    const pages: (number | string)[] = [];
    const maxVisible = 5;

    if (totalPages <= maxVisible + 2) {
      for (let i = 1; i <= totalPages; i++) {
        pages.push(i);
      }
    } else {
      pages.push(1);

      if (currentPage > 3) {
        pages.push("...");
      }

      const start = Math.max(2, currentPage - 1);
      const end = Math.min(totalPages - 1, currentPage + 1);

      for (let i = start; i <= end; i++) {
        pages.push(i);
      }

      if (currentPage < totalPages - 2) {
        pages.push("...");
      }

      pages.push(totalPages);
    }

    return pages;
  });
</script>

<div class="space-y-8 p-4">
  <!-- Style 1: Simple Pagination -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Simple Pagination</h3>
    <div class="flex items-center justify-between">
      <span class="text-sm text-gray-700 dark:text-gray-400">
        Showing <span class="font-semibold text-gray-900 dark:text-white">{startItem}-{endItem}</span> of
        <span class="font-semibold text-gray-900 dark:text-white">{totalItems.toLocaleString()}</span>
      </span>
      <div class="flex gap-2">
        <Button
          color="alternative"
          size="sm"
          disabled={currentPage === 1}
          onclick={() => goToPage(currentPage - 1)}
        >
          Previous
        </Button>
        <Button
          color="alternative"
          size="sm"
          disabled={currentPage === totalPages}
          onclick={() => goToPage(currentPage + 1)}
        >
          Next
        </Button>
      </div>
    </div>
  </Card>

  <!-- Style 2: Numbered Pagination -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Numbered Pagination</h3>
    <div class="flex items-center justify-center gap-1">
      <Button
        color="alternative"
        size="sm"
        disabled={currentPage === 1}
        onclick={() => goToPage(currentPage - 1)}
        class="!p-2"
      >
        <ChevronLeftOutline class="h-4 w-4" />
      </Button>

      {#each visiblePages() as page}
        {#if page === "..."}
          <span class="px-3 py-2 text-gray-500">...</span>
        {:else}
          <Button
            color={currentPage === page ? "primary" : "alternative"}
            size="sm"
            onclick={() => goToPage(page as number)}
            class="min-w-[40px]"
          >
            {page}
          </Button>
        {/if}
      {/each}

      <Button
        color="alternative"
        size="sm"
        disabled={currentPage === totalPages}
        onclick={() => goToPage(currentPage + 1)}
        class="!p-2"
      >
        <ChevronRightOutline class="h-4 w-4" />
      </Button>
    </div>
  </Card>

  <!-- Style 3: Full Featured Pagination -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Full Featured Pagination</h3>
    <div class="flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
      <!-- Items per page -->
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-500 dark:text-gray-400">Show</span>
        <Select items={itemsPerPageOptions} bind:value={itemsPerPage} size="sm" class="w-32" />
      </div>

      <!-- Page info -->
      <span class="text-sm text-gray-700 dark:text-gray-400">
        Showing <span class="font-semibold text-gray-900 dark:text-white">{startItem}</span> to
        <span class="font-semibold text-gray-900 dark:text-white">{endItem}</span> of
        <span class="font-semibold text-gray-900 dark:text-white">{totalItems.toLocaleString()}</span> results
      </span>

      <!-- Navigation -->
      <div class="flex items-center gap-1">
        <Button
          color="alternative"
          size="sm"
          disabled={currentPage === 1}
          onclick={() => goToPage(1)}
          class="!p-2"
        >
          <ChevronDoubleLeftOutline class="h-4 w-4" />
        </Button>
        <Button
          color="alternative"
          size="sm"
          disabled={currentPage === 1}
          onclick={() => goToPage(currentPage - 1)}
          class="!p-2"
        >
          <ChevronLeftOutline class="h-4 w-4" />
        </Button>

        <div class="flex items-center gap-1 px-2">
          <span class="text-sm text-gray-500">Page</span>
          <input
            type="number"
            value={currentPage}
            onchange={(e) => goToPage(parseInt((e.target as HTMLInputElement).value))}
            min="1"
            max={totalPages}
            class="w-12 rounded border border-gray-300 px-2 py-1 text-center text-sm dark:border-gray-600 dark:bg-gray-700"
          />
          <span class="text-sm text-gray-500">of {totalPages}</span>
        </div>

        <Button
          color="alternative"
          size="sm"
          disabled={currentPage === totalPages}
          onclick={() => goToPage(currentPage + 1)}
          class="!p-2"
        >
          <ChevronRightOutline class="h-4 w-4" />
        </Button>
        <Button
          color="alternative"
          size="sm"
          disabled={currentPage === totalPages}
          onclick={() => goToPage(totalPages)}
          class="!p-2"
        >
          <ChevronDoubleRightOutline class="h-4 w-4" />
        </Button>
      </div>
    </div>
  </Card>

  <!-- Style 4: Load More -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Load More Style</h3>
    <div class="text-center">
      <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
        Showing 24 of 1,234 products
      </p>
      <div class="mb-4 h-2 w-full rounded-full bg-gray-200 dark:bg-gray-700">
        <div class="h-2 rounded-full bg-primary-600" style="width: 2%"></div>
      </div>
      <Button color="alternative">
        Load More Products
      </Button>
    </div>
  </Card>
</div>
