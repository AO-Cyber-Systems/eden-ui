<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="relative bg-white dark:bg-gray-900">
  <div class="absolute inset-0 z-0 overflow-hidden">
    <video autoplay muted loop class="h-full w-full object-cover opacity-30 dark:opacity-20">
      <source src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/video.mp4" type="video/mp4" />
    </video>
    <div class="absolute inset-0 bg-gradient-to-t from-white via-white/80 to-white/60 dark:from-gray-900 dark:via-gray-900/80 dark:to-gray-900/60"></div>
  </div>
  <div class="relative z-10 mx-auto max-w-screen-xl px-4 py-24 text-center lg:py-32">
    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
      We invest in the world's potential
    </h1>
    <p class="mb-8 text-lg font-normal text-gray-600 sm:px-16 lg:px-48 lg:text-xl dark:text-gray-300">
      Here at Flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.
    </p>
    <div class="flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0 sm:space-x-4">
      <Button size="lg">
        Get started
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
      <Button size="lg" color="alternative">
        Learn more
      </Button>
    </div>
  </div>
</section>
