<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import ScrollSpy from './ScrollSpy.svelte';

  const { Story } = defineMeta({
    title: 'Components/ScrollSpy',
    component: ScrollSpy,
    tags: ['autodocs'],
    argTypes: {
      position: {
        control: { type: 'select' },
        options: ['top', 'left', 'right'],
        description: 'Position of the navigation',
      },
      offset: {
        control: { type: 'number', min: 0, max: 200 },
        description: 'Offset from top when scrolling to sections',
      },
      sticky: {
        control: 'boolean',
        description: 'Whether the navigation should be sticky',
      },
      smoothScroll: {
        control: 'boolean',
        description: 'Enable smooth scrolling animation',
      },
    },
    args: {
      position: 'top',
      offset: 0,
      sticky: true,
      smoothScroll: true,
    },
  });

  // Default navigation items
  const defaultItems = [
    { id: 'overview', label: 'Overview' },
    { id: 'features', label: 'Features' },
    { id: 'pricing', label: 'Pricing' },
    { id: 'faq', label: 'FAQ' },
  ];

  // Documentation sections
  const docItems = [
    { id: 'installation', label: 'Installation' },
    { id: 'usage', label: 'Usage' },
    { id: 'api', label: 'API Reference' },
    { id: 'examples', label: 'Examples' },
    { id: 'troubleshooting', label: 'Troubleshooting' },
  ];

  function handleActiveChange(id) {
    console.log('Active section changed to:', id);
  }

  function handleNavigate(id) {
    console.log('Navigated to section:', id);
  }
</script>

