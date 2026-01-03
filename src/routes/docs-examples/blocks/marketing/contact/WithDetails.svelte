<script lang="ts">
  import { Input, Textarea, Button, Label } from "flowbite-svelte";
  import { EnvelopeSolid, PhoneSolid, MapPinSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="grid gap-8 lg:grid-cols-2">
      <!-- Contact Info -->
      <div>
        <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Get in Touch
        </h2>
        <p class="mb-8 text-gray-500 dark:text-gray-400 lg:text-lg">
          We'd love to hear from you. Please fill out this form or use our contact information below.
        </p>

        <div class="space-y-6">
          <div class="flex items-start gap-4">
            <div class="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <EnvelopeSolid class="h-6 w-6 text-primary-600 dark:text-primary-400" />
            </div>
            <div>
              <h3 class="font-semibold text-gray-900 dark:text-white">Email</h3>
              <p class="text-gray-500 dark:text-gray-400">Our friendly team is here to help.</p>
              <a href="mailto:hello@company.com" class="text-primary-600 hover:underline dark:text-primary-500">hello@company.com</a>
            </div>
          </div>

          <div class="flex items-start gap-4">
            <div class="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <MapPinSolid class="h-6 w-6 text-primary-600 dark:text-primary-400" />
            </div>
            <div>
              <h3 class="font-semibold text-gray-900 dark:text-white">Office</h3>
              <p class="text-gray-500 dark:text-gray-400">Come say hello at our office HQ.</p>
              <p class="text-gray-900 dark:text-white">100 Smith Street, Collingwood VIC 3066</p>
            </div>
          </div>

          <div class="flex items-start gap-4">
            <div class="flex h-12 w-12 shrink-0 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <PhoneSolid class="h-6 w-6 text-primary-600 dark:text-primary-400" />
            </div>
            <div>
              <h3 class="font-semibold text-gray-900 dark:text-white">Phone</h3>
              <p class="text-gray-500 dark:text-gray-400">Mon-Fri from 8am to 5pm.</p>
              <a href="tel:+1-555-000-0000" class="text-primary-600 hover:underline dark:text-primary-500">+1 (555) 000-0000</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Contact Form -->
      <div class="rounded-lg bg-white p-8 shadow-lg dark:bg-gray-900">
        <form action="#" class="space-y-6">
          <div class="grid gap-6 sm:grid-cols-2">
            <div>
              <Label for="first-name" class="mb-2 block">First name</Label>
              <Input type="text" id="first-name" placeholder="John" required />
            </div>
            <div>
              <Label for="last-name" class="mb-2 block">Last name</Label>
              <Input type="text" id="last-name" placeholder="Doe" required />
            </div>
          </div>
          <div>
            <Label for="email" class="mb-2 block">Email</Label>
            <Input type="email" id="email" placeholder="name@company.com" required />
          </div>
          <div>
            <Label for="phone" class="mb-2 block">Phone number</Label>
            <Input type="tel" id="phone" placeholder="+1 (555) 000-0000" />
          </div>
          <div>
            <Label for="message" class="mb-2 block">Message</Label>
            <Textarea id="message" rows={4} placeholder="How can we help you?" />
          </div>
          <Button type="submit" class="w-full">Send message</Button>
        </form>
      </div>
    </div>
  </div>
</section>
