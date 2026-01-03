<script lang="ts">
  import { Card, Badge, Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  const projects = [
    {
      title: "E-commerce Platform",
      client: "TechStore Inc.",
      description: "A complete e-commerce solution with inventory management, payment processing, and real-time analytics.",
      tags: ["React", "Node.js", "PostgreSQL"],
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png",
    },
    {
      title: "Healthcare Portal",
      client: "MediCare Systems",
      description: "Patient management system with appointment scheduling, medical records, and telemedicine integration.",
      tags: ["Vue.js", "Python", "MongoDB"],
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-1.jpg",
    },
    {
      title: "FinTech Mobile App",
      client: "PayFlow",
      description: "Mobile banking application with secure transactions, budgeting tools, and investment tracking.",
      tags: ["React Native", "Go", "Redis"],
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-2.jpg",
    },
  ];
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mb-12 flex flex-col items-start justify-between gap-4 lg:flex-row lg:items-center">
      <div>
        <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Case Studies
        </h2>
        <p class="mt-2 text-gray-500 dark:text-gray-400">
          Explore how we've helped our clients achieve their goals
        </p>
      </div>
      <Button color="light">
        View all projects
        <ArrowRightOutline class="ms-2 h-4 w-4" />
      </Button>
    </div>

    <div class="grid gap-8 lg:grid-cols-3">
      {#each projects as project}
        <Card class="overflow-hidden">
          <img src={project.image} alt={project.title} class="-mx-6 -mt-6 mb-4 h-48 w-[calc(100%+3rem)] object-cover" />
          <div class="mb-3 flex flex-wrap gap-2">
            {#each project.tags as tag}
              <Badge color="primary">{tag}</Badge>
            {/each}
          </div>
          <h3 class="mb-1 text-xl font-bold text-gray-900 dark:text-white">{project.title}</h3>
          <p class="mb-3 text-sm text-primary-600 dark:text-primary-500">{project.client}</p>
          <p class="mb-4 text-gray-500 dark:text-gray-400">{project.description}</p>
          <a href="#" class="inline-flex items-center text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
            Read case study
            <ArrowRightOutline class="ms-1 h-4 w-4" />
          </a>
        </Card>
      {/each}
    </div>
  </div>
</section>
