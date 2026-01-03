<script lang="ts">
  import { Card, Button, Badge } from "flowbite-svelte";
  import { CheckCircleSolid, CloseCircleSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Simple, transparent pricing
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        No contracts. No surprise fees. Cancel anytime.
      </p>
    </div>
    <div class="space-y-8 sm:gap-6 lg:grid lg:grid-cols-3 lg:space-y-0 xl:gap-10">
      <!-- Free -->
      <Card class="mx-auto flex max-w-lg flex-col rounded-3xl p-8">
        <div class="mb-4">
          <h3 class="text-lg font-medium text-gray-500 dark:text-gray-400">Free</h3>
          <p class="mt-2 text-gray-900 dark:text-white">
            <span class="text-4xl font-bold">$0</span>
            <span class="text-gray-500 dark:text-gray-400">/month</span>
          </p>
        </div>
        <p class="mb-6 text-gray-500 dark:text-gray-400">
          Great for trying out the platform.
        </p>
        <Button outline class="mb-8">Start for free</Button>
        <ul class="space-y-3">
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Up to 3 projects</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Basic analytics</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Community support</span>
          </li>
          <li class="flex items-center gap-3">
            <CloseCircleSolid class="h-5 w-5 text-gray-300 dark:text-gray-600" />
            <span class="text-gray-400 dark:text-gray-500">Custom domains</span>
          </li>
          <li class="flex items-center gap-3">
            <CloseCircleSolid class="h-5 w-5 text-gray-300 dark:text-gray-600" />
            <span class="text-gray-400 dark:text-gray-500">Priority support</span>
          </li>
        </ul>
      </Card>

      <!-- Pro -->
      <Card class="relative mx-auto flex max-w-lg flex-col rounded-3xl bg-primary-600 p-8 text-white ring-4 ring-primary-500/50 dark:bg-primary-700">
        <Badge class="absolute -top-3 right-4 bg-white text-primary-600">Recommended</Badge>
        <div class="mb-4">
          <h3 class="text-lg font-medium text-primary-100">Pro</h3>
          <p class="mt-2">
            <span class="text-4xl font-bold">$49</span>
            <span class="text-primary-200">/month</span>
          </p>
        </div>
        <p class="mb-6 text-primary-100">
          Perfect for growing businesses.
        </p>
        <Button color="light" class="mb-8">Get started</Button>
        <ul class="space-y-3">
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-white" />
            <span>Unlimited projects</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-white" />
            <span>Advanced analytics</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-white" />
            <span>Priority support</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-white" />
            <span>Custom domains</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-white" />
            <span>API access</span>
          </li>
        </ul>
      </Card>

      <!-- Team -->
      <Card class="mx-auto flex max-w-lg flex-col rounded-3xl p-8">
        <div class="mb-4">
          <h3 class="text-lg font-medium text-gray-500 dark:text-gray-400">Team</h3>
          <p class="mt-2 text-gray-900 dark:text-white">
            <span class="text-4xl font-bold">$99</span>
            <span class="text-gray-500 dark:text-gray-400">/month</span>
          </p>
        </div>
        <p class="mb-6 text-gray-500 dark:text-gray-400">
          For teams that need to collaborate.
        </p>
        <Button outline class="mb-8">Contact sales</Button>
        <ul class="space-y-3">
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Everything in Pro</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Team collaboration</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Admin controls</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">SSO integration</span>
          </li>
          <li class="flex items-center gap-3">
            <CheckCircleSolid class="h-5 w-5 text-green-500" />
            <span class="text-gray-600 dark:text-gray-300">Dedicated support</span>
          </li>
        </ul>
      </Card>
    </div>
  </div>
</section>
