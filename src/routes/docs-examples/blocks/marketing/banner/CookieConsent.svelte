<script lang="ts">
  import { Button } from "flowbite-svelte";

  let isVisible = $state(true);

  function acceptAll() {
    isVisible = false;
  }

  function rejectAll() {
    isVisible = false;
  }
</script>

{#if isVisible}
  <div class="fixed bottom-4 left-4 right-4 z-50 mx-auto max-w-2xl rounded-lg border border-gray-200 bg-white p-6 shadow-xl dark:border-gray-700 dark:bg-gray-800">
    <div class="mb-4 flex items-start gap-4">
      <div class="flex h-12 w-12 shrink-0 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-700">
        <svg class="h-6 w-6 text-gray-600 dark:text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
      </div>
      <div>
        <h3 class="mb-1 text-lg font-semibold text-gray-900 dark:text-white">
          We value your privacy
        </h3>
        <p class="text-sm text-gray-500 dark:text-gray-400">
          We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking "Accept All", you consent to our use of cookies.
          <a href="#" class="text-primary-600 hover:underline dark:text-primary-500">Read our Cookie Policy</a>
        </p>
      </div>
    </div>
    <div class="flex flex-col gap-3 sm:flex-row sm:justify-end">
      <Button color="alternative" onclick={rejectAll}>Reject all</Button>
      <Button color="light">Customize</Button>
      <Button onclick={acceptAll}>Accept all</Button>
    </div>
  </div>
{/if}
