<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Card from './Card.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Card',
    component: Card,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The max-width size of the card',
      },
      color: {
        control: { type: 'select' },
        options: ['gray', 'red', 'yellow', 'green', 'indigo', 'purple', 'pink', 'blue', 'primary', 'none'],
        description: 'The background color of the card',
      },
      shadow: {
        control: { type: 'select' },
        options: ['none', 'sm', 'md', 'lg', 'xl'],
        description: 'The shadow size of the card',
      },
      horizontal: {
        control: 'boolean',
        description: 'Whether to display the card horizontally',
      },
      reverse: {
        control: 'boolean',
        description: 'Reverse the order of image and content',
      },
    },
    args: {
      size: 'sm',
      color: 'gray',
      shadow: 'md',
      horizontal: false,
      reverse: false,
    },
  });
</script>

<!-- Default Card -->
<Story name="Default">
  {#snippet children(args)}
    <Card {...args}>
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Noteworthy technology acquisitions 2021
      </h5>
      <p class="font-normal text-gray-700 dark:text-gray-400">
        Here are the biggest enterprise technology acquisitions of 2021 so far, in reverse chronological order.
      </p>
    </Card>
  {/snippet}
</Story>

<!-- With Image -->
<Story name="With Image">
  {#snippet children(args)}
    <Card img="https://flowbite.com/docs/images/blog/image-1.jpg" size="sm">
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Noteworthy technology acquisitions 2021
      </h5>
      <p class="mb-3 font-normal text-gray-700 dark:text-gray-400">
        Here are the biggest enterprise technology acquisitions of 2021 so far.
      </p>
      <Button>Read more</Button>
    </Card>
  {/snippet}
</Story>

<!-- Horizontal Card -->
<Story name="Horizontal" args={{ horizontal: true }}>
  {#snippet children(args)}
    <Card {...args} img="https://flowbite.com/docs/images/blog/image-4.jpg" size="md">
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Horizontal Card
      </h5>
      <p class="font-normal text-gray-700 dark:text-gray-400">
        This card displays content horizontally with the image on the left.
      </p>
    </Card>
  {/snippet}
</Story>

<!-- Horizontal Reversed -->
<Story name="Horizontal Reversed" args={{ horizontal: true, reverse: true }}>
  {#snippet children(args)}
    <Card {...args} img="https://flowbite.com/docs/images/blog/image-4.jpg" size="md">
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Reversed Horizontal Card
      </h5>
      <p class="font-normal text-gray-700 dark:text-gray-400">
        This card displays content horizontally with the image on the right.
      </p>
    </Card>
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <Card size="xs">
        <h5 class="text-lg font-bold text-gray-900 dark:text-white">Extra Small Card</h5>
        <p class="text-gray-700 dark:text-gray-400">size="xs"</p>
      </Card>
      <Card size="sm">
        <h5 class="text-lg font-bold text-gray-900 dark:text-white">Small Card</h5>
        <p class="text-gray-700 dark:text-gray-400">size="sm"</p>
      </Card>
      <Card size="md">
        <h5 class="text-lg font-bold text-gray-900 dark:text-white">Medium Card</h5>
        <p class="text-gray-700 dark:text-gray-400">size="md"</p>
      </Card>
      <Card size="lg">
        <h5 class="text-lg font-bold text-gray-900 dark:text-white">Large Card</h5>
        <p class="text-gray-700 dark:text-gray-400">size="lg"</p>
      </Card>
    </div>
  {/snippet}
</Story>

<!-- Colors -->
<Story name="Colors">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4">
      <Card color="gray" size="xs">
        <p class="text-gray-700 dark:text-gray-400">Gray</p>
      </Card>
      <Card color="primary" size="xs">
        <p class="text-white">Primary</p>
      </Card>
      <Card color="blue" size="xs">
        <p class="text-white">Blue</p>
      </Card>
      <Card color="green" size="xs">
        <p class="text-white">Green</p>
      </Card>
      <Card color="red" size="xs">
        <p class="text-white">Red</p>
      </Card>
      <Card color="purple" size="xs">
        <p class="text-white">Purple</p>
      </Card>
    </div>
  {/snippet}
</Story>

<!-- Shadow Sizes -->
<Story name="Shadows">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-4 p-4 bg-gray-100 dark:bg-gray-800">
      <Card shadow="none" size="xs">
        <p class="text-gray-700 dark:text-gray-400">No Shadow</p>
      </Card>
      <Card shadow="sm" size="xs">
        <p class="text-gray-700 dark:text-gray-400">Small Shadow</p>
      </Card>
      <Card shadow="md" size="xs">
        <p class="text-gray-700 dark:text-gray-400">Medium Shadow</p>
      </Card>
      <Card shadow="lg" size="xs">
        <p class="text-gray-700 dark:text-gray-400">Large Shadow</p>
      </Card>
      <Card shadow="xl" size="xs">
        <p class="text-gray-700 dark:text-gray-400">XL Shadow</p>
      </Card>
    </div>
  {/snippet}
</Story>

<!-- As Link -->
<Story name="As Link">
  {#snippet children(args)}
    <Card href="#" size="sm">
      <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
        Clickable Card
      </h5>
      <p class="font-normal text-gray-700 dark:text-gray-400">
        This entire card is a link. Click anywhere to navigate.
      </p>
    </Card>
  {/snippet}
</Story>

<!-- Call to Action -->
<Story name="CTA Card">
  {#snippet children(args)}
    <Card size="sm">
      <h5 class="mb-2 text-3xl font-bold text-gray-900 dark:text-white">
        Work smarter from anywhere
      </h5>
      <p class="mb-5 text-base text-gray-500 dark:text-gray-400 sm:text-lg">
        Stay connected with your team and access your work from any device with our cloud platform.
      </p>
      <div class="flex flex-wrap gap-2">
        <Button color="primary">Get started</Button>
        <Button color="alternative">Learn more</Button>
      </div>
    </Card>
  {/snippet}
</Story>
