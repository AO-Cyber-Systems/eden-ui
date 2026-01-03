<script lang="ts">
  import { Input, Button } from "flowbite-svelte";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="items-center gap-8 lg:grid lg:grid-cols-2 xl:gap-16">
      <div class="mb-8 lg:mb-0">
        <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
          Subscribe to our newsletter
        </h2>
        <p class="mb-6 font-light text-gray-500 sm:text-xl dark:text-gray-400">
          Join over 10,000 developers and designers who receive our newsletter packed with the latest updates, tips, and resources.
        </p>
        <form action="#" class="space-y-4">
          <div class="grid gap-4 sm:grid-cols-2">
            <Input type="text" placeholder="First name" required />
            <Input type="text" placeholder="Last name" required />
          </div>
          <Input type="email" placeholder="Your email" required />
          <div class="flex items-start">
            <input type="checkbox" id="newsletter-terms" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" required />
            <label for="newsletter-terms" class="ml-2 text-sm text-gray-500 dark:text-gray-400">
              I agree to receive emails and accept the <a href="#" class="text-primary-600 hover:underline dark:text-primary-500">Terms of Service</a>.
            </label>
          </div>
          <Button type="submit" class="w-full sm:w-auto">Subscribe</Button>
        </form>
      </div>
      <img class="hidden w-full rounded-lg lg:block" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/newsletter/newsletter.svg" alt="newsletter illustration" />
    </div>
  </div>
</section>
