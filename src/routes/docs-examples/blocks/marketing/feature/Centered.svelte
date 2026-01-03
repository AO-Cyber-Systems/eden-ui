<script lang="ts">
  import { CogOutline, ChartPieOutline, LockClosedOutline, RocketOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Designed for business teams
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Here at Flowbite we focus on markets where technology, innovation, and capital can unlock long-term value.
      </p>
    </div>
    <div class="grid gap-8 sm:grid-cols-2 lg:grid-cols-4">
      <div class="text-center">
        <div class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
          <CogOutline class="h-7 w-7 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold dark:text-white">Customizable</h3>
        <p class="text-gray-500 dark:text-gray-400">
          Configure to fit your workflow
        </p>
      </div>
      <div class="text-center">
        <div class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
          <ChartPieOutline class="h-7 w-7 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold dark:text-white">Analytics</h3>
        <p class="text-gray-500 dark:text-gray-400">
          Deep insights into your data
        </p>
      </div>
      <div class="text-center">
        <div class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
          <LockClosedOutline class="h-7 w-7 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold dark:text-white">Security</h3>
        <p class="text-gray-500 dark:text-gray-400">
          Enterprise-grade protection
        </p>
      </div>
      <div class="text-center">
        <div class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
          <RocketOutline class="h-7 w-7 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold dark:text-white">Fast</h3>
        <p class="text-gray-500 dark:text-gray-400">
          Optimized for performance
        </p>
      </div>
    </div>
  </div>
</section>
