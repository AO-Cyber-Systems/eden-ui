<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="max-w-screen-lg">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Powering innovation at 200,000+ companies worldwide
      </h2>
      <p class="mb-8 text-gray-500 sm:text-xl dark:text-gray-400">
        Track work across the enterprise through an open, collaborative platform. Link issues across Jira and ingest data from other software development tools, so your IT support and operations teams have richer contextual information to rapidly respond to requests, incidents, and changes.
      </p>
      <div class="flex flex-col space-y-4 sm:flex-row sm:space-x-4 sm:space-y-0">
        <Button size="lg">
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
        <Button size="lg" outline>
          Learn more
        </Button>
      </div>
    </div>
  </div>
</section>
