<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import MegaMenu from './MegaMenu.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/MegaMenu',
    component: MegaMenu,
    tags: ['autodocs'],
    argTypes: {
      full: {
        control: 'boolean',
        description: 'Whether the menu takes full width',
      },
    },
    args: {
      full: false,
    },
  });

  const menuItems = [
    { name: 'About Us', href: '#' },
    { name: 'Library', href: '#' },
    { name: 'Resources', href: '#' },
    { name: 'Pro Version', href: '#' },
  ];

  const companyItems = [
    { name: 'About Us', href: '#', description: 'Learn more about our company' },
    { name: 'Careers', href: '#', description: 'Join our team' },
    { name: 'Blog', href: '#', description: 'Read our latest articles' },
    { name: 'Press', href: '#', description: 'News and announcements' },
  ];

  const productItems = [
    { name: 'Features', href: '#' },
    { name: 'Integrations', href: '#' },
    { name: 'Pricing', href: '#' },
    { name: 'Changelog', href: '#' },
    { name: 'Roadmap', href: '#' },
    { name: 'API Docs', href: '#' },
  ];
</script>

<!-- Default MegaMenu -->
<Story name="Default">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[300px]">
      <MegaMenu {...args} items={menuItems}>
        {#snippet trigger()}
          <Button color="primary">
            Open Menu
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        {#snippet children({ item })}
          <a href={item.href} class="block p-2 text-sm text-gray-600 hover:text-primary-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-primary-500 dark:hover:bg-gray-700 rounded">
            {item.name}
          </a>
        {/snippet}
      </MegaMenu>
    </div>
  {/snippet}
</Story>

<!-- Full Width Menu -->
<Story name="Full Width">
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <MegaMenu full items={productItems}>
        {#snippet trigger()}
          <Button color="alternative">
            Products
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        {#snippet children({ item })}
          <a href={item.href} class="block p-3 text-gray-600 hover:text-primary-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-primary-500 dark:hover:bg-gray-700 rounded-lg">
            {item.name}
          </a>
        {/snippet}
      </MegaMenu>
    </div>
  {/snippet}
</Story>

<!-- With Extra Content -->
<Story name="With Extra Content">
  {#snippet children(args)}
    <div class="min-h-[400px]">
      <MegaMenu full items={companyItems}>
        {#snippet trigger()}
          <Button color="primary">
            Company
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        {#snippet children({ item })}
          <a href={item.href} class="block p-3 hover:bg-gray-100 dark:hover:bg-gray-700 rounded-lg">
            <div class="font-semibold text-gray-900 dark:text-white">{item.name}</div>
            <p class="text-sm text-gray-500 dark:text-gray-400">{item.description}</p>
          </a>
        {/snippet}
        {#snippet extra()}
          <div class="p-4 bg-gray-50 dark:bg-gray-700 rounded-lg">
            <h3 class="mb-2 font-semibold text-gray-900 dark:text-white">Our Mission</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mb-3">
              We're dedicated to building the best tools for developers worldwide.
            </p>
            <a href="#" class="inline-flex items-center text-sm font-medium text-primary-600 hover:text-primary-700 dark:text-primary-500">
              Learn more
              <svg class="w-3 h-3 ms-1" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
              </svg>
            </a>
          </div>
        {/snippet}
      </MegaMenu>
    </div>
  {/snippet}
</Story>

<!-- With Icons -->
<Story name="With Icons">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[350px]">
      <MegaMenu items={[
        { name: 'Dashboard', href: '#', icon: 'home' },
        { name: 'Settings', href: '#', icon: 'cog' },
        { name: 'Users', href: '#', icon: 'users' },
        { name: 'Reports', href: '#', icon: 'chart' },
      ]}>
        {#snippet trigger()}
          <Button color="alternative">
            Navigation
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        {#snippet children({ item })}
          <a href={item.href} class="flex items-center gap-3 p-3 text-gray-600 hover:text-primary-600 hover:bg-gray-100 dark:text-gray-400 dark:hover:text-primary-500 dark:hover:bg-gray-700 rounded-lg">
            {#if item.icon === 'home'}
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
              </svg>
            {:else if item.icon === 'cog'}
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
              </svg>
            {:else if item.icon === 'users'}
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path d="M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z"/>
              </svg>
            {:else if item.icon === 'chart'}
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path d="M2 10a8 8 0 018-8v8h8a8 8 0 11-16 0z"/>
                <path d="M12 2.252A8.014 8.014 0 0117.748 8H12V2.252z"/>
              </svg>
            {/if}
            {item.name}
          </a>
        {/snippet}
      </MegaMenu>
    </div>
  {/snippet}
</Story>
