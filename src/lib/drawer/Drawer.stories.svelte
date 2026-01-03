<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Drawer from './Drawer.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Drawer',
    component: Drawer,
    tags: ['autodocs'],
    argTypes: {
      placement: {
        control: { type: 'select' },
        options: ['left', 'right', 'top', 'bottom'],
        description: 'The placement of the drawer',
      },
      width: {
        control: { type: 'select' },
        options: ['default', 'full'],
        description: 'The width of the drawer',
      },
      modal: {
        control: 'boolean',
        description: 'Whether the drawer is modal (has backdrop)',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the drawer has a close button',
      },
      outsideclose: {
        control: 'boolean',
        description: 'Whether clicking outside closes the drawer',
      },
    },
    args: {
      placement: 'left',
      modal: true,
      dismissable: true,
      outsideclose: true,
    },
  });

  let leftOpen = $state(false);
  let rightOpen = $state(false);
  let topOpen = $state(false);
  let bottomOpen = $state(false);
  let navOpen = $state(false);
  let formOpen = $state(false);
</script>

<!-- Default Drawer (Left) -->
<Story name="Default">
  {#snippet children(args)}
    <Button onclick={() => leftOpen = true}>Open Left Drawer</Button>
    <Drawer {...args} bind:open={leftOpen} class="p-4 w-80">
      <h5 class="inline-flex items-center mb-4 text-base font-semibold text-gray-500 dark:text-gray-400">
        <svg class="w-4 h-4 mr-2.5" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
        </svg>
        Info
      </h5>
      <p class="mb-6 text-sm text-gray-500 dark:text-gray-400">
        Supercharge your hiring by taking advantage of our limited-time sale on Alarm Manager.
      </p>
      <div class="flex gap-2">
        <Button color="primary" class="w-full">Learn more</Button>
        <Button color="alternative" class="w-full" onclick={() => leftOpen = false}>Close</Button>
      </div>
    </Drawer>
  {/snippet}
</Story>

<!-- Right Placement -->
<Story name="Right Placement" args={{ placement: 'right' }}>
  {#snippet children(args)}
    <Button onclick={() => rightOpen = true}>Open Right Drawer</Button>
    <Drawer {...args} bind:open={rightOpen} class="p-4 w-80">
      <h5 class="inline-flex items-center mb-4 text-base font-semibold text-gray-500 dark:text-gray-400">
        Settings
      </h5>
      <p class="mb-6 text-sm text-gray-500 dark:text-gray-400">
        Configure your application settings and preferences here.
      </p>
      <Button color="alternative" class="w-full" onclick={() => rightOpen = false}>Close</Button>
    </Drawer>
  {/snippet}
</Story>

<!-- Top Placement -->
<Story name="Top Placement" args={{ placement: 'top' }}>
  {#snippet children(args)}
    <Button onclick={() => topOpen = true}>Open Top Drawer</Button>
    <Drawer {...args} bind:open={topOpen} class="p-4 w-full">
      <div class="max-w-lg mx-auto text-center">
        <h5 class="mb-2 text-lg font-semibold text-gray-500 dark:text-gray-400">
          Important Notice
        </h5>
        <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
          This is a notification from the top of the page.
        </p>
        <Button color="primary" onclick={() => topOpen = false}>Got it</Button>
      </div>
    </Drawer>
  {/snippet}
</Story>

<!-- Bottom Placement -->
<Story name="Bottom Placement" args={{ placement: 'bottom' }}>
  {#snippet children(args)}
    <Button onclick={() => bottomOpen = true}>Open Bottom Drawer</Button>
    <Drawer {...args} bind:open={bottomOpen} class="p-4 w-full">
      <div class="max-w-lg mx-auto text-center">
        <h5 class="mb-2 text-lg font-semibold text-gray-500 dark:text-gray-400">
          Cookie Preferences
        </h5>
        <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
          We use cookies to improve your experience on our website.
        </p>
        <div class="flex justify-center gap-2">
          <Button color="primary" onclick={() => bottomOpen = false}>Accept All</Button>
          <Button color="alternative" onclick={() => bottomOpen = false}>Decline</Button>
        </div>
      </div>
    </Drawer>
  {/snippet}
</Story>

<!-- Navigation Drawer -->
<Story name="Navigation Drawer">
  {#snippet children(args)}
    <Button onclick={() => navOpen = true}>Open Navigation</Button>
    <Drawer bind:open={navOpen} class="p-4 w-64">
      <h5 class="text-base font-semibold text-gray-500 uppercase dark:text-gray-400 mb-4">Menu</h5>
      <ul class="space-y-2">
        <li>
          <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
            </svg>
            <span class="ml-3">Dashboard</span>
          </a>
        </li>
        <li>
          <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
              <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd"/>
            </svg>
            <span class="ml-3">Projects</span>
          </a>
        </li>
        <li>
          <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
            </svg>
            <span class="ml-3">Users</span>
          </a>
        </li>
        <li>
          <a href="#" class="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
            </svg>
            <span class="ml-3">Settings</span>
          </a>
        </li>
      </ul>
    </Drawer>
  {/snippet}
</Story>

<!-- Form Drawer -->
<Story name="Form Drawer">
  {#snippet children(args)}
    <Button onclick={() => formOpen = true}>Open Form Drawer</Button>
    <Drawer bind:open={formOpen} placement="right" class="p-4 w-96">
      <h5 class="inline-flex items-center mb-6 text-base font-semibold text-gray-500 dark:text-gray-400">
        <svg class="w-4 h-4 mr-2.5" fill="currentColor" viewBox="0 0 20 20">
          <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
        </svg>
        New Project
      </h5>
      <form class="space-y-4">
        <div>
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Name</label>
          <input type="text" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:text-white" placeholder="Project name" required />
        </div>
        <div>
          <label for="description" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
          <textarea id="description" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white" placeholder="Project description"></textarea>
        </div>
        <div class="flex gap-2 pt-4">
          <Button type="submit" color="primary" class="w-full">Create Project</Button>
          <Button color="alternative" class="w-full" onclick={() => formOpen = false}>Cancel</Button>
        </div>
      </form>
    </Drawer>
  {/snippet}
</Story>

<!-- Non-modal (with offset) -->
<Story name="Non-modal with Offset">
  {#snippet children(args)}
    <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg min-h-[200px]">
      <p class="text-gray-600 dark:text-gray-400 mb-4">
        The drawer below stays visible with an offset when closed.
      </p>
      <Button onclick={() => leftOpen = !leftOpen}>
        {leftOpen ? 'Close' : 'Open'} Drawer
      </Button>
    </div>
    <Drawer bind:open={leftOpen} offset="48px" modal={false} class="p-4 w-64">
      <h5 class="text-base font-semibold text-gray-500 dark:text-gray-400 mb-4">Sidebar</h5>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        This drawer has an offset so it peeks out when closed.
      </p>
    </Drawer>
  {/snippet}
</Story>
