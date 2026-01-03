<script lang="ts">
  import { Rating, Star } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="flex flex-col items-center gap-8 lg:flex-row lg:justify-between">
      <div class="text-center lg:text-left">
        <h2 class="mb-2 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Loved by developers worldwide
        </h2>
        <p class="text-gray-500 dark:text-gray-400">
          Join over 100,000+ happy customers using our platform
        </p>
      </div>
      <div class="flex flex-wrap items-center justify-center gap-8 lg:gap-12">
        <div class="text-center">
          <div class="text-4xl font-bold text-gray-900 dark:text-white">4.9</div>
          <Rating total={5} rating={4.9} class="mt-1 justify-center">
            <Star size={20} fillPercent={100} />
          </Rating>
          <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">12,000+ reviews</p>
        </div>
        <div class="text-center">
          <div class="text-4xl font-bold text-gray-900 dark:text-white">100K+</div>
          <p class="mt-2 text-sm font-medium text-gray-600 dark:text-gray-300">Active Users</p>
        </div>
        <div class="text-center">
          <div class="text-4xl font-bold text-gray-900 dark:text-white">50+</div>
          <p class="mt-2 text-sm font-medium text-gray-600 dark:text-gray-300">Countries</p>
        </div>
        <div class="text-center">
          <div class="text-4xl font-bold text-gray-900 dark:text-white">99.9%</div>
          <p class="mt-2 text-sm font-medium text-gray-600 dark:text-gray-300">Uptime</p>
        </div>
      </div>
    </div>
  </div>
</section>
