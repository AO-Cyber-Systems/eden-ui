<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-gradient-to-r from-primary-600 to-primary-800 dark:from-primary-800 dark:to-primary-900">
  <div class="mx-auto max-w-screen-xl px-4 py-16 text-center lg:py-24">
    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-white md:text-5xl lg:text-6xl">
      Build digital products faster
    </h1>
    <p class="mb-8 text-lg font-normal text-primary-100 sm:px-16 lg:px-48 lg:text-xl">
      The most popular and feature-rich component library for building modern web applications with Svelte.
    </p>
    <div class="flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0 sm:space-x-4">
      <Button size="lg" color="light">
        Get started
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
      <Button size="lg" outline color="light" class="border-white text-white hover:bg-white/10">
        Learn more
      </Button>
    </div>
    <div class="mt-12 flex items-center justify-center gap-8">
      <div class="text-center">
        <div class="text-3xl font-bold text-white">10K+</div>
        <div class="text-sm text-primary-200">Downloads</div>
      </div>
      <div class="h-12 w-px bg-primary-400"></div>
      <div class="text-center">
        <div class="text-3xl font-bold text-white">500+</div>
        <div class="text-sm text-primary-200">Components</div>
      </div>
      <div class="h-12 w-px bg-primary-400"></div>
      <div class="text-center">
        <div class="text-3xl font-bold text-white">99%</div>
        <div class="text-sm text-primary-200">Satisfaction</div>
      </div>
    </div>
  </div>
</section>
