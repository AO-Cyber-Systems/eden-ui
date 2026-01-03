<script lang="ts">
  import { Input, Textarea, Button, Label, Select } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mb-8 text-center">
      <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Our Locations
      </h2>
      <p class="text-gray-500 dark:text-gray-400 lg:text-lg">
        Visit us at one of our offices or reach out online
      </p>
    </div>

    <div class="mb-12 grid gap-8 md:grid-cols-3">
      <div class="rounded-lg border border-gray-200 p-6 text-center dark:border-gray-700">
        <h3 class="mb-2 text-lg font-bold text-gray-900 dark:text-white">San Francisco</h3>
        <p class="mb-4 text-gray-500 dark:text-gray-400">
          100 Market Street<br />
          San Francisco, CA 94105
        </p>
        <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
          View on map →
        </a>
      </div>
      <div class="rounded-lg border border-gray-200 p-6 text-center dark:border-gray-700">
        <h3 class="mb-2 text-lg font-bold text-gray-900 dark:text-white">New York</h3>
        <p class="mb-4 text-gray-500 dark:text-gray-400">
          350 Fifth Avenue<br />
          New York, NY 10118
        </p>
        <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
          View on map →
        </a>
      </div>
      <div class="rounded-lg border border-gray-200 p-6 text-center dark:border-gray-700">
        <h3 class="mb-2 text-lg font-bold text-gray-900 dark:text-white">London</h3>
        <p class="mb-4 text-gray-500 dark:text-gray-400">
          1 Canada Square<br />
          London E14 5AB, UK
        </p>
        <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
          View on map →
        </a>
      </div>
    </div>

    <!-- Map placeholder -->
    <div class="mb-12 h-96 overflow-hidden rounded-lg bg-gray-200 dark:bg-gray-700">
      <div class="flex h-full items-center justify-center text-gray-500 dark:text-gray-400">
        <div class="text-center">
          <svg class="mx-auto mb-4 h-12 w-12" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
          </svg>
          <p>Map Integration Placeholder</p>
          <p class="text-sm">Replace with Google Maps, Mapbox, or other map provider</p>
        </div>
      </div>
    </div>

    <!-- Contact Form -->
    <div class="mx-auto max-w-screen-md">
      <h3 class="mb-4 text-center text-2xl font-bold text-gray-900 dark:text-white">
        Send us a message
      </h3>
      <form action="#" class="space-y-6">
        <div class="grid gap-6 sm:grid-cols-2">
          <div>
            <Label for="name" class="mb-2 block">Your name</Label>
            <Input type="text" id="name" placeholder="John Doe" required />
          </div>
          <div>
            <Label for="email" class="mb-2 block">Your email</Label>
            <Input type="email" id="email" placeholder="name@company.com" required />
          </div>
        </div>
        <div>
          <Label for="location" class="mb-2 block">Preferred location</Label>
          <Select id="location">
            <option value="">Select a location</option>
            <option value="sf">San Francisco</option>
            <option value="ny">New York</option>
            <option value="london">London</option>
          </Select>
        </div>
        <div>
          <Label for="message" class="mb-2 block">Message</Label>
          <Textarea id="message" rows={4} placeholder="Your message here..." />
        </div>
        <div class="text-center">
          <Button type="submit">Send message</Button>
        </div>
      </form>
    </div>
  </div>
</section>
