<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Sidebar from './Sidebar.svelte';
  import SidebarWrapper from './SidebarWrapper.svelte';
  import SidebarGroup from './SidebarGroup.svelte';
  import SidebarItem from './SidebarItem.svelte';
  import SidebarDropdownWrapper from './SidebarDropdownWrapper.svelte';
  import SidebarBrand from './SidebarBrand.svelte';
  import SidebarButton from './SidebarButton.svelte';
  import SidebarCta from './SidebarCta.svelte';

  const { Story } = defineMeta({
    title: 'Components/Sidebar',
    component: Sidebar,
    tags: ['autodocs'],
    argTypes: {
      breakpoint: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg', 'xl', '2xl'],
        description: 'Responsive breakpoint for sidebar visibility',
      },
      position: {
        control: { type: 'select' },
        options: ['fixed', 'absolute', 'static'],
        description: 'CSS position of the sidebar',
      },
      backdrop: {
        control: 'boolean',
        description: 'Show backdrop overlay when sidebar is open',
      },
      activateClickOutside: {
        control: 'boolean',
        description: 'Close sidebar when clicking outside',
      },
      isSingle: {
        control: 'boolean',
        description: 'Only allow one dropdown open at a time',
      },
    },
    args: {
      breakpoint: 'md',
      position: 'fixed',
      backdrop: true,
      activateClickOutside: true,
      isSingle: true,
    },
  });

  let isOpen = $state(true);

  const site = {
    name: 'Flowbite',
    href: '/',
    img: 'https://flowbite.com/docs/images/logo.svg',
  };

  function closeSidebar() {
    isOpen = false;
  }

  function toggleSidebar() {
    isOpen = !isOpen;
  }
</script>

