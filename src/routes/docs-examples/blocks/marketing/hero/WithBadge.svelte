<script lang="ts">
  import { Button, Badge, Avatar } from "flowbite-svelte";
  import { ArrowRightOutline, StarSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 text-center lg:py-16">
    <div class="mb-6 inline-flex items-center gap-2">
      <Badge large color="yellow" class="flex items-center gap-1 rounded-full px-3 py-1">
        <StarSolid class="h-4 w-4" />
        <span>4.9</span>
      </Badge>
      <span class="text-sm text-gray-500 dark:text-gray-400">Trusted by 10,000+ customers</span>
    </div>
    <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
      The best way to build modern websites
    </h1>
    <p class="mb-8 text-lg font-normal text-gray-500 sm:px-16 lg:px-48 lg:text-xl dark:text-gray-400">
      Flowbite helps you build beautiful, responsive websites quickly using Tailwind CSS and Svelte components.
    </p>
    <div class="mb-8 flex flex-col space-y-4 sm:flex-row sm:justify-center sm:space-y-0 sm:space-x-4">
      <Button size="lg">
        Start free trial
        <ArrowRightOutline class="ml-2 h-5 w-5" />
      </Button>
      <Button size="lg" color="alternative">
        View pricing
      </Button>
    </div>
    <div class="flex items-center justify-center gap-2">
      <div class="flex -space-x-4">
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" rounded size="sm" />
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" rounded size="sm" />
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png" rounded size="sm" />
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/thomas-lean.png" rounded size="sm" />
      </div>
      <span class="text-sm text-gray-500 dark:text-gray-400">Join 10,000+ happy users</span>
    </div>
  </div>
</section>
