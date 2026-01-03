<script lang="ts">
  import { Tabs, TabItem, Accordion, AccordionItem } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Frequently asked questions
      </h2>
      <p class="font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Browse by category to find the answers you need.
      </p>
    </div>

    <div class="mx-auto max-w-screen-md">
      <Tabs style="underline" class="mb-8">
        <TabItem open title="General">
          <Accordion class="mt-4">
            <AccordionItem>
              {#snippet header()}What is your product?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Our product is a comprehensive platform that helps teams collaborate more effectively and ship faster.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}Who is this for?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                This is for development teams of all sizes, from startups to enterprise companies.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}How do I get started?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Simply sign up for a free account and follow our onboarding guide to set up your workspace.
              </p>
            </AccordionItem>
          </Accordion>
        </TabItem>
        <TabItem title="Billing">
          <Accordion class="mt-4">
            <AccordionItem>
              {#snippet header()}What payment methods do you accept?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                We accept all major credit cards, PayPal, and bank transfers for enterprise customers.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}Can I get a refund?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Yes, we offer a 30-day money-back guarantee on all our plans.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}Is there a free trial?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Yes, we offer a 14-day free trial with full access to all features.
              </p>
            </AccordionItem>
          </Accordion>
        </TabItem>
        <TabItem title="Technical">
          <Accordion class="mt-4">
            <AccordionItem>
              {#snippet header()}What technologies do you support?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                We support all major programming languages and frameworks including JavaScript, Python, Go, and more.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}Do you have an API?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Yes, we have a comprehensive REST API and GraphQL API for all integrations.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}What about security?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                We use industry-standard encryption and are SOC 2 Type II certified.
              </p>
            </AccordionItem>
          </Accordion>
        </TabItem>
        <TabItem title="Support">
          <Accordion class="mt-4">
            <AccordionItem>
              {#snippet header()}How can I contact support?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                You can reach us via email, live chat, or through our Discord community.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}What are your support hours?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Our support team is available 24/7 for Pro and Enterprise customers.
              </p>
            </AccordionItem>
            <AccordionItem>
              {#snippet header()}Do you offer onboarding?{/snippet}
              <p class="text-gray-500 dark:text-gray-400">
                Yes, Enterprise customers get dedicated onboarding and training sessions.
              </p>
            </AccordionItem>
          </Accordion>
        </TabItem>
      </Tabs>
    </div>
  </div>
</section>
