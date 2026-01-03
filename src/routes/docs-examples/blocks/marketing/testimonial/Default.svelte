<script lang="ts">
  import { Avatar, Rating, Star } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Trusted by thousands of teams
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        See what our customers have to say about us.
      </p>
    </div>
    <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">
      <!-- Testimonial 1 -->
      <figure class="flex flex-col rounded-lg border border-gray-200 bg-gray-50 p-6 dark:border-gray-700 dark:bg-gray-800">
        <Rating total={5} rating={5} class="mb-4">
          <Star slot="star" class="h-5 w-5" />
        </Rating>
        <blockquote class="mb-4 flex-1">
          <p class="text-gray-500 dark:text-gray-400">
            "Flowbite is just awesome. It contains tons of predesigned components and pages starting from login screen to complex dashboard. Perfect choice for your next SaaS application."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/karen-nelson.png" alt="profile picture" size="sm" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Karen Nelson</div>
            <div class="text-sm text-gray-500 dark:text-gray-400">Developer at Open AI</div>
          </div>
        </figcaption>
      </figure>

      <!-- Testimonial 2 -->
      <figure class="flex flex-col rounded-lg border border-gray-200 bg-gray-50 p-6 dark:border-gray-700 dark:bg-gray-800">
        <Rating total={5} rating={5} class="mb-4">
          <Star slot="star" class="h-5 w-5" />
        </Rating>
        <blockquote class="mb-4 flex-1">
          <p class="text-gray-500 dark:text-gray-400">
            "The quality of the components and the attention to detail is unmatched. It has saved us countless hours of development time."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png" alt="profile picture" size="sm" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Roberta Casas</div>
            <div class="text-sm text-gray-500 dark:text-gray-400">Lead Designer at Dropbox</div>
          </div>
        </figcaption>
      </figure>

      <!-- Testimonial 3 -->
      <figure class="flex flex-col rounded-lg border border-gray-200 bg-gray-50 p-6 dark:border-gray-700 dark:bg-gray-800">
        <Rating total={5} rating={5} class="mb-4">
          <Star slot="star" class="h-5 w-5" />
        </Rating>
        <blockquote class="mb-4 flex-1">
          <p class="text-gray-500 dark:text-gray-400">
            "I was amazed at how quickly I could build a complete landing page. The documentation is clear and the components are super flexible."
          </p>
        </blockquote>
        <figcaption class="flex items-center space-x-3">
          <Avatar src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png" alt="profile picture" size="sm" />
          <div class="space-y-0.5 font-medium dark:text-white">
            <div>Jese Leos</div>
            <div class="text-sm text-gray-500 dark:text-gray-400">Software Engineer at Facebook</div>
          </div>
        </figcaption>
      </figure>
    </div>
  </div>
</section>
