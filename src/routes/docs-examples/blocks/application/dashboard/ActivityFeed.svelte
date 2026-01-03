<script lang="ts">
  import { Card, Avatar, Button, Badge } from "flowbite-svelte";

  const activities = [
    {
      id: 1,
      user: { name: "Bonnie Green", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" },
      action: "created a new project",
      target: "Marketing Campaign Q4",
      time: "2 minutes ago",
      type: "create"
    },
    {
      id: 2,
      user: { name: "Thomas Lean", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/thomas-lean.png" },
      action: "commented on",
      target: "Design Review",
      time: "15 minutes ago",
      type: "comment"
    },
    {
      id: 3,
      user: { name: "Jese Leos", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" },
      action: "completed task",
      target: "API Integration",
      time: "1 hour ago",
      type: "complete"
    },
    {
      id: 4,
      user: { name: "Roberta Casas", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png" },
      action: "uploaded file",
      target: "design-assets.zip",
      time: "3 hours ago",
      type: "upload"
    },
    {
      id: 5,
      user: { name: "Neil Sims", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/neil-sims.png" },
      action: "updated status of",
      target: "Bug Fix #423",
      time: "5 hours ago",
      type: "update"
    }
  ];

  const typeColors: Record<string, string> = {
    create: "green",
    comment: "blue",
    complete: "purple",
    upload: "amber",
    update: "primary"
  };
</script>

<Card class="p-4">
  <div class="mb-4 flex items-center justify-between">
    <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recent Activity</h3>
    <Button size="sm" color="alternative">View all</Button>
  </div>

  <div class="flow-root">
    <ul class="-mb-8">
      {#each activities as activity, index}
        <li>
          <div class="relative pb-8">
            {#if index !== activities.length - 1}
              <span class="absolute left-4 top-4 -ml-px h-full w-0.5 bg-gray-200 dark:bg-gray-700" aria-hidden="true"></span>
            {/if}
            <div class="relative flex space-x-3">
              <div>
                <Avatar src={activity.user.avatar} alt={activity.user.name} size="sm" />
              </div>
              <div class="flex min-w-0 flex-1 justify-between space-x-4 pt-1.5">
                <div>
                  <p class="text-sm text-gray-600 dark:text-gray-400">
                    <span class="font-medium text-gray-900 dark:text-white">{activity.user.name}</span>
                    {" "}{activity.action}{" "}
                    <span class="font-medium text-primary-600 dark:text-primary-500">{activity.target}</span>
                  </p>
                </div>
                <div class="whitespace-nowrap text-right text-sm text-gray-500 dark:text-gray-400">
                  {activity.time}
                </div>
              </div>
            </div>
          </div>
        </li>
      {/each}
    </ul>
  </div>
</Card>
