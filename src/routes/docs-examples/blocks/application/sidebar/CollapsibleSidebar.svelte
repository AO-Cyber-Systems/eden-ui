<script lang="ts">
  import { Sidebar, SidebarGroup, SidebarItem, SidebarWrapper, SidebarDropdownWrapper, SidebarDropdownItem, Button, Badge } from "flowbite-svelte";
  import { HomeOutline, ChartPieOutline, ShoppingCartOutline, UsersOutline, CubeOutline, DocumentTextOutline, CogOutline, ChevronDownOutline, ChevronRightOutline, BuildingStorefrontOutline, TagOutline, CreditCardOutline, ChartBarOutline, UserOutline, UserGroupOutline, ShieldCheckOutline } from "flowbite-svelte-icons";

  let expandedSections = $state<string[]>(["ecommerce"]);

  function toggleSection(section: string) {
    if (expandedSections.includes(section)) {
      expandedSections = expandedSections.filter(s => s !== section);
    } else {
      expandedSections = [...expandedSections, section];
    }
  }

  const menuSections = [
    {
      id: "ecommerce",
      label: "E-commerce",
      icon: ShoppingCartOutline,
      items: [
        { label: "Products", href: "#", icon: CubeOutline },
        { label: "Orders", href: "#", icon: DocumentTextOutline, badge: "5" },
        { label: "Customers", href: "#", icon: UsersOutline }
      ]
    },
    {
      id: "analytics",
      label: "Analytics",
      icon: ChartPieOutline,
      items: [
        { label: "Overview", href: "#", icon: ChartBarOutline },
        { label: "Reports", href: "#", icon: DocumentTextOutline },
        { label: "Real-time", href: "#", icon: ChartPieOutline }
      ]
    },
    {
      id: "users",
      label: "User Management",
      icon: UserGroupOutline,
      items: [
        { label: "All Users", href: "#", icon: UsersOutline },
        { label: "Roles", href: "#", icon: ShieldCheckOutline },
        { label: "Permissions", href: "#", icon: CogOutline }
      ]
    }
  ];
</script>

