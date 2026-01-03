<script lang="ts">
  import { Badge } from "flowbite-svelte";
  import { HomeOutline, ChartPieOutline, ShoppingCartOutline, UsersOutline, CubeOutline, DocumentTextOutline, CogOutline, ChevronDownOutline, ChevronRightOutline, FolderOutline, CodeBracketOutline, ServerOutline, CloudOutline, DatabaseOutline, CommandLineOutline, BeakerOutline, WrenchOutline, PuzzlePieceOutline, SwatchOutline, RectangleGroupOutline, BookOpenOutline, NewspaperOutline, CalendarMonthOutline, ClipboardDocumentListOutline, TagOutline, CreditCardOutline, TruckOutline, ReceiptRefundOutline } from "flowbite-svelte-icons";

  interface MenuItem {
    id: string;
    label: string;
    icon?: any;
    href?: string;
    badge?: string;
    badgeColor?: "red" | "green" | "blue" | "yellow";
    children?: MenuItem[];
  }

  let expandedItems = $state<string[]>(["development", "components"]);
  let activeItem = $state("buttons");

  function toggleExpand(id: string) {
    if (expandedItems.includes(id)) {
      expandedItems = expandedItems.filter(i => i !== id);
    } else {
      expandedItems = [...expandedItems, id];
    }
  }

  const menuItems: MenuItem[] = [
    { id: "dashboard", label: "Dashboard", icon: HomeOutline, href: "#" },
    { id: "analytics", label: "Analytics", icon: ChartPieOutline, href: "#", badge: "New", badgeColor: "green" },
    {
      id: "ecommerce",
      label: "E-commerce",
      icon: ShoppingCartOutline,
      children: [
        { id: "products", label: "Products", icon: CubeOutline, href: "#" },
        { id: "orders", label: "Orders", icon: DocumentTextOutline, href: "#", badge: "12", badgeColor: "red" },
        { id: "customers", label: "Customers", icon: UsersOutline, href: "#" },
        {
          id: "inventory",
          label: "Inventory",
          icon: FolderOutline,
          children: [
            { id: "stock", label: "Stock Levels", href: "#" },
            { id: "suppliers", label: "Suppliers", href: "#" },
            { id: "warehouses", label: "Warehouses", href: "#" }
          ]
        },
        {
          id: "finances",
          label: "Finances",
          icon: CreditCardOutline,
          children: [
            { id: "invoices", label: "Invoices", href: "#" },
            { id: "refunds", label: "Refunds", icon: ReceiptRefundOutline, href: "#" },
            { id: "shipping", label: "Shipping", icon: TruckOutline, href: "#" }
          ]
        }
      ]
    },
    {
      id: "development",
      label: "Development",
      icon: CodeBracketOutline,
      children: [
        { id: "projects", label: "Projects", icon: FolderOutline, href: "#" },
        {
          id: "infrastructure",
          label: "Infrastructure",
          icon: ServerOutline,
          children: [
            { id: "servers", label: "Servers", href: "#" },
            { id: "databases", label: "Databases", icon: DatabaseOutline, href: "#" },
            { id: "cloud", label: "Cloud Services", icon: CloudOutline, href: "#" }
          ]
        },
        { id: "deployments", label: "Deployments", icon: CommandLineOutline, href: "#" },
        { id: "testing", label: "Testing", icon: BeakerOutline, href: "#" }
      ]
    },
    {
      id: "components",
      label: "UI Components",
      icon: PuzzlePieceOutline,
      children: [
        {
          id: "forms",
          label: "Forms",
          icon: ClipboardDocumentListOutline,
          children: [
            { id: "inputs", label: "Input Fields", href: "#" },
            { id: "selects", label: "Select & Dropdowns", href: "#" },
            { id: "checkboxes", label: "Checkboxes & Radios", href: "#" },
            { id: "buttons", label: "Buttons", href: "#" }
          ]
        },
        {
          id: "display",
          label: "Display",
          icon: RectangleGroupOutline,
          children: [
            { id: "cards", label: "Cards", href: "#" },
            { id: "tables", label: "Tables", href: "#" },
            { id: "modals", label: "Modals", href: "#" }
          ]
        },
        { id: "theming", label: "Theming", icon: SwatchOutline, href: "#" }
      ]
    },
    {
      id: "content",
      label: "Content",
      icon: BookOpenOutline,
      children: [
        { id: "pages", label: "Pages", icon: DocumentTextOutline, href: "#" },
        { id: "blog", label: "Blog Posts", icon: NewspaperOutline, href: "#" },
        { id: "media", label: "Media Library", icon: FolderOutline, href: "#" }
      ]
    },
    { id: "calendar", label: "Calendar", icon: CalendarMonthOutline, href: "#" },
    { id: "settings", label: "Settings", icon: CogOutline, href: "#" }
  ];
