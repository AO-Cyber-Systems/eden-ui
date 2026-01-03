<script lang="ts">
  import { Button, Input, Avatar, Dropdown, DropdownItem, DropdownDivider } from "flowbite-svelte";
  import { SearchOutline, BellSolid, CogSolid, ArrowRightToBracketSolid } from "flowbite-svelte-icons";

  let searchQuery = $state("");
</script>

<header class="border-b border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-900">
  <div class="mx-auto flex max-w-screen-xl items-center justify-between px-4 py-3">
    <!-- Logo & Nav -->
    <div class="flex items-center gap-8">
      <a href="/" class="flex items-center gap-2">
        <svg class="h-8 w-8 text-primary-600" viewBox="0 0 24 24" fill="currentColor">
          <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" />
        </svg>
        <span class="text-xl font-bold text-gray-900 dark:text-white">Dashboard</span>
      </a>
      <nav class="hidden items-center gap-6 lg:flex">
        <a href="#" class="text-sm font-medium text-primary-600 dark:text-primary-500">Dashboard</a>
        <a href="#" class="text-sm font-medium text-gray-600 hover:text-primary-600 dark:text-gray-400 dark:hover:text-primary-500">Team</a>
        <a href="#" class="text-sm font-medium text-gray-600 hover:text-primary-600 dark:text-gray-400 dark:hover:text-primary-500">Projects</a>
        <a href="#" class="text-sm font-medium text-gray-600 hover:text-primary-600 dark:text-gray-400 dark:hover:text-primary-500">Reports</a>
      </nav>
    </div>

    <!-- Search & User -->
    <div class="flex items-center gap-4">
      <!-- Search -->
      <div class="hidden w-72 md:block">
        <Input
          type="search"
          placeholder="Search..."
          size="sm"
          bind:value={searchQuery}
        >
          {#snippet left()}
            <SearchOutline class="h-4 w-4 text-gray-500 dark:text-gray-400" />
          {/snippet}
        </Input>
      </div>

      <!-- Notifications -->
      <button class="relative rounded-lg p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
        <BellSolid class="h-5 w-5" />
        <span class="absolute right-1 top-1 flex h-2 w-2">
          <span class="absolute inline-flex h-full w-full animate-ping rounded-full bg-red-400 opacity-75"></span>
          <span class="relative inline-flex h-2 w-2 rounded-full bg-red-500"></span>
        </span>
      </button>

      <!-- User Menu -->
      <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" rounded class="cursor-pointer" />
      <Dropdown>
        <div class="px-4 py-3">
          <span class="block text-sm font-semibold text-gray-900 dark:text-white">Bonnie Green</span>
          <span class="block truncate text-sm text-gray-500 dark:text-gray-400">bonnie@company.com</span>
        </div>
        <DropdownDivider />
        <DropdownItem href="#">
          <CogSolid class="me-2 h-4 w-4" />
          Settings
        </DropdownItem>
        <DropdownItem href="#">
          <ArrowRightToBracketSolid class="me-2 h-4 w-4" />
          Sign out
        </DropdownItem>
      </Dropdown>
    </div>
  </div>
</header>
