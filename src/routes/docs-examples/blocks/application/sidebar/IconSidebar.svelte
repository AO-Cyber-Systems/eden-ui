<script lang="ts">
  import { Button, Tooltip } from "flowbite-svelte";
  import { HomeOutline, ChartPieOutline, InboxOutline, UsersOutline, ShoppingBagOutline, CogOutline, QuestionCircleOutline, ArrowRightToBracketOutline, BellOutline, MagnifyingGlassOutline, CalendarMonthOutline, FolderOutline, ChatBubbleLeftRightOutline, HeartOutline, StarOutline, ClockOutline, BarsOutline, PlusOutline } from "flowbite-svelte-icons";

  let activeItem = $state("home");
  let isExpanded = $state(false);

  const mainNavItems = [
    { id: "home", icon: HomeOutline, label: "Home" },
    { id: "analytics", icon: ChartPieOutline, label: "Analytics" },
    { id: "inbox", icon: InboxOutline, label: "Inbox", badge: 3 },
    { id: "calendar", icon: CalendarMonthOutline, label: "Calendar" },
    { id: "files", icon: FolderOutline, label: "Files" }
  ];

  const bottomNavItems = [
    { id: "settings", icon: CogOutline, label: "Settings" },
    { id: "help", icon: QuestionCircleOutline, label: "Help" }
  ];
</script>

