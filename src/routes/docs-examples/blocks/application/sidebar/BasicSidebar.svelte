<script lang="ts">
  import { Sidebar, SidebarGroup, SidebarItem, SidebarWrapper, Badge } from "flowbite-svelte";
  import { HomeOutline, ChartPieOutline, InboxOutline, UsersOutline, ShoppingBagOutline, CogOutline, QuestionCircleOutline, ArrowRightToBracketOutline } from "flowbite-svelte-icons";

  let activeItem = $state("dashboard");

  const navItems = [
    { id: "dashboard", label: "Dashboard", icon: HomeOutline },
    { id: "analytics", label: "Analytics", icon: ChartPieOutline },
    { id: "inbox", label: "Inbox", icon: InboxOutline, badge: "3" },
    { id: "users", label: "Users", icon: UsersOutline },
    { id: "products", label: "Products", icon: ShoppingBagOutline }
  ];
</script>

<div class="flex gap-8 p-4">
  <!-- Basic Sidebar -->
  <div class="w-64">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Basic Sidebar</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Simple navigation links</p>
    </div>
    <Sidebar class="w-full">
      <SidebarWrapper class="rounded-lg bg-gray-50 dark:bg-gray-800">
        <SidebarGroup>
          {#each navItems as item}
            <SidebarItem
              label={item.label}
              href="#"
              active={activeItem === item.id}
              onclick={() => activeItem = item.id}
            >
              {#snippet iconSlot()}
                <svelte:component this={item.icon} class="h-5 w-5" />
              {/snippet}
              {#if item.badge}
                {#snippet subtext()}
                  <Badge class="ms-auto">{item.badge}</Badge>
                {/snippet}
              {/if}
            </SidebarItem>
          {/each}
        </SidebarGroup>
      </SidebarWrapper>
    </Sidebar>
  </div>

  <!-- Sidebar with Sections -->
  <div class="w-64">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Grouped Sidebar</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Organized by sections</p>
    </div>
    <Sidebar class="w-full">
      <SidebarWrapper class="rounded-lg bg-gray-50 dark:bg-gray-800">
        <SidebarGroup>
          <span class="mb-2 block px-3 text-xs font-semibold uppercase text-gray-500 dark:text-gray-400">Main</span>
          <SidebarItem label="Dashboard" href="#">
            {#snippet iconSlot()}
              <HomeOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
          <SidebarItem label="Analytics" href="#">
            {#snippet iconSlot()}
              <ChartPieOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
        </SidebarGroup>
        <SidebarGroup border>
          <span class="mb-2 block px-3 text-xs font-semibold uppercase text-gray-500 dark:text-gray-400">Management</span>
          <SidebarItem label="Users" href="#">
            {#snippet iconSlot()}
              <UsersOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
          <SidebarItem label="Products" href="#">
            {#snippet iconSlot()}
              <ShoppingBagOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
        </SidebarGroup>
        <SidebarGroup border>
          <span class="mb-2 block px-3 text-xs font-semibold uppercase text-gray-500 dark:text-gray-400">Support</span>
          <SidebarItem label="Settings" href="#">
            {#snippet iconSlot()}
              <CogOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
          <SidebarItem label="Help" href="#">
            {#snippet iconSlot()}
              <QuestionCircleOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
        </SidebarGroup>
      </SidebarWrapper>
    </Sidebar>
  </div>

  <!-- Sidebar with User Section -->
  <div class="w-64">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With User Profile</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Includes user avatar</p>
    </div>
    <div class="rounded-lg bg-gray-50 dark:bg-gray-800">
      <!-- User Profile Section -->
      <div class="border-b border-gray-200 p-4 dark:border-gray-700">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-100 text-sm font-medium text-primary-800 dark:bg-primary-900 dark:text-primary-200">
            NS
          </div>
          <div>
            <div class="font-medium text-gray-900 dark:text-white">Neil Sims</div>
            <div class="text-sm text-gray-500 dark:text-gray-400">Administrator</div>
          </div>
        </div>
      </div>

      <Sidebar class="w-full">
        <SidebarWrapper class="bg-transparent">
          <SidebarGroup>
            {#each navItems as item}
              <SidebarItem label={item.label} href="#">
                {#snippet iconSlot()}
                  <svelte:component this={item.icon} class="h-5 w-5" />
                {/snippet}
              </SidebarItem>
            {/each}
          </SidebarGroup>
          <SidebarGroup border>
            <SidebarItem label="Sign out" href="#">
              {#snippet iconSlot()}
                <ArrowRightToBracketOutline class="h-5 w-5" />
              {/snippet}
            </SidebarItem>
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  </div>
</div>
