<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto max-w-screen-sm text-center">
      <h2 class="mb-4 text-4xl font-extrabold leading-tight tracking-tight text-gray-900 dark:text-white">
        Start your free trial today
      </h2>
      <p class="mb-6 font-light text-gray-500 md:text-lg dark:text-gray-400">
        Try Flowbite Platform for 30 days. No credit card required.
      </p>
      <Button size="lg">
        Free trial for 30 days
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
    </div>
  </div>
</section>
