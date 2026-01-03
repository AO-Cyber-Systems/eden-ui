<script lang="ts">
  import { Avatar, Rating, Star } from "flowbite-svelte";
  import { QuoteSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <figure class="mx-auto max-w-screen-lg text-center">
      <QuoteSolid class="mx-auto mb-6 h-10 w-10 text-gray-400 dark:text-gray-600" />
      <blockquote>
        <p class="text-xl font-medium text-gray-900 md:text-2xl dark:text-white">
          "Flowbite is just awesome. It contains tons of predesigned components and pages starting from login screen to complex dashboard. Perfect choice for your next SaaS application."
        </p>
      </blockquote>
      <figcaption class="mt-6 flex items-center justify-center space-x-3">
        <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/michael-gouch.png" alt="profile picture" />
        <div class="flex items-center divide-x divide-gray-500 dark:divide-gray-700">
          <div class="pr-3 font-medium text-gray-900 dark:text-white">Michael Gough</div>
          <div class="pl-3 text-sm text-gray-500 dark:text-gray-400">CEO at Google</div>
        </div>
      </figcaption>
    </figure>
  </div>
</section>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="grid gap-8 md:grid-cols-2">
      <!-- Large testimonial -->
      <figure class="flex flex-col justify-center rounded-lg border border-gray-200 bg-gray-50 p-8 dark:border-gray-700 dark:bg-gray-800">
        <Rating total={5} rating={5} class="mb-4">
          <Star slot="star" class="h-5 w-5" />
        </Rating>
        <blockquote class="mb-4">
          <p class="text-lg text-gray-500 dark:text-gray-400">
            "We've been using Flowbite for the past year and it has completely transformed our development workflow. The component library is extensive and well-documented."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" alt="profile picture" size="md" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Bonnie Green</div>
            <div class="text-sm text-gray-500 dark:text-gray-400">CTO at Microsoft</div>
          </div>
        </figcaption>
      </figure>

      <!-- Smaller testimonials -->
      <div class="space-y-8">
        <figure class="rounded-lg border border-gray-200 bg-gray-50 p-6 dark:border-gray-700 dark:bg-gray-800">
          <Rating total={5} rating={5} class="mb-3">
            <Star slot="star" class="h-4 w-4" />
          </Rating>
          <blockquote class="mb-3">
            <p class="text-gray-500 dark:text-gray-400">
              "The attention to detail in every component is impressive. Highly recommended!"
            </p>
          </blockquote>
          <figcaption class="flex items-center space-x-3">
            <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/karen-nelson.png" alt="profile picture" size="sm" />
            <div class="space-y-0.5 font-medium dark:text-white">
              <div>Karen Nelson</div>
              <div class="text-sm text-gray-500 dark:text-gray-400">Developer at OpenAI</div>
            </div>
          </figcaption>
        </figure>

        <figure class="rounded-lg border border-gray-200 bg-gray-50 p-6 dark:border-gray-700 dark:bg-gray-800">
          <Rating total={5} rating={4} class="mb-3">
            <Star slot="star" class="h-4 w-4" />
          </Rating>
          <blockquote class="mb-3">
            <p class="text-gray-500 dark:text-gray-400">
              "Saved us months of development time. The ROI is incredible."
            </p>
          </blockquote>
          <figcaption class="flex items-center space-x-3">
            <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" alt="profile picture" size="sm" />
            <div class="space-y-0.5 font-medium dark:text-white">
              <div>Jese Leos</div>
              <div class="text-sm text-gray-500 dark:text-gray-400">VP of Engineering at Stripe</div>
            </div>
          </figcaption>
        </figure>
      </div>
    </div>
  </div>
</section>
