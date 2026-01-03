<script lang="ts">
  import { Card } from "flowbite-svelte";
  import { ArrowUpOutline, ArrowDownOutline, UsersSolid, CurrencyDollarSolid, ShoppingCartSolid, ChartPieSolid } from "flowbite-svelte-icons";

  const stats = [
    {
      title: "Total Users",
      value: "24,521",
      change: "+12.5%",
      trend: "up",
      icon: UsersSolid,
      color: "primary"
    },
    {
      title: "Revenue",
      value: "$48,352",
      change: "+8.2%",
      trend: "up",
      icon: CurrencyDollarSolid,
      color: "green"
    },
    {
      title: "Orders",
      value: "1,423",
      change: "-2.4%",
      trend: "down",
      icon: ShoppingCartSolid,
      color: "amber"
    },
    {
      title: "Conversion Rate",
      value: "3.24%",
      change: "+1.1%",
      trend: "up",
      icon: ChartPieSolid,
      color: "purple"
    }
  ];

  const colorClasses: Record<string, { bg: string; icon: string }> = {
    primary: { bg: "bg-primary-100 dark:bg-primary-900", icon: "text-primary-600 dark:text-primary-400" },
    green: { bg: "bg-green-100 dark:bg-green-900", icon: "text-green-600 dark:text-green-400" },
    amber: { bg: "bg-amber-100 dark:bg-amber-900", icon: "text-amber-600 dark:text-amber-400" },
    purple: { bg: "bg-purple-100 dark:bg-purple-900", icon: "text-purple-600 dark:text-purple-400" }
  };
</script>

<div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-4">
  {#each stats as stat}
    <Card class="p-4">
      <div class="flex items-center justify-between">
        <div>
          <p class="text-sm font-medium text-gray-500 dark:text-gray-400">{stat.title}</p>
          <h3 class="mt-1 text-2xl font-bold text-gray-900 dark:text-white">{stat.value}</h3>
          <div class="mt-2 flex items-center text-sm">
            {#if stat.trend === "up"}
              <ArrowUpOutline class="me-1 h-4 w-4 text-green-500" />
              <span class="text-green-500">{stat.change}</span>
            {:else}
              <ArrowDownOutline class="me-1 h-4 w-4 text-red-500" />
              <span class="text-red-500">{stat.change}</span>
            {/if}
            <span class="ms-2 text-gray-500 dark:text-gray-400">vs last month</span>
          </div>
        </div>
        <div class="{colorClasses[stat.color].bg} rounded-full p-3">
          <stat.icon class="h-6 w-6 {colorClasses[stat.color].icon}" />
        </div>
      </div>
    </Card>
  {/each}
</div>
