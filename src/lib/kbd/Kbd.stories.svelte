<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Kbd from './Kbd.svelte';

  const { Story } = defineMeta({
    title: 'Components/Kbd',
    component: Kbd,
    tags: ['autodocs'],
    argTypes: {},
    args: {},
  });
</script>

<!-- Default Kbd -->
<Story name="Default">
  {#snippet children(args)}
    <Kbd {...args}>Shift</Kbd>
  {/snippet}
</Story>

<!-- Single Keys -->
<Story name="Single Keys">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Kbd>A</Kbd>
      <Kbd>B</Kbd>
      <Kbd>C</Kbd>
      <Kbd>1</Kbd>
      <Kbd>2</Kbd>
      <Kbd>3</Kbd>
    </div>
  {/snippet}
</Story>

<!-- Special Keys -->
<Story name="Special Keys">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Kbd>Enter</Kbd>
      <Kbd>Tab</Kbd>
      <Kbd>Space</Kbd>
      <Kbd>Esc</Kbd>
      <Kbd>Backspace</Kbd>
      <Kbd>Delete</Kbd>
    </div>
  {/snippet}
</Story>

<!-- Modifier Keys -->
<Story name="Modifier Keys">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Kbd>Ctrl</Kbd>
      <Kbd>Alt</Kbd>
      <Kbd>Shift</Kbd>
      <Kbd>Cmd</Kbd>
      <Kbd>Fn</Kbd>
    </div>
  {/snippet}
</Story>

<!-- Arrow Keys -->
<Story name="Arrow Keys">
  {#snippet children(args)}
    <div class="flex gap-2">
      <Kbd class="px-2">
        <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M14.707 12.707a1 1 0 01-1.414 0L10 9.414l-3.293 3.293a1 1 0 01-1.414-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 010 1.414z" clip-rule="evenodd" />
        </svg>
      </Kbd>
      <Kbd class="px-2">
        <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
        </svg>
      </Kbd>
      <Kbd class="px-2">
        <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
        </svg>
      </Kbd>
      <Kbd class="px-2">
        <svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd" />
        </svg>
      </Kbd>
    </div>
  {/snippet}
</Story>

<!-- Keyboard Shortcuts -->
<Story name="Keyboard Shortcuts">
  {#snippet children(args)}
    <div class="space-y-4">
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-600 dark:text-gray-400 w-24">Copy:</span>
        <Kbd>Ctrl</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>C</Kbd>
      </div>
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-600 dark:text-gray-400 w-24">Paste:</span>
        <Kbd>Ctrl</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>V</Kbd>
      </div>
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-600 dark:text-gray-400 w-24">Cut:</span>
        <Kbd>Ctrl</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>X</Kbd>
      </div>
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-600 dark:text-gray-400 w-24">Save:</span>
        <Kbd>Ctrl</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>S</Kbd>
      </div>
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-600 dark:text-gray-400 w-24">Undo:</span>
        <Kbd>Ctrl</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>Z</Kbd>
      </div>
      <div class="flex items-center gap-2">
        <span class="text-sm text-gray-600 dark:text-gray-400 w-24">Redo:</span>
        <Kbd>Ctrl</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>Shift</Kbd>
        <span class="text-gray-500">+</span>
        <Kbd>Z</Kbd>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Function Keys -->
<Story name="Function Keys">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-2">
      <Kbd>F1</Kbd>
      <Kbd>F2</Kbd>
      <Kbd>F3</Kbd>
      <Kbd>F4</Kbd>
      <Kbd>F5</Kbd>
      <Kbd>F6</Kbd>
      <Kbd>F7</Kbd>
      <Kbd>F8</Kbd>
      <Kbd>F9</Kbd>
      <Kbd>F10</Kbd>
      <Kbd>F11</Kbd>
      <Kbd>F12</Kbd>
    </div>
  {/snippet}
</Story>

<!-- In Context -->
<Story name="In Documentation Context">
  {#snippet children(args)}
    <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Quick Reference</h3>
      <p class="text-gray-600 dark:text-gray-400 mb-2">
        Press <Kbd>Ctrl</Kbd> + <Kbd>K</Kbd> to open the command palette.
      </p>
      <p class="text-gray-600 dark:text-gray-400 mb-2">
        Use <Kbd>Tab</Kbd> to navigate between fields.
      </p>
      <p class="text-gray-600 dark:text-gray-400">
        Press <Kbd>Esc</Kbd> to close dialogs.
      </p>
    </div>
  {/snippet}
</Story>
