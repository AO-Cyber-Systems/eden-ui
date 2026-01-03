<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import VirtualList from './VirtualList.svelte';

  const { Story } = defineMeta({
    title: 'Components/VirtualList',
    component: VirtualList,
    tags: ['autodocs'],
    argTypes: {
      minItemHeight: {
        control: { type: 'number', min: 20, max: 200 },
        description: 'Minimum height for each item when getItemHeight is not provided',
      },
      height: {
        control: { type: 'number', min: 100, max: 800 },
        description: 'Height of the scrollable container',
      },
      overscan: {
        control: { type: 'number', min: 0, max: 20 },
        description: 'Number of items to render above and below the visible area',
      },
      contained: {
        control: 'boolean',
        description: 'Enable CSS containment for better performance',
      },
      ariaLabel: {
        control: 'text',
        description: 'Aria label for accessibility',
      },
    },
    args: {
      minItemHeight: 50,
      height: 400,
      overscan: 5,
      contained: false,
    },
  });

  // Generate simple list items
  function generateItems(count) {
    return Array.from({ length: count }, (_, i) => ({
      id: i + 1,
      title: `Item ${i + 1}`,
      description: `This is the description for item ${i + 1}`,
    }));
  }

  // Generate items with variable heights
  function generateVariableItems(count) {
    const descriptions = [
      'Short.',
      'A medium length description.',
      'A somewhat longer description that spans multiple lines when rendered.',
      'This is a very long description that will definitely span multiple lines and create taller items in the list.',
      'Brief note.',
      'An extensive description with lots of detail. This could be a full paragraph explaining the item in great detail, discussing its features, benefits, and usage scenarios.',
    ];

    return Array.from({ length: count }, (_, i) => ({
      id: i + 1,
      title: `Item ${i + 1}`,
      description: descriptions[i % descriptions.length],
      height: 60 + descriptions[i % descriptions.length].length * 0.5,
    }));
  }

  // Generate user list items
  function generateUsers(count) {
    const names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank', 'Grace', 'Henry'];
    const roles = ['Developer', 'Designer', 'Manager', 'Analyst', 'Engineer'];
    const statuses = ['online', 'offline', 'away', 'busy'];

    return Array.from({ length: count }, (_, i) => ({
      id: i + 1,
      name: names[i % names.length],
      email: `${names[i % names.length].toLowerCase()}${i}@example.com`,
      role: roles[i % roles.length],
      status: statuses[i % statuses.length],
      avatar: names[i % names.length][0],
    }));
  }

  const simpleItems = generateItems(100);
  const variableItems = generateVariableItems(100);
  const users = generateUsers(200);
</script>

