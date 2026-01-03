<script lang="ts">
  import { Button, Input, Label } from "flowbite-svelte";
</script>

<section class="bg-gradient-to-r from-primary-600 to-primary-800 dark:from-primary-800 dark:to-primary-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto max-w-screen-md text-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-white sm:text-4xl">
        Sign up for our newsletter
      </h2>
      <p class="mx-auto mb-8 max-w-2xl text-primary-100 md:mb-12 sm:text-xl">
        Stay up to date with the roadmap progress, announcements and exclusive discounts feel free to sign up with your email.
      </p>
      <form class="mx-auto max-w-md">
        <div class="flex flex-col items-center gap-4 sm:flex-row">
          <div class="w-full">
            <Label for="email" class="sr-only">Email address</Label>
            <Input type="email" id="email" placeholder="Enter your email" required class="w-full" />
          </div>
          <Button type="submit" color="light" class="w-full sm:w-auto">Subscribe</Button>
        </div>
      </form>
    </div>
  </div>
</section>
