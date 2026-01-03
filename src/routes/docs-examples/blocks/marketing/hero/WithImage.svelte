<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ArrowRightOutline, VideoCameraOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto grid max-w-screen-xl px-4 py-8 lg:grid-cols-12 lg:gap-8 lg:py-16 xl:gap-0">
    <div class="mr-auto place-self-center lg:col-span-7">
      <h1 class="mb-4 max-w-2xl text-4xl font-extrabold leading-none tracking-tight md:text-5xl xl:text-6xl dark:text-white">
        Payments tool for software companies
      </h1>
      <p class="mb-6 max-w-2xl font-light text-gray-500 md:text-lg lg:mb-8 lg:text-xl dark:text-gray-400">
        From checkout to global sales tax compliance, companies around the world use Flowbite to simplify their payment stack.
      </p>
      <div class="flex flex-wrap gap-4">
        <Button size="lg">
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
        <Button size="lg" color="alternative">
          <VideoCameraOutline class="mr-2 h-5 w-5" />
          Watch video
        </Button>
      </div>
    </div>
    <div class="hidden lg:col-span-5 lg:mt-0 lg:flex">
      <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/phone-mockup.png" alt="mockup" class="w-full" />
    </div>
  </div>
</section>
