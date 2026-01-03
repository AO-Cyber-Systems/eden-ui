<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { HomeOutline, ArrowLeftOutline } from "flowbite-svelte-icons";
</script>

<section class="flex min-h-screen items-center bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto max-w-screen-sm text-center">
      <h1 class="mb-4 text-7xl font-extrabold tracking-tight text-primary-600 lg:text-9xl dark:text-primary-500">
        404
      </h1>
      <p class="mb-4 text-3xl font-bold tracking-tight text-gray-900 md:text-4xl dark:text-white">
        Something's missing.
      </p>
      <p class="mb-8 text-lg font-light text-gray-500 dark:text-gray-400">
        Sorry, we can't find that page. You'll find lots to explore on the home page.
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
