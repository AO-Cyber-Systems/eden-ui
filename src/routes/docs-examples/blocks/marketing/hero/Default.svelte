<script lang="ts">
  import { Button, Badge } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 text-center lg:py-16">
    <Badge large class="mb-4">
      <span class="font-medium">New</span>
      <span class="ml-2">Flowbite is out! See what's new</span>
    </Badge>
    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
      We invest in the world's potential
    </h1>
    <p class="mb-8 text-lg font-normal text-gray-500 sm:px-16 lg:px-48 lg:text-xl dark:text-gray-400">
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
