<script lang="ts">
  import { Card, Button, Toggle } from "flowbite-svelte";
  import { CheckCircleSolid } from "flowbite-svelte-icons";

  let annual = $state(false);

  const prices = {
    starter: { monthly: 29, annual: 290 },
    company: { monthly: 99, annual: 990 },
    enterprise: { monthly: 499, annual: 4990 },
  };
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Choose your plan
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Start free and scale as you grow. No hidden fees.
      </p>
      <div class="flex items-center justify-center gap-3">
        <span class="text-gray-900 dark:text-white" class:font-semibold={!annual}>Monthly</span>
        <Toggle bind:checked={annual} />
        <span class="text-gray-900 dark:text-white" class:font-semibold={annual}>
          Annual
          <span class="ml-1 rounded bg-green-100 px-2 py-0.5 text-xs font-medium text-green-800 dark:bg-green-900 dark:text-green-300">
            Save 20%
          </span>
        </span>
      </div>
    </div>
    <div class="space-y-8 sm:gap-6 lg:grid lg:grid-cols-3 lg:space-y-0 xl:gap-10">
      <!-- Starter -->
      <Card class="mx-auto flex max-w-lg flex-col p-6">
        <h3 class="mb-4 text-2xl font-semibold text-gray-900 dark:text-white">Starter</h3>
        <p class="font-light text-gray-500 sm:text-lg dark:text-gray-400">
          Best option for personal use.
        </p>
        <div class="my-8 flex items-baseline justify-center">
          <span class="mr-2 text-5xl font-extrabold text-gray-900 dark:text-white">
            ${annual ? prices.starter.annual : prices.starter.monthly}
          </span>
          <span class="text-gray-500 dark:text-gray-400">/{annual ? 'year' : 'month'}</span>
        </div>
        <ul class="mb-8 space-y-4">
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">1 user license</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">5 projects</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Community support</span>
          </li>
        </ul>
        <Button outline class="mt-auto">Get started</Button>
      </Card>

      <!-- Company -->
      <Card class="relative mx-auto flex max-w-lg flex-col border-2 border-primary-500 p-6">
        <span class="absolute -top-3 left-1/2 -translate-x-1/2 rounded-full bg-primary-500 px-3 py-1 text-sm font-medium text-white">
          Most popular
        </span>
        <h3 class="mb-4 text-2xl font-semibold text-gray-900 dark:text-white">Company</h3>
        <p class="font-light text-gray-500 sm:text-lg dark:text-gray-400">
          For growing teams.
        </p>
        <div class="my-8 flex items-baseline justify-center">
          <span class="mr-2 text-5xl font-extrabold text-gray-900 dark:text-white">
            ${annual ? prices.company.annual : prices.company.monthly}
          </span>
          <span class="text-gray-500 dark:text-gray-400">/{annual ? 'year' : 'month'}</span>
        </div>
        <ul class="mb-8 space-y-4">
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">10 user licenses</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Unlimited projects</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Priority support</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">API access</span>
          </li>
        </ul>
        <Button class="mt-auto">Get started</Button>
      </Card>

      <!-- Enterprise -->
      <Card class="mx-auto flex max-w-lg flex-col p-6">
        <h3 class="mb-4 text-2xl font-semibold text-gray-900 dark:text-white">Enterprise</h3>
        <p class="font-light text-gray-500 sm:text-lg dark:text-gray-400">
          For large organizations.
        </p>
        <div class="my-8 flex items-baseline justify-center">
          <span class="mr-2 text-5xl font-extrabold text-gray-900 dark:text-white">
            ${annual ? prices.enterprise.annual : prices.enterprise.monthly}
          </span>
          <span class="text-gray-500 dark:text-gray-400">/{annual ? 'year' : 'month'}</span>
        </div>
        <ul class="mb-8 space-y-4">
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Unlimited users</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Unlimited projects</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">24/7 dedicated support</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">Custom integrations</span>
          </li>
          <li class="flex items-center space-x-3">
            <CheckCircleSolid class="h-5 w-5 flex-shrink-0 text-green-500" />
            <span class="text-gray-900 dark:text-white">SSO & SAML</span>
          </li>
        </ul>
        <Button outline class="mt-auto">Contact sales</Button>
      </Card>
    </div>
  </div>
</section>
