<script lang="ts">
  import { Button, Input, Label } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto grid max-w-screen-xl px-4 py-8 lg:grid-cols-2 lg:gap-12 lg:py-16">
    <div class="flex flex-col justify-center">
      <h1 class="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        We invest in the world's potential
      </h1>
      <p class="mb-6 text-lg font-normal text-gray-500 lg:text-xl dark:text-gray-400">
        Here at Flowbite we focus on markets where technology, innovation, and capital can unlock long-term value.
      </p>
      <div class="flex flex-wrap gap-4">
        <Button size="lg">
          Get started
          <ArrowRightOutline class="ml-2 h-5 w-5" />
        </Button>
        <Button size="lg" color="alternative">
          Learn more
        </Button>
      </div>
    </div>
    <div class="mt-8 lg:mt-0">
      <div class="w-full rounded-lg border border-gray-200 bg-white p-6 shadow-md sm:p-8 dark:border-gray-700 dark:bg-gray-800">
        <h2 class="mb-6 text-2xl font-bold text-gray-900 dark:text-white">Start your free trial</h2>
        <form class="space-y-6">
          <div>
            <Label for="email" class="mb-2 block">Your email</Label>
            <Input type="email" id="email" placeholder="name@company.com" required />
          </div>
          <div>
            <Label for="password" class="mb-2 block">Password</Label>
            <Input type="password" id="password" placeholder="••••••••" required />
          </div>
          <Button type="submit" class="w-full">Create account</Button>
          <p class="text-sm text-gray-500 dark:text-gray-400">
            By signing up, you agree to our <a href="#terms" class="text-primary-600 hover:underline dark:text-primary-500">Terms of Service</a> and <a href="#privacy" class="text-primary-600 hover:underline dark:text-primary-500">Privacy Policy</a>.
          </p>
        </form>
      </div>
    </div>
  </div>
</section>
