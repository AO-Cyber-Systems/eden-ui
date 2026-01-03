<script lang="ts">
  import { Badge, Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  const posts = [
    {
      category: "Tutorial",
      categoryColor: "blue" as const,
      title: "How to quickly deploy a static website",
      excerpt: "Static websites are now used to bootstrap lots of websites and are becoming the basis for a variety of tools that even influence both web designers and developers.",
      author: "Jese Leos",
      date: "Aug 15, 2023",
      readTime: "16 min read",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png",
    },
    {
      category: "Article",
      categoryColor: "green" as const,
      title: "Our first project with React",
      excerpt: "Over the past year, Volosoft has undergone many changes! After switching to TypeScript, we've focused on creating a comprehensive front-end ecosystem.",
      author: "Bonnie Green",
      date: "Aug 12, 2023",
      readTime: "12 min read",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png",
    },
    {
      category: "Resource",
      categoryColor: "purple" as const,
      title: "Designing with Figma: A complete guide",
      excerpt: "A step-by-step guide that will help you design your first website or application using Figma and best practices for collaboration.",
      author: "Michael Gough",
      date: "Aug 10, 2023",
      readTime: "8 min read",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/michael-gouch.png",
    },
    {
      category: "Case Study",
      categoryColor: "yellow" as const,
      title: "Enterprise software: Our journey to $1M ARR",
      excerpt: "A detailed look at how we grew our enterprise software product to $1M in annual recurring revenue over 18 months.",
      author: "Roberta Casas",
      date: "Aug 5, 2023",
      readTime: "10 min read",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png",
    },
  ];
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
      <div>
        <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Blog Posts
        </h2>
        <p class="mt-1 text-gray-500 dark:text-gray-400">
          Deep dives into building great products
        </p>
      </div>
      <div class="flex gap-2">
        <Button color="light" size="sm">All</Button>
        <Button color="alternative" size="sm">Tutorials</Button>
        <Button color="alternative" size="sm">Articles</Button>
        <Button color="alternative" size="sm">Case Studies</Button>
      </div>
    </div>

    <div class="divide-y divide-gray-200 dark:divide-gray-700">
      {#each posts as post}
        <article class="py-8 first:pt-0 last:pb-0">
          <div class="flex flex-col gap-4 lg:flex-row lg:items-start lg:gap-8">
            <div class="flex-1">
              <div class="mb-2 flex items-center gap-4">
                <Badge color={post.categoryColor}>{post.category}</Badge>
                <span class="text-sm text-gray-500 dark:text-gray-400">{post.date}</span>
                <span class="text-sm text-gray-500 dark:text-gray-400">{post.readTime}</span>
              </div>
              <h3 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">
                <a href="#" class="hover:text-primary-600 dark:hover:text-primary-500">{post.title}</a>
              </h3>
              <p class="mb-4 text-gray-500 dark:text-gray-400">{post.excerpt}</p>
              <div class="flex items-center justify-between">
                <div class="flex items-center gap-3">
                  <img class="h-8 w-8 rounded-full" src={post.avatar} alt={post.author} />
                  <span class="text-sm font-medium text-gray-900 dark:text-white">{post.author}</span>
                </div>
                <a href="#" class="inline-flex items-center text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
                  Read more
                  <ArrowRightOutline class="ms-1 h-4 w-4" />
                </a>
              </div>
            </div>
          </div>
        </article>
      {/each}
    </div>

    <div class="mt-8 text-center">
      <Button color="light">
        Load more posts
      </Button>
    </div>
  </div>
</section>