<!-- Default VirtualList -->
<Story name="Default">
  {#snippet children(args)}
    <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
      <VirtualList
        items={simpleItems}
        minItemHeight={args.minItemHeight}
        height={args.height}
        overscan={args.overscan}
        contained={args.contained}
      >
        {#snippet children(item, index)}
          <div class="px-4 py-3 border-b border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-800">
            <h4 class="text-sm font-medium text-gray-900 dark:text-white">{item.title}</h4>
            <p class="text-xs text-gray-500 dark:text-gray-400">{item.description}</p>
          </div>
        {/snippet}
      </VirtualList>
    </div>
  {/snippet}
</Story>

<!-- Simple List -->
<Story name="Simple List">
  {#snippet children(args)}
    <div class="space-y-4 max-w-lg">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        A basic virtualized list with 100 items. Only visible items are rendered.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={simpleItems}
          minItemHeight={50}
          height={300}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-3 border-b border-gray-200 dark:border-gray-700 flex items-center gap-3">
              <span class="w-8 h-8 rounded-full bg-blue-100 dark:bg-blue-900 flex items-center justify-center text-blue-600 dark:text-blue-300 text-sm font-medium">
                {item.id}
              </span>
              <div>
                <h4 class="text-sm font-medium text-gray-900 dark:text-white">{item.title}</h4>
                <p class="text-xs text-gray-500 dark:text-gray-400">{item.description}</p>
              </div>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Variable Height Items -->
<Story name="Variable Height Items">
  {#snippet children(args)}
    <div class="space-y-4 max-w-lg">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        List with variable height items using the getItemHeight callback.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={variableItems}
          height={400}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-3 border-b border-gray-200 dark:border-gray-700">
              <h4 class="text-sm font-medium text-gray-900 dark:text-white">{item.title}</h4>
              <p class="text-sm text-gray-600 dark:text-gray-400 mt-1">{item.description}</p>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- User List -->
<Story name="User List">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        A user directory with 200 entries, virtualized for performance.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={users}
          minItemHeight={64}
          height={400}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-3 border-b border-gray-200 dark:border-gray-700 flex items-center justify-between hover:bg-gray-50 dark:hover:bg-gray-800 transition-colors">
              <div class="flex items-center gap-3">
                <div class="w-10 h-10 rounded-full bg-gradient-to-br from-purple-500 to-pink-500 flex items-center justify-center text-white font-bold">
                  {item.avatar}
                </div>
                <div>
                  <h4 class="text-sm font-medium text-gray-900 dark:text-white">{item.name}</h4>
                  <p class="text-xs text-gray-500 dark:text-gray-400">{item.email}</p>
                </div>
              </div>
              <div class="flex items-center gap-2">
                <span class="text-xs text-gray-600 dark:text-gray-400">{item.role}</span>
                <span class={`w-2 h-2 rounded-full ${
                  item.status === 'online' ? 'bg-green-500' :
                  item.status === 'away' ? 'bg-yellow-500' :
                  item.status === 'busy' ? 'bg-red-500' :
                  'bg-gray-400'
                }`}></span>
              </div>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Large Dataset -->
<Story name="Large Dataset (10,000 items)">
  {#snippet children(args)}
    {@const largeItems = generateItems(10000)}
    <div class="space-y-4 max-w-lg">
      <div class="flex items-center justify-between">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          10,000 items - virtualization keeps the DOM small.
        </p>
        <span class="text-xs bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300 px-2 py-1 rounded">
          {largeItems.length.toLocaleString()} items
        </span>
      </div>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={largeItems}
          minItemHeight={40}
          height={400}
          overscan={10}
          contained={true}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-2 border-b border-gray-100 dark:border-gray-800 flex items-center justify-between">
              <span class="text-sm text-gray-900 dark:text-white">{item.title}</span>
              <span class="text-xs text-gray-400">#{item.id}</span>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Height Variations -->
<Story name="Container Height Variations">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small height (200px)</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden max-w-sm">
          <VirtualList
            items={simpleItems}
            minItemHeight={40}
            height={200}
          >
            {#snippet children(item, index)}
              <div class="px-3 py-2 border-b border-gray-200 dark:border-gray-700 text-sm text-gray-900 dark:text-white">
                {item.title}
              </div>
            {/snippet}
          </VirtualList>
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium height (400px)</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden max-w-sm">
          <VirtualList
            items={simpleItems}
            minItemHeight={40}
            height={400}
          >
            {#snippet children(item, index)}
              <div class="px-3 py-2 border-b border-gray-200 dark:border-gray-700 text-sm text-gray-900 dark:text-white">
                {item.title}
              </div>
            {/snippet}
          </VirtualList>
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large height (600px)</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden max-w-sm">
          <VirtualList
            items={simpleItems}
            minItemHeight={40}
            height={600}
          >
            {#snippet children(item, index)}
              <div class="px-3 py-2 border-b border-gray-200 dark:border-gray-700 text-sm text-gray-900 dark:text-white">
                {item.title}
              </div>
            {/snippet}
          </VirtualList>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Chat Messages -->
<Story name="Chat Messages">
  {#snippet children(args)}
    {@const messages = Array.from({ length: 100 }, (_, i) => ({
      id: i + 1,
      sender: i % 3 === 0 ? 'me' : 'other',
      text: [
        'Hey!',
        'How are you doing today?',
        "I'm doing great, thanks for asking! Just working on this new project.",
        'Nice!',
        "That's awesome. What kind of project?",
        "It's a virtual list component for handling large datasets efficiently.",
        'Sounds interesting!',
      ][i % 7],
      time: `${9 + Math.floor(i / 10)}:${String(i % 60).padStart(2, '0')} AM`,
      height: 60 + [
        'Hey!',
        'How are you doing today?',
        "I'm doing great, thanks for asking! Just working on this new project.",
        'Nice!',
        "That's awesome. What kind of project?",
        "It's a virtual list component for handling large datasets efficiently.",
        'Sounds interesting!',
      ][i % 7].length * 0.3,
    }))}
    <div class="space-y-4 max-w-md">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Chat-style message list with alternating alignment.
      </p>
      <div class="bg-gray-100 dark:bg-gray-900 rounded-lg overflow-hidden p-2">
        <VirtualList
          items={messages}
          height={400}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div class={`flex mb-2 ${item.sender === 'me' ? 'justify-end' : 'justify-start'}`}>
              <div class={`max-w-[80%] rounded-lg px-3 py-2 ${
                item.sender === 'me'
                  ? 'bg-blue-600 text-white'
                  : 'bg-white dark:bg-gray-800 text-gray-900 dark:text-white shadow-sm'
              }`}>
                <p class="text-sm">{item.text}</p>
                <p class={`text-xs mt-1 ${item.sender === 'me' ? 'text-blue-200' : 'text-gray-400'}`}>{item.time}</p>
              </div>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- File List -->
<Story name="File Explorer">
  {#snippet children(args)}
    {@const files = Array.from({ length: 150 }, (_, i) => {
      const types = ['folder', 'js', 'ts', 'svelte', 'css', 'json', 'md', 'png', 'jpg'];
      const type = types[i % types.length];
      return {
        id: i + 1,
        name: type === 'folder' ? `folder-${i}` : `file-${i}.${type}`,
        type,
        size: type === 'folder' ? null : `${Math.floor(Math.random() * 500) + 1} KB`,
        modified: `Dec ${(i % 28) + 1}, 2024`,
      };
    })}
    <div class="space-y-4 max-w-lg">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        File explorer style list with icons.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={files}
          minItemHeight={44}
          height={400}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-2 border-b border-gray-100 dark:border-gray-800 flex items-center gap-3 hover:bg-gray-50 dark:hover:bg-gray-800 cursor-pointer">
              {#if item.type === 'folder'}
                <svg class="w-5 h-5 text-yellow-500" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z" />
                </svg>
              {:else}
                <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4z" clip-rule="evenodd" />
                </svg>
              {/if}
              <span class="flex-1 text-sm text-gray-900 dark:text-white truncate">{item.name}</span>
              <span class="text-xs text-gray-400 w-16 text-right">{item.size || '--'}</span>
              <span class="text-xs text-gray-400 w-24 text-right">{item.modified}</span>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Containment Optimization -->
<Story name="With CSS Containment">
  {#snippet children(args)}
    <div class="space-y-4 max-w-lg">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        CSS containment isolates layout calculations for each item, improving performance with large lists.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={simpleItems}
          minItemHeight={50}
          height={400}
          contained={true}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-3 border-b border-gray-200 dark:border-gray-700">
              <h4 class="text-sm font-medium text-gray-900 dark:text-white">{item.title}</h4>
              <p class="text-xs text-gray-500 dark:text-gray-400">{item.description}</p>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Log Viewer -->
<Story name="Log Viewer">
  {#snippet children(args)}
    {@const logs = Array.from({ length: 500 }, (_, i) => {
      const levels = ['INFO', 'WARN', 'ERROR', 'DEBUG'];
      const level = levels[i % levels.length];
      return {
        id: i + 1,
        timestamp: `2024-12-${String((i % 28) + 1).padStart(2, '0')} ${String(9 + (i % 12)).padStart(2, '0')}:${String(i % 60).padStart(2, '0')}:${String(i % 60).padStart(2, '0')}`,
        level,
        message: [
          'Application started successfully',
          'Connection timeout warning',
          'Failed to process request: invalid input',
          'Cache miss for key: user_session_123',
        ][levels.indexOf(level)],
      };
    })}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Log viewer with colored severity levels.
      </p>
      <div class="bg-gray-900 rounded-lg overflow-hidden font-mono">
        <VirtualList
          items={logs}
          minItemHeight={28}
          height={400}
        >
          {#snippet children(item, index)}
            <div class="px-4 py-1 border-b border-gray-800 flex gap-4 text-xs">
              <span class="text-gray-500 w-36 shrink-0">{item.timestamp}</span>
              <span class={`w-12 shrink-0 font-bold ${
                item.level === 'ERROR' ? 'text-red-500' :
                item.level === 'WARN' ? 'text-yellow-500' :
                item.level === 'DEBUG' ? 'text-gray-500' :
                'text-green-500'
              }`}>{item.level}</span>
              <span class="text-gray-300 truncate">{item.message}</span>
            </div>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Todo List -->
<Story name="Todo List">
  {#snippet children(args)}
    {@const todos = Array.from({ length: 50 }, (_, i) => ({
      id: i + 1,
      text: `Task ${i + 1}: ${['Complete project', 'Review code', 'Write tests', 'Update docs', 'Fix bug'][i % 5]}`,
      completed: i % 3 === 0,
      priority: ['low', 'medium', 'high'][i % 3],
    }))}
    <div class="space-y-4 max-w-md">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Interactive todo list with checkboxes and priority badges.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualList
          items={todos}
          minItemHeight={52}
          height={350}
        >
          {#snippet children(item, index)}
            <label class="px-4 py-3 border-b border-gray-100 dark:border-gray-800 flex items-center gap-3 cursor-pointer hover:bg-gray-50 dark:hover:bg-gray-800">
              <input
                type="checkbox"
                checked={item.completed}
                class="w-4 h-4 text-blue-600 rounded border-gray-300 focus:ring-blue-500"
              />
              <span class={`flex-1 text-sm ${item.completed ? 'text-gray-400 line-through' : 'text-gray-900 dark:text-white'}`}>
                {item.text}
              </span>
              <span class={`text-xs px-2 py-1 rounded ${
                item.priority === 'high' ? 'bg-red-100 text-red-700 dark:bg-red-900 dark:text-red-300' :
                item.priority === 'medium' ? 'bg-yellow-100 text-yellow-700 dark:bg-yellow-900 dark:text-yellow-300' :
                'bg-green-100 text-green-700 dark:bg-green-900 dark:text-green-300'
              }`}>
                {item.priority}
              </span>
            </label>
          {/snippet}
        </VirtualList>
      </div>
    </div>
  {/snippet}
</Story>

