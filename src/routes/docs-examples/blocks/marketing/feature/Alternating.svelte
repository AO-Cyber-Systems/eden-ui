<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline, CheckCircleSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <!-- Feature 1 -->
    <div class="mb-16 items-center gap-8 lg:grid lg:grid-cols-2 xl:gap-16">
      <img class="mb-4 w-full rounded-lg lg:mb-0" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/features/feature-office-1.png" alt="feature image" />
      <div class="text-gray-500 sm:text-lg dark:text-gray-400">
        <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Work with tools you already use
        </h2>
        <p class="mb-8 font-light lg:text-xl">
          Deliver great service experiences fast - without the complexity of traditional ITSM solutions. Accelerate critical development work, eliminate toil, and deploy changes with ease.
        </p>
        <ul class="my-7 space-y-5 border-t border-gray-200 pt-8 dark:border-gray-700">
          <li class="flex space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-primary-600 dark:text-primary-500" />
            <span class="text-base font-medium leading-tight text-gray-900 dark:text-white">Continuous integration and deployment</span>
          </li>
          <li class="flex space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-primary-600 dark:text-primary-500" />
            <span class="text-base font-medium leading-tight text-gray-900 dark:text-white">Development workflow</span>
          </li>
          <li class="flex space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-primary-600 dark:text-primary-500" />
            <span class="text-base font-medium leading-tight text-gray-900 dark:text-white">Knowledge management</span>
          </li>
        </ul>
        <Button>
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
      </div>
    </div>
    <!-- Feature 2 (Reversed) -->
    <div class="items-center gap-8 lg:grid lg:grid-cols-2 xl:gap-16">
      <div class="text-gray-500 sm:text-lg dark:text-gray-400">
        <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          We invest in the world's potential
        </h2>
        <p class="mb-8 font-light lg:text-xl">
          Deliver great service experiences fast - without the complexity of traditional ITSM solutions. Accelerate critical development work, eliminate toil.
        </p>
        <ul class="my-7 space-y-5 border-t border-gray-200 pt-8 dark:border-gray-700">
          <li class="flex space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-primary-600 dark:text-primary-500" />
            <span class="text-base font-medium leading-tight text-gray-900 dark:text-white">Dynamic reports and dashboards</span>
          </li>
          <li class="flex space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-primary-600 dark:text-primary-500" />
            <span class="text-base font-medium leading-tight text-gray-900 dark:text-white">Templates for everyone</span>
          </li>
          <li class="flex space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-primary-600 dark:text-primary-500" />
            <span class="text-base font-medium leading-tight text-gray-900 dark:text-white">Development workflow</span>
          </li>
        </ul>
        <Button>
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
      </div>
      <img class="mb-4 mt-8 w-full rounded-lg lg:mb-0 lg:mt-0" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/features/feature-office-2.png" alt="feature image 2" />
    </div>
  </div>
</section>