</script>

{#snippet menuItem(item: MenuItem, level: number = 0)}
  {#if item.children}
    <div>
      <button
        class="flex w-full items-center justify-between rounded-lg px-3 py-2 text-sm transition-colors {level > 0 ? 'text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700' : 'font-medium text-gray-900 hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700'}"
        onclick={() => toggleExpand(item.id)}
      >
        <span class="flex items-center gap-3">
          {#if item.icon}
            <svelte:component this={item.icon} class="h-5 w-5 {level > 0 ? 'h-4 w-4' : ''}" />
          {:else if level > 1}
            <span class="h-1.5 w-1.5 rounded-full bg-gray-400"></span>
          {/if}
          {item.label}
          {#if item.badge}
            <Badge color={item.badgeColor || "dark"} class="text-xs">{item.badge}</Badge>
          {/if}
        </span>
        <ChevronDownOutline class="h-4 w-4 text-gray-500 transition-transform {expandedItems.includes(item.id) ? '' : '-rotate-90'}" />
      </button>

      {#if expandedItems.includes(item.id)}
        <div class="mt-1 {level === 0 ? 'ml-3 border-l border-gray-200 pl-3 dark:border-gray-700' : 'ml-4 pl-2'}">
          {#each item.children as child}
            {@render menuItem(child, level + 1)}
          {/each}
        </div>
      {/if}
    </div>
  {:else}
    <a
      href={item.href}
      class="flex items-center gap-3 rounded-lg px-3 py-2 text-sm transition-colors {activeItem === item.id ? 'bg-primary-50 text-primary-700 dark:bg-primary-900/30 dark:text-primary-300' : level > 0 ? 'text-gray-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700' : 'text-gray-900 hover:bg-gray-100 dark:text-white dark:hover:bg-gray-700'}"
      onclick={() => activeItem = item.id}
    >
      {#if item.icon}
        <svelte:component this={item.icon} class="{level > 0 ? 'h-4 w-4' : 'h-5 w-5'}" />
      {:else if level > 1}
        <span class="h-1.5 w-1.5 rounded-full {activeItem === item.id ? 'bg-primary-500' : 'bg-gray-400'}"></span>
      {/if}
      <span class="{level === 0 ? 'font-medium' : ''}">{item.label}</span>
      {#if item.badge}
        <Badge color={item.badgeColor || "dark"} class="ml-auto text-xs">{item.badge}</Badge>
      {/if}
    </a>
  {/if}
{/snippet}

<div class="flex gap-8 p-4">
  <!-- Full Multi-level Sidebar -->
  <div class="w-72">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Multi-level Navigation</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Deep nested menu structure</p>
    </div>

    <div class="max-h-[600px] overflow-y-auto rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
      <nav class="space-y-1">
        {#each menuItems as item}
          {@render menuItem(item, 0)}
        {/each}
      </nav>
    </div>
  </div>

  <!-- Breadcrumb Trail Display -->
  <div class="flex-1">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Current Selection</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Active item: <strong>{activeItem}</strong></p>
    </div>

    <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
      <p class="text-sm text-gray-600 dark:text-gray-400">
        Expanded sections: <span class="font-medium text-gray-900 dark:text-white">{expandedItems.join(", ") || "None"}</span>
      </p>

      <div class="mt-4">
        <h4 class="mb-2 text-sm font-medium text-gray-900 dark:text-white">Features demonstrated:</h4>
        <ul class="list-inside list-disc space-y-1 text-sm text-gray-600 dark:text-gray-400">
          <li>Three levels of nested navigation</li>
          <li>Collapsible sections with animated chevrons</li>
          <li>Active state highlighting</li>
          <li>Badge support for counts and labels</li>
          <li>Icon support at all levels</li>
          <li>Dot indicators for deep nested items</li>
          <li>Visual hierarchy with indentation</li>
          <li>Border lines for section grouping</li>
        </ul>
      </div>
    </div>
  </div>
</div>
