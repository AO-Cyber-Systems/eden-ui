<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl gap-16 px-4 py-8 sm:py-16 lg:grid lg:grid-cols-2 lg:px-6">
    <div>
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 md:text-4xl dark:text-white">
        We're not just another agency. We're partners in your success.
      </h2>
      <p class="mb-4 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        We believe in transparency, collaboration, and delivering results that matter. Our approach combines strategic thinking with creative excellence.
      </p>
      <p class="mb-4 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Every project is a partnership. We work closely with you to understand your goals, challenges, and vision for success.
      </p>
      <Button>
        Get in touch
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
    </div>
    <div class="mt-8 lg:mt-0">
      <h3 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">Our Values</h3>
      <div class="space-y-6">
        <div class="border-l-4 border-primary-500 pl-4">
          <h4 class="mb-1 font-semibold text-gray-900 dark:text-white">Transparency</h4>
          <p class="text-gray-500 dark:text-gray-400">
            Clear communication and honest feedback are the foundation of our relationships.
          </p>
        </div>
        <div class="border-l-4 border-primary-500 pl-4">
          <h4 class="mb-1 font-semibold text-gray-900 dark:text-white">Excellence</h4>
          <p class="text-gray-500 dark:text-gray-400">
            We hold ourselves to the highest standards in everything we do.
          </p>
        </div>
        <div class="border-l-4 border-primary-500 pl-4">
          <h4 class="mb-1 font-semibold text-gray-900 dark:text-white">Innovation</h4>
          <p class="text-gray-500 dark:text-gray-400">
            We constantly push boundaries and explore new ways to solve problems.
          </p>
        </div>
        <div class="border-l-4 border-primary-500 pl-4">
          <h4 class="mb-1 font-semibold text-gray-900 dark:text-white">Partnership</h4>
          <p class="text-gray-500 dark:text-gray-400">
            Your success is our success. We're invested in your outcomes.
          </p>
        </div>
      </div>
    </div>
  </div>
</section>
