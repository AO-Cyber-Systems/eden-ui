<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { CheckCircleSolid, ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl items-center gap-8 px-4 py-8 sm:py-16 md:grid md:grid-cols-2 lg:px-6 xl:gap-16">
    <img class="w-full dark:hidden" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png" alt="dashboard image" />
    <img class="hidden w-full dark:block" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png" alt="dashboard image" />
    <div class="mt-4 md:mt-0">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Let's create more tools and ideas that brings us together.
      </h2>
      <p class="mb-6 font-light text-gray-500 md:text-lg dark:text-gray-400">
        Flowbite helps you connect with friends and communities of people who share your interests. Connecting with your friends and family as well as discovering new ones is easy with features like Groups.
      </p>
      <ul class="mb-6 space-y-4">
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="font-light text-gray-500 dark:text-gray-400">Continuous integration and deployment</span>
        </li>
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="font-light text-gray-500 dark:text-gray-400">Development workflow</span>
        </li>
        <li class="flex items-center space-x-3">
          <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
          <span class="font-light text-gray-500 dark:text-gray-400">Knowledge management</span>
        </li>
      </ul>
      <Button>
        Get started
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
    </div>
  </div>
</section>
