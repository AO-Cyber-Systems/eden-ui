<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="text-center">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Trusted by developers worldwide
      </h2>
      <p class="mb-8 text-lg text-gray-500 dark:text-gray-400">
        Join thousands of developers who are building with Flowbite
      </p>
    </div>
    <div class="mb-12 grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
      <div class="text-center">
        <div class="text-4xl font-extrabold text-primary-600 dark:text-primary-500">73M+</div>
        <p class="mt-2 text-gray-500 dark:text-gray-400">Developers</p>
      </div>
      <div class="text-center">
        <div class="text-4xl font-extrabold text-primary-600 dark:text-primary-500">100M+</div>
        <p class="mt-2 text-gray-500 dark:text-gray-400">Public repositories</p>
      </div>
      <div class="text-center">
        <div class="text-4xl font-extrabold text-primary-600 dark:text-primary-500">1000+</div>
        <p class="mt-2 text-gray-500 dark:text-gray-400">Components</p>
      </div>
      <div class="text-center">
        <div class="text-4xl font-extrabold text-primary-600 dark:text-primary-500">99.9%</div>
        <p class="mt-2 text-gray-500 dark:text-gray-400">Uptime</p>
      </div>
    </div>
    <div class="flex justify-center">
      <Button size="lg">
        Start building
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
    </div>
  </div>
</section>
