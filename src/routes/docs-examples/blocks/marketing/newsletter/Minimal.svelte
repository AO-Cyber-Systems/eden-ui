<script lang="ts">
  import { Input, Button } from "flowbite-svelte";
</script>

<section class="border-t border-b border-gray-200 bg-white py-8 dark:border-gray-700 dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 lg:px-6">
    <div class="flex flex-col items-center justify-between gap-6 lg:flex-row">
      <div class="text-center lg:text-left">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">
          Stay in the loop
        </h3>
        <p class="text-gray-500 dark:text-gray-400">
          Get notified about updates and be the first to know when new features are released.
        </p>
      </div>
      <form action="#" class="flex w-full max-w-md gap-3">
        <Input type="email" placeholder="Enter your email" class="flex-1" required />
        <Button type="submit">Subscribe</Button>
      </form>
    </div>
  </div>
</section>
