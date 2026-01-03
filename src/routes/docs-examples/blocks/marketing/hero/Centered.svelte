<script lang="ts">
  import { Button, Badge } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 text-center lg:py-16">
    <Badge large color="primary" class="mb-6 inline-flex items-center rounded-full px-4 py-1.5">
      <svg class="mr-2 h-3 w-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
        <path d="M10 0a10 10 0 1 0 10 10A10.011 10.011 0 0 0 10 0Zm3.982 13.982a1 1 0 0 1-1.414 0l-3.274-3.274A1.012 1.012 0 0 1 9 10V6a1 1 0 0 1 2 0v3.586l2.982 2.982a1 1 0 0 1 0 1.414Z" />
      </svg>
      <span class="text-sm font-medium">Launching soon - Join waitlist</span>
    </Badge>
    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
      Build products that matter
    </h1>
    <p class="mb-8 text-lg font-normal text-gray-500 sm:px-16 lg:px-48 lg:text-xl dark:text-gray-400">
      Focus on what you do best and let us handle the rest. Our platform provides everything you need to build, launch, and scale your business.
    </p>
    <div class="flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0 sm:space-x-4">
      <Button size="lg" class="px-8">
        Get early access
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
    </div>
    <p class="mt-6 text-sm text-gray-500 dark:text-gray-400">
      No credit card required. Cancel anytime.
    </p>
  </div>
</section>
