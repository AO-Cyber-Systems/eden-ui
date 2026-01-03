<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { CloseOutline } from "flowbite-svelte-icons";

  let isVisible = $state(true);
</script>

{#if isVisible}
  <div class="flex items-center gap-4 border-b border-gray-200 bg-gray-50 px-4 py-3 dark:border-gray-700 dark:bg-gray-800">
    <div class="flex flex-1 flex-wrap items-center justify-center gap-2 text-sm">
      <span class="font-medium text-gray-900 dark:text-white">
        🎉 New Feature Available!
      </span>
      <span class="text-gray-600 dark:text-gray-400">
        Check out our new analytics dashboard.
      </span>
      <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">
        Learn more →
      </a>
    </div>
    <button
      class="rounded-lg p-1.5 text-gray-400 hover:bg-gray-200 hover:text-gray-900 dark:hover:bg-gray-700 dark:hover:text-white"
      onclick={() => isVisible = false}
    >
      <CloseOutline class="h-4 w-4" />
    </button>
  </div>
{/if}
