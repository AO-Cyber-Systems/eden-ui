<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Accordion from './Accordion.svelte';
  import AccordionItem from './AccordionItem.svelte';

  const { Story } = defineMeta({
    title: 'Components/Accordion',
    component: Accordion,
    tags: ['autodocs'],
    argTypes: {
      flush: {
        control: 'boolean',
        description: 'Removes borders and rounded corners',
      },
      multiple: {
        control: 'boolean',
        description: 'Allows multiple items to be open at once',
      },
    },
    args: {
      flush: false,
      multiple: false,
    },
  });
</script>

<!-- Default Accordion -->
<Story name="Default">
  {#snippet children(args)}
    <Accordion {...args}>
      <AccordionItem>
        {#snippet header()}
          <span>What is Flowbite?</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          Flowbite is an open-source library of interactive components built on top of Tailwind CSS.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}
          <span>Is there a Figma file?</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          Yes! You can find the Figma design file on the Flowbite website.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}
          <span>What are the differences?</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          The main difference is that the core components are built as web components.
        </p>
      </AccordionItem>
    </Accordion>
  {/snippet}
</Story>

<!-- Flush Accordion -->
<Story name="Flush" args={{ flush: true }}>
  {#snippet children(args)}
    <Accordion {...args}>
      <AccordionItem>
        {#snippet header()}
          <span>What is Flowbite?</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          Flowbite is an open-source library of interactive components.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}
          <span>Is there a Figma file?</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          Yes! You can find the Figma design file on the website.
        </p>
      </AccordionItem>
    </Accordion>
  {/snippet}
</Story>

<!-- Multiple Open -->
<Story name="Multiple Open" args={{ multiple: true }}>
  {#snippet children(args)}
    <Accordion {...args}>
      <AccordionItem open>
        {#snippet header()}
          <span>First Item (Open)</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          This item starts open.
        </p>
      </AccordionItem>
      <AccordionItem open>
        {#snippet header()}
          <span>Second Item (Open)</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          This item also starts open because multiple is enabled.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}
          <span>Third Item (Closed)</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          This item starts closed.
        </p>
      </AccordionItem>
    </Accordion>
  {/snippet}
</Story>

<!-- With Default Open -->
<Story name="Default Open">
  {#snippet children(args)}
    <Accordion>
      <AccordionItem open>
        {#snippet header()}
          <span>This starts open</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          This accordion item is open by default.
        </p>
      </AccordionItem>
      <AccordionItem>
        {#snippet header()}
          <span>This starts closed</span>
        {/snippet}
        <p class="mb-2 text-gray-500 dark:text-gray-400">
          Click to expand this item.
        </p>
      </AccordionItem>
    </Accordion>
  {/snippet}
</Story>
