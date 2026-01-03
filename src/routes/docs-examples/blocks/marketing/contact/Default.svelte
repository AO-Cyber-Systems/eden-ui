<script lang="ts">
  import { Input, Textarea, Button, Label, Select } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto max-w-screen-md">
      <h2 class="mb-4 text-center text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Contact Us
      </h2>
      <p class="mb-8 text-center font-light text-gray-500 dark:text-gray-400 sm:text-xl">
        Got a technical issue? Want to send feedback about a beta feature? Need details about our Business plan? Let us know.
      </p>
      <form action="#" class="space-y-6">
        <div>
          <Label for="email" class="mb-2 block">Your email</Label>
          <Input type="email" id="email" placeholder="name@company.com" required />
        </div>
        <div>
          <Label for="subject" class="mb-2 block">Subject</Label>
          <Input type="text" id="subject" placeholder="Let us know how we can help you" required />
        </div>
        <div>
          <Label for="message" class="mb-2 block">Your message</Label>
          <Textarea id="message" rows={6} placeholder="Leave a comment..." />
        </div>
        <Button type="submit" class="w-full sm:w-auto">Send message</Button>
      </form>
    </div>
  </div>
</section>
