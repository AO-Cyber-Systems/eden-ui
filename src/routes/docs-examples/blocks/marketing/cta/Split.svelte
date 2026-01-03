<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline, CheckCircleSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto grid max-w-screen-xl gap-8 px-4 py-8 lg:grid-cols-2 lg:gap-16 lg:py-16">
    <div class="flex flex-col justify-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 md:text-4xl dark:text-white">
        Start building with Flowbite today
      </h2>
      <p class="mb-6 text-gray-500 md:text-lg dark:text-gray-400">
        Get started with our most-loved features and build faster with the most advanced UI component library.
      </p>
      <ul class="mb-6 space-y-4 text-left">
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="text-gray-500 dark:text-gray-400">Individual configuration</span>
        </li>
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="text-gray-500 dark:text-gray-400">No setup, or hidden fees</span>
        </li>
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="text-gray-500 dark:text-gray-400">Team size: <span class="font-semibold text-gray-900 dark:text-white">1 developer</span></span>
        </li>
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="text-gray-500 dark:text-gray-400">Premium support: <span class="font-semibold text-gray-900 dark:text-white">6 months</span></span>
        </li>
      </ul>
      <div class="flex flex-wrap gap-4">
        <Button size="lg">
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
        <Button size="lg" color="alternative">
          View pricing
        </Button>
      </div>
    </div>
    <div class="flex items-center justify-center">
      <img class="rounded-lg shadow-xl" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/cta/cta-dashboard-mockup.svg" alt="dashboard mockup" />
    </div>
  </div>
</section>
