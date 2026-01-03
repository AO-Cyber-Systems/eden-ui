<script lang="ts">
  import { Card, Badge, Button, Avatar } from "flowbite-svelte";
  import { CalendarMonthSolid, MapPinSolid, ClockSolid } from "flowbite-svelte-icons";

  const events = [
    {
      date: "Mar 15",
      month: "2024",
      title: "Web Development Summit",
      description: "Join industry experts for a day of learning about modern web technologies.",
      time: "9:00 AM - 5:00 PM",
      location: "San Francisco, CA",
      attendees: 500,
      price: "$299",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png",
    },
    {
      date: "Mar 22",
      month: "2024",
      title: "Design Systems Workshop",
      description: "A hands-on workshop covering design tokens, component libraries, and documentation.",
      time: "10:00 AM - 4:00 PM",
      location: "Online",
      attendees: 200,
      price: "Free",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-1.jpg",
    },
    {
      date: "Apr 5",
      month: "2024",
      title: "Cloud Native Conference",
      description: "Deep dive into Kubernetes, microservices, and cloud-native architectures.",
      time: "8:00 AM - 6:00 PM",
      location: "Seattle, WA",
      attendees: 1000,
      price: "$399",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-2.jpg",
    },
    {
      date: "Apr 12",
      month: "2024",
      title: "AI/ML Hackathon",
      description: "48-hour hackathon focused on building AI-powered applications.",
      time: "Fri 6PM - Sun 6PM",
      location: "New York, NY",
      attendees: 150,
      price: "$50",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-3.jpg",
    },
  ];
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mb-12 flex flex-col items-start justify-between gap-4 lg:flex-row lg:items-center">
      <div>
        <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Upcoming Events
        </h2>
        <p class="mt-2 text-gray-500 dark:text-gray-400">
          Join us at our upcoming conferences, workshops, and meetups
        </p>
      </div>
      <Button>View calendar</Button>
    </div>

    <div class="grid gap-6 md:grid-cols-2">
      {#each events as event}
        <Card class="flex-row overflow-hidden">
          <div class="flex">
            <!-- Date Badge -->
            <div class="flex w-24 shrink-0 flex-col items-center justify-center bg-primary-600 p-4 text-white">
              <span class="text-3xl font-bold">{event.date.split(" ")[1]}</span>
              <span class="text-sm uppercase">{event.date.split(" ")[0]}</span>
            </div>
            <!-- Content -->
            <div class="flex-1 p-4">
              <div class="mb-2 flex flex-wrap items-center gap-2">
                <Badge color={event.price === "Free" ? "green" : "primary"}>{event.price}</Badge>
                <span class="text-sm text-gray-500 dark:text-gray-400">{event.attendees} attending</span>
              </div>
              <h3 class="mb-2 text-lg font-bold text-gray-900 dark:text-white">{event.title}</h3>
              <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">{event.description}</p>
              <div class="flex flex-wrap gap-4 text-sm text-gray-500 dark:text-gray-400">
                <span class="flex items-center gap-1">
                  <ClockSolid class="h-4 w-4" />
                  {event.time}
                </span>
                <span class="flex items-center gap-1">
                  <MapPinSolid class="h-4 w-4" />
                  {event.location}
                </span>
              </div>
            </div>
          </div>
        </Card>
      {/each}
    </div>
  </div>
</section>
