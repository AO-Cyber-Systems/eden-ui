<script lang="ts">
  import { Input, Button } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto max-w-screen-md text-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 sm:text-4xl dark:text-white">
        Sign up for our newsletter
      </h2>
      <p class="mx-auto mb-8 max-w-2xl font-light text-gray-500 sm:text-xl md:mb-12 dark:text-gray-400">
        Stay up to date with the roadmap progress, announcements and exclusive discounts feel free to sign up with your email.
      </p>
      <form action="#" class="mx-auto max-w-screen-sm">
        <div class="mb-3 flex items-center gap-3">
          <div class="relative w-full">
            <Input type="email" placeholder="Enter your email" size="lg" class="pl-10" required>
              {#snippet left()}
                <svg class="h-5 w-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" />
                  <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" />
                </svg>
              {/snippet}
            </Input>
          </div>
          <Button type="submit" size="lg">Subscribe</Button>
        </div>
        <p class="text-sm text-gray-500 dark:text-gray-400">
          We care about the protection of your data. <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Read our Privacy Policy</a>.
        </p>
      </form>
    </div>
  </div>
</section>
