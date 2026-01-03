<script lang="ts">
  import { Card, Button } from "flowbite-svelte";
  import {
    PlusOutline,
    UserAddOutline,
    FolderPlusOutline,
    DocumentTextOutline,
    EnvelopeSolid,
    CalendarMonthSolid,
    CogSolid,
    ChartPieSolid
  } from "flowbite-svelte-icons";

  const quickActions = [
    { name: "New Project", icon: FolderPlusOutline, color: "primary" },
    { name: "Add User", icon: UserAddOutline, color: "green" },
    { name: "Create Report", icon: DocumentTextOutline, color: "blue" },
    { name: "Send Email", icon: EnvelopeSolid, color: "purple" }
  ];

  const shortcuts = [
    { name: "Calendar", icon: CalendarMonthSolid, count: 3 },
    { name: "Messages", icon: EnvelopeSolid, count: 12 },
    { name: "Analytics", icon: ChartPieSolid, count: null },
    { name: "Settings", icon: CogSolid, count: null }
  ];

  const colorClasses: Record<string, string> = {
    primary: "bg-primary-100 text-primary-600 hover:bg-primary-200 dark:bg-primary-900 dark:text-primary-400 dark:hover:bg-primary-800",
    green: "bg-green-100 text-green-600 hover:bg-green-200 dark:bg-green-900 dark:text-green-400 dark:hover:bg-green-800",
    blue: "bg-blue-100 text-blue-600 hover:bg-blue-200 dark:bg-blue-900 dark:text-blue-400 dark:hover:bg-blue-800",
    purple: "bg-purple-100 text-purple-600 hover:bg-purple-200 dark:bg-purple-900 dark:text-purple-400 dark:hover:bg-purple-800"
  };
</script>

<div class="grid gap-4 lg:grid-cols-2">
  <!-- Quick Actions Grid -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Quick Actions</h3>
    <div class="grid grid-cols-2 gap-3">
      {#each quickActions as action}
        <button
          class="{colorClasses[action.color]} flex flex-col items-center justify-center rounded-lg p-4 transition-colors"
        >
          <action.icon class="mb-2 h-8 w-8" />
          <span class="text-sm font-medium">{action.name}</span>
        </button>
      {/each}
    </div>
  </Card>

  <!-- Shortcut Buttons -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Shortcuts</h3>
    <div class="space-y-2">
      {#each shortcuts as shortcut}
        <button
          class="flex w-full items-center justify-between rounded-lg border border-gray-200 p-3 text-left transition-colors hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-800"
        >
          <div class="flex items-center">
            <shortcut.icon class="me-3 h-5 w-5 text-gray-500 dark:text-gray-400" />
            <span class="text-sm font-medium text-gray-900 dark:text-white">{shortcut.name}</span>
          </div>
          {#if shortcut.count}
            <span class="rounded-full bg-primary-100 px-2 py-0.5 text-xs font-medium text-primary-800 dark:bg-primary-900 dark:text-primary-300">
              {shortcut.count}
            </span>
          {/if}
        </button>
      {/each}
    </div>
  </Card>

  <!-- Action Bar -->
  <Card class="p-4 lg:col-span-2">
    <div class="flex flex-wrap items-center justify-between gap-4">
      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Create New</h3>
        <p class="text-sm text-gray-500 dark:text-gray-400">Quick access to common actions</p>
      </div>
      <div class="flex flex-wrap gap-2">
        <Button>
          <PlusOutline class="me-2 h-4 w-4" />
          New Task
        </Button>
        <Button color="alternative">
          <FolderPlusOutline class="me-2 h-4 w-4" />
          New Project
        </Button>
        <Button color="alternative">
          <UserAddOutline class="me-2 h-4 w-4" />
          Invite Member
        </Button>
        <Button color="alternative">
          <DocumentTextOutline class="me-2 h-4 w-4" />
          New Document
        </Button>
      </div>
    </div>
  </Card>
</div>
