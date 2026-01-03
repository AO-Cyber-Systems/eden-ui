<script lang="ts">
  import { Button, Input } from "flowbite-svelte";
</script>

<section class="flex min-h-screen items-center bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto max-w-screen-md text-center">
      <div class="mb-8">
        <svg class="mx-auto h-24 w-24 text-primary-600 dark:text-primary-500" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z" />
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
        </svg>
      </div>
      <h1 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 md:text-4xl dark:text-white">
        Under Maintenance
      </h1>
      <p class="mb-8 text-lg font-light text-gray-500 dark:text-gray-400">
        We're currently performing scheduled maintenance. We'll be back online shortly. Thank you for your patience.
      </p>
      <div class="mb-8">
        <div class="flex items-center justify-center gap-4 text-2xl font-bold text-gray-900 dark:text-white">
          <div class="text-center">
            <div class="rounded-lg bg-white p-4 shadow dark:bg-gray-900">02</div>
            <span class="mt-2 block text-sm font-normal text-gray-500">Hours</span>
          </div>
          <span>:</span>
          <div class="text-center">
            <div class="rounded-lg bg-white p-4 shadow dark:bg-gray-900">45</div>
            <span class="mt-2 block text-sm font-normal text-gray-500">Minutes</span>
          </div>
          <span>:</span>
          <div class="text-center">
            <div class="rounded-lg bg-white p-4 shadow dark:bg-gray-900">30</div>
            <span class="mt-2 block text-sm font-normal text-gray-500">Seconds</span>
          </div>
        </div>
      </div>
      <div class="mx-auto max-w-md">
        <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
          Get notified when we're back online:
        </p>
        <form class="flex gap-2">
          <Input type="email" placeholder="Enter your email" class="flex-1" />
          <Button type="submit">Notify me</Button>
        </form>
      </div>
    </div>
  </div>
</section>
