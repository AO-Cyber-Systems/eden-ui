<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Navbar from './Navbar.svelte';
  import NavBrand from './NavBrand.svelte';
  import NavLi from './NavLi.svelte';
  import NavUl from './NavUl.svelte';
  import NavHamburger from './NavHamburger.svelte';
  import Button from '$lib/buttons/Button.svelte';
  import Avatar from '$lib/avatar/Avatar.svelte';

  const { Story } = defineMeta({
    title: 'Components/Navbar',
    component: Navbar,
    tags: ['autodocs'],
    argTypes: {
      fluid: {
        control: 'boolean',
        description: 'Whether the navbar container should be fluid (full-width)',
      },
      breakpoint: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg', 'xl'],
        description: 'Responsive breakpoint for mobile menu',
      },
    },
    args: {
      fluid: false,
      breakpoint: 'md',
    },
  });
</script>

<!-- Default Navbar -->
<Story name="Default">
  {#snippet children(args)}
    <Navbar {...args}>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <img src="https://flowbite.com/docs/images/logo.svg" class="me-3 h-6 sm:h-9" alt="Flowbite Logo" />
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Flowbite</span>
        </NavBrand>
        <NavHamburger onclick={toggle} />
        <NavUl {hidden}>
          <NavLi href="/" active>Home</NavLi>
          <NavLi href="/about">About</NavLi>
          <NavLi href="/services">Services</NavLi>
          <NavLi href="/pricing">Pricing</NavLi>
          <NavLi href="/contact">Contact</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- With Active Page -->
<Story name="With Active Page">
  {#snippet children(args)}
    <Navbar>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Brand</span>
        </NavBrand>
        <NavHamburger onclick={toggle} />
        <NavUl {hidden} activeUrl="/services">
          <NavLi href="/">Home</NavLi>
          <NavLi href="/about">About</NavLi>
          <NavLi href="/services">Services</NavLi>
          <NavLi href="/contact">Contact</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- With CTA Button -->
<Story name="With CTA Button">
  {#snippet children(args)}
    <Navbar>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <img src="https://flowbite.com/docs/images/logo.svg" class="me-3 h-6 sm:h-9" alt="Flowbite Logo" />
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Flowbite</span>
        </NavBrand>
        <div class="flex md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
          <Button>Get started</Button>
          <NavHamburger onclick={toggle} />
        </div>
        <NavUl {hidden}>
          <NavLi href="/">Home</NavLi>
          <NavLi href="/about">About</NavLi>
          <NavLi href="/services">Services</NavLi>
          <NavLi href="/pricing">Pricing</NavLi>
          <NavLi href="/contact">Contact</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- With Search -->
<Story name="With Search">
  {#snippet children(args)}
    <Navbar>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Brand</span>
        </NavBrand>
        <div class="flex md:order-2">
          <div class="relative hidden md:block">
            <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
              <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
              </svg>
            </div>
            <input type="text" class="block w-full p-2 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white" placeholder="Search..." />
          </div>
          <NavHamburger onclick={toggle} />
        </div>
        <NavUl {hidden}>
          <NavLi href="/">Home</NavLi>
          <NavLi href="/company">Company</NavLi>
          <NavLi href="/marketplace">Marketplace</NavLi>
          <NavLi href="/features">Features</NavLi>
          <NavLi href="/team">Team</NavLi>
          <NavLi href="/contact">Contact</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- With User Menu -->
<Story name="With User Menu">
  {#snippet children(args)}
    <Navbar>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <img src="https://flowbite.com/docs/images/logo.svg" class="me-3 h-6 sm:h-9" alt="Flowbite Logo" />
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Flowbite</span>
        </NavBrand>
        <div class="flex items-center md:order-2 space-x-3 md:space-x-0 rtl:space-x-reverse">
          <button type="button" class="flex text-sm bg-gray-800 rounded-full md:me-0 focus:ring-4 focus:ring-gray-300 dark:focus:ring-gray-600">
            <Avatar src="https://flowbite.com/docs/images/people/profile-picture-3.jpg" alt="user photo" />
          </button>
          <NavHamburger onclick={toggle} />
        </div>
        <NavUl {hidden}>
          <NavLi href="/">Dashboard</NavLi>
          <NavLi href="/settings">Settings</NavLi>
          <NavLi href="/earnings">Earnings</NavLi>
          <NavLi href="/signout">Sign out</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- Fluid Container -->
<Story name="Fluid Container">
  {#snippet children(args)}
    <Navbar fluid>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Fluid Navbar</span>
        </NavBrand>
        <NavHamburger onclick={toggle} />
        <NavUl {hidden}>
          <NavLi href="/">Home</NavLi>
          <NavLi href="/about">About</NavLi>
          <NavLi href="/services">Services</NavLi>
          <NavLi href="/contact">Contact</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- E-commerce Navbar -->
<Story name="E-commerce">
  {#snippet children(args)}
    <Navbar>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Shop</span>
        </NavBrand>
        <div class="flex items-center md:order-2 space-x-3">
          <button type="button" class="relative p-2 text-gray-500 rounded-lg hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path>
            </svg>
            <span class="absolute top-0 right-0 inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none text-white transform translate-x-1/2 -translate-y-1/2 bg-red-500 rounded-full">3</span>
          </button>
          <button type="button" class="p-2 text-gray-500 rounded-lg hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path>
            </svg>
          </button>
          <NavHamburger onclick={toggle} />
        </div>
        <NavUl {hidden}>
          <NavLi href="/">Home</NavLi>
          <NavLi href="/products">Products</NavLi>
          <NavLi href="/categories">Categories</NavLi>
          <NavLi href="/deals">Deals</NavLi>
          <NavLi href="/contact">Contact</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

<!-- Dashboard Navbar -->
<Story name="Dashboard">
  {#snippet children(args)}
    <Navbar>
      {#snippet children({ hidden, toggle })}
        <NavBrand href="/">
          <img src="https://flowbite.com/docs/images/logo.svg" class="me-3 h-6 sm:h-9" alt="Logo" />
          <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">Dashboard</span>
        </NavBrand>
        <div class="flex items-center md:order-2 space-x-4">
          <button type="button" class="relative p-2 text-gray-500 rounded-lg hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9"></path>
            </svg>
            <span class="absolute top-0 right-0 block w-2 h-2 bg-red-500 rounded-full"></span>
          </button>
          <Avatar src="https://flowbite.com/docs/images/people/profile-picture-5.jpg" alt="user" rounded />
          <NavHamburger onclick={toggle} />
        </div>
        <NavUl {hidden}>
          <NavLi href="/">Overview</NavLi>
          <NavLi href="/analytics">Analytics</NavLi>
          <NavLi href="/reports">Reports</NavLi>
          <NavLi href="/users">Users</NavLi>
          <NavLi href="/settings">Settings</NavLi>
        </NavUl>
      {/snippet}
    </Navbar>
  {/snippet}
</Story>

