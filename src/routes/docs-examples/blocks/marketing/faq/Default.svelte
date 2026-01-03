<script lang="ts">
  import { Accordion, AccordionItem } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <h2 class="mb-8 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
      Frequently asked questions
    </h2>
    <Accordion>
      <AccordionItem>
        {#snippet header()}What do you mean by "Figma assets"?{/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          You will have access to download the full Figma project including all of the pages, the components, responsive pages, and also the icons, illustrations, and images included in the screens.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}What does "lifetime access" exactly mean?{/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          Once you have purchased either the design, code, or both packages, you will have access to all of the future updates based on the roadmap, free of charge.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}How does support work?{/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          We're aware of the importance of well-qualified support, that is why we decided that support will only be provided by the authors that actually worked on this project.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}I want to build more than one project. Is that allowed?{/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          You can use Flowbite to build any number of projects—whether it's a personal portfolio, a client project, or a commercial product. There are no limitations.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}What does the free version include?{/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          The free version of Flowbite includes a small selection of components, utility classes, and page examples that you can use to get started with your project.
        </p>
      </AccordionItem>
    </Accordion>
  </div>
</section>
