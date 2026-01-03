<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Listgroup from './Listgroup.svelte';
  import ListgroupItem from './ListgroupItem.svelte';

  const { Story } = defineMeta({
    title: 'Components/Listgroup',
    component: Listgroup,
    tags: ['autodocs'],
    argTypes: {
      active: {
        control: 'boolean',
        description: 'Whether items are interactive buttons',
      },
      horizontal: {
        control: 'boolean',
        description: 'Display items horizontally',
      },
      rounded: {
        control: 'boolean',
        description: 'Apply rounded corners',
      },
      border: {
        control: 'boolean',
        description: 'Show border around the list',
      },
    },
    args: {
      active: false,
      horizontal: false,
      rounded: true,
      border: true,
    },
  });

  const simpleItems = ['Profile', 'Settings', 'Messages', 'Download'];

  const objectItems = [
    { name: 'Profile', href: '#profile' },
    { name: 'Settings', href: '#settings' },
    { name: 'Messages', href: '#messages' },
    { name: 'Download', href: '#download' },
  ];
</script>

<!-- Default Listgroup -->
<Story name="Default">
  {#snippet children(args)}
    <Listgroup {...args} items={simpleItems} />
  {/snippet}
</Story>

<!-- With Links -->
<Story name="With Links">
  {#snippet children(args)}
    <Listgroup items={objectItems} />
  {/snippet}
</Story>

<!-- Active/Interactive Buttons -->
<Story name="Active Buttons" args={{ active: true }}>
  {#snippet children(args)}
    <Listgroup {...args} items={simpleItems} />
  {/snippet}
</Story>

<!-- Horizontal Layout -->
<Story name="Horizontal" args={{ horizontal: true }}>
  {#snippet children(args)}
    <Listgroup {...args} items={simpleItems} />
  {/snippet}
</Story>

<!-- With Custom Items -->
<Story name="With Custom Items">
  {#snippet children(args)}
    <Listgroup>
      {#snippet children()}
        <ListgroupItem>
          <div class="flex items-center">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"/>
            </svg>
            Profile
          </div>
        </ListgroupItem>
        <ListgroupItem>
          <div class="flex items-center">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"/>
            </svg>
            Settings
          </div>
        </ListgroupItem>
        <ListgroupItem>
          <div class="flex items-center">
            <svg class="w-4 h-4 mr-2" fill="currentColor" viewBox="0 0 20 20">
              <path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"/>
              <path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"/>
            </svg>
            Messages
          </div>
        </ListgroupItem>
      {/snippet}
    </Listgroup>
  {/snippet}
</Story>

<!-- With Current Item -->
<Story name="With Current Item">
  {#snippet children(args)}
    <Listgroup>
      {#snippet children()}
        <ListgroupItem href="#profile">Profile</ListgroupItem>
        <ListgroupItem href="#settings" current>Settings</ListgroupItem>
        <ListgroupItem href="#messages">Messages</ListgroupItem>
        <ListgroupItem href="#download">Download</ListgroupItem>
      {/snippet}
    </Listgroup>
  {/snippet}
</Story>

<!-- With Disabled Item -->
<Story name="With Disabled Item">
  {#snippet children(args)}
    <Listgroup active>
      {#snippet children()}
        <ListgroupItem>Profile</ListgroupItem>
        <ListgroupItem>Settings</ListgroupItem>
        <ListgroupItem disabled>Messages (Disabled)</ListgroupItem>
        <ListgroupItem>Download</ListgroupItem>
      {/snippet}
    </Listgroup>
  {/snippet}
</Story>

<!-- Without Border -->
<Story name="Without Border" args={{ border: false }}>
  {#snippet children(args)}
    <Listgroup {...args} items={simpleItems} />
  {/snippet}
</Story>

<!-- Combination Example -->
<Story name="Navigation Menu">
  {#snippet children(args)}
    <div class="w-64">
      <Listgroup>
        {#snippet children()}
          <ListgroupItem href="#" current>
            <div class="flex items-center">
              <svg class="w-5 h-5 mr-3 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
              </svg>
              Dashboard
            </div>
          </ListgroupItem>
          <ListgroupItem href="#">
            <div class="flex items-center">
              <svg class="w-5 h-5 mr-3 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z"/>
                <path fill-rule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clip-rule="evenodd"/>
              </svg>
              Projects
            </div>
          </ListgroupItem>
          <ListgroupItem href="#">
            <div class="flex items-center">
              <svg class="w-5 h-5 mr-3 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-6-3a2 2 0 11-4 0 2 2 0 014 0zm-2 4a5 5 0 00-4.546 2.916A5.986 5.986 0 0010 16a5.986 5.986 0 004.546-2.084A5 5 0 0010 11z" clip-rule="evenodd"/>
              </svg>
              Team
            </div>
          </ListgroupItem>
          <ListgroupItem href="#">
            <div class="flex items-center">
              <svg class="w-5 h-5 mr-3 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M5 4a3 3 0 00-3 3v6a3 3 0 003 3h10a3 3 0 003-3V7a3 3 0 00-3-3H5zm-1 9v-1h5v2H5a1 1 0 01-1-1zm7 1h4a1 1 0 001-1v-1h-5v2zm0-4h5V8h-5v2zM9 8H4v2h5V8z" clip-rule="evenodd"/>
              </svg>
              Calendar
            </div>
          </ListgroupItem>
        {/snippet}
      </Listgroup>
    </div>
  {/snippet}
</Story>
