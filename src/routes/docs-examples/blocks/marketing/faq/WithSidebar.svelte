<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ChevronDownOutline } from "flowbite-svelte-icons";

  const faqs = [
    {
      question: "What methods of payment do you accept?",
      answer: "We accept Visa, MasterCard, American Express, PayPal, and bank transfers. For enterprise customers, we also offer invoicing options."
    },
    {
      question: "How do I get a refund?",
      answer: "You can request a refund within 30 days of your purchase. Simply contact our support team with your order number and we'll process your refund within 5-7 business days."
    },
    {
      question: "Can I upgrade my plan later?",
      answer: "Yes, you can upgrade your plan at any time. Your new plan will take effect immediately and we'll prorate the cost based on your remaining billing period."
    },
    {
      question: "Do you offer a free trial?",
      answer: "Yes, we offer a 14-day free trial on all our plans. No credit card required to get started."
    },
    {
      question: "What's included in the enterprise plan?",
      answer: "The enterprise plan includes unlimited users, dedicated support, custom integrations, SSO/SAML authentication, and a dedicated account manager."
    }
  ];

  let openIndex = $state<number | null>(0);
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="gap-16 lg:grid lg:grid-cols-3">
      <!-- Sidebar -->
      <div class="mb-8 lg:mb-0">
        <h2 class="mb-4 text-3xl font-extrabold tracking-tight text-gray-900 dark:text-white">
          Frequently asked questions
        </h2>
        <p class="mb-6 text-gray-500 dark:text-gray-400">
          Can't find the answer you're looking for? Reach out to our customer support team.
        </p>
        <Button>Contact support</Button>
      </div>

      <!-- FAQ List -->
      <div class="lg:col-span-2">
        <div class="divide-y divide-gray-200 dark:divide-gray-700">
          {#each faqs as faq, index}
            <div class="py-5">
              <button
                class="flex w-full items-center justify-between text-left"
                onclick={() => openIndex = openIndex === index ? null : index}
              >
                <span class="text-lg font-medium text-gray-900 dark:text-white">
                  {faq.question}
                </span>
                <ChevronDownOutline class="h-5 w-5 flex-shrink-0 text-gray-500 transition-transform {openIndex === index ? 'rotate-180' : ''}" />
              </button>
              {#if openIndex === index}
                <p class="mt-3 text-gray-500 dark:text-gray-400">
                  {faq.answer}
                </p>
              {/if}
            </div>
          {/each}
        </div>
      </div>
    </div>
  </div>
</section>
