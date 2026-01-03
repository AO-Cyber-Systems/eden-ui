<script lang="ts">
  import { Accordion, AccordionItem } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Frequently asked questions
      </h2>
      <p class="font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Everything you need to know about the product and billing.
      </p>
    </div>
    <div class="grid gap-8 lg:grid-cols-2">
      <div>
        <Accordion>
          <AccordionItem>
            {#snippet header()}What is Flowbite?{/snippet}
            <p class="text-gray-500 dark:text-gray-400">
              Flowbite is an open-source library of UI components based on the utility-first Tailwind CSS framework featuring dark mode support, a Figma design system, templates, and more.
            </p>
          </AccordionItem>
          <AccordionItem>
            {#snippet header()}Can I use Flowbite in open-source projects?{/snippet}
            <p class="text-gray-500 dark:text-gray-400">
              Yes, Flowbite is open-source under the MIT license. You can use it in personal and commercial projects.
            </p>
          </AccordionItem>
          <AccordionItem>
            {#snippet header()}Is there a Figma file available?{/snippet}
            <p class="text-gray-500 dark:text-gray-400">
              Yes, you can get access to the Figma design system from the Pro version. It includes all components and pages.
            </p>
          </AccordionItem>
        </Accordion>
      </div>
      <div>
        <Accordion>
          <AccordionItem>
            {#snippet header()}What are the differences between Flowbite and Tailwind UI?{/snippet}
            <p class="text-gray-500 dark:text-gray-400">
              Both are built with Tailwind CSS, but Flowbite focuses on interactive components with JavaScript while Tailwind UI provides static templates.
            </p>
          </AccordionItem>
          <AccordionItem>
            {#snippet header()}What about browser support?{/snippet}
            <p class="text-gray-500 dark:text-gray-400">
              Flowbite supports all modern browsers including Chrome, Firefox, Safari, Edge, and Opera.
            </p>
          </AccordionItem>
          <AccordionItem>
            {#snippet header()}Do you offer technical support?{/snippet}
            <p class="text-gray-500 dark:text-gray-400">
              We offer email support for Pro customers and community support through our Discord channel.
            </p>
          </AccordionItem>
        </Accordion>
      </div>
    </div>
  </div>
</section>
