<script lang="ts">
  import { Button, Input } from "flowbite-svelte";
  import { HomeOutline, SearchOutline } from "flowbite-svelte-icons";

  let searchQuery = $state("");
</script>

<section class="flex min-h-screen items-center bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="grid items-center gap-8 lg:grid-cols-2">
      <!-- Illustration -->
      <div class="order-2 lg:order-1">
        <svg class="mx-auto h-64 w-full max-w-md text-gray-200 dark:text-gray-700" viewBox="0 0 400 300" fill="none">
          <!-- Browser window -->
          <rect x="50" y="30" width="300" height="200" rx="10" fill="currentColor" />
          <rect x="50" y="30" width="300" height="30" rx="10" fill="#E5E7EB" class="dark:fill-gray-600" />
          <circle cx="75" cy="45" r="6" fill="#EF4444" />
          <circle cx="95" cy="45" r="6" fill="#F59E0B" />
          <circle cx="115" cy="45" r="6" fill="#10B981" />

          <!-- 404 text -->
          <text x="200" y="150" font-size="48" font-weight="bold" fill="#6B7280" text-anchor="middle">404</text>
          <text x="200" y="180" font-size="14" fill="#9CA3AF" text-anchor="middle">Page not found</text>

          <!-- Decorative elements -->
          <circle cx="100" cy="250" r="20" fill="#E5E7EB" class="dark:fill-gray-700" />
          <circle cx="320" cy="80" r="15" fill="#E5E7EB" class="dark:fill-gray-700" />
          <rect x="300" y="240" width="40" height="40" rx="8" fill="#E5E7EB" class="dark:fill-gray-700" />
        </svg>
      </div>

      <!-- Content -->
      <div class="order-1 text-center lg:order-2 lg:text-left">
        <p class="mb-2 text-sm font-medium uppercase tracking-wider text-primary-600 dark:text-primary-500">
          404 Error
        </p>
        <h1 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 md:text-5xl dark:text-white">
          Page not found
        </h1>
        <p class="mb-8 text-lg text-gray-500 dark:text-gray-400">
          Oops! The page you are looking for doesn't exist or has been moved. Try searching for what you need or go back to the homepage.
        </p>

        <!-- Search -->
        <form class="mb-6 flex gap-2">
          <div class="relative flex-1">
            <Input
              type="search"
              placeholder="Search our site..."
              bind:value={searchQuery}
              class="pl-10"
            >
              {#snippet left()}
                <SearchOutline class="h-5 w-5 text-gray-500 dark:text-gray-400" />
              {/snippet}
            </Input>
          </div>
          <Button type="submit">Search</Button>
        </form>

        <div class="flex flex-col gap-4 sm:flex-row sm:justify-center lg:justify-start">
          <Button href="/">
            <HomeOutline class="me-2 h-4 w-4" />
            Back to Homepage
          </Button>
          <Button color="alternative" href="#">
            Contact Support
          </Button>
        </div>

        <!-- Helpful links -->
        <div class="mt-8 border-t border-gray-200 pt-8 dark:border-gray-700">
          <p class="mb-4 text-sm font-medium text-gray-900 dark:text-white">
            Popular pages:
          </p>
          <div class="flex flex-wrap justify-center gap-4 lg:justify-start">
            <a href="#" class="text-sm text-primary-600 hover:underline dark:text-primary-500">Documentation</a>
            <a href="#" class="text-sm text-primary-600 hover:underline dark:text-primary-500">Pricing</a>
            <a href="#" class="text-sm text-primary-600 hover:underline dark:text-primary-500">Blog</a>
            <a href="#" class="text-sm text-primary-600 hover:underline dark:text-primary-500">Support</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