<!-- Default ScrollSpy -->
<Story name="Default">
  {#snippet children(args)}
    <div class="relative">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        Note: ScrollSpy works best in a full page context. In Storybook, scrolling is contained to the story frame.
      </p>
      <ScrollSpy
        {...args}
        items={defaultItems}
        onActiveChange={handleActiveChange}
        onNavigate={handleNavigate}
      />

      <div class="mt-8 space-y-8">
        <section id="overview" class="min-h-64 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Overview</h2>
          <p class="text-gray-600 dark:text-gray-400">
            This section provides an overview of the product. ScrollSpy automatically highlights
            the navigation item corresponding to the currently visible section.
          </p>
        </section>

        <section id="features" class="min-h-64 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Features</h2>
          <ul class="list-disc list-inside text-gray-600 dark:text-gray-400 space-y-2">
            <li>Automatic section tracking with IntersectionObserver</li>
            <li>Smooth scroll navigation</li>
            <li>Customizable offset and positioning</li>
            <li>Sticky navigation support</li>
          </ul>
        </section>

        <section id="pricing" class="min-h-64 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Pricing</h2>
          <p class="text-gray-600 dark:text-gray-400">
            View our pricing plans and choose the one that fits your needs.
          </p>
        </section>

        <section id="faq" class="min-h-64 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">FAQ</h2>
          <p class="text-gray-600 dark:text-gray-400">
            Frequently asked questions and answers.
          </p>
        </section>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Offset -->
<Story name="With Offset">
  {#snippet children(args)}
    <div class="relative">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        This example uses a 100px offset, useful when you have a fixed header.
      </p>
      <ScrollSpy
        items={defaultItems}
        offset={100}
        onActiveChange={handleActiveChange}
      />

      <div class="mt-8 space-y-8">
        <section id="overview" class="min-h-48 p-6 bg-blue-50 dark:bg-blue-900/20 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Overview</h2>
          <p class="text-gray-600 dark:text-gray-400">Content with 100px offset compensation.</p>
        </section>
        <section id="features" class="min-h-48 p-6 bg-green-50 dark:bg-green-900/20 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Features</h2>
          <p class="text-gray-600 dark:text-gray-400">Feature details here.</p>
        </section>
        <section id="pricing" class="min-h-48 p-6 bg-purple-50 dark:bg-purple-900/20 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Pricing</h2>
          <p class="text-gray-600 dark:text-gray-400">Pricing information.</p>
        </section>
        <section id="faq" class="min-h-48 p-6 bg-orange-50 dark:bg-orange-900/20 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">FAQ</h2>
          <p class="text-gray-600 dark:text-gray-400">Common questions.</p>
        </section>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Non-Sticky -->
<Story name="Non-Sticky">
  {#snippet children(args)}
    <div class="relative">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        Non-sticky navigation that scrolls with content.
      </p>
      <ScrollSpy
        items={defaultItems}
        sticky={false}
        onActiveChange={handleActiveChange}
      />

      <div class="mt-8 space-y-8">
        <section id="overview" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Overview</h2>
          <p class="text-gray-600 dark:text-gray-400">The navigation above will scroll with this content.</p>
        </section>
        <section id="features" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Features</h2>
          <p class="text-gray-600 dark:text-gray-400">Feature section.</p>
        </section>
        <section id="pricing" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Pricing</h2>
          <p class="text-gray-600 dark:text-gray-400">Pricing section.</p>
        </section>
        <section id="faq" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">FAQ</h2>
          <p class="text-gray-600 dark:text-gray-400">FAQ section.</p>
        </section>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Custom Active/Inactive Classes -->
<Story name="Custom Classes">
  {#snippet children(args)}
    <div class="relative">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        Custom active and inactive styling classes.
      </p>
      <ScrollSpy
        items={defaultItems}
        activeClass="text-blue-600 font-bold border-b-2 border-blue-600"
        inactiveClass="text-gray-400 hover:text-gray-600"
        onActiveChange={handleActiveChange}
      />

      <div class="mt-8 space-y-8">
        <section id="overview" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Overview</h2>
          <p class="text-gray-600 dark:text-gray-400">Section with custom navigation styling.</p>
        </section>
        <section id="features" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Features</h2>
          <p class="text-gray-600 dark:text-gray-400">Feature section.</p>
        </section>
        <section id="pricing" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Pricing</h2>
          <p class="text-gray-600 dark:text-gray-400">Pricing section.</p>
        </section>
        <section id="faq" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">FAQ</h2>
          <p class="text-gray-600 dark:text-gray-400">FAQ section.</p>
        </section>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Documentation Page Example -->
<Story name="Documentation Page">
  {#snippet children(args)}
    <div class="relative">
      <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-6">Component Documentation</h1>

      <ScrollSpy
        items={docItems}
        offset={20}
        onActiveChange={handleActiveChange}
      />

      <div class="mt-8 space-y-12">
        <section id="installation" class="min-h-48">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Installation</h2>
          <div class="bg-gray-900 text-gray-100 p-4 rounded-lg font-mono text-sm">
            npm install @flowbite-svelte
          </div>
          <p class="mt-4 text-gray-600 dark:text-gray-400">
            Install the package using npm, pnpm, or yarn.
          </p>
        </section>

        <section id="usage" class="min-h-48">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Usage</h2>
          <p class="text-gray-600 dark:text-gray-400">
            Import the component and use it in your Svelte files.
          </p>
          <div class="bg-gray-900 text-gray-100 p-4 rounded-lg font-mono text-sm mt-4">
            import {'{ ScrollSpy }'} from 'flowbite-svelte';
          </div>
        </section>

        <section id="api" class="min-h-48">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">API Reference</h2>
          <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
              <tr>
                <th class="px-4 py-2">Prop</th>
                <th class="px-4 py-2">Type</th>
                <th class="px-4 py-2">Default</th>
              </tr>
            </thead>
            <tbody>
              <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                <td class="px-4 py-2">items</td>
                <td class="px-4 py-2">array</td>
                <td class="px-4 py-2">required</td>
              </tr>
              <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                <td class="px-4 py-2">offset</td>
                <td class="px-4 py-2">number</td>
                <td class="px-4 py-2">0</td>
              </tr>
            </tbody>
          </table>
        </section>

        <section id="examples" class="min-h-48">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Examples</h2>
          <p class="text-gray-600 dark:text-gray-400">
            Check out the various examples in this Storybook to see different use cases.
          </p>
        </section>

        <section id="troubleshooting" class="min-h-48">
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-4">Troubleshooting</h2>
          <p class="text-gray-600 dark:text-gray-400">
            Common issues and their solutions.
          </p>
          <ul class="list-disc list-inside mt-4 text-gray-600 dark:text-gray-400 space-y-2">
            <li>Ensure section IDs match the items array</li>
            <li>Use offset when you have fixed headers</li>
            <li>Check console for warnings about missing sections</li>
          </ul>
        </section>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Instant Scroll (No Animation) -->
<Story name="Instant Scroll">
  {#snippet children(args)}
    <div class="relative">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        Scroll navigation without smooth animation.
      </p>
      <ScrollSpy
        items={defaultItems}
        smoothScroll={false}
        onActiveChange={handleActiveChange}
      />

      <div class="mt-8 space-y-8">
        <section id="overview" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Overview</h2>
          <p class="text-gray-600 dark:text-gray-400">Click navigation items to jump instantly (no animation).</p>
        </section>
        <section id="features" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Features</h2>
          <p class="text-gray-600 dark:text-gray-400">Feature section.</p>
        </section>
        <section id="pricing" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Pricing</h2>
          <p class="text-gray-600 dark:text-gray-400">Pricing section.</p>
        </section>
        <section id="faq" class="min-h-48 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white mb-2">FAQ</h2>
          <p class="text-gray-600 dark:text-gray-400">FAQ section.</p>
        </section>
      </div>
    </div>
  {/snippet}
</Story>
