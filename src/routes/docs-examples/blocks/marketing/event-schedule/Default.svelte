<script lang="ts">
  import { Badge, Avatar, Button } from "flowbite-svelte";

  const events = [
    {
      time: "9:00 AM",
      title: "Registration & Welcome Coffee",
      description: "Get your badge and enjoy refreshments while networking with other attendees.",
      location: "Main Lobby",
      type: "networking",
    },
    {
      time: "10:00 AM",
      title: "Opening Keynote: The Future of Tech",
      description: "Join our CEO as they share insights on emerging technologies and industry trends.",
      speaker: { name: "Sarah Johnson", role: "CEO", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" },
      location: "Main Stage",
      type: "keynote",
    },
    {
      time: "11:30 AM",
      title: "Building Scalable Systems",
      description: "Learn best practices for designing and implementing scalable architectures.",
      speaker: { name: "Michael Chen", role: "CTO", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" },
      location: "Room A",
      type: "workshop",
    },
    {
      time: "1:00 PM",
      title: "Lunch Break",
      description: "Enjoy a catered lunch and continue networking with fellow attendees.",
      location: "Dining Hall",
      type: "break",
    },
    {
      time: "2:00 PM",
      title: "Panel: DevOps in Practice",
      description: "Industry leaders discuss real-world DevOps challenges and solutions.",
      location: "Main Stage",
      type: "panel",
    },
    {
      time: "4:00 PM",
      title: "Closing Remarks & Networking",
      description: "Final thoughts from our organizers and extended networking opportunity.",
      location: "Main Lobby",
      type: "networking",
    },
  ];

  const typeColors: Record<string, "primary" | "green" | "yellow" | "purple" | "blue"> = {
    keynote: "primary",
    workshop: "green",
    break: "yellow",
    panel: "purple",
    networking: "blue",
  };
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto mb-12 max-w-screen-md text-center">
      <Badge color="primary" large class="mb-4">March 15, 2024</Badge>
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Conference Schedule
      </h2>
      <p class="text-gray-500 dark:text-gray-400 lg:text-lg">
        A full day of inspiring talks, hands-on workshops, and networking opportunities
      </p>
    </div>

    <div class="mx-auto max-w-3xl">
      <div class="relative border-l-2 border-gray-200 dark:border-gray-700">
        {#each events as event}
          <div class="mb-10 ml-6">
            <div class="absolute -left-3 flex h-6 w-6 items-center justify-center rounded-full bg-primary-600 ring-8 ring-white dark:ring-gray-900">
              <div class="h-2 w-2 rounded-full bg-white"></div>
            </div>
            <div class="rounded-lg border border-gray-200 bg-gray-50 p-6 dark:border-gray-700 dark:bg-gray-800">
              <div class="mb-3 flex flex-wrap items-center justify-between gap-2">
                <div class="flex items-center gap-3">
                  <span class="text-sm font-medium text-gray-500 dark:text-gray-400">{event.time}</span>
                  <Badge color={typeColors[event.type]}>{event.type}</Badge>
                </div>
                <span class="text-sm text-gray-500 dark:text-gray-400">{event.location}</span>
              </div>
              <h3 class="mb-2 text-lg font-bold text-gray-900 dark:text-white">{event.title}</h3>
              <p class="mb-4 text-gray-500 dark:text-gray-400">{event.description}</p>
              {#if event.speaker}
                <div class="flex items-center gap-3">
                  <Avatar src={event.speaker.avatar} rounded size="sm" />
                  <div>
                    <p class="text-sm font-medium text-gray-900 dark:text-white">{event.speaker.name}</p>
                    <p class="text-xs text-gray-500 dark:text-gray-400">{event.speaker.role}</p>
                  </div>
                </div>
              {/if}
            </div>
          </div>
        {/each}
      </div>
    </div>
  </div>
</section>
