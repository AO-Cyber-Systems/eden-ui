<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Banner from './Banner.svelte';

  const { Story } = defineMeta({
    title: 'Components/Banner',
    component: Banner,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['gray', 'primary', 'secondary', 'red', 'orange', 'yellow', 'green', 'blue', 'purple', 'pink'],
        description: 'The color variant of the banner',
      },
      type: {
        control: { type: 'select' },
        options: [undefined, 'bottom', 'cta'],
        description: 'The type/position of the banner',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the banner can be dismissed',
      },
    },
    args: {
      color: 'gray',
      dismissable: true,
    },
  });
</script>

<!-- Default Banner -->
<Story name="Default">
  {#snippet children(args)}
    <Banner {...args}>
      <p class="flex items-center text-sm font-normal text-gray-500 dark:text-gray-400">
        <span class="inline-flex p-1 me-3 bg-gray-200 rounded-full dark:bg-gray-600">
          <svg class="w-3 h-3 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/>
          </svg>
        </span>
        <span>New version available! Check out the new features.</span>
      </p>
    </Banner>
  {/snippet}
</Story>

<!-- Banner Colors -->
<Story name="Colors">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <Banner color="gray">
        <p class="text-sm">Gray banner message</p>
      </Banner>
      <Banner color="primary">
        <p class="text-sm">Primary banner message</p>
      </Banner>
      <Banner color="blue">
        <p class="text-sm">Blue banner message</p>
      </Banner>
      <Banner color="green">
        <p class="text-sm">Green banner - success message</p>
      </Banner>
      <Banner color="red">
        <p class="text-sm">Red banner - error message</p>
      </Banner>
      <Banner color="yellow">
        <p class="text-sm">Yellow banner - warning message</p>
      </Banner>
    </div>
  {/snippet}
</Story>

<!-- CTA Banner -->
<Story name="CTA Type" args={{ type: 'cta' }}>
  {#snippet children(args)}
    <Banner {...args}>
      <p class="flex items-center text-sm font-normal text-gray-500 dark:text-gray-400">
        <span>Get 20% off your first order!</span>
        <a href="#" class="ml-2 text-sm font-medium text-blue-600 hover:underline dark:text-blue-500">
          Shop now
        </a>
      </p>
    </Banner>
  {/snippet}
</Story>

<!-- Bottom Banner -->
<Story name="Bottom Type" args={{ type: 'bottom' }}>
  {#snippet children(args)}
    <div class="relative h-32 bg-gray-100 dark:bg-gray-800">
      <Banner {...args}>
        <p class="text-sm font-normal text-gray-500 dark:text-gray-400">
          This banner appears at the bottom of the container.
        </p>
      </Banner>
    </div>
  {/snippet}
</Story>

<!-- Non-dismissable -->
<Story name="Non-dismissable" args={{ dismissable: false }}>
  {#snippet children(args)}
    <Banner {...args}>
      <p class="text-sm font-normal text-gray-500 dark:text-gray-400">
        This banner cannot be dismissed by the user.
      </p>
    </Banner>
  {/snippet}
</Story>

<!-- With Link -->
<Story name="With Link">
  {#snippet children(args)}
    <Banner>
      <p class="flex items-center text-sm font-normal text-gray-500 dark:text-gray-400">
        <span>We've just launched a new feature!</span>
        <a href="#" class="inline-flex items-center ml-2 text-sm font-medium text-blue-600 hover:underline dark:text-blue-500">
          Learn more
          <svg class="w-3 h-3 ms-1.5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"/>
          </svg>
        </a>
      </p>
    </Banner>
  {/snippet}
</Story>
