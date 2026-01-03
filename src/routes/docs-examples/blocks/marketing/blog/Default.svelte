<script lang="ts">
  import { Badge } from "flowbite-svelte";

  const posts = [
    {
      category: "Tutorial",
      title: "How to quickly deploy a static website",
      excerpt: "Static websites are now used to bootstrap lots of websites and are becoming the basis for a variety of tools that even influence both web designers and developers.",
      author: "Jese Leos",
      date: "Aug 15, 2023",
      readTime: "16 min read",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-1.jpg",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png",
    },
    {
      category: "Article",
      title: "Our first project with React",
      excerpt: "Over the past year, Volosoft has undergone many changes! After switching to TypeScript, we've focused on creating a comprehensive front-end ecosystem.",
      author: "Bonnie Green",
      date: "Aug 12, 2023",
      readTime: "12 min read",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-2.jpg",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png",
    },
    {
      category: "Resource",
      title: "Designing with Figma: A complete guide",
      excerpt: "A step-by-step guide that will help you design your first website or application using Figma and best practices for collaboration.",
      author: "Michael Gough",
      date: "Aug 10, 2023",
      readTime: "8 min read",
      image: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-3.jpg",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/michael-gouch.png",
    },
  ];
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto mb-8 max-w-screen-sm text-center lg:mb-12">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Our Blog
      </h2>
      <p class="font-light text-gray-500 dark:text-gray-400 sm:text-xl">
        We use an agile approach to test assumptions and connect with the needs of your audience early and often.
      </p>
    </div>
    <div class="grid gap-8 lg:grid-cols-3">
      {#each posts as post}
        <article class="overflow-hidden rounded-lg border border-gray-200 bg-white shadow-md dark:border-gray-700 dark:bg-gray-800">
          <a href="#">
            <img class="h-48 w-full object-cover" src={post.image} alt={post.title} />
          </a>
          <div class="p-6">
            <div class="mb-4 flex items-center justify-between">
              <Badge color="primary">{post.category}</Badge>
              <span class="text-sm text-gray-500 dark:text-gray-400">{post.readTime}</span>
            </div>
            <h3 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">
              <a href="#">{post.title}</a>
            </h3>
            <p class="mb-4 text-gray-500 dark:text-gray-400">{post.excerpt}</p>
            <div class="flex items-center gap-3">
              <img class="h-8 w-8 rounded-full" src={post.avatar} alt={post.author} />
              <div class="text-sm">
                <p class="font-medium text-gray-900 dark:text-white">{post.author}</p>
                <p class="text-gray-500 dark:text-gray-400">{post.date}</p>
              </div>
            </div>
          </div>
        </article>
      {/each}
    </div>
  </div>
</section>