<!-- Default Sidebar -->
<Story name="Default">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar {...args} {isOpen} {closeSidebar} disableBreakpoints>
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
                </svg>
              {/snippet}
            </SidebarItem>
            <SidebarItem label="Kanban" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/>
                </svg>
              {/snippet}
            </SidebarItem>
            <SidebarItem label="Inbox" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M8.707 7.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l2-2a1 1 0 00-1.414-1.414L11 7.586V3a1 1 0 10-2 0v4.586l-.293-.293z"/>
                  <path d="M3 5a2 2 0 012-2h1a1 1 0 010 2H5v7h2l1 2h4l1-2h2V5h-1a1 1 0 110-2h1a2 2 0 012 2v10a2 2 0 01-2 2H5a2 2 0 01-2-2V5z"/>
                </svg>
              {/snippet}
              {#snippet subtext()}
                <span class="inline-flex justify-center items-center p-3 ms-3 w-3 h-3 text-sm font-medium text-primary-600 bg-primary-200 rounded-full dark:bg-primary-900 dark:text-primary-200">3</span>
              {/snippet}
            </SidebarItem>
            <SidebarItem label="Users" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
            </SidebarItem>
            <SidebarItem label="Products" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
            </SidebarItem>
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>

<!-- With Brand -->
<Story name="With Brand">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar isOpen={true} disableBreakpoints>
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarBrand {site} class="mb-5" />
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#" active />
            <SidebarItem label="Settings" href="#" />
            <SidebarItem label="Users" href="#" />
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>

<!-- With Dropdown -->
<Story name="With Dropdown">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar isOpen={true} disableBreakpoints isSingle>
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
                </svg>
              {/snippet}
            </SidebarItem>

            <SidebarDropdownWrapper label="E-commerce">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
              <SidebarItem label="Products" href="#" />
              <SidebarItem label="Billing" href="#" />
              <SidebarItem label="Invoice" href="#" />
            </SidebarDropdownWrapper>

            <SidebarDropdownWrapper label="Users">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
              <SidebarItem label="All Users" href="#" />
              <SidebarItem label="Add User" href="#" />
              <SidebarItem label="Roles" href="#" />
            </SidebarDropdownWrapper>

            <SidebarItem label="Settings" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
            </SidebarItem>
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>

<!-- With Groups and Border -->
<Story name="With Groups">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar isOpen={true} disableBreakpoints>
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#" active />
            <SidebarItem label="Kanban" href="#" />
            <SidebarItem label="Inbox" href="#" />
          </SidebarGroup>
          <SidebarGroup border>
            <SidebarItem label="Upgrade to Pro" href="#" />
            <SidebarItem label="Documentation" href="#" />
            <SidebarItem label="Components" href="#" />
            <SidebarItem label="Help" href="#" />
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>

<!-- With CTA -->
<Story name="With CTA">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar isOpen={true} disableBreakpoints>
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#" />
            <SidebarItem label="Kanban" href="#" />
            <SidebarItem label="Users" href="#" />
          </SidebarGroup>
          <SidebarCta label="Beta" class="mt-6">
            {#snippet icon()}
              <button type="button" class="ms-auto -mx-1.5 -my-1.5 bg-primary-50 text-primary-900 rounded-lg focus:ring-2 focus:ring-primary-400 p-1 hover:bg-primary-200 inline-flex h-6 w-6 dark:bg-primary-900 dark:text-primary-400 dark:hover:bg-primary-800" aria-label="Close">
                <span class="sr-only">Close</span>
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
              </button>
            {/snippet}
            <p class="mb-3 text-sm text-primary-900 dark:text-primary-400">
              Preview the new Flowbite dashboard navigation! You can turn the new navigation off for a limited time in your profile.
            </p>
            <a class="text-sm text-primary-900 underline hover:text-primary-800 dark:text-primary-400 dark:hover:text-primary-300" href="#">
              Turn new navigation off
            </a>
          </SidebarCta>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>

<!-- With Active URL -->
<Story name="With Active URL">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar isOpen={true} disableBreakpoints activeUrl="#users">
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#dashboard" />
            <SidebarItem label="Kanban" href="#kanban" />
            <SidebarItem label="Users" href="#users" />
            <SidebarItem label="Settings" href="#settings" />
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
      <div class="ms-64 p-4">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          The "Users" item is automatically highlighted because activeUrl="#users"
        </p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Sidebar Button -->
<Story name="Sidebar Button">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Toggle button for opening sidebar on mobile
      </p>
      <SidebarButton onclick={toggleSidebar} />
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Sidebar is: {isOpen ? 'Open' : 'Closed'}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Admin Dashboard Example -->
<Story name="Admin Dashboard">
  {#snippet children(args)}
    <div class="relative min-h-[500px]">
      <Sidebar isOpen={true} disableBreakpoints isSingle>
        <SidebarWrapper class="py-4 px-3 bg-gray-900 h-full">
          <SidebarBrand {site} class="mb-5" />
          <SidebarGroup>
            <SidebarItem label="Dashboard" href="#" active>
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z"/>
                </svg>
              {/snippet}
            </SidebarItem>

            <SidebarDropdownWrapper label="Pages">
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M2 6a2 2 0 012-2h4l2 2h4a2 2 0 012 2v1H8a3 3 0 00-3 3v1.5a1.5 1.5 0 01-3 0V6z" clip-rule="evenodd"/>
                  <path d="M6 12a2 2 0 012-2h8a2 2 0 012 2v2a2 2 0 01-2 2H2h2a2 2 0 002-2v-2z"/>
                </svg>
              {/snippet}
              <SidebarItem label="Profile" href="#" />
              <SidebarItem label="Settings" href="#" />
              <SidebarItem label="Pricing" href="#" />
              <SidebarItem label="404 Page" href="#" />
            </SidebarDropdownWrapper>

            <SidebarDropdownWrapper label="Sales">
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M5 2a2 2 0 00-2 2v14l3.5-2 3.5 2 3.5-2 3.5 2V4a2 2 0 00-2-2H5zm2.5 3a1.5 1.5 0 100 3 1.5 1.5 0 000-3zm6.207.293a1 1 0 00-1.414 0l-6 6a1 1 0 101.414 1.414l6-6a1 1 0 000-1.414zM12.5 10a1.5 1.5 0 100 3 1.5 1.5 0 000-3z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
              <SidebarItem label="Products" href="#" />
              <SidebarItem label="Billing" href="#" />
              <SidebarItem label="Invoice" href="#" />
            </SidebarDropdownWrapper>

            <SidebarItem label="Messages" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"/>
                  <path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"/>
                </svg>
              {/snippet}
              {#snippet subtext()}
                <span class="inline-flex justify-center items-center w-5 h-5 text-xs font-semibold rounded-full text-primary-800 bg-primary-100 dark:bg-primary-700 dark:text-primary-100">6</span>
              {/snippet}
            </SidebarItem>

            <SidebarItem label="Authentication" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M3 3a1 1 0 011 1v12a1 1 0 11-2 0V4a1 1 0 011-1zm7.707 3.293a1 1 0 010 1.414L9.414 9H17a1 1 0 110 2H9.414l1.293 1.293a1 1 0 01-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
            </SidebarItem>
          </SidebarGroup>

          <SidebarGroup border>
            <SidebarItem label="Docs" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z"/>
                </svg>
              {/snippet}
            </SidebarItem>
            <SidebarItem label="Help" href="#">
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-8-3a1 1 0 00-.867.5 1 1 0 11-1.731-1A3 3 0 0113 8a3.001 3.001 0 01-2 2.83V11a1 1 0 11-2 0v-1a1 1 0 011-1 1 1 0 100-2zm0 8a1 1 0 100-2 1 1 0 000 2z" clip-rule="evenodd"/>
                </svg>
              {/snippet}
            </SidebarItem>
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>

<!-- Multi-level Dropdown -->
<Story name="Multi-level Dropdown">
  {#snippet children(args)}
    <div class="relative min-h-96">
      <Sidebar isOpen={true} disableBreakpoints isSingle={false}>
        <SidebarWrapper class="py-4 px-3 bg-gray-50 dark:bg-gray-800 h-full">
          <SidebarGroup>
            <p class="text-xs uppercase text-gray-500 dark:text-gray-400 mb-2 px-2">isSingle=false allows multiple dropdowns open</p>
            <SidebarDropdownWrapper label="Category 1">
              <SidebarItem label="Item 1.1" href="#" />
              <SidebarItem label="Item 1.2" href="#" />
              <SidebarItem label="Item 1.3" href="#" />
            </SidebarDropdownWrapper>
            <SidebarDropdownWrapper label="Category 2">
              <SidebarItem label="Item 2.1" href="#" />
              <SidebarItem label="Item 2.2" href="#" />
            </SidebarDropdownWrapper>
            <SidebarDropdownWrapper label="Category 3">
              <SidebarItem label="Item 3.1" href="#" />
              <SidebarItem label="Item 3.2" href="#" />
              <SidebarItem label="Item 3.3" href="#" />
              <SidebarItem label="Item 3.4" href="#" />
            </SidebarDropdownWrapper>
          </SidebarGroup>
        </SidebarWrapper>
      </Sidebar>
    </div>
  {/snippet}
</Story>