<div class="flex gap-8 p-4">
  <!-- Collapsible with Accordion -->
  <div class="w-64">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Collapsible Sections</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Expandable menu groups</p>
    </div>

    <div class="rounded-lg bg-gray-50 dark:bg-gray-800">
      <Sidebar class="w-full">
        <SidebarWrapper class="bg-transparent">
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#" active>
              {#snippet iconSlot()}
                <HomeOutline class="h-5 w-5" />
              {/snippet}
            </SidebarItem>
          </SidebarGroup>

          {#each menuSections as section}
            <SidebarGroup>
              <button
                class="flex w-full items-center justify-between rounded-lg p-2 text-gray-900 hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700"
                onclick={() => toggleSection(section.id)}
              >
                <span class="flex items-center gap-3">
                  <svelte:component this={section.icon} class="h-5 w-5 text-gray-500 dark:text-gray-400" />
                  <span class="text-sm font-medium">{section.label}</span>
                </span>
                {#if expandedSections.includes(section.id)}
                  <ChevronDownOutline class="h-4 w-4 text-gray-500" />
                {:else}
                  <ChevronRightOutline class="h-4 w-4 text-gray-500" />
                {/if}
              </button>

              {#if expandedSections.includes(section.id)}
                <div class="ml-4 mt-1 space-y-1 border-l border-gray-200 pl-4 dark:border-gray-700">
                  {#each section.items as item}
                    <a
                      href={item.href}
                      class="flex items-center justify-between rounded-lg px-3 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700"
                    >
                      <span class="flex items-center gap-2">
                        <svelte:component this={item.icon} class="h-4 w-4" />
                        {item.label}
                      </span>
                      {#if item.badge}
                        <Badge color="red" class="text-xs">{item.badge}</Badge>
                      {/if}
                    </a>
                  {/each}
                </div>
              {/if}
            </SidebarGroup>
          {/each}

          <SidebarGroup border>
            <SidebarItem label="Settings" href="#">
              {#snippet iconSlot()}
                <CogOutline class="h-5 w-5" />
              {/snippet}
            </SidebarItem>
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  </div>

  <!-- Collapsible with Built-in Dropdown -->
  <div class="w-64">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Dropdown Style</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Using SidebarDropdownWrapper</p>
    </div>

    <Sidebar class="w-full">
      <SidebarWrapper class="rounded-lg bg-gray-50 dark:bg-gray-800">
        <SidebarGroup>
          <SidebarItem label="Dashboard" href="#">
            {#snippet iconSlot()}
              <HomeOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>

          <SidebarDropdownWrapper label="E-commerce">
            {#snippet iconSlot()}
              <ShoppingCartOutline class="h-5 w-5" />
            {/snippet}
            <SidebarDropdownItem label="Products" href="#" />
            <SidebarDropdownItem label="Billing" href="#" />
            <SidebarDropdownItem label="Invoice" href="#" />
          </SidebarDropdownWrapper>

          <SidebarDropdownWrapper label="Users">
            {#snippet iconSlot()}
              <UsersOutline class="h-5 w-5" />
            {/snippet}
            <SidebarDropdownItem label="All Users" href="#" />
            <SidebarDropdownItem label="Add User" href="#" />
            <SidebarDropdownItem label="User Groups" href="#" />
          </SidebarDropdownWrapper>

          <SidebarItem label="Analytics" href="#">
            {#snippet iconSlot()}
              <ChartPieOutline class="h-5 w-5" />
            {/snippet}
          </SidebarItem>
        </SidebarGroup>
      </SidebarWrapper>
    </Sidebar>
  </div>

  <!-- Multi-level Nested -->
  <div class="w-64">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Multi-level Nested</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Deep nesting support</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-2 dark:bg-gray-800">
      <nav class="space-y-1">
        <a href="#" class="flex items-center rounded-lg bg-primary-50 px-3 py-2 text-primary-700 dark:bg-primary-900/30 dark:text-primary-300">
          <HomeOutline class="me-3 h-5 w-5" />
          Dashboard
        </a>

        <!-- Level 1 -->
        <div>
          <button
            class="flex w-full items-center justify-between rounded-lg px-3 py-2 text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700"
            onclick={() => toggleSection('store')}
          >
            <span class="flex items-center">
              <BuildingStorefrontOutline class="me-3 h-5 w-5" />
              Store
            </span>
            <ChevronDownOutline class="h-4 w-4 transition-transform {expandedSections.includes('store') ? 'rotate-180' : ''}" />
          </button>

          {#if expandedSections.includes('store')}
            <div class="ml-6 mt-1 space-y-1">
              <a href="#" class="flex items-center rounded-lg px-3 py-2 text-sm text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
                <CubeOutline class="me-2 h-4 w-4" />
                Products
              </a>

              <!-- Level 2 -->
              <div>
                <button
                  class="flex w-full items-center justify-between rounded-lg px-3 py-2 text-sm text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700"
                  onclick={() => toggleSection('categories')}
                >
                  <span class="flex items-center">
                    <TagOutline class="me-2 h-4 w-4" />
                    Categories
                  </span>
                  <ChevronRightOutline class="h-3 w-3 transition-transform {expandedSections.includes('categories') ? 'rotate-90' : ''}" />
                </button>

                {#if expandedSections.includes('categories')}
                  <div class="ml-6 mt-1 space-y-1">
                    <a href="#" class="block rounded-lg px-3 py-1.5 text-xs text-gray-500 hover:bg-gray-100 dark:text-gray-500 dark:hover:bg-gray-700">
                      Electronics
                    </a>
                    <a href="#" class="block rounded-lg px-3 py-1.5 text-xs text-gray-500 hover:bg-gray-100 dark:text-gray-500 dark:hover:bg-gray-700">
                      Clothing
                    </a>
                    <a href="#" class="block rounded-lg px-3 py-1.5 text-xs text-gray-500 hover:bg-gray-100 dark:text-gray-500 dark:hover:bg-gray-700">
                      Home & Garden
                    </a>
                  </div>
                {/if}
              </div>

              <a href="#" class="flex items-center rounded-lg px-3 py-2 text-sm text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
                <CreditCardOutline class="me-2 h-4 w-4" />
                Orders
              </a>
            </div>
          {/if}
        </div>

        <a href="#" class="flex items-center rounded-lg px-3 py-2 text-gray-700 hover:bg-gray-100 dark:text-gray-300 dark:hover:bg-gray-700">
          <ChartPieOutline class="me-3 h-5 w-5" />
          Analytics
        </a>
      </nav>
    </div>
  </div>
</div>
