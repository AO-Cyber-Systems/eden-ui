<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Clipboard from './Clipboard.svelte';

  const { Story } = defineMeta({
    title: 'Components/Clipboard',
    component: Clipboard,
    tags: ['autodocs'],
    argTypes: {
      embedded: {
        control: 'boolean',
        description: 'Whether the clipboard button is embedded in another element',
      },
    },
    args: {
      embedded: false,
      value: 'npm install flowbite-svelte',
    },
  });
</script>

<!-- Default Clipboard -->
<Story name="Default">
  {#snippet children(args)}
    <div class="flex items-center gap-2">
      <code class="bg-gray-100 dark:bg-gray-800 px-3 py-2 rounded text-sm">npm install flowbite-svelte</code>
      <Clipboard value="npm install flowbite-svelte">
        {#snippet children(success)}
          {#if success}
            <svg class="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
            </svg>
          {:else}
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"/>
            </svg>
          {/if}
        {/snippet}
      </Clipboard>
    </div>
  {/snippet}
</Story>

<!-- With Text Label -->
<Story name="With Text Label">
  {#snippet children(args)}
    <div class="flex items-center gap-2">
      <code class="bg-gray-100 dark:bg-gray-800 px-3 py-2 rounded text-sm font-mono">
        https://example.com/share/abc123
      </code>
      <Clipboard value="https://example.com/share/abc123" color="primary">
        {#snippet children(success)}
          {#if success}
            Copied!
          {:else}
            Copy link
          {/if}
        {/snippet}
      </Clipboard>
    </div>
  {/snippet}
</Story>

<!-- Embedded Style -->
<Story name="Embedded" args={{ embedded: true }}>
  {#snippet children(args)}
    <div class="relative">
      <input
        type="text"
        readonly
        value="sk_live_abc123xyz789"
        class="w-full pr-12 bg-gray-50 border border-gray-300 text-gray-900 rounded-lg p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:text-white"
      />
      <Clipboard {...args} value="sk_live_abc123xyz789" class="absolute right-2 top-1/2 -translate-y-1/2">
        {#snippet children(success)}
          {#if success}
            <svg class="w-4 h-4 text-green-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
            </svg>
          {:else}
            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"/>
            </svg>
          {/if}
        {/snippet}
      </Clipboard>
    </div>
  {/snippet}
</Story>

<!-- Code Block -->
<Story name="Code Block">
  {#snippet children(args)}
    <div class="relative bg-gray-800 rounded-lg p-4">
      <pre class="text-green-400 text-sm font-mono overflow-x-auto"><code>const greeting = "Hello, World!";
console.log(greeting);</code></pre>
      <Clipboard
        value={'const greeting = "Hello, World!";\nconsole.log(greeting);'}
        class="absolute top-2 right-2"
        color="dark"
      >
        {#snippet children(success)}
          {#if success}
            <svg class="w-4 h-4 text-green-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"/>
            </svg>
          {:else}
            <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z"/>
            </svg>
          {/if}
        {/snippet}
      </Clipboard>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Clipboard value="Primary" color="primary">
        {#snippet children(success)}
          {success ? 'Copied!' : 'Primary'}
        {/snippet}
      </Clipboard>
      <Clipboard value="Secondary" color="secondary">
        {#snippet children(success)}
          {success ? 'Copied!' : 'Secondary'}
        {/snippet}
      </Clipboard>
      <Clipboard value="Dark" color="dark">
        {#snippet children(success)}
          {success ? 'Copied!' : 'Dark'}
        {/snippet}
      </Clipboard>
      <Clipboard value="Light" color="light">
        {#snippet children(success)}
          {success ? 'Copied!' : 'Light'}
        {/snippet}
      </Clipboard>
    </div>
  {/snippet}
</Story>
