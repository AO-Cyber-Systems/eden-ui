<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { CloseOutline } from "flowbite-svelte-icons";

  let isVisible = $state(true);
</script>

{#if isVisible}
  <div class="fixed bottom-0 left-0 right-0 z-50 border-t border-gray-200 bg-white p-4 shadow-lg dark:border-gray-700 dark:bg-gray-900">
    <div class="mx-auto flex max-w-screen-xl flex-col items-center justify-between gap-4 sm:flex-row">
      <div class="flex items-center gap-4">
        <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
          <svg class="h-5 w-5 text-primary-600 dark:text-primary-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" />
          </svg>
        </div>
        <div>
          <p class="font-semibold text-gray-900 dark:text-white">
            Don't miss our Black Friday sale!
          </p>
          <p class="text-sm text-gray-500 dark:text-gray-400">
            Get 50% off all premium plans. Limited time offer.
          </p>
        </div>
      </div>
      <div class="flex items-center gap-3">
        <Button>Claim offer</Button>
        <Button color="alternative" onclick={() => isVisible = false}>Maybe later</Button>
      </div>
    </div>
  </div>
{/if}
