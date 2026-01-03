<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import CloseButton from './CloseButton.svelte';
  import Popper from './Popper.svelte';
  import { useBreakpoints, useCurrentBreakpoint, BREAKPOINTS } from './responsive.svelte';

  const { Story } = defineMeta({
    title: 'Components/Utils',
    component: CloseButton,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose', 'none'],
        description: 'Color variant of the close button',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg'],
        description: 'Size of the close button',
      },
      name: {
        control: 'text',
        description: 'Screen reader text for the button',
      },
    },
    args: {
      color: 'gray',
      size: 'md',
      name: 'Close',
    },
  });

  function handleClose() {
    console.log('Close button clicked');
  }
</script>

<!-- ==================== CLOSE BUTTON ==================== -->

<!-- Default CloseButton -->
<Story name="CloseButton Default">
  {#snippet children(args)}
    <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg inline-block">
      <CloseButton onclick={handleClose} />
    </div>
  {/snippet}
</Story>

<!-- CloseButton Sizes -->
<Story name="CloseButton Sizes">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">xs</p>
        <CloseButton size="xs" onclick={handleClose} />
      </div>
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">sm</p>
        <CloseButton size="sm" onclick={handleClose} />
      </div>
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">md</p>
        <CloseButton size="md" onclick={handleClose} />
      </div>
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">lg</p>
        <CloseButton size="lg" onclick={handleClose} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- CloseButton Colors -->
<Story name="CloseButton Colors">
  {#snippet children(args)}
    <div class="grid grid-cols-4 md:grid-cols-7 gap-4">
      {#each ['primary', 'secondary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'] as color}
        <div class="text-center">
          <CloseButton {color} onclick={handleClose} />
          <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">{color}</p>
        </div>
      {/each}
    </div>
  {/snippet}
</Story>

<!-- CloseButton with Custom Icon -->
<Story name="CloseButton Custom Icon">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">Default X</p>
        <CloseButton onclick={handleClose} />
      </div>
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">Custom Icon</p>
        <CloseButton onclick={handleClose} color="red">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd" />
          </svg>
        </CloseButton>
      </div>
    </div>
  {/snippet}
</Story>

<!-- CloseButton as Link -->
<Story name="CloseButton as Link">
  {#snippet children(args)}
    <div class="flex items-center gap-4">
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">Button (default)</p>
        <CloseButton onclick={handleClose} />
      </div>
      <div class="text-center">
        <p class="text-xs text-gray-500 dark:text-gray-400 mb-2">Link</p>
        <CloseButton href="#" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- CloseButton in Context -->
<Story name="CloseButton in Context">
  {#snippet children(args)}
    <div class="space-y-4">
      <!-- Alert with close button -->
      <div class="flex items-center p-4 bg-blue-50 dark:bg-blue-900 rounded-lg">
        <svg class="w-5 h-5 text-blue-500 mr-3" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
        </svg>
        <span class="text-sm text-blue-700 dark:text-blue-300 flex-1">This is an info message with a close button.</span>
        <CloseButton color="blue" size="sm" onclick={handleClose} />
      </div>

      <!-- Card with close button -->
      <div class="relative p-4 bg-white dark:bg-gray-800 border dark:border-gray-700 rounded-lg">
        <CloseButton class="absolute top-2 right-2" size="sm" onclick={handleClose} />
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white pr-8">Card Title</h3>
        <p class="text-gray-500 dark:text-gray-400 mt-2">This card has a close button in the corner.</p>
      </div>

      <!-- Modal header example -->
      <div class="p-4 bg-white dark:bg-gray-800 border-b dark:border-gray-700 rounded-t-lg flex items-center justify-between">
        <h3 class="text-xl font-semibold text-gray-900 dark:text-white">Modal Header</h3>
        <CloseButton onclick={handleClose} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- ==================== POPPER ==================== -->

<!-- Popper Default (Click Trigger) -->
<Story name="Popper Click Trigger">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <button class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700" id="popper-click-trigger">
        Click me
      </button>
      <Popper triggeredBy="#popper-click-trigger" trigger="click" class="p-3 bg-white dark:bg-gray-800 border dark:border-gray-700 rounded-lg shadow-lg">
        <p class="text-gray-700 dark:text-gray-300">This appears on click!</p>
      </Popper>
    </div>
  {/snippet}
</Story>

<!-- Popper Hover Trigger -->
<Story name="Popper Hover Trigger">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <button class="px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700" id="popper-hover-trigger">
        Hover me
      </button>
      <Popper triggeredBy="#popper-hover-trigger" trigger="hover" class="p-3 bg-white dark:bg-gray-800 border dark:border-gray-700 rounded-lg shadow-lg">
        <p class="text-gray-700 dark:text-gray-300">This appears on hover!</p>
      </Popper>
    </div>
  {/snippet}
</Story>

<!-- Popper Placements -->
<Story name="Popper Placements">
  {#snippet children(args)}
    <div class="grid grid-cols-3 gap-4 py-20 px-10">
      <!-- Top Row -->
      <div></div>
      <div class="flex justify-center">
        <button class="px-3 py-1.5 text-sm bg-gray-600 text-white rounded" id="popper-top">Top</button>
        <Popper triggeredBy="#popper-top" trigger="hover" placement="top" class="px-3 py-2 bg-gray-900 text-white rounded shadow-lg text-sm">
          Placement: top
        </Popper>
      </div>
      <div></div>

      <!-- Middle Row -->
      <div class="flex justify-end">
        <button class="px-3 py-1.5 text-sm bg-gray-600 text-white rounded" id="popper-left">Left</button>
        <Popper triggeredBy="#popper-left" trigger="hover" placement="left" class="px-3 py-2 bg-gray-900 text-white rounded shadow-lg text-sm">
          Placement: left
        </Popper>
      </div>
      <div></div>
      <div class="flex justify-start">
        <button class="px-3 py-1.5 text-sm bg-gray-600 text-white rounded" id="popper-right">Right</button>
        <Popper triggeredBy="#popper-right" trigger="hover" placement="right" class="px-3 py-2 bg-gray-900 text-white rounded shadow-lg text-sm">
          Placement: right
        </Popper>
      </div>

      <!-- Bottom Row -->
      <div></div>
      <div class="flex justify-center">
        <button class="px-3 py-1.5 text-sm bg-gray-600 text-white rounded" id="popper-bottom">Bottom</button>
        <Popper triggeredBy="#popper-bottom" trigger="hover" placement="bottom" class="px-3 py-2 bg-gray-900 text-white rounded shadow-lg text-sm">
          Placement: bottom
        </Popper>
      </div>
      <div></div>
    </div>
  {/snippet}
</Story>

<!-- Popper with Arrow -->
<Story name="Popper with Arrow">
  {#snippet children(args)}
    <div class="flex justify-center gap-8 py-16">
      <div>
        <button class="px-4 py-2 bg-purple-600 text-white rounded-lg" id="popper-arrow-top">Top Arrow</button>
        <Popper triggeredBy="#popper-arrow-top" trigger="hover" placement="top" arrow class="px-3 py-2 bg-gray-900 text-white rounded shadow-lg border border-gray-700">
          Tooltip with arrow
        </Popper>
      </div>
      <div>
        <button class="px-4 py-2 bg-purple-600 text-white rounded-lg" id="popper-arrow-bottom">Bottom Arrow</button>
        <Popper triggeredBy="#popper-arrow-bottom" trigger="hover" placement="bottom" arrow class="px-3 py-2 bg-gray-900 text-white rounded shadow-lg border border-gray-700">
          Tooltip with arrow
        </Popper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Popper Rich Content -->
<Story name="Popper Rich Content">
  {#snippet children(args)}
    <div class="flex justify-center py-16">
      <button class="px-4 py-2 bg-indigo-600 text-white rounded-lg" id="popper-rich">
        User Profile
      </button>
      <Popper triggeredBy="#popper-rich" trigger="click" placement="bottom" class="w-64 bg-white dark:bg-gray-800 rounded-lg shadow-lg border dark:border-gray-700 overflow-hidden">
        <div class="p-4">
          <div class="flex items-center gap-3 mb-3">
            <div class="w-10 h-10 bg-indigo-500 rounded-full flex items-center justify-center text-white font-semibold">
              JD
            </div>
            <div>
              <p class="font-semibold text-gray-900 dark:text-white">John Doe</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">@johndoe</p>
            </div>
          </div>
          <p class="text-sm text-gray-600 dark:text-gray-300 mb-3">
            Full-stack developer passionate about building great products.
          </p>
          <div class="flex gap-4 text-sm">
            <span class="text-gray-500 dark:text-gray-400">
              <strong class="text-gray-900 dark:text-white">124</strong> Following
            </span>
            <span class="text-gray-500 dark:text-gray-400">
              <strong class="text-gray-900 dark:text-white">1.2k</strong> Followers
            </span>
          </div>
        </div>
        <div class="px-4 py-3 bg-gray-50 dark:bg-gray-700 border-t dark:border-gray-600">
          <button class="w-full px-4 py-2 bg-indigo-600 text-white rounded-lg text-sm hover:bg-indigo-700">
            Follow
          </button>
        </div>
      </Popper>
    </div>
  {/snippet}
</Story>

<!-- ==================== RESPONSIVE HOOKS ==================== -->

<!-- Responsive Breakpoints Demo -->
<Story name="Responsive Breakpoints">
  {#snippet children(args)}
    {@const breakpoints = useBreakpoints()}
    {@const currentBreakpoint = useCurrentBreakpoint()}
    <div class="space-y-6">
      <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Current Breakpoint</h3>
        <div class="text-center">
          <span class="inline-block px-6 py-3 bg-blue-600 text-white text-2xl font-bold rounded-lg">
            {currentBreakpoint()}
          </span>
        </div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mt-4 text-center">
          Resize your browser to see this value change
        </p>
      </div>

      <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Breakpoint Status</h3>
        <div class="grid grid-cols-2 md:grid-cols-3 gap-3">
          {#each Object.entries(BREAKPOINTS) as [name, width]}
            <div class="flex items-center gap-2 p-2 bg-white dark:bg-gray-700 rounded">
              <span class={`w-3 h-3 rounded-full ${breakpoints[name] ? 'bg-green-500' : 'bg-gray-300 dark:bg-gray-600'}`}></span>
              <span class="text-sm font-medium text-gray-700 dark:text-gray-300">{name}</span>
              <span class="text-xs text-gray-500 dark:text-gray-400">({width}px)</span>
            </div>
          {/each}
        </div>
      </div>

      <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Device Categories</h3>
        <div class="flex gap-4">
          <div class={`flex-1 p-4 rounded-lg text-center ${breakpoints.isMobile ? 'bg-blue-100 dark:bg-blue-900 border-2 border-blue-500' : 'bg-white dark:bg-gray-700'}`}>
            <svg class="w-8 h-8 mx-auto mb-2 text-gray-600 dark:text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" />
            </svg>
            <p class="font-medium text-gray-900 dark:text-white">Mobile</p>
            <p class="text-xs text-gray-500 dark:text-gray-400">&lt; 640px</p>
          </div>
          <div class={`flex-1 p-4 rounded-lg text-center ${breakpoints.isTablet ? 'bg-blue-100 dark:bg-blue-900 border-2 border-blue-500' : 'bg-white dark:bg-gray-700'}`}>
            <svg class="w-8 h-8 mx-auto mb-2 text-gray-600 dark:text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 18h.01M7 21h10a2 2 0 002-2V5a2 2 0 00-2-2H7a2 2 0 00-2 2v14a2 2 0 002 2z" />
            </svg>
            <p class="font-medium text-gray-900 dark:text-white">Tablet</p>
            <p class="text-xs text-gray-500 dark:text-gray-400">640px - 1023px</p>
          </div>
          <div class={`flex-1 p-4 rounded-lg text-center ${breakpoints.isDesktop ? 'bg-blue-100 dark:bg-blue-900 border-2 border-blue-500' : 'bg-white dark:bg-gray-700'}`}>
            <svg class="w-8 h-8 mx-auto mb-2 text-gray-600 dark:text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
            </svg>
            <p class="font-medium text-gray-900 dark:text-white">Desktop</p>
            <p class="text-xs text-gray-500 dark:text-gray-400">&gt;= 1024px</p>
          </div>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Responsive Content Example -->
<Story name="Responsive Content Example">
  {#snippet children(args)}
    {@const breakpoints = useBreakpoints()}
    <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Responsive Layout Demo</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        This content adapts based on the current breakpoint using the useBreakpoints hook.
      </p>

      {#if breakpoints.isMobile}
        <div class="p-4 bg-red-100 dark:bg-red-900 rounded-lg">
          <p class="text-red-800 dark:text-red-200 font-medium">Mobile View</p>
          <p class="text-red-600 dark:text-red-300 text-sm mt-1">
            Stack content vertically for better mobile experience.
          </p>
        </div>
      {:else if breakpoints.isTablet}
        <div class="p-4 bg-yellow-100 dark:bg-yellow-900 rounded-lg">
          <p class="text-yellow-800 dark:text-yellow-200 font-medium">Tablet View</p>
          <p class="text-yellow-600 dark:text-yellow-300 text-sm mt-1">
            Two-column layout works well here.
          </p>
        </div>
      {:else}
        <div class="p-4 bg-green-100 dark:bg-green-900 rounded-lg">
          <p class="text-green-800 dark:text-green-200 font-medium">Desktop View</p>
          <p class="text-green-600 dark:text-green-300 text-sm mt-1">
            Full multi-column layout with sidebar.
          </p>
        </div>
      {/if}
    </div>
  {/snippet}
</Story>
