<script lang="ts">
  import { Button, Input, Label, Checkbox } from "flowbite-svelte";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto max-w-screen-md rounded-lg bg-white p-8 shadow dark:bg-gray-900 sm:p-12">
      <h2 class="mb-4 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Get early access
      </h2>
      <p class="mb-6 text-gray-500 dark:text-gray-400">
        Be the first to know when we launch. Enter your email address and we'll notify you.
      </p>
      <form class="space-y-6">
        <div class="grid gap-6 sm:grid-cols-2">
          <div>
            <Label for="first-name" class="mb-2 block">First name</Label>
            <Input type="text" id="first-name" placeholder="Bonnie" required />
          </div>
          <div>
            <Label for="last-name" class="mb-2 block">Last name</Label>
            <Input type="text" id="last-name" placeholder="Green" required />
          </div>
        </div>
        <div>
          <Label for="email" class="mb-2 block">Your email</Label>
          <Input type="email" id="email" placeholder="name@flowbite.com" required />
        </div>
        <div>
          <Label for="company" class="mb-2 block">Company</Label>
          <Input type="text" id="company" placeholder="Flowbite" />
        </div>
        <div class="flex items-start">
          <Checkbox id="terms">
            I agree to the <a href="#terms" class="text-primary-600 hover:underline dark:text-primary-500">terms and conditions</a>
          </Checkbox>
        </div>
        <Button type="submit" class="w-full">Request early access</Button>
      </form>
    </div>
  </div>
</section>
