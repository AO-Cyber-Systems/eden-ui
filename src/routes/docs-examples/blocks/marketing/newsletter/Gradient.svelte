<script lang="ts">
  import { Input, Button } from "flowbite-svelte";
</script>

<section class="bg-gradient-to-r from-primary-500 to-primary-700">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto max-w-screen-md text-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-white sm:text-4xl">
        Get the latest updates
      </h2>
      <p class="mx-auto mb-8 max-w-2xl font-light text-primary-100 sm:text-xl md:mb-12">
        Subscribe to our newsletter and never miss out on the latest features, tips, and exclusive offers.
      </p>
      <form action="#" class="mx-auto max-w-lg">
        <div class="flex flex-col gap-3 sm:flex-row">
          <Input type="email" placeholder="Your email address" size="lg" class="flex-1" required />
          <Button type="submit" size="lg" color="light">
            Subscribe
          </Button>
        </div>
        <p class="mt-4 text-sm text-primary-100">
          No spam. Unsubscribe at any time.
        </p>
      </form>
    </div>
  </div>
</section>
