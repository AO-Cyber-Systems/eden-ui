<script lang="ts">
  import { Card, Progressbar, Badge } from "flowbite-svelte";

  const projects = [
    { name: "Website Redesign", progress: 75, status: "In Progress", color: "primary" },
    { name: "Mobile App Development", progress: 45, status: "In Progress", color: "blue" },
    { name: "API Integration", progress: 100, status: "Completed", color: "green" },
    { name: "Database Migration", progress: 30, status: "In Progress", color: "amber" }
  ];

  const goals = [
    { name: "Monthly Revenue", current: 48352, target: 60000, unit: "$" },
    { name: "New Customers", current: 234, target: 300, unit: "" },
    { name: "Support Tickets Resolved", current: 89, target: 100, unit: "%" }
  ];

  const tasks = [
    { name: "Design Tasks", completed: 24, total: 30 },
    { name: "Development Tasks", completed: 18, total: 45 },
    { name: "Testing Tasks", completed: 12, total: 20 }
  ];
</script>

<div class="grid gap-4 lg:grid-cols-2">
  <!-- Project Progress -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Project Progress</h3>
    <div class="space-y-4">
      {#each projects as project}
        <div>
          <div class="mb-1 flex items-center justify-between">
            <span class="text-sm font-medium text-gray-900 dark:text-white">{project.name}</span>
            <Badge color={project.status === "Completed" ? "green" : "blue"}>{project.status}</Badge>
          </div>
          <div class="flex items-center gap-2">
            <Progressbar progress={project.progress} size="h-2" color={project.color as "primary" | "blue" | "green" | "red" | "yellow" | "indigo" | "purple" | "gray"} class="flex-1" />
            <span class="text-sm font-medium text-gray-700 dark:text-gray-300">{project.progress}%</span>
          </div>
        </div>
      {/each}
    </div>
  </Card>

  <!-- Monthly Goals -->
  <Card class="p-4">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Monthly Goals</h3>
    <div class="space-y-6">
      {#each goals as goal}
        {@const progress = Math.round((goal.current / goal.target) * 100)}
        <div>
          <div class="mb-2 flex items-center justify-between">
            <span class="text-sm font-medium text-gray-900 dark:text-white">{goal.name}</span>
            <span class="text-sm text-gray-500 dark:text-gray-400">
              {goal.unit}{goal.current.toLocaleString()} / {goal.unit}{goal.target.toLocaleString()}
            </span>
          </div>
          <div class="relative">
            <div class="h-4 w-full overflow-hidden rounded-full bg-gray-200 dark:bg-gray-700">
              <div
                class="h-4 rounded-full bg-gradient-to-r from-primary-500 to-primary-600 transition-all"
                style="width: {Math.min(progress, 100)}%"
              ></div>
            </div>
            <span class="absolute inset-0 flex items-center justify-center text-xs font-medium text-white mix-blend-difference">
              {progress}%
            </span>
          </div>
        </div>
      {/each}
    </div>
  </Card>

  <!-- Task Completion -->
  <Card class="p-4 lg:col-span-2">
    <h3 class="mb-4 text-lg font-semibold text-gray-900 dark:text-white">Task Completion</h3>
    <div class="grid gap-4 sm:grid-cols-3">
      {#each tasks as task}
        {@const percent = Math.round((task.completed / task.total) * 100)}
        <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
          <div class="mb-2 text-center">
            <div class="relative mx-auto h-24 w-24">
              <!-- Background circle -->
              <svg class="h-24 w-24" viewBox="0 0 36 36">
                <path
                  class="text-gray-200 dark:text-gray-700"
                  stroke="currentColor"
                  stroke-width="3"
                  fill="none"
                  d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                />
                <path
                  class="text-primary-500"
                  stroke="currentColor"
                  stroke-width="3"
                  stroke-linecap="round"
                  fill="none"
                  stroke-dasharray="{percent}, 100"
                  d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                />
              </svg>
              <div class="absolute inset-0 flex items-center justify-center">
                <span class="text-xl font-bold text-gray-900 dark:text-white">{percent}%</span>
              </div>
            </div>
          </div>
          <p class="text-center text-sm font-medium text-gray-900 dark:text-white">{task.name}</p>
          <p class="text-center text-xs text-gray-500 dark:text-gray-400">
            {task.completed} of {task.total} completed
          </p>
        </div>
      {/each}
    </div>
  </Card>
</div>
