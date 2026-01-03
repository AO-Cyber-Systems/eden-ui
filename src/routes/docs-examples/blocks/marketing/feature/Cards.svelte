<script lang="ts">
  import { Card, Button } from "flowbite-svelte";
  import { ArrowRightOutline, CogOutline, ChartPieOutline, LockClosedOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mb-8 text-center lg:mb-16">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Our features
      </h2>
      <p class="text-gray-500 sm:text-xl dark:text-gray-400">
        Explore the whole collection of features that we offer.
      </p>
    </div>
    <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
      <Card class="flex flex-col items-start">
        <div class="mb-4 flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
          <CogOutline class="h-6 w-6 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">Customizable</h3>
        <p class="mb-4 flex-1 text-gray-500 dark:text-gray-400">
          Tailor the platform to your specific needs with extensive customization options.
        </p>
        <Button outline size="sm">
          Learn more
          <ArrowRightOutline class="ml-2 h-4 w-4" />
        </Button>
      </Card>
      <Card class="flex flex-col items-start">
        <div class="mb-4 flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
          <ChartPieOutline class="h-6 w-6 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">Analytics</h3>
        <p class="mb-4 flex-1 text-gray-500 dark:text-gray-400">
          Get detailed insights into your data with powerful analytics and reporting tools.
        </p>
        <Button outline size="sm">
          Learn more
          <ArrowRightOutline class="ml-2 h-4 w-4" />
        </Button>
      </Card>
      <Card class="flex flex-col items-start">
        <div class="mb-4 flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
          <LockClosedOutline class="h-6 w-6 text-primary-600 dark:text-primary-300" />
        </div>
        <h3 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">Security</h3>
        <p class="mb-4 flex-1 text-gray-500 dark:text-gray-400">
          Enterprise-grade security to protect your data and ensure compliance.
        </p>
        <Button outline size="sm">
          Learn more
          <ArrowRightOutline class="ml-2 h-4 w-4" />
        </Button>
      </Card>
    </div>
  </div>
</section>
