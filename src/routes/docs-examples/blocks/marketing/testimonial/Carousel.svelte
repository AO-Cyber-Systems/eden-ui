<script lang="ts">
  import { Avatar, Button } from "flowbite-svelte";
  import { ChevronLeftOutline, ChevronRightOutline, QuoteSolid } from "flowbite-svelte-icons";

  const testimonials = [
    {
      quote: "Flowbite is just awesome. It contains tons of predesigned components and pages starting from login screen to complex dashboard. Perfect choice for your next SaaS application.",
      author: "Karen Nelson",
      role: "Developer at Open AI",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/karen-nelson.png"
    },
    {
      quote: "The quality of the components and the attention to detail is unmatched. It has saved us countless hours of development time and our customers love the results.",
      author: "Roberta Casas",
      role: "Lead Designer at Dropbox",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png"
    },
    {
      quote: "I was amazed at how quickly I could build a complete landing page. The documentation is clear and the components are super flexible and customizable.",
      author: "Jese Leos",
      role: "Software Engineer at Facebook",
      avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png"
    }
  ];

  let currentIndex = $state(0);

  function next() {
    currentIndex = (currentIndex + 1) % testimonials.length;
  }

  function prev() {
    currentIndex = (currentIndex - 1 + testimonials.length) % testimonials.length;
  }
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="relative mx-auto max-w-screen-md text-center">
      <QuoteSolid class="mx-auto mb-6 h-12 w-12 text-gray-400 dark:text-gray-600" />

      <blockquote class="mb-8">
        <p class="text-xl font-medium text-gray-900 md:text-2xl dark:text-white">
          "{testimonials[currentIndex].quote}"
        </p>
      </blockquote>

      <figcaption class="flex items-center justify-center space-x-3">
        <Avatar src={testimonials[currentIndex].avatar} alt="profile picture" />
        <div class="space-y-0.5 text-left font-medium dark:text-white">
          <div>{testimonials[currentIndex].author}</div>
          <div class="text-sm text-gray-500 dark:text-gray-400">{testimonials[currentIndex].role}</div>
        </div>
      </figcaption>

      <div class="mt-8 flex items-center justify-center gap-4">
        <Button pill outline size="sm" onclick={prev}>
          <ChevronLeftOutline class="h-5 w-5" />
        </Button>
        <div class="flex gap-2">
          {#each testimonials as _, i}
            <button
              class="h-2.5 w-2.5 rounded-full transition-colors {i === currentIndex ? 'bg-primary-600' : 'bg-gray-300 dark:bg-gray-600'}"
              onclick={() => currentIndex = i}
            ></button>
          {/each}
        </div>
        <Button pill outline size="sm" onclick={next}>
          <ChevronRightOutline class="h-5 w-5" />
        </Button>
      </div>
    </div>
  </div>
</section>
