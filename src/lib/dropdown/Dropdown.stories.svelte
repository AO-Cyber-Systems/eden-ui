<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Dropdown from './Dropdown.svelte';
  import DropdownItem from './DropdownItem.svelte';
  import DropdownGroup from './DropdownGroup.svelte';
  import DropdownDivider from './DropdownDivider.svelte';
  import DropdownHeader from './DropdownHeader.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Dropdown',
    component: Dropdown,
    tags: ['autodocs'],
    argTypes: {
      placement: {
        control: { type: 'select' },
        options: ['top', 'top-start', 'top-end', 'right', 'right-start', 'right-end', 'bottom', 'bottom-start', 'bottom-end', 'left', 'left-start', 'left-end'],
        description: 'The placement of the dropdown',
      },
      simple: {
        control: 'boolean',
        description: 'Whether to use simple mode (auto-wrap with group)',
      },
      offset: {
        control: { type: 'number' },
        description: 'The offset from the trigger element',
      },
    },
    args: {
      placement: 'bottom',
      simple: false,
      offset: 2,
    },
  });
</script>

<!-- Default Dropdown -->
<Story name="Default">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[200px]">
      <Dropdown {...args}>
        {#snippet trigger()}
          <Button color="primary">
            Dropdown
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>Dashboard</DropdownItem>
          <DropdownItem>Settings</DropdownItem>
          <DropdownItem>Earnings</DropdownItem>
          <DropdownItem>Sign out</DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- With Header -->
<Story name="With Header">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[250px]">
      <Dropdown>
        {#snippet trigger()}
          <Button color="primary">
            User Menu
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownHeader>
          <span class="block text-sm font-medium truncate">Bonnie Green</span>
          <span class="block text-sm truncate text-gray-500 dark:text-gray-400">bonnie@flowbite.com</span>
        </DropdownHeader>
        <DropdownGroup>
          <DropdownItem>Dashboard</DropdownItem>
          <DropdownItem>Settings</DropdownItem>
          <DropdownItem>Earnings</DropdownItem>
        </DropdownGroup>
        <DropdownDivider />
        <DropdownGroup>
          <DropdownItem>Sign out</DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- With Divider -->
<Story name="With Divider">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[220px]">
      <Dropdown>
        {#snippet trigger()}
          <Button color="primary">
            Options
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>Edit</DropdownItem>
          <DropdownItem>Duplicate</DropdownItem>
        </DropdownGroup>
        <DropdownDivider />
        <DropdownGroup>
          <DropdownItem>Archive</DropdownItem>
          <DropdownItem>Move</DropdownItem>
        </DropdownGroup>
        <DropdownDivider />
        <DropdownGroup>
          <DropdownItem>Delete</DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- Simple Mode -->
<Story name="Simple Mode" args={{ simple: true }}>
  {#snippet children(args)}
    <div class="flex justify-center min-h-[200px]">
      <Dropdown {...args}>
        {#snippet trigger()}
          <Button color="alternative">
            Simple Dropdown
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownItem>Profile</DropdownItem>
        <DropdownItem>Settings</DropdownItem>
        <DropdownItem>Sign out</DropdownItem>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- With Links -->
<Story name="With Links">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[200px]">
      <Dropdown activeUrl="/dashboard">
        {#snippet trigger()}
          <Button color="primary">
            Navigation
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem href="/dashboard">Dashboard</DropdownItem>
          <DropdownItem href="/settings">Settings</DropdownItem>
          <DropdownItem href="/profile">Profile</DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- Placement Variants -->
<Story name="Placement Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap justify-center gap-4 min-h-[300px] py-20">
      <Dropdown placement="top">
        {#snippet trigger()}
          <Button color="primary">Top</Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>Item 1</DropdownItem>
          <DropdownItem>Item 2</DropdownItem>
        </DropdownGroup>
      </Dropdown>

      <Dropdown placement="bottom">
        {#snippet trigger()}
          <Button color="primary">Bottom</Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>Item 1</DropdownItem>
          <DropdownItem>Item 2</DropdownItem>
        </DropdownGroup>
      </Dropdown>

      <Dropdown placement="left">
        {#snippet trigger()}
          <Button color="primary">Left</Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>Item 1</DropdownItem>
          <DropdownItem>Item 2</DropdownItem>
        </DropdownGroup>
      </Dropdown>

      <Dropdown placement="right">
        {#snippet trigger()}
          <Button color="primary">Right</Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>Item 1</DropdownItem>
          <DropdownItem>Item 2</DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- With Icons -->
<Story name="With Icons">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[220px]">
      <Dropdown>
        {#snippet trigger()}
          <Button color="primary">
            Actions
            <svg class="w-2.5 h-2.5 ms-3" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
              <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 4 4 4-4"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem class="flex items-center">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
            </svg>
            Edit
          </DropdownItem>
          <DropdownItem class="flex items-center">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
              <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd"/>
            </svg>
            Duplicate
          </DropdownItem>
          <DropdownItem class="flex items-center text-red-600 dark:text-red-500">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"/>
            </svg>
            Delete
          </DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>

<!-- Kebab Menu -->
<Story name="Kebab Menu">
  {#snippet children(args)}
    <div class="flex justify-center min-h-[180px]">
      <Dropdown>
        {#snippet trigger()}
          <Button color="alternative" class="!p-2">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10 6a2 2 0 110-4 2 2 0 010 4zM10 12a2 2 0 110-4 2 2 0 010 4zM10 18a2 2 0 110-4 2 2 0 010 4z"/>
            </svg>
          </Button>
        {/snippet}
        <DropdownGroup>
          <DropdownItem>View</DropdownItem>
          <DropdownItem>Edit</DropdownItem>
          <DropdownItem>Delete</DropdownItem>
        </DropdownGroup>
      </Dropdown>
    </div>
  {/snippet}
</Story>
