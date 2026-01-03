<script lang="ts">
  import { Avatar, Badge } from "flowbite-svelte";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto max-w-screen-md text-center">
      <div class="mb-6 flex justify-center -space-x-4">
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" rounded size="lg" class="ring-4 ring-white dark:ring-gray-800" />
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" rounded size="lg" class="ring-4 ring-white dark:ring-gray-800" />
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/michael-gouch.png" rounded size="lg" class="ring-4 ring-white dark:ring-gray-800" />
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png" rounded size="lg" class="ring-4 ring-white dark:ring-gray-800" />
        <Avatar rounded size="lg" class="ring-4 ring-white dark:ring-gray-800">
          <span class="text-sm font-medium text-gray-600 dark:text-gray-300">+99</span>
        </Avatar>
      </div>
      <div class="mb-4 flex items-center justify-center gap-1">
        {#each Array(5) as _}
          <svg class="h-5 w-5 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
          </svg>
        {/each}
        <span class="ml-2 text-sm text-gray-500 dark:text-gray-400">4.95 out of 5</span>
      </div>
      <h3 class="mb-2 text-xl font-bold text-gray-900 dark:text-white">
        Trusted by 100,000+ developers
      </h3>
      <p class="text-gray-500 dark:text-gray-400">
        From startups to Fortune 500 companies, teams rely on our platform
      </p>
      <div class="mt-6 flex flex-wrap justify-center gap-4">
        <Badge color="green" large>✓ Free to start</Badge>
        <Badge color="blue" large>✓ No credit card required</Badge>
        <Badge color="purple" large>✓ Cancel anytime</Badge>
      </div>
    </div>
  </div>
</section>
