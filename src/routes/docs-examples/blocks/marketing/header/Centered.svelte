<script lang="ts">
  import { Button } from "flowbite-svelte";

  let mobileMenuOpen = $state(false);
</script>

<header class="bg-white dark:bg-gray-900">
  <nav class="mx-auto flex max-w-screen-xl items-center justify-between px-4 py-4">
    <!-- Logo -->
    <a href="/" class="flex items-center gap-2">
      <svg class="h-8 w-8 text-primary-600" viewBox="0 0 24 24" fill="currentColor">
        <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" />
      </svg>
      <span class="text-xl font-bold text-gray-900 dark:text-white">Brand</span>
    </a>

    <!-- Desktop Navigation -->
    <div class="hidden items-center gap-8 md:flex">
      <a href="#" class="text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-primary-500">
        Features
      </a>
      <a href="#" class="text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-primary-500">
        Pricing
      </a>
      <a href="#" class="text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-primary-500">
        About
      </a>
      <a href="#" class="text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-primary-500">
        Blog
      </a>
      <a href="#" class="text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-primary-500">
        Contact
      </a>
    </div>

    <!-- CTA Buttons -->
    <div class="hidden items-center gap-3 md:flex">
      <Button color="alternative" size="sm">Log in</Button>
      <Button size="sm">Get started</Button>
    </div>

    <!-- Mobile Menu Button -->
    <button
      class="rounded-lg p-2 text-gray-500 hover:bg-gray-100 md:hidden dark:text-gray-400 dark:hover:bg-gray-700"
      onclick={() => mobileMenuOpen = !mobileMenuOpen}
    >
      <svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        {#if mobileMenuOpen}
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        {:else}
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
        {/if}
      </svg>
    </button>
  </nav>

  <!-- Mobile Menu -->
  {#if mobileMenuOpen}
    <div class="border-t border-gray-200 px-4 py-4 md:hidden dark:border-gray-700">
      <div class="flex flex-col gap-4">
        <a href="#" class="text-sm font-medium text-gray-700 dark:text-gray-300">Features</a>
        <a href="#" class="text-sm font-medium text-gray-700 dark:text-gray-300">Pricing</a>
        <a href="#" class="text-sm font-medium text-gray-700 dark:text-gray-300">About</a>
        <a href="#" class="text-sm font-medium text-gray-700 dark:text-gray-300">Blog</a>
        <a href="#" class="text-sm font-medium text-gray-700 dark:text-gray-300">Contact</a>
        <div class="flex flex-col gap-2 pt-4">
          <Button color="alternative" class="w-full">Log in</Button>
          <Button class="w-full">Get started</Button>
        </div>
      </div>
    </div>
  {/if}
</header>
