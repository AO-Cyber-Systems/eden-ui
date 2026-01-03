<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { HomeOutline, ArrowLeftOutline } from "flowbite-svelte-icons";
</script>

<section class="flex min-h-screen items-center bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto max-w-screen-sm text-center">
      <div class="mb-8 flex justify-center">
        <svg class="h-32 w-32 text-red-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
        </svg>
      </div>
      <h1 class="mb-4 text-7xl font-extrabold tracking-tight text-red-600 lg:text-9xl">
        403
      </h1>
      <p class="mb-4 text-3xl font-bold tracking-tight text-gray-900 md:text-4xl dark:text-white">
        Access Forbidden
      </p>
      <p class="mb-8 text-lg font-light text-gray-500 dark:text-gray-400">
        You don't have permission to access this resource. Please contact the administrator if you believe this is an error.
      </p>
      <div class="flex justify-center gap-4">
        <Button color="light">
          <ArrowLeftOutline class="me-2 h-4 w-4" />
          Go back
        </Button>
        <Button href="/">
          <HomeOutline class="me-2 h-4 w-4" />
          Back to Homepage
        </Button>
      </div>
    </div>
  </div>
</section>
