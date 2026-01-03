<script lang="ts">
  import { Avatar } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Loved by teams at
      </h2>
    </div>

    <!-- Logos -->
    <div class="mb-12 flex flex-wrap items-center justify-center gap-8 grayscale opacity-50">
      <svg class="h-8" viewBox="0 0 125 35" fill="currentColor">
        <path d="M19.5 0C8.7 0 0 8.7 0 19.5S8.7 39 19.5 39 39 30.3 39 19.5 30.3 0 19.5 0zm0 29.2c-5.4 0-9.7-4.3-9.7-9.7s4.3-9.7 9.7-9.7 9.7 4.3 9.7 9.7-4.3 9.7-9.7 9.7z"/>
        <text x="45" y="28" font-size="24" font-weight="bold">Google</text>
      </svg>
      <svg class="h-8" viewBox="0 0 125 35" fill="currentColor">
        <text x="0" y="28" font-size="24" font-weight="bold">Microsoft</text>
      </svg>
      <svg class="h-8" viewBox="0 0 100 35" fill="currentColor">
        <text x="0" y="28" font-size="24" font-weight="bold">Spotify</text>
      </svg>
      <svg class="h-8" viewBox="0 0 100 35" fill="currentColor">
        <text x="0" y="28" font-size="24" font-weight="bold">Airbnb</text>
      </svg>
    </div>

    <!-- Testimonials -->
    <div class="grid gap-8 md:grid-cols-3">
      <figure class="flex flex-col p-6">
        <blockquote class="mb-4 flex-1">
          <p class="text-gray-500 dark:text-gray-400">
            "Flowbite has completely transformed how we build user interfaces. The components are well-designed and easy to customize."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3 border-t border-gray-200 pt-4 dark:border-gray-700">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/karen-nelson.png" alt="profile picture" size="sm" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Karen Nelson</div>
            <div class="flex items-center text-sm text-gray-500 dark:text-gray-400">
              <span>Developer at</span>
              <span class="ml-1 font-semibold text-gray-900 dark:text-white">Google</span>
            </div>
          </div>
        </figcaption>
      </figure>

      <figure class="flex flex-col p-6">
        <blockquote class="mb-4 flex-1">
          <p class="text-gray-500 dark:text-gray-400">
            "The documentation is excellent and the component quality is outstanding. It's become an essential part of our tech stack."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3 border-t border-gray-200 pt-4 dark:border-gray-700">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png" alt="profile picture" size="sm" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Roberta Casas</div>
            <div class="flex items-center text-sm text-gray-500 dark:text-gray-400">
              <span>Lead Designer at</span>
              <span class="ml-1 font-semibold text-gray-900 dark:text-white">Microsoft</span>
            </div>
          </div>
        </figcaption>
      </figure>

      <figure class="flex flex-col p-6">
        <blockquote class="mb-4 flex-1">
          <p class="text-gray-500 dark:text-gray-400">
            "We've tried many UI libraries but Flowbite stands out for its attention to detail and developer experience."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3 border-t border-gray-200 pt-4 dark:border-gray-700">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" alt="profile picture" size="sm" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Jese Leos</div>
            <div class="flex items-center text-sm text-gray-500 dark:text-gray-400">
              <span>Engineer at</span>
              <span class="ml-1 font-semibold text-gray-900 dark:text-white">Spotify</span>
            </div>
          </div>
        </figcaption>
      </figure>
    </div>
  </div>
</section>
