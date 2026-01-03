<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16">
    <div class="flex flex-col items-center justify-between gap-8 sm:flex-row">
      <div>
        <h2 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
          Ready to get started?
        </h2>
        <p class="text-gray-500 dark:text-gray-400">
          Start your free trial today. No credit card required.
        </p>
      </div>
      <div class="flex flex-shrink-0 gap-4">
        <Button size="lg">
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
        <Button size="lg" color="alternative">
          Contact sales
        </Button>
      </div>
    </div>
  </div>
</section>
