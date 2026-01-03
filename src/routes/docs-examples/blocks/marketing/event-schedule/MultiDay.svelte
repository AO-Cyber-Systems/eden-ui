<script lang="ts">
  import { Tabs, TabItem, Badge, Avatar } from "flowbite-svelte";

  const schedule = {
    day1: [
      { time: "9:00 AM", title: "Opening Ceremony", speaker: "John Doe", type: "keynote" },
      { time: "10:30 AM", title: "Web Performance Workshop", speaker: "Jane Smith", type: "workshop" },
      { time: "1:00 PM", title: "Lunch Break", speaker: "", type: "break" },
      { time: "2:00 PM", title: "API Design Patterns", speaker: "Mike Johnson", type: "talk" },
      { time: "4:00 PM", title: "Networking Hour", speaker: "", type: "networking" },
    ],
    day2: [
      { time: "9:00 AM", title: "Cloud Architecture", speaker: "Sarah Lee", type: "talk" },
      { time: "10:30 AM", title: "Security Best Practices", speaker: "Tom Wilson", type: "workshop" },
      { time: "1:00 PM", title: "Lunch Break", speaker: "", type: "break" },
      { time: "2:00 PM", title: "Panel: Future of AI", speaker: "Various Speakers", type: "panel" },
      { time: "4:00 PM", title: "Closing Keynote", speaker: "CEO", type: "keynote" },
    ],
    day3: [
      { time: "9:00 AM", title: "Hands-on Lab: Kubernetes", speaker: "DevOps Team", type: "workshop" },
      { time: "12:00 PM", title: "Hackathon Kickoff", speaker: "", type: "hackathon" },
      { time: "6:00 PM", title: "Hackathon Presentations", speaker: "", type: "hackathon" },
      { time: "7:00 PM", title: "Awards Ceremony", speaker: "", type: "ceremony" },
    ],
  };

  const typeColors: Record<string, "primary" | "green" | "yellow" | "purple" | "blue" | "red"> = {
    keynote: "primary",
    workshop: "green",
    break: "yellow",
    talk: "blue",
    panel: "purple",
    networking: "blue",
    hackathon: "red",
    ceremony: "primary",
  };
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto mb-12 max-w-screen-md text-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        DevCon 2024
      </h2>
      <p class="text-gray-500 dark:text-gray-400 lg:text-lg">
        March 15-17, 2024 · San Francisco, CA
      </p>
    </div>

    <Tabs style="pill" contentClass="mt-8">
      <TabItem open title="Day 1 - March 15">
        <div class="grid gap-4">
          {#each schedule.day1 as event}
            <div class="flex items-center gap-4 rounded-lg bg-white p-4 shadow dark:bg-gray-900">
              <div class="w-20 shrink-0 text-center">
                <span class="text-sm font-medium text-gray-900 dark:text-white">{event.time}</span>
              </div>
              <div class="flex-1">
                <h4 class="font-medium text-gray-900 dark:text-white">{event.title}</h4>
                {#if event.speaker}
                  <p class="text-sm text-gray-500 dark:text-gray-400">{event.speaker}</p>
                {/if}
              </div>
              <Badge color={typeColors[event.type]}>{event.type}</Badge>
            </div>
          {/each}
        </div>
      </TabItem>
      <TabItem title="Day 2 - March 16">
        <div class="grid gap-4">
          {#each schedule.day2 as event}
            <div class="flex items-center gap-4 rounded-lg bg-white p-4 shadow dark:bg-gray-900">
              <div class="w-20 shrink-0 text-center">
                <span class="text-sm font-medium text-gray-900 dark:text-white">{event.time}</span>
              </div>
              <div class="flex-1">
                <h4 class="font-medium text-gray-900 dark:text-white">{event.title}</h4>
                {#if event.speaker}
                  <p class="text-sm text-gray-500 dark:text-gray-400">{event.speaker}</p>
                {/if}
              </div>
              <Badge color={typeColors[event.type]}>{event.type}</Badge>
            </div>
          {/each}
        </div>
      </TabItem>
      <TabItem title="Day 3 - March 17">
        <div class="grid gap-4">
          {#each schedule.day3 as event}
            <div class="flex items-center gap-4 rounded-lg bg-white p-4 shadow dark:bg-gray-900">
              <div class="w-20 shrink-0 text-center">
                <span class="text-sm font-medium text-gray-900 dark:text-white">{event.time}</span>
              </div>
              <div class="flex-1">
                <h4 class="font-medium text-gray-900 dark:text-white">{event.title}</h4>
                {#if event.speaker}
                  <p class="text-sm text-gray-500 dark:text-gray-400">{event.speaker}</p>
                {/if}
              </div>
              <Badge color={typeColors[event.type]}>{event.type}</Badge>
            </div>
          {/each}
        </div>
      </TabItem>
    </Tabs>
  </div>
</section>
