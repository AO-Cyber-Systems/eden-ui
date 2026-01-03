<script lang="ts">
  import { Button, Input, Dropdown, DropdownItem, DropdownDivider, Badge, Toggle, Avatar } from "flowbite-svelte";
  import { HomeOutline, ChartPieOutline, InboxOutline, UsersOutline, ShoppingBagOutline, CogOutline, BarsOutline, BellOutline, MagnifyingGlassOutline, ChevronDownOutline, MoonOutline, SunOutline, ArrowRightToBracketOutline, UserOutline, CreditCardOutline, QuestionCircleOutline, XMarkOutline } from "flowbite-svelte-icons";

  let sidebarOpen = $state(true);
  let mobileSidebarOpen = $state(false);
  let darkMode = $state(false);
  let activeItem = $state("dashboard");

  const navItems = [
    { id: "dashboard", label: "Dashboard", icon: HomeOutline },
    { id: "analytics", label: "Analytics", icon: ChartPieOutline },
    { id: "inbox", label: "Inbox", icon: InboxOutline, badge: "3" },
    { id: "users", label: "Team", icon: UsersOutline },
    { id: "products", label: "Products", icon: ShoppingBagOutline },
    { id: "settings", label: "Settings", icon: CogOutline }
  ];
</script>

<div class="p-4">
  <div class="mb-4">
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Complete Dashboard Layout</h3>
    <p class="text-sm text-gray-500 dark:text-gray-400">Header + sidebar + content area</p>
  </div>

  <!-- Dashboard Container -->
  <div class="overflow-hidden rounded-lg border border-gray-200 bg-gray-100 dark:border-gray-700 dark:bg-gray-900">
    <!-- Top Header -->
    <header class="flex h-16 items-center justify-between border-b border-gray-200 bg-white px-4 dark:border-gray-700 dark:bg-gray-800">
      <!-- Left Section -->
      <div class="flex items-center gap-4">
        <!-- Mobile menu button -->
        <button
          class="rounded-lg p-2 text-gray-500 hover:bg-gray-100 lg:hidden dark:text-gray-400 dark:hover:bg-gray-700"
          onclick={() => mobileSidebarOpen = !mobileSidebarOpen}
        >
          <BarsOutline class="h-5 w-5" />
        </button>

        <!-- Desktop sidebar toggle -->
        <button
          class="hidden rounded-lg p-2 text-gray-500 hover:bg-gray-100 lg:block dark:text-gray-400 dark:hover:bg-gray-700"
          onclick={() => sidebarOpen = !sidebarOpen}
        >
          <BarsOutline class="h-5 w-5" />
        </button>

        <!-- Logo -->
        <div class="flex items-center gap-2">
          <div class="flex h-8 w-8 items-center justify-center rounded-lg bg-primary-600 text-white">
            <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
              <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
            </svg>
          </div>
          <span class="hidden text-lg font-semibold text-gray-900 sm:block dark:text-white">Flowbite</span>
        </div>

        <!-- Search -->
        <div class="hidden md:block md:w-64">
          <Input placeholder="Search..." size="sm">
            {#snippet left()}
              <MagnifyingGlassOutline class="h-4 w-4 text-gray-500" />
            {/snippet}
          </Input>
        </div>
      </div>

      <!-- Right Section -->
      <div class="flex items-center gap-2">
        <!-- Theme Toggle -->
        <button
          class="rounded-lg p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
          onclick={() => darkMode = !darkMode}
        >
          {#if darkMode}
            <SunOutline class="h-5 w-5" />
          {:else}
            <MoonOutline class="h-5 w-5" />
          {/if}
        </button>

        <!-- Notifications -->
        <button class="relative rounded-lg p-2 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
          <BellOutline class="h-5 w-5" />
          <span class="absolute right-1.5 top-1.5 h-2 w-2 rounded-full bg-red-500"></span>
        </button>
        <Dropdown>
          <div class="px-4 py-2 text-sm font-medium text-gray-900 dark:text-white">Notifications</div>
          <DropdownDivider />
          <DropdownItem>New message from John</DropdownItem>
          <DropdownItem>Order #1234 shipped</DropdownItem>
          <DropdownItem>Weekly report ready</DropdownItem>
          <DropdownDivider />
          <DropdownItem class="text-primary-600 dark:text-primary-400">View all</DropdownItem>
        </Dropdown>

        <!-- User Menu -->
        <button class="flex items-center gap-2 rounded-lg p-1.5 hover:bg-gray-100 dark:hover:bg-gray-700">
          <div class="flex h-8 w-8 items-center justify-center rounded-full bg-primary-100 text-sm font-medium text-primary-800 dark:bg-primary-900 dark:text-primary-200">
            NS
          </div>
          <span class="hidden text-sm font-medium text-gray-700 lg:block dark:text-gray-300">Neil Sims</span>
          <ChevronDownOutline class="hidden h-4 w-4 text-gray-500 lg:block" />
        </button>
        <Dropdown>
          <div class="px-4 py-2">
            <div class="text-sm font-medium text-gray-900 dark:text-white">Neil Sims</div>
            <div class="text-xs text-gray-500 dark:text-gray-400">neil@flowbite.com</div>
          </div>
          <DropdownDivider />
          <DropdownItem>
            <UserOutline class="me-2 h-4 w-4" />Profile
          </DropdownItem>
          <DropdownItem>
            <CogOutline class="me-2 h-4 w-4" />Settings
          </DropdownItem>
          <DropdownItem>
            <CreditCardOutline class="me-2 h-4 w-4" />Billing
          </DropdownItem>
          <DropdownDivider />
          <DropdownItem>
            <ArrowRightToBracketOutline class="me-2 h-4 w-4" />Sign out
          </DropdownItem>
        </Dropdown>
      </div>
    </header>

    <div class="flex">
      <!-- Mobile Sidebar Overlay -->
      {#if mobileSidebarOpen}
        <div class="fixed inset-0 z-40 bg-gray-900/50 lg:hidden" onclick={() => mobileSidebarOpen = false}></div>
      {/if}

      <!-- Sidebar -->
      <aside class="
        {mobileSidebarOpen ? 'fixed inset-y-0 left-0 z-50 w-64' : 'hidden'}
        {sidebarOpen ? 'lg:block lg:w-64' : 'lg:block lg:w-16'}
        flex-shrink-0 border-r border-gray-200 bg-white transition-all duration-300 dark:border-gray-700 dark:bg-gray-800
      ">
        <!-- Mobile close button -->
        <div class="flex h-16 items-center justify-between border-b border-gray-200 px-4 lg:hidden dark:border-gray-700">
          <span class="text-lg font-semibold text-gray-900 dark:text-white">Menu</span>
          <button onclick={() => mobileSidebarOpen = false}>
            <XMarkOutline class="h-5 w-5 text-gray-500" />
          </button>
        </div>

        <nav class="p-3">
          <ul class="space-y-1">
            {#each navItems as item}
              <li>
                <button
                  class="flex w-full items-center gap-3 rounded-lg p-2.5 transition-colors {activeItem === item.id ? 'bg-primary-50 text-primary-700 dark:bg-primary-900/30 dark:text-primary-300' : 'text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700'} {sidebarOpen ? '' : 'lg:justify-center'}"
                  onclick={() => { activeItem = item.id; mobileSidebarOpen = false; }}
                >
                  <svelte:component this={item.icon} class="h-5 w-5 flex-shrink-0" />
                  <span class="{sidebarOpen ? 'lg:block' : 'lg:hidden'} whitespace-nowrap text-sm font-medium">{item.label}</span>
                  {#if item.badge && sidebarOpen}
                    <Badge class="ml-auto lg:{sidebarOpen ? 'block' : 'hidden'}">{item.badge}</Badge>
                  {/if}
                </button>
              </li>
            {/each}
          </ul>

          <!-- Bottom section -->
          <div class="mt-8 border-t border-gray-200 pt-4 dark:border-gray-700">
            <button class="flex w-full items-center gap-3 rounded-lg p-2.5 text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700 {sidebarOpen ? '' : 'lg:justify-center'}">
              <QuestionCircleOutline class="h-5 w-5" />
              <span class="{sidebarOpen ? 'lg:block' : 'lg:hidden'} text-sm font-medium">Help & Support</span>
            </button>
          </div>
        </nav>
      </aside>

      <!-- Main Content -->
      <main class="min-h-[400px] flex-1 overflow-auto p-6">
        <div class="mb-6">
          <h1 class="text-2xl font-bold text-gray-900 dark:text-white">
            {navItems.find(n => n.id === activeItem)?.label}
          </h1>
          <p class="text-gray-500 dark:text-gray-400">Welcome back! Here's what's happening today.</p>
        </div>

        <!-- Content Cards -->
        <div class="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
          {#each [
            { label: "Total Revenue", value: "$45,231", change: "+12.5%", color: "green" },
            { label: "Active Users", value: "2,345", change: "+5.2%", color: "green" },
            { label: "New Orders", value: "456", change: "-2.4%", color: "red" },
            { label: "Conversion Rate", value: "3.2%", change: "+1.1%", color: "green" }
          ] as stat}
            <div class="rounded-lg bg-white p-4 shadow-sm dark:bg-gray-800">
              <p class="text-sm text-gray-500 dark:text-gray-400">{stat.label}</p>
              <p class="mt-1 text-2xl font-bold text-gray-900 dark:text-white">{stat.value}</p>
              <p class="mt-1 text-sm {stat.color === 'green' ? 'text-green-600 dark:text-green-400' : 'text-red-600 dark:text-red-400'}">
                {stat.change} from last month
              </p>
            </div>
          {/each}
        </div>

        <!-- Chart Placeholder -->
        <div class="mt-6 rounded-lg bg-white p-6 shadow-sm dark:bg-gray-800">
          <h2 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Revenue Overview</h2>
          <div class="flex h-64 items-center justify-center rounded-lg border-2 border-dashed border-gray-200 dark:border-gray-700">
            <p class="text-gray-500 dark:text-gray-400">Chart component would go here</p>
          </div>
        </div>
      </main>
    </div>
  </div>

  <!-- Layout Controls -->
  <div class="mt-4 flex items-center gap-4">
    <div class="flex items-center gap-2">
      <Toggle bind:checked={sidebarOpen} />
      <span class="text-sm text-gray-600 dark:text-gray-400">Sidebar expanded</span>
    </div>
    <div class="flex items-center gap-2">
      <Toggle bind:checked={darkMode} />
      <span class="text-sm text-gray-600 dark:text-gray-400">Dark mode</span>
    </div>
  </div>
</div>
