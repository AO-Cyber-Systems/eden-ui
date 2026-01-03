<script lang="ts">
  import { Card, Button } from "flowbite-svelte";
  import { CheckCircleSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Designed for business teams like yours
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Here at Flowbite we focus on markets where technology, innovation, and capital can unlock long-term value and drive economic growth.
      </p>
    </div>
    <div class="space-y-8 sm:gap-6 lg:grid lg:grid-cols-3 lg:space-y-0 xl:gap-10">
      <!-- Starter -->
      <Card class="mx-auto flex max-w-lg flex-col p-6">
        <h3 class="mb-4 text-2xl font-semibold text-gray-900 dark:text-white">Starter</h3>
        <p class="font-light text-gray-500 sm:text-lg dark:text-gray-400">
          Best option for personal use & for your next project.
        </p>
        <div class="my-8 flex items-baseline justify-center">
          <span class="mr-2 text-5xl font-extrabold text-gray-900 dark:text-white">$29</span>
          <span class="text-gray-500 dark:text-gray-400">/month</span>
        </div>
        <ul class="mb-8 space-y-4">
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Individual configuration</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">No setup, or hidden fees</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Team size: <span class="font-semibold">1 developer</span></span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Premium support: <span class="font-semibold">6 months</span></span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Free updates: <span class="font-semibold">6 months</span></span>
          </li>
        </ul>
        <Button class="mt-auto">Get started</Button>
      </Card>

      <!-- Company -->
      <Card class="mx-auto flex max-w-lg flex-col bg-primary-600 p-6 text-white dark:bg-primary-700">
        <h3 class="mb-4 text-2xl font-semibold">Company</h3>
        <p class="font-light text-primary-100 sm:text-lg">
          Relevant for multiple users, extended & premium support.
        </p>
        <div class="my-8 flex items-baseline justify-center">
          <span class="mr-2 text-5xl font-extrabold">$99</span>
          <span class="text-primary-100">/month</span>
        </div>
        <ul class="mb-8 space-y-4">
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-white" />
            <span>Individual configuration</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-white" />
            <span>No setup, or hidden fees</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-white" />
            <span>Team size: <span class="font-semibold">10 developers</span></span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-white" />
            <span>Premium support: <span class="font-semibold">24 months</span></span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-white" />
            <span>Free updates: <span class="font-semibold">24 months</span></span>
          </li>
        </ul>
        <Button color="light" class="mt-auto">Get started</Button>
      </Card>

      <!-- Enterprise -->
      <Card class="mx-auto flex max-w-lg flex-col p-6">
        <h3 class="mb-4 text-2xl font-semibold text-gray-900 dark:text-white">Enterprise</h3>
        <p class="font-light text-gray-500 sm:text-lg dark:text-gray-400">
          Best for large scale uses and extended redistribution rights.
        </p>
        <div class="my-8 flex items-baseline justify-center">
          <span class="mr-2 text-5xl font-extrabold text-gray-900 dark:text-white">$499</span>
          <span class="text-gray-500 dark:text-gray-400">/month</span>
        </div>
        <ul class="mb-8 space-y-4">
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Individual configuration</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">No setup, or hidden fees</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Team size: <span class="font-semibold">100+ developers</span></span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Premium support: <span class="font-semibold">36 months</span></span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Free updates: <span class="font-semibold">36 months</span></span>
          </li>
        </ul>
        <Button class="mt-auto">Get started</Button>
      </Card>
    </div>
  </div>
</section>
