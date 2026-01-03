<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import VirtualMasonry from './VirtualMasonry.svelte';

  const { Story } = defineMeta({
    title: 'Components/VirtualMasonry',
    component: VirtualMasonry,
    tags: ['autodocs'],
    argTypes: {
      columns: {
        control: { type: 'number', min: 1, max: 8 },
        description: 'Number of columns in the masonry layout',
      },
      gap: {
        control: { type: 'number', min: 0, max: 48 },
        description: 'Gap between items in pixels',
      },
      height: {
        control: { type: 'number', min: 200, max: 1200 },
        description: 'Height of the scrollable container',
      },
      overscan: {
        control: { type: 'number', min: 0, max: 500 },
        description: 'Overscan buffer in pixels for smoother scrolling',
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
      columns: 3,
      gap: 16,
      height: 600,
      overscan: 200,
      contained: false,
    },
  });

  // Generate sample image items with varying heights
  function generateImageItems(count) {
    const colors = ['red', 'blue', 'green', 'purple', 'orange', 'pink', 'teal', 'indigo', 'cyan', 'amber'];
    return Array.from({ length: count }, (_, i) => ({
      id: i + 1,
      title: `Image ${i + 1}`,
      height: 150 + Math.floor(Math.random() * 200), // Random height 150-350px
      color: colors[i % colors.length],
      likes: Math.floor(Math.random() * 1000),
    }));
  }

  // Generate card items with different content lengths
  function generateCardItems(count) {
    const titles = ['Design', 'Photography', 'Travel', 'Food', 'Tech', 'Art', 'Nature', 'Fashion'];
    const descriptions = [
      'A quick tip for better design.',
      'Exploring the world one photo at a time. This journey takes us through beautiful landscapes.',
      'Short note.',
      'Discovering amazing cuisines from around the globe. Each dish tells a story of culture and tradition passed down through generations.',
      'The latest in technology.',
      'Creative expressions through various mediums.',
      'Finding peace in the great outdoors. The mountains call to those who seek adventure and solitude.',
      'Style tips for every season.'
    ];

    return Array.from({ length: count }, (_, i) => ({
      id: i + 1,
      title: titles[i % titles.length],
      description: descriptions[i % descriptions.length],
      height: 120 + (descriptions[i % descriptions.length].length / 2), // Height based on content
      image: `https://picsum.photos/300/${150 + Math.floor(Math.random() * 100)}?random=${i}`,
    }));
  }

  const imageItems = generateImageItems(100);
  const cardItems = generateCardItems(50);
</script>

<!-- Default VirtualMasonry -->
<Story name="Default">
  {#snippet children(args)}
    <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
      <VirtualMasonry
        items={imageItems}
        columns={args.columns}
        gap={args.gap}
        height={args.height}
        overscan={args.overscan}
        contained={args.contained}
        getItemHeight={(item) => item.height}
      >
        {#snippet children(item, index)}
          <div
            class="rounded-lg flex items-center justify-center text-white font-bold text-lg"
            style="background-color: {item.color}; height: 100%;"
          >
            #{item.id}
          </div>
        {/snippet}
      </VirtualMasonry>
    </div>
  {/snippet}
</Story>

<!-- Image Gallery -->
<Story name="Image Gallery">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        A virtualized Pinterest-style image gallery. Scroll to see virtualization in action - only visible items are rendered.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualMasonry
          items={imageItems}
          columns={4}
          gap={12}
          height={500}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div class="group relative h-full overflow-hidden rounded-lg shadow-sm hover:shadow-md transition-shadow">
              <div
                class="w-full h-full flex items-center justify-center text-white"
                style="background: linear-gradient(135deg, {item.color}, {item.color}88);"
              >
                <span class="text-4xl font-bold opacity-50">{item.id}</span>
              </div>
              <div class="absolute inset-x-0 bottom-0 bg-gradient-to-t from-black/70 to-transparent p-3 opacity-0 group-hover:opacity-100 transition-opacity">
                <p class="text-white text-sm font-medium">{item.title}</p>
                <p class="text-gray-300 text-xs">{item.likes} likes</p>
              </div>
            </div>
          {/snippet}
        </VirtualMasonry>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Card Layout -->
<Story name="Card Layout">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Cards with varying content lengths arranged in a masonry layout.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualMasonry
          items={cardItems}
          columns={3}
          gap={16}
          height={600}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div class="h-full bg-white dark:bg-gray-800 rounded-lg shadow border border-gray-200 dark:border-gray-700 overflow-hidden">
              <div class="p-4">
                <h3 class="text-sm font-semibold text-gray-900 dark:text-white mb-2">{item.title}</h3>
                <p class="text-xs text-gray-600 dark:text-gray-400 line-clamp-6">{item.description}</p>
              </div>
            </div>
          {/snippet}
        </VirtualMasonry>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Column Variations -->
<Story name="Column Variations">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">2 Columns</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
          <VirtualMasonry
            items={imageItems.slice(0, 20)}
            columns={2}
            gap={16}
            height={300}
            getItemHeight={(item) => item.height}
          >
            {#snippet children(item, index)}
              <div
                class="rounded-lg flex items-center justify-center text-white font-bold"
                style="background-color: {item.color}; height: 100%;"
              >
                #{item.id}
              </div>
            {/snippet}
          </VirtualMasonry>
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">4 Columns</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
          <VirtualMasonry
            items={imageItems.slice(0, 20)}
            columns={4}
            gap={12}
            height={300}
            getItemHeight={(item) => item.height}
          >
            {#snippet children(item, index)}
              <div
                class="rounded-lg flex items-center justify-center text-white font-bold"
                style="background-color: {item.color}; height: 100%;"
              >
                #{item.id}
              </div>
            {/snippet}
          </VirtualMasonry>
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">6 Columns</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
          <VirtualMasonry
            items={imageItems.slice(0, 30)}
            columns={6}
            gap={8}
            height={300}
            getItemHeight={(item) => item.height}
          >
            {#snippet children(item, index)}
              <div
                class="rounded-lg flex items-center justify-center text-white font-bold text-sm"
                style="background-color: {item.color}; height: 100%;"
              >
                #{item.id}
              </div>
            {/snippet}
          </VirtualMasonry>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Gap Variations -->
<Story name="Gap Variations">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">No gap (0px)</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
          <VirtualMasonry
            items={imageItems.slice(0, 15)}
            columns={3}
            gap={0}
            height={250}
            getItemHeight={(item) => item.height}
          >
            {#snippet children(item, index)}
              <div
                class="flex items-center justify-center text-white font-bold"
                style="background-color: {item.color}; height: 100%;"
              >
                #{item.id}
              </div>
            {/snippet}
          </VirtualMasonry>
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small gap (8px)</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
          <VirtualMasonry
            items={imageItems.slice(0, 15)}
            columns={3}
            gap={8}
            height={250}
            getItemHeight={(item) => item.height}
          >
            {#snippet children(item, index)}
              <div
                class="rounded flex items-center justify-center text-white font-bold"
                style="background-color: {item.color}; height: 100%;"
              >
                #{item.id}
              </div>
            {/snippet}
          </VirtualMasonry>
        </div>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large gap (24px)</p>
        <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
          <VirtualMasonry
            items={imageItems.slice(0, 15)}
            columns={3}
            gap={24}
            height={300}
            getItemHeight={(item) => item.height}
          >
            {#snippet children(item, index)}
              <div
                class="rounded-lg flex items-center justify-center text-white font-bold"
                style="background-color: {item.color}; height: 100%;"
              >
                #{item.id}
              </div>
            {/snippet}
          </VirtualMasonry>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Large Dataset -->
<Story name="Large Dataset (1000 items)">
  {#snippet children(args)}
    {@const largeItems = generateImageItems(1000)}
    <div class="space-y-4">
      <div class="flex items-center justify-between">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          1000 items - virtualization ensures smooth scrolling by only rendering visible items.
        </p>
        <span class="text-xs bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300 px-2 py-1 rounded">
          {largeItems.length} items
        </span>
      </div>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualMasonry
          items={largeItems}
          columns={5}
          gap={8}
          height={600}
          overscan={300}
          contained
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div
              class="rounded-lg flex items-center justify-center text-white font-bold text-sm shadow-sm"
              style="background-color: {item.color}; height: 100%;"
            >
              #{item.id}
            </div>
          {/snippet}
        </VirtualMasonry>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Contained Optimization -->
<Story name="With CSS Containment">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        CSS containment improves performance by isolating layout, style, and paint calculations for each item.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden">
        <VirtualMasonry
          items={imageItems}
          columns={4}
          gap={12}
          height={500}
          contained={true}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div
              class="rounded-lg flex items-center justify-center text-white font-bold"
              style="background-color: {item.color}; height: 100%;"
            >
              #{item.id}
            </div>
          {/snippet}
        </VirtualMasonry>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Product Grid -->
<Story name="Product Grid Example">
  {#snippet children(args)}
    {@const products = Array.from({ length: 50 }, (_, i) => ({
      id: i + 1,
      name: `Product ${i + 1}`,
      price: (Math.random() * 200 + 10).toFixed(2),
      rating: (Math.random() * 2 + 3).toFixed(1),
      height: 280 + Math.floor(Math.random() * 60),
    }))}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        E-commerce product grid with varying card heights.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden bg-gray-50 dark:bg-gray-900">
        <VirtualMasonry
          items={products}
          columns={4}
          gap={16}
          height={600}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div class="h-full bg-white dark:bg-gray-800 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700 overflow-hidden flex flex-col">
              <div class="flex-1 bg-gray-100 dark:bg-gray-700 flex items-center justify-center min-h-[120px]">
                <svg class="w-12 h-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                </svg>
              </div>
              <div class="p-3">
                <h4 class="text-sm font-medium text-gray-900 dark:text-white truncate">{item.name}</h4>
                <div class="flex items-center justify-between mt-2">
                  <span class="text-lg font-bold text-blue-600 dark:text-blue-400">${item.price}</span>
                  <span class="text-xs text-gray-500 dark:text-gray-400 flex items-center gap-1">
                    <svg class="w-3 h-3 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
                      <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                    {item.rating}
                  </span>
                </div>
              </div>
            </div>
          {/snippet}
        </VirtualMasonry>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Social Media Feed -->
<Story name="Social Media Feed">
  {#snippet children(args)}
    {@const posts = Array.from({ length: 40 }, (_, i) => ({
      id: i + 1,
      author: ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'][i % 5],
      content: [
        'Just had an amazing coffee!',
        'Working on a new project. Super excited about the possibilities!',
        'Quick update.',
        'Went hiking today and the views were absolutely breathtaking. Nature really has a way of putting things in perspective.',
        'New blog post is up!',
        'Random thought of the day.',
      ][i % 6],
      likes: Math.floor(Math.random() * 500),
      comments: Math.floor(Math.random() * 50),
      height: 100 + [
        'Just had an amazing coffee!',
        'Working on a new project. Super excited about the possibilities!',
        'Quick update.',
        'Went hiking today and the views were absolutely breathtaking. Nature really has a way of putting things in perspective.',
        'New blog post is up!',
        'Random thought of the day.',
      ][i % 6].length,
    }))}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Social media feed with varying post lengths.
      </p>
      <div class="border border-gray-200 dark:border-gray-700 rounded-lg overflow-hidden bg-gray-100 dark:bg-gray-900">
        <VirtualMasonry
          items={posts}
          columns={3}
          gap={12}
          height={500}
          getItemHeight={(item) => item.height}
        >
          {#snippet children(item, index)}
            <div class="h-full bg-white dark:bg-gray-800 rounded-lg p-4 shadow-sm">
              <div class="flex items-center gap-2 mb-3">
                <div class="w-8 h-8 rounded-full bg-gradient-to-br from-purple-500 to-pink-500 flex items-center justify-center text-white text-xs font-bold">
                  {item.author[0]}
                </div>
                <span class="text-sm font-medium text-gray-900 dark:text-white">{item.author}</span>
              </div>
              <p class="text-sm text-gray-700 dark:text-gray-300 mb-3">{item.content}</p>
              <div class="flex items-center gap-4 text-xs text-gray-500 dark:text-gray-400">
                <span>{item.likes} likes</span>
                <span>{item.comments} comments</span>
              </div>
            </div>
          {/snippet}
        </VirtualMasonry>
      </div>
    </div>
  {/snippet}
</Story>

