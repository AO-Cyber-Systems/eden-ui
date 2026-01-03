<script lang="ts">
  import { Button, Card, Badge, Modal, Alert, Input, Label, Radio } from "flowbite-svelte";
  import { CreditCardOutline, CheckCircleOutline, ArrowDownTrayOutline, PlusOutline, TrashBinOutline, ExclamationCircleOutline, StarOutline, RocketOutline } from "flowbite-svelte-icons";

  let showAddCardModal = $state(false);
  let showCancelModal = $state(false);
  let selectedPlan = $state("pro");

  const invoices = [
    { id: "INV-2026-001", date: "Jan 1, 2026", amount: "$29.00", status: "paid" },
    { id: "INV-2025-012", date: "Dec 1, 2025", amount: "$29.00", status: "paid" },
    { id: "INV-2025-011", date: "Nov 1, 2025", amount: "$29.00", status: "paid" },
    { id: "INV-2025-010", date: "Oct 1, 2025", amount: "$29.00", status: "paid" }
  ];

  const plans = [
    { id: "free", name: "Free", price: 0, features: ["5 projects", "1GB storage", "Community support"] },
    { id: "pro", name: "Pro", price: 29, features: ["Unlimited projects", "100GB storage", "Priority support", "Advanced analytics"], popular: true },
    { id: "enterprise", name: "Enterprise", price: 99, features: ["Everything in Pro", "Unlimited storage", "Dedicated support", "Custom integrations", "SLA guarantee"] }
  ];
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Current Plan -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Current Plan</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage your subscription</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-12 w-12 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <RocketOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
            </div>
            <div>
              <div class="flex items-center gap-2">
                <p class="text-xl font-bold text-gray-900 dark:text-white">Pro Plan</p>
                <Badge color="primary">Current</Badge>
              </div>
              <p class="text-gray-500 dark:text-gray-400">$29/month</p>
            </div>
          </div>
        </div>

        <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
          <div class="mb-4 flex items-center justify-between">
            <p class="font-medium text-gray-900 dark:text-white">Usage this month</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Resets Jan 15</p>
          </div>

          <div class="space-y-3">
            <div>
              <div class="mb-1 flex justify-between text-sm">
                <span class="text-gray-600 dark:text-gray-300">Projects</span>
                <span class="text-gray-900 dark:text-white">12 / Unlimited</span>
              </div>
              <div class="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-700">
                <div class="h-2 rounded-full bg-primary-500" style="width: 40%"></div>
              </div>
            </div>

            <div>
              <div class="mb-1 flex justify-between text-sm">
                <span class="text-gray-600 dark:text-gray-300">Storage</span>
                <span class="text-gray-900 dark:text-white">45GB / 100GB</span>
              </div>
              <div class="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-700">
                <div class="h-2 rounded-full bg-primary-500" style="width: 45%"></div>
              </div>
            </div>

            <div>
              <div class="mb-1 flex justify-between text-sm">
                <span class="text-gray-600 dark:text-gray-300">API Calls</span>
                <span class="text-gray-900 dark:text-white">8,500 / 50,000</span>
              </div>
              <div class="h-2 w-full rounded-full bg-gray-200 dark:bg-gray-700">
                <div class="h-2 rounded-full bg-primary-500" style="width: 17%"></div>
              </div>
            </div>
          </div>
        </div>

        <div class="flex gap-3">
          <Button class="flex-1">Upgrade plan</Button>
          <Button color="light" onclick={() => showCancelModal = true}>Cancel subscription</Button>
        </div>
      </div>
    </Card>
  </div>

  <!-- Payment Methods -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Payment Methods</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage your payment options</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-4">
        <!-- Primary Card -->
        <div class="flex items-center justify-between rounded-lg border-2 border-primary-500 bg-primary-50 p-4 dark:border-primary-400 dark:bg-primary-900/30">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-600">
              <CreditCardOutline class="h-5 w-5 text-white" />
            </div>
            <div>
              <div class="flex items-center gap-2">
                <p class="font-medium text-gray-900 dark:text-white">Visa ending in 4242</p>
                <Badge color="primary">Default</Badge>
              </div>
              <p class="text-sm text-gray-500 dark:text-gray-400">Expires 12/2027</p>
            </div>
          </div>
          <Button size="xs" color="light">Edit</Button>
        </div>

        <!-- Secondary Card -->
        <div class="flex items-center justify-between rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-orange-500">
              <CreditCardOutline class="h-5 w-5 text-white" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Mastercard ending in 8888</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Expires 08/2026</p>
            </div>
          </div>
          <div class="flex gap-2">
            <Button size="xs" color="light">Set default</Button>
            <Button size="xs" color="light" class="text-red-600">
              <TrashBinOutline class="h-4 w-4" />
            </Button>
          </div>
        </div>

        <Button color="light" class="w-full" onclick={() => showAddCardModal = true}>
          <PlusOutline class="me-2 h-4 w-4" />
          Add payment method
        </Button>
      </div>
    </Card>
  </div>

  <!-- Billing History -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Billing History</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">View and download invoices</p>
    </div>

    <Card>
      <div class="overflow-x-auto">
        <table class="w-full text-left text-sm">
          <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th class="px-4 py-3">Invoice</th>
              <th class="px-4 py-3">Date</th>
              <th class="px-4 py-3">Amount</th>
              <th class="px-4 py-3">Status</th>
              <th class="px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody>
            {#each invoices as invoice}
              <tr class="border-b dark:border-gray-700">
                <td class="px-4 py-3 font-medium text-gray-900 dark:text-white">{invoice.id}</td>
                <td class="px-4 py-3 text-gray-500 dark:text-gray-400">{invoice.date}</td>
                <td class="px-4 py-3 text-gray-900 dark:text-white">{invoice.amount}</td>
                <td class="px-4 py-3">
                  <Badge color="green">
                    <CheckCircleOutline class="me-1 h-3 w-3" />
                    Paid
                  </Badge>
                </td>
                <td class="px-4 py-3">
                  <Button size="xs" color="light">
                    <ArrowDownTrayOutline class="me-1 h-3 w-3" />
                    PDF
                  </Button>
                </td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>

      <div class="mt-4 flex justify-center">
        <Button color="light">View all invoices</Button>
      </div>
    </Card>
  </div>

  <!-- Available Plans -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Available Plans</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Choose the plan that works for you</p>
    </div>

    <div class="grid gap-6 md:grid-cols-3">
      {#each plans as plan}
        <Card class="relative {plan.id === selectedPlan ? 'ring-2 ring-primary-500' : ''}">
          {#if plan.popular}
            <div class="absolute -top-3 left-1/2 -translate-x-1/2">
              <Badge color="primary">
                <StarOutline class="me-1 h-3 w-3" />
                Most Popular
              </Badge>
            </div>
          {/if}

          <div class="text-center">
            <h4 class="text-lg font-bold text-gray-900 dark:text-white">{plan.name}</h4>
            <div class="my-4">
              <span class="text-4xl font-extrabold text-gray-900 dark:text-white">${plan.price}</span>
              <span class="text-gray-500 dark:text-gray-400">/month</span>
            </div>

            <ul class="mb-6 space-y-3 text-left">
              {#each plan.features as feature}
                <li class="flex items-center gap-2">
                  <CheckCircleOutline class="h-5 w-5 text-green-500" />
                  <span class="text-gray-600 dark:text-gray-300">{feature}</span>
                </li>
              {/each}
            </ul>

            {#if plan.id === selectedPlan}
              <Button class="w-full" disabled>Current plan</Button>
            {:else if plan.price > 29}
              <Button class="w-full">Upgrade</Button>
            {:else}
              <Button class="w-full" color="light">Downgrade</Button>
            {/if}
          </div>
        </Card>
      {/each}
    </div>
  </div>
</div>

<!-- Add Card Modal -->
<Modal bind:open={showAddCardModal} size="md" title="Add Payment Method">
  <form class="space-y-4">
    <div>
      <Label for="card-number" class="mb-2">Card number</Label>
      <Input type="text" id="card-number" placeholder="1234 5678 9012 3456" />
    </div>

    <div class="grid grid-cols-2 gap-4">
      <div>
        <Label for="expiry" class="mb-2">Expiry date</Label>
        <Input type="text" id="expiry" placeholder="MM/YY" />
      </div>
      <div>
        <Label for="cvc" class="mb-2">CVC</Label>
        <Input type="text" id="cvc" placeholder="123" />
      </div>
    </div>

    <div>
      <Label for="card-name" class="mb-2">Name on card</Label>
      <Input type="text" id="card-name" placeholder="John Doe" />
    </div>

    <label class="flex items-center gap-2">
      <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
      <span class="text-sm text-gray-600 dark:text-gray-300">Set as default payment method</span>
    </label>
  </form>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showAddCardModal = false}>Cancel</Button>
      <Button>Add card</Button>
    </div>
  {/snippet}
</Modal>

<!-- Cancel Subscription Modal -->
<Modal bind:open={showCancelModal} size="md" title="Cancel Subscription">
  <div class="space-y-4">
    <Alert color="yellow">
      <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
      You'll lose access to Pro features at the end of your billing period.
    </Alert>

    <p class="text-gray-600 dark:text-gray-300">
      We're sorry to see you go. Your subscription will remain active until January 15, 2026.
      After that, your account will be downgraded to the Free plan.
    </p>

    <div>
      <p class="mb-3 font-medium text-gray-900 dark:text-white">Why are you canceling?</p>
      <div class="space-y-2">
        <label class="flex items-center gap-2">
          <Radio name="cancel-reason" value="expensive" />
          <span class="text-gray-600 dark:text-gray-300">Too expensive</span>
        </label>
        <label class="flex items-center gap-2">
          <Radio name="cancel-reason" value="features" />
          <span class="text-gray-600 dark:text-gray-300">Missing features I need</span>
        </label>
        <label class="flex items-center gap-2">
          <Radio name="cancel-reason" value="switching" />
          <span class="text-gray-600 dark:text-gray-300">Switching to another product</span>
        </label>
        <label class="flex items-center gap-2">
          <Radio name="cancel-reason" value="other" />
          <span class="text-gray-600 dark:text-gray-300">Other</span>
        </label>
      </div>
    </div>
  </div>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showCancelModal = false}>Keep subscription</Button>
      <Button color="red">Cancel subscription</Button>
    </div>
  {/snippet}
</Modal>
