<script lang="ts">
  import { Card, Badge, Avatar } from "flowbite-svelte";

  const posts = [
    {
      category: "Engineering",
      categoryColor: "blue" as const,
      title: "Building a design system from scratch",
      excerpt: "Learn how we built our design system to maintain consistency across all our products.",
      author: "Jese Leos",
      role: "Lead Developer",
      date: "Aug 15",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png",
    },
    {
      category: "Product",
      categoryColor: "green" as const,
      title: "What's new in v3.0",
      excerpt: "A deep dive into all the new features and improvements in our latest major release.",
      author: "Bonnie Green",
      role: "Product Manager",
      date: "Aug 12",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png",
    },
    {
      category: "Design",
      categoryColor: "purple" as const,
      title: "The psychology of color in UI",
      excerpt: "Understanding how color choices affect user behavior and product perception.",
      author: "Roberta Casas",
      role: "UI Designer",
      date: "Aug 10",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png",
    },
    {
      category: "Culture",
      categoryColor: "yellow" as const,
      title: "How we work remotely",
      excerpt: "Our approach to building a thriving company culture with a distributed team.",
      author: "Michael Gough",
      role: "HR Lead",
      date: "Aug 8",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/michael-gouch.png",
    },
  ];
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto mb-12 max-w-screen-md text-center">
      <Badge color="primary" large class="mb-4">Blog</Badge>
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Read our latest updates
      </h2>
      <p class="font-light text-gray-500 dark:text-gray-400 sm:text-xl">
        Thoughts, stories, and ideas from our team
      </p>
    </div>
    <div class="grid gap-6 md:grid-cols-2">
      {#each posts as post}
        <Card class="transition-shadow hover:shadow-lg">
          <div class="flex items-center justify-between">
            <Badge color={post.categoryColor}>{post.category}</Badge>
            <span class="text-sm text-gray-500 dark:text-gray-400">{post.date}</span>
          </div>
          <h3 class="mt-4 text-xl font-bold text-gray-900 dark:text-white">
            <a href="#" class="hover:text-primary-600 dark:hover:text-primary-500">{post.title}</a>
          </h3>
          <p class="mt-2 text-gray-500 dark:text-gray-400">{post.excerpt}</p>
          <div class="mt-4 flex items-center gap-3 border-t border-gray-200 pt-4 dark:border-gray-700">
            <Avatar src={post.avatar} rounded />
            <div>
              <p class="text-sm font-medium text-gray-900 dark:text-white">{post.author}</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">{post.role}</p>
            </div>
          </div>
        </Card>
      {/each}
    </div>
  </div>
</section>
