<script lang="ts">
  import { Card, Avatar } from "flowbite-svelte";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Our team
      </h2>
      <p class="font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Explore the whole collection of open-source web components and elements built with the utility classes from Tailwind.
      </p>
    </div>
    <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
      <Card class="p-0">
        <div class="flex flex-col items-center p-10">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" alt="Bonnie Green" size="xl" class="mb-4" />
          <h3 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">Bonnie Green</h3>
          <span class="text-sm text-gray-500 dark:text-gray-400">CEO & Founder</span>
          <p class="mt-3 text-center text-gray-500 dark:text-gray-400">
            Bonnie drives the technical strategy of the platform and brand.
          </p>
          <div class="mt-4 flex space-x-3">
            <a href="#" class="inline-flex items-center rounded-lg border border-gray-300 bg-white px-4 py-2 text-center text-sm font-medium text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:border-gray-600 dark:bg-gray-800 dark:text-white dark:hover:border-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-700">
              Message
            </a>
          </div>
        </div>
      </Card>
      <Card class="p-0">
        <div class="flex flex-col items-center p-10">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" alt="Jese Leos" size="xl" class="mb-4" />
          <h3 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">Jese Leos</h3>
          <span class="text-sm text-gray-500 dark:text-gray-400">CTO</span>
          <p class="mt-3 text-center text-gray-500 dark:text-gray-400">
            Jese leads our engineering team to build the best products.
          </p>
          <div class="mt-4 flex space-x-3">
            <a href="#" class="inline-flex items-center rounded-lg border border-gray-300 bg-white px-4 py-2 text-center text-sm font-medium text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:border-gray-600 dark:bg-gray-800 dark:text-white dark:hover:border-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-700">
              Message
            </a>
          </div>
        </div>
      </Card>
      <Card class="p-0">
        <div class="flex flex-col items-center p-10">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/michael-gouch.png" alt="Michael Gough" size="xl" class="mb-4" />
          <h3 class="mb-1 text-xl font-medium text-gray-900 dark:text-white">Michael Gough</h3>
          <span class="text-sm text-gray-500 dark:text-gray-400">Senior Designer</span>
          <p class="mt-3 text-center text-gray-500 dark:text-gray-400">
            Michael creates beautiful interfaces that users love.
          </p>
          <div class="mt-4 flex space-x-3">
            <a href="#" class="inline-flex items-center rounded-lg border border-gray-300 bg-white px-4 py-2 text-center text-sm font-medium text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:border-gray-600 dark:bg-gray-800 dark:text-white dark:hover:border-gray-700 dark:hover:bg-gray-700 dark:focus:ring-gray-700">
              Message
            </a>
          </div>
        </div>
      </Card>
    </div>
  </div>
</section>
