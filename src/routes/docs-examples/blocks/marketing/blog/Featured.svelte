<script lang="ts">
  import { Badge, Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mb-8 flex items-center justify-between">
      <div>
        <h2 class="text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Latest Articles
        </h2>
        <p class="mt-2 text-gray-500 dark:text-gray-400">
          Insights and updates from our team
        </p>
      </div>
      <Button color="light">
        View all articles
        <ArrowRightOutline class="ms-2 h-4 w-4" />
      </Button>
    </div>

    <div class="grid gap-8 lg:grid-cols-2">
      <!-- Featured Article -->
      <article class="group relative overflow-hidden rounded-xl">
        <img
          class="h-96 w-full object-cover transition-transform duration-300 group-hover:scale-105"
          src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-1.jpg"
          alt="Featured article"
        />
        <div class="absolute inset-0 bg-gradient-to-t from-gray-900/90 via-gray-900/50 to-transparent"></div>
        <div class="absolute bottom-0 left-0 p-6 lg:p-8">
          <Badge color="primary" class="mb-4">Featured</Badge>
          <h3 class="mb-2 text-2xl font-bold text-white lg:text-3xl">
            <a href="#">The future of web development in 2024</a>
          </h3>
          <p class="mb-4 text-gray-300">
            Explore the emerging trends and technologies shaping the web development landscape.
          </p>
          <div class="flex items-center gap-3">
            <img
              class="h-10 w-10 rounded-full"
              src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png"
              alt="Author"
            />
            <div class="text-sm">
              <p class="font-medium text-white">Bonnie Green</p>
              <p class="text-gray-400">Aug 15, 2023 · 10 min read</p>
            </div>
          </div>
        </div>
      </article>

      <!-- Side Articles -->
      <div class="flex flex-col gap-6">
        <article class="flex gap-4 rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <img
            class="h-24 w-24 rounded-lg object-cover"
            src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-2.jpg"
            alt="Article"
          />
          <div class="flex-1">
            <Badge color="blue" class="mb-2">Tutorial</Badge>
            <h4 class="mb-1 font-bold text-gray-900 dark:text-white">
              <a href="#" class="hover:text-primary-600">Getting started with Svelte 5</a>
            </h4>
            <p class="text-sm text-gray-500 dark:text-gray-400">Aug 12, 2023 · 5 min read</p>
          </div>
        </article>
        <article class="flex gap-4 rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <img
            class="h-24 w-24 rounded-lg object-cover"
            src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/blog/image-3.jpg"
            alt="Article"
          />
          <div class="flex-1">
            <Badge color="green" class="mb-2">Case Study</Badge>
            <h4 class="mb-1 font-bold text-gray-900 dark:text-white">
              <a href="#" class="hover:text-primary-600">How we scaled to 1M users</a>
            </h4>
            <p class="text-sm text-gray-500 dark:text-gray-400">Aug 10, 2023 · 8 min read</p>
          </div>
        </article>
        <article class="flex gap-4 rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <img
            class="h-24 w-24 rounded-lg object-cover"
            src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/content-gallery-3.png"
            alt="Article"
          />
          <div class="flex-1">
            <Badge color="purple" class="mb-2">Design</Badge>
            <h4 class="mb-1 font-bold text-gray-900 dark:text-white">
              <a href="#" class="hover:text-primary-600">Building accessible components</a>
            </h4>
            <p class="text-sm text-gray-500 dark:text-gray-400">Aug 8, 2023 · 6 min read</p>
          </div>
        </article>
        <article class="flex gap-4 rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <img
            class="h-24 w-24 rounded-lg object-cover"
            src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/content/office-long-1.png"
            alt="Article"
          />
          <div class="flex-1">
            <Badge color="yellow" class="mb-2">News</Badge>
            <h4 class="mb-1 font-bold text-gray-900 dark:text-white">
              <a href="#" class="hover:text-primary-600">Our Series A announcement</a>
            </h4>
            <p class="text-sm text-gray-500 dark:text-gray-400">Aug 5, 2023 · 3 min read</p>
          </div>
        </article>
      </div>
    </div>
  </div>
</section>
