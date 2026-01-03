<script lang="ts">
  import { Badge, Button } from "flowbite-svelte";

  let activeFilter = $state("all");

  const projects = [
    { id: 1, title: "E-commerce Platform", category: "web", image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png" },
    { id: 2, title: "Mobile Banking App", category: "mobile", image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/office-long-1.png" },
    { id: 3, title: "Brand Identity", category: "design", image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-1.jpg" },
    { id: 4, title: "SaaS Dashboard", category: "web", image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-2.jpg" },
    { id: 5, title: "Fitness Tracker", category: "mobile", image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-3.jpg" },
    { id: 6, title: "Marketing Website", category: "design", image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png" },
  ];

  const filteredProjects = $derived(
    activeFilter === "all" ? projects : projects.filter(p => p.category === activeFilter)
  );
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto mb-12 max-w-screen-md text-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Our Work
      </h2>
      <p class="text-gray-500 dark:text-gray-400 lg:text-lg">
        Explore our latest projects and see how we've helped our clients succeed
      </p>
    </div>

    <!-- Filters -->
    <div class="mb-8 flex flex-wrap justify-center gap-2">
      <Button
        color={activeFilter === "all" ? "primary" : "alternative"}
        size="sm"
        onclick={() => activeFilter = "all"}
      >
        All
      </Button>
      <Button
        color={activeFilter === "web" ? "primary" : "alternative"}
        size="sm"
        onclick={() => activeFilter = "web"}
      >
        Web Development
      </Button>
      <Button
        color={activeFilter === "mobile" ? "primary" : "alternative"}
        size="sm"
        onclick={() => activeFilter = "mobile"}
      >
        Mobile Apps
      </Button>
      <Button
        color={activeFilter === "design" ? "primary" : "alternative"}
        size="sm"
        onclick={() => activeFilter = "design"}
      >
        Design
      </Button>
    </div>

    <!-- Projects Grid -->
    <div class="grid gap-6 sm:grid-cols-2 lg:grid-cols-3">
      {#each filteredProjects as project}
        <a href="#" class="group overflow-hidden rounded-lg">
          <div class="relative aspect-video overflow-hidden">
            <img
              src={project.image}
              alt={project.title}
              class="h-full w-full object-cover transition-transform duration-300 group-hover:scale-110"
            />
            <div class="absolute inset-0 bg-gray-900/60 opacity-0 transition-opacity group-hover:opacity-100">
              <div class="flex h-full items-center justify-center">
                <span class="rounded-full bg-white px-4 py-2 text-sm font-medium text-gray-900">
                  View Project
                </span>
              </div>
            </div>
          </div>
          <div class="mt-4">
            <Badge color="primary" class="mb-2">{project.category}</Badge>
            <h3 class="font-bold text-gray-900 dark:text-white">{project.title}</h3>
          </div>
        </a>
      {/each}
    </div>
  </div>
</section>
