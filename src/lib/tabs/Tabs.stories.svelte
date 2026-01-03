<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Tabs from './Tabs.svelte';
  import TabItem from './TabItem.svelte';

  const { Story } = defineMeta({
    title: 'Components/Tabs',
    component: Tabs,
    tags: ['autodocs'],
    argTypes: {
      tabStyle: {
        control: { type: 'select' },
        options: ['none', 'full', 'pill', 'underline'],
        description: 'Visual style for the tabs',
      },
      divider: {
        control: 'boolean',
        description: 'Show divider line below tabs',
      },
    },
    args: {
      tabStyle: 'none',
      divider: true,
    },
  });

  let selectedTab = $state('profile');
</script>

<!-- Default Tabs -->
<Story name="Default">
  {#snippet children(args)}
    <Tabs {...args}>
      <TabItem open title="Profile">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          <b>Profile:</b> This is the profile tab content. User information and settings would appear here.
        </p>
      </TabItem>
      <TabItem title="Dashboard">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          <b>Dashboard:</b> This is the dashboard tab content. Analytics and overview would appear here.
        </p>
      </TabItem>
      <TabItem title="Settings">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          <b>Settings:</b> This is the settings tab content. Configuration options would appear here.
        </p>
      </TabItem>
      <TabItem title="Contacts">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          <b>Contacts:</b> This is the contacts tab content. Contact list would appear here.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Tab Styles -->
<Story name="Tab Styles">
  {#snippet children(args)}
    <div class="space-y-12">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Default Style (none)</p>
        <Tabs tabStyle="none">
          <TabItem open title="Profile">
            <p class="text-sm text-gray-500 dark:text-gray-400">Profile content with default style.</p>
          </TabItem>
          <TabItem title="Dashboard">
            <p class="text-sm text-gray-500 dark:text-gray-400">Dashboard content.</p>
          </TabItem>
          <TabItem title="Settings">
            <p class="text-sm text-gray-500 dark:text-gray-400">Settings content.</p>
          </TabItem>
        </Tabs>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Underline Style</p>
        <Tabs tabStyle="underline">
          <TabItem open title="Profile">
            <p class="text-sm text-gray-500 dark:text-gray-400">Profile content with underline style.</p>
          </TabItem>
          <TabItem title="Dashboard">
            <p class="text-sm text-gray-500 dark:text-gray-400">Dashboard content.</p>
          </TabItem>
          <TabItem title="Settings">
            <p class="text-sm text-gray-500 dark:text-gray-400">Settings content.</p>
          </TabItem>
        </Tabs>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Pill Style</p>
        <Tabs tabStyle="pill">
          <TabItem open title="Profile">
            <p class="text-sm text-gray-500 dark:text-gray-400">Profile content with pill style.</p>
          </TabItem>
          <TabItem title="Dashboard">
            <p class="text-sm text-gray-500 dark:text-gray-400">Dashboard content.</p>
          </TabItem>
          <TabItem title="Settings">
            <p class="text-sm text-gray-500 dark:text-gray-400">Settings content.</p>
          </TabItem>
        </Tabs>
      </div>

      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Full Width Style</p>
        <Tabs tabStyle="full">
          <TabItem open title="Profile">
            <p class="text-sm text-gray-500 dark:text-gray-400">Profile content with full width style.</p>
          </TabItem>
          <TabItem title="Dashboard">
            <p class="text-sm text-gray-500 dark:text-gray-400">Dashboard content.</p>
          </TabItem>
          <TabItem title="Settings">
            <p class="text-sm text-gray-500 dark:text-gray-400">Settings content.</p>
          </TabItem>
        </Tabs>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Underline Style -->
<Story name="Underline Style">
  {#snippet children(args)}
    <Tabs tabStyle="underline">
      <TabItem open title="Profile">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          This is the <b>Profile</b> tab content. The underline style provides a clean, minimal look
          with an underline indicator for the active tab.
        </p>
      </TabItem>
      <TabItem title="Dashboard">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          This is the <b>Dashboard</b> tab content with analytics overview.
        </p>
      </TabItem>
      <TabItem title="Settings">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          This is the <b>Settings</b> tab content with configuration options.
        </p>
      </TabItem>
      <TabItem title="Contacts">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          This is the <b>Contacts</b> tab content with your contact list.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Pill Style -->
<Story name="Pill Style">
  {#snippet children(args)}
    <Tabs tabStyle="pill">
      <TabItem open title="Profile">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Profile tab with pill-style buttons. This style gives a more button-like appearance.
        </p>
      </TabItem>
      <TabItem title="Dashboard">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Dashboard content area.
        </p>
      </TabItem>
      <TabItem title="Settings">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Settings content area.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Full Width Style -->
<Story name="Full Width Style">
  {#snippet children(args)}
    <Tabs tabStyle="full">
      <TabItem open title="Profile">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Full width tabs distribute equally across the container. Perfect for a balanced layout.
        </p>
      </TabItem>
      <TabItem title="Dashboard">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Dashboard content in full width mode.
        </p>
      </TabItem>
      <TabItem title="Settings">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Settings content in full width mode.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- With Disabled Tab -->
<Story name="With Disabled Tab">
  {#snippet children(args)}
    <Tabs tabStyle="underline">
      <TabItem open title="Profile">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Profile content. Notice that the "Contacts" tab is disabled and cannot be selected.
        </p>
      </TabItem>
      <TabItem title="Dashboard">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Dashboard content.
        </p>
      </TabItem>
      <TabItem title="Settings">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Settings content.
        </p>
      </TabItem>
      <TabItem disabled title="Contacts">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          This content cannot be accessed because the tab is disabled.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Without Divider -->
<Story name="Without Divider">
  {#snippet children(args)}
    <Tabs tabStyle="none" divider={false}>
      <TabItem open title="Profile">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Content without the divider line between tabs and content.
        </p>
      </TabItem>
      <TabItem title="Dashboard">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Dashboard content.
        </p>
      </TabItem>
      <TabItem title="Settings">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Settings content.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Controlled Selection -->
<Story name="Controlled Selection">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Use the <code class="bg-gray-100 dark:bg-gray-800 px-1 rounded">selected</code> prop with <code class="bg-gray-100 dark:bg-gray-800 px-1 rounded">key</code> to control which tab is active programmatically.
      </p>
      <div class="flex gap-2 mb-4">
        <button
          class="px-3 py-1.5 text-sm bg-blue-600 text-white rounded hover:bg-blue-700"
          onclick={() => (selectedTab = 'profile')}
        >
          Select Profile
        </button>
        <button
          class="px-3 py-1.5 text-sm bg-blue-600 text-white rounded hover:bg-blue-700"
          onclick={() => (selectedTab = 'dashboard')}
        >
          Select Dashboard
        </button>
        <button
          class="px-3 py-1.5 text-sm bg-blue-600 text-white rounded hover:bg-blue-700"
          onclick={() => (selectedTab = 'settings')}
        >
          Select Settings
        </button>
      </div>
      <p class="text-xs text-gray-400">Currently selected: {selectedTab}</p>
      <Tabs tabStyle="underline" bind:selected={selectedTab}>
        <TabItem key="profile" title="Profile">
          <p class="text-sm text-gray-500 dark:text-gray-400">Profile content controlled externally.</p>
        </TabItem>
        <TabItem key="dashboard" title="Dashboard">
          <p class="text-sm text-gray-500 dark:text-gray-400">Dashboard content controlled externally.</p>
        </TabItem>
        <TabItem key="settings" title="Settings">
          <p class="text-sm text-gray-500 dark:text-gray-400">Settings content controlled externally.</p>
        </TabItem>
      </Tabs>
    </div>
  {/snippet}
</Story>

<!-- With Icons (Title Slot) -->
<Story name="With Icons">
  {#snippet children(args)}
    <Tabs tabStyle="underline">
      <TabItem open>
        {#snippet titleSlot()}
          <div class="flex items-center gap-2">
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd" />
            </svg>
            Profile
          </div>
        {/snippet}
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Profile tab with an icon in the tab button.
        </p>
      </TabItem>
      <TabItem>
        {#snippet titleSlot()}
          <div class="flex items-center gap-2">
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path d="M3 4a1 1 0 011-1h12a1 1 0 011 1v2a1 1 0 01-1 1H4a1 1 0 01-1-1V4zM3 10a1 1 0 011-1h6a1 1 0 011 1v6a1 1 0 01-1 1H4a1 1 0 01-1-1v-6zM14 9a1 1 0 00-1 1v6a1 1 0 001 1h2a1 1 0 001-1v-6a1 1 0 00-1-1h-2z" />
            </svg>
            Dashboard
          </div>
        {/snippet}
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Dashboard tab with an icon.
        </p>
      </TabItem>
      <TabItem>
        {#snippet titleSlot()}
          <div class="flex items-center gap-2">
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd" />
            </svg>
            Settings
          </div>
        {/snippet}
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Settings tab with an icon.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- With Badges -->
<Story name="With Badges">
  {#snippet children(args)}
    <Tabs tabStyle="pill">
      <TabItem open>
        {#snippet titleSlot()}
          <div class="flex items-center gap-2">
            Inbox
            <span class="bg-blue-100 text-blue-800 text-xs font-medium px-2 py-0.5 rounded dark:bg-blue-900 dark:text-blue-300">
              12
            </span>
          </div>
        {/snippet}
        <p class="text-sm text-gray-500 dark:text-gray-400">
          You have 12 unread messages in your inbox.
        </p>
      </TabItem>
      <TabItem>
        {#snippet titleSlot()}
          <div class="flex items-center gap-2">
            Notifications
            <span class="bg-red-100 text-red-800 text-xs font-medium px-2 py-0.5 rounded dark:bg-red-900 dark:text-red-300">
              3
            </span>
          </div>
        {/snippet}
        <p class="text-sm text-gray-500 dark:text-gray-400">
          You have 3 new notifications.
        </p>
      </TabItem>
      <TabItem title="Archive">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          View archived messages.
        </p>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Rich Content -->
<Story name="Rich Content">
  {#snippet children(args)}
    <Tabs tabStyle="underline">
      <TabItem open title="Overview">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Project Overview</h3>
          <div class="grid grid-cols-3 gap-4">
            <div class="p-4 bg-white dark:bg-gray-700 rounded-lg shadow">
              <p class="text-2xl font-bold text-gray-900 dark:text-white">128</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Total Tasks</p>
            </div>
            <div class="p-4 bg-white dark:bg-gray-700 rounded-lg shadow">
              <p class="text-2xl font-bold text-green-600">96</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Completed</p>
            </div>
            <div class="p-4 bg-white dark:bg-gray-700 rounded-lg shadow">
              <p class="text-2xl font-bold text-yellow-600">32</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">In Progress</p>
            </div>
          </div>
        </div>
      </TabItem>
      <TabItem title="Team">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Team Members</h3>
          <ul class="divide-y divide-gray-200 dark:divide-gray-700">
            {#each ['Alice Johnson', 'Bob Smith', 'Carol Williams'] as member}
              <li class="py-3 flex items-center gap-3">
                <div class="w-10 h-10 rounded-full bg-gray-200 dark:bg-gray-600 flex items-center justify-center">
                  {member.charAt(0)}
                </div>
                <div>
                  <p class="font-medium text-gray-900 dark:text-white">{member}</p>
                  <p class="text-sm text-gray-500 dark:text-gray-400">Developer</p>
                </div>
              </li>
            {/each}
          </ul>
        </div>
      </TabItem>
      <TabItem title="Activity">
        <div class="space-y-4">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recent Activity</h3>
          <div class="space-y-3">
            {#each ['Completed task: Update documentation', 'New comment on PR #42', 'Merged branch feature/tabs'] as activity, i}
              <div class="flex gap-3 text-sm">
                <span class="text-gray-400">{i + 1}h ago</span>
                <span class="text-gray-700 dark:text-gray-300">{activity}</span>
              </div>
            {/each}
          </div>
        </div>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>

<!-- Custom Active Classes -->
<Story name="Custom Active Classes">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Custom active styling with green colors instead of primary.
      </p>
      <Tabs tabStyle="underline" classes={{ active: "p-4 text-green-600 border-b-2 border-green-600 dark:text-green-400 dark:border-green-400" }}>
        <TabItem open title="Tab 1">
          <p class="text-sm text-gray-500 dark:text-gray-400">Content with custom green active styling.</p>
        </TabItem>
        <TabItem title="Tab 2">
          <p class="text-sm text-gray-500 dark:text-gray-400">Second tab content.</p>
        </TabItem>
        <TabItem title="Tab 3">
          <p class="text-sm text-gray-500 dark:text-gray-400">Third tab content.</p>
        </TabItem>
      </Tabs>
    </div>
  {/snippet}
</Story>

<!-- Form Example -->
<Story name="Form Example">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Tabs tabStyle="full">
        <TabItem open title="Personal Info">
          <form class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Full Name</label>
              <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="John Doe" />
            </div>
            <div>
              <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Email</label>
              <input type="email" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="john@example.com" />
            </div>
          </form>
        </TabItem>
        <TabItem title="Address">
          <form class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Street Address</label>
              <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="123 Main St" />
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">City</label>
                <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="City" />
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">ZIP</label>
                <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="12345" />
              </div>
            </div>
          </form>
        </TabItem>
        <TabItem title="Payment">
          <form class="space-y-4">
            <div>
              <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Card Number</label>
              <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="4242 4242 4242 4242" />
            </div>
            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Expiry</label>
                <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="MM/YY" />
              </div>
              <div>
                <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">CVC</label>
                <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" placeholder="123" />
              </div>
            </div>
          </form>
        </TabItem>
      </Tabs>
    </div>
  {/snippet}
</Story>

<!-- Two Tabs Only -->
<Story name="Two Tabs Only">
  {#snippet children(args)}
    <Tabs tabStyle="pill">
      <TabItem open title="Monthly">
        <div class="text-center py-8">
          <p class="text-4xl font-bold text-gray-900 dark:text-white">$29</p>
          <p class="text-gray-500 dark:text-gray-400">per month</p>
        </div>
      </TabItem>
      <TabItem title="Yearly">
        <div class="text-center py-8">
          <p class="text-4xl font-bold text-gray-900 dark:text-white">$290</p>
          <p class="text-gray-500 dark:text-gray-400">per year (save 17%)</p>
        </div>
      </TabItem>
    </Tabs>
  {/snippet}
</Story>