<div class="flex gap-8 p-4">
  <!-- Icon-only Sidebar -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Icon Only</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Compact navigation</p>
    </div>

    <div class="flex h-[500px] w-16 flex-col items-center justify-between rounded-lg bg-gray-900 py-4">
      <!-- Logo -->
      <div class="flex flex-col items-center gap-4">
        <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-primary-600 text-white">
          <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
            <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
          </svg>
        </div>

        <!-- Main Navigation -->
        <nav class="flex flex-col gap-2">
          {#each mainNavItems as item}
            <button
              class="relative flex h-10 w-10 items-center justify-center rounded-lg transition-colors {activeItem === item.id ? 'bg-gray-700 text-white' : 'text-gray-400 hover:bg-gray-800 hover:text-white'}"
              onclick={() => activeItem = item.id}
            >
              <svelte:component this={item.icon} class="h-5 w-5" />
              {#if item.badge}
                <span class="absolute -right-1 -top-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-[10px] font-medium text-white">
                  {item.badge}
                </span>
              {/if}
            </button>
            <Tooltip placement="right">{item.label}</Tooltip>
          {/each}
        </nav>
      </div>

      <!-- Bottom Navigation -->
      <nav class="flex flex-col gap-2">
        {#each bottomNavItems as item}
          <button
            class="flex h-10 w-10 items-center justify-center rounded-lg text-gray-400 transition-colors hover:bg-gray-800 hover:text-white"
          >
            <svelte:component this={item.icon} class="h-5 w-5" />
          </button>
          <Tooltip placement="right">{item.label}</Tooltip>
        {/each}
        <!-- User Avatar -->
        <button class="mt-2 flex h-10 w-10 items-center justify-center rounded-full bg-gray-700 text-sm font-medium text-white">
          NS
        </button>
        <Tooltip placement="right">Neil Sims</Tooltip>
      </nav>
    </div>
  </div>

  <!-- Expandable Icon Sidebar -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Expandable</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Hover or click to expand</p>
    </div>

    <div
      class="flex h-[500px] flex-col justify-between rounded-lg bg-gray-50 py-4 transition-all duration-300 dark:bg-gray-800 {isExpanded ? 'w-56 px-3' : 'w-16 items-center'}"
      onmouseenter={() => isExpanded = true}
      onmouseleave={() => isExpanded = false}
    >
      <div class="flex flex-col gap-2">
        <!-- Toggle Button -->
        <button
          class="mb-2 flex h-10 w-10 items-center justify-center self-center rounded-lg text-gray-500 hover:bg-gray-200 dark:text-gray-400 dark:hover:bg-gray-700"
          onclick={() => isExpanded = !isExpanded}
        >
          <BarsOutline class="h-5 w-5" />
        </button>

        <!-- Navigation -->
        {#each mainNavItems as item}
          <button
            class="flex items-center gap-3 rounded-lg p-2.5 transition-colors {activeItem === item.id ? 'bg-primary-100 text-primary-700 dark:bg-primary-900/30 dark:text-primary-300' : 'text-gray-700 hover:bg-gray-200 dark:text-gray-300 dark:hover:bg-gray-700'} {isExpanded ? '' : 'justify-center'}"
            onclick={() => activeItem = item.id}
          >
            <svelte:component this={item.icon} class="h-5 w-5 flex-shrink-0" />
            {#if isExpanded}
              <span class="whitespace-nowrap text-sm font-medium">{item.label}</span>
              {#if item.badge}
                <span class="ml-auto flex h-5 w-5 items-center justify-center rounded-full bg-red-100 text-xs font-medium text-red-800 dark:bg-red-900 dark:text-red-200">
                  {item.badge}
                </span>
              {/if}
            {/if}
          </button>
        {/each}
      </div>

      <!-- Bottom Section -->
      <div class="flex flex-col gap-2">
        {#each bottomNavItems as item}
          <button
            class="flex items-center gap-3 rounded-lg p-2.5 text-gray-700 transition-colors hover:bg-gray-200 dark:text-gray-300 dark:hover:bg-gray-700 {isExpanded ? '' : 'justify-center'}"
          >
            <svelte:component this={item.icon} class="h-5 w-5 flex-shrink-0" />
            {#if isExpanded}
              <span class="whitespace-nowrap text-sm font-medium">{item.label}</span>
            {/if}
          </button>
        {/each}
      </div>
    </div>
  </div>

  <!-- Dock-style Sidebar -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Dock Style</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">macOS-inspired dock</p>
    </div>

    <div class="flex h-[500px] w-16 flex-col items-center justify-center rounded-2xl bg-white/80 py-4 shadow-lg backdrop-blur-sm dark:bg-gray-800/80">
      <nav class="flex flex-col gap-3">
        {#each mainNavItems as item}
          <button
            class="group relative flex h-11 w-11 items-center justify-center rounded-xl transition-all duration-200 {activeItem === item.id ? 'bg-primary-100 text-primary-600 shadow-md dark:bg-primary-900/50 dark:text-primary-400' : 'text-gray-500 hover:scale-110 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700'}"
            onclick={() => activeItem = item.id}
          >
            <svelte:component this={item.icon} class="h-5 w-5" />
            {#if item.badge}
              <span class="absolute -right-1 -top-1 flex h-4 w-4 items-center justify-center rounded-full bg-red-500 text-[10px] font-bold text-white shadow">
                {item.badge}
              </span>
            {/if}

            <!-- Tooltip on hover -->
            <span class="pointer-events-none absolute left-full ml-3 whitespace-nowrap rounded-lg bg-gray-900 px-2 py-1 text-xs text-white opacity-0 shadow-lg transition-opacity group-hover:opacity-100 dark:bg-gray-700">
              {item.label}
            </span>
          </button>
        {/each}

        <div class="my-2 h-px w-8 bg-gray-200 dark:bg-gray-700"></div>

        {#each bottomNavItems as item}
          <button
            class="group relative flex h-11 w-11 items-center justify-center rounded-xl text-gray-500 transition-all duration-200 hover:scale-110 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
          >
            <svelte:component this={item.icon} class="h-5 w-5" />
            <span class="pointer-events-none absolute left-full ml-3 whitespace-nowrap rounded-lg bg-gray-900 px-2 py-1 text-xs text-white opacity-0 shadow-lg transition-opacity group-hover:opacity-100 dark:bg-gray-700">
              {item.label}
            </span>
          </button>
        {/each}
      </nav>
    </div>
  </div>

  <!-- Floating Action Sidebar -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Floating Actions</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Quick action buttons</p>
    </div>

    <div class="relative h-[500px] w-16">
      <div class="absolute inset-x-0 bottom-0 flex flex-col items-center gap-2">
        <button class="flex h-10 w-10 items-center justify-center rounded-full bg-gray-100 text-gray-600 shadow-sm transition-colors hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600">
          <MagnifyingGlassOutline class="h-5 w-5" />
        </button>
        <button class="flex h-10 w-10 items-center justify-center rounded-full bg-gray-100 text-gray-600 shadow-sm transition-colors hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600">
          <BellOutline class="h-5 w-5" />
        </button>
        <button class="flex h-10 w-10 items-center justify-center rounded-full bg-gray-100 text-gray-600 shadow-sm transition-colors hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600">
          <ChatBubbleLeftRightOutline class="h-5 w-5" />
        </button>
        <button class="flex h-10 w-10 items-center justify-center rounded-full bg-gray-100 text-gray-600 shadow-sm transition-colors hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600">
          <CogOutline class="h-5 w-5" />
        </button>
        <button class="flex h-12 w-12 items-center justify-center rounded-full bg-primary-600 text-white shadow-lg transition-transform hover:scale-105">
          <PlusOutline class="h-6 w-6" />
        </button>
      </div>
    </div>
  </div>
</div>
