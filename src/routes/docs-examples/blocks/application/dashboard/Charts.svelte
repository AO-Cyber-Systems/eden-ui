<script lang="ts">
  import { Card, Button, Dropdown, DropdownItem } from "flowbite-svelte";
  import { ChevronDownOutline } from "flowbite-svelte-icons";
</script>

<div class="grid gap-4 lg:grid-cols-2">
  <!-- Line Chart Widget -->
  <Card class="p-4">
    <div class="mb-4 flex items-center justify-between">
      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Revenue Overview</h3>
        <p class="text-sm text-gray-500 dark:text-gray-400">Monthly revenue trends</p>
      </div>
      <Button color="alternative" size="sm">
        Last 6 months
        <ChevronDownOutline class="ms-2 h-4 w-4" />
      </Button>
      <Dropdown>
        <DropdownItem>Last 30 days</DropdownItem>
        <DropdownItem>Last 3 months</DropdownItem>
        <DropdownItem>Last 6 months</DropdownItem>
        <DropdownItem>Last 12 months</DropdownItem>
      </Dropdown>
    </div>
    <!-- Chart Placeholder -->
    <div class="flex h-64 items-center justify-center rounded-lg bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 12l3-3 3 3 4-4M8 21l4-4 4 4M3 4h18M4 4h16v12a1 1 0 01-1 1H5a1 1 0 01-1-1V4z" />
        </svg>
        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Line Chart Area</p>
        <p class="text-xs text-gray-400 dark:text-gray-500">Integrate with Chart.js or ApexCharts</p>
      </div>
    </div>
    <div class="mt-4 flex items-center justify-between border-t border-gray-200 pt-4 dark:border-gray-700">
      <div class="text-sm">
        <span class="font-medium text-gray-900 dark:text-white">$48,352</span>
        <span class="text-gray-500 dark:text-gray-400"> total revenue</span>
      </div>
      <Button size="sm">View Report</Button>
    </div>
  </Card>

  <!-- Bar Chart Widget -->
  <Card class="p-4">
    <div class="mb-4 flex items-center justify-between">
      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Traffic Sources</h3>
        <p class="text-sm text-gray-500 dark:text-gray-400">Visitors by channel</p>
      </div>
      <Button color="alternative" size="sm">
        This week
        <ChevronDownOutline class="ms-2 h-4 w-4" />
      </Button>
    </div>
    <!-- Chart Placeholder -->
    <div class="flex h-64 items-center justify-center rounded-lg bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z" />
        </svg>
        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Bar Chart Area</p>
        <p class="text-xs text-gray-400 dark:text-gray-500">Integrate with Chart.js or ApexCharts</p>
      </div>
    </div>
    <!-- Legend -->
    <div class="mt-4 grid grid-cols-2 gap-4 border-t border-gray-200 pt-4 dark:border-gray-700">
      <div class="flex items-center">
        <span class="me-2 h-3 w-3 rounded-full bg-primary-500"></span>
        <span class="text-sm text-gray-600 dark:text-gray-400">Direct: 42%</span>
      </div>
      <div class="flex items-center">
        <span class="me-2 h-3 w-3 rounded-full bg-green-500"></span>
        <span class="text-sm text-gray-600 dark:text-gray-400">Organic: 28%</span>
      </div>
      <div class="flex items-center">
        <span class="me-2 h-3 w-3 rounded-full bg-amber-500"></span>
        <span class="text-sm text-gray-600 dark:text-gray-400">Referral: 18%</span>
      </div>
      <div class="flex items-center">
        <span class="me-2 h-3 w-3 rounded-full bg-purple-500"></span>
        <span class="text-sm text-gray-600 dark:text-gray-400">Social: 12%</span>
      </div>
    </div>
  </Card>

  <!-- Donut Chart Widget -->
  <Card class="p-4">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Sales by Category</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Product category breakdown</p>
    </div>
    <div class="flex h-48 items-center justify-center rounded-lg bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z" />
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z" />
        </svg>
        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Donut Chart Area</p>
      </div>
    </div>
    <div class="mt-4 space-y-2">
      <div class="flex items-center justify-between">
        <div class="flex items-center">
          <span class="me-2 h-3 w-3 rounded-full bg-primary-500"></span>
          <span class="text-sm text-gray-600 dark:text-gray-400">Electronics</span>
        </div>
        <span class="text-sm font-medium text-gray-900 dark:text-white">$12,423</span>
      </div>
      <div class="flex items-center justify-between">
        <div class="flex items-center">
          <span class="me-2 h-3 w-3 rounded-full bg-green-500"></span>
          <span class="text-sm text-gray-600 dark:text-gray-400">Clothing</span>
        </div>
        <span class="text-sm font-medium text-gray-900 dark:text-white">$8,234</span>
      </div>
      <div class="flex items-center justify-between">
        <div class="flex items-center">
          <span class="me-2 h-3 w-3 rounded-full bg-amber-500"></span>
          <span class="text-sm text-gray-600 dark:text-gray-400">Home & Garden</span>
        </div>
        <span class="text-sm font-medium text-gray-900 dark:text-white">$5,127</span>
      </div>
    </div>
  </Card>

  <!-- Area Chart Widget -->
  <Card class="p-4">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">User Growth</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">New users over time</p>
    </div>
    <div class="flex h-48 items-center justify-center rounded-lg bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6" />
        </svg>
        <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">Area Chart</p>
      </div>
    </div>
    <div class="mt-4 flex items-center justify-between border-t border-gray-200 pt-4 dark:border-gray-700">
      <div>
        <p class="text-2xl font-bold text-gray-900 dark:text-white">+2,340</p>
        <p class="text-sm text-gray-500 dark:text-gray-400">new users this month</p>
      </div>
      <div class="text-right">
        <p class="text-sm font-medium text-green-500">+18.2%</p>
        <p class="text-xs text-gray-400">vs last month</p>
      </div>
    </div>
  </Card>
</div>
