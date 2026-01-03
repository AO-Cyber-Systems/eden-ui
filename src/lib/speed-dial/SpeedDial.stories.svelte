<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import SpeedDial from './SpeedDial.svelte';
  import SpeedDialButton from './SpeedDialButton.svelte';
  import SpeedDialTrigger from './SpeedDialTrigger.svelte';

  const { Story } = defineMeta({
    title: 'Components/SpeedDial',
    component: SpeedDial,
    tags: ['autodocs'],
    argTypes: {
      placement: {
        control: { type: 'select' },
        options: ['top', 'bottom', 'left', 'right'],
        description: 'Position of the speed dial menu',
      },
      trigger: {
        control: { type: 'select' },
        options: ['hover', 'click'],
        description: 'How to trigger the menu',
      },
      tooltip: {
        control: { type: 'select' },
        options: ['left', 'right', 'top', 'bottom', 'none'],
        description: 'Tooltip placement for buttons',
      },
      pill: {
        control: 'boolean',
        description: 'Use pill-shaped buttons',
      },
      textOutside: {
        control: 'boolean',
        description: 'Show button text outside instead of tooltip',
      },
    },
    args: {
      placement: 'top',
      trigger: 'hover',
      tooltip: 'left',
      pill: true,
      textOutside: false,
    },
  });
</script>

<!-- Default SpeedDial -->
<Story name="Default">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <SpeedDial {...args}>
        <SpeedDialTrigger />
        <SpeedDialButton name="Share">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Print">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Download">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path clip-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V8a2 2 0 00-2-2h-5L9 4H4zm7 5a1 1 0 10-2 0v1.586l-.293-.293a.999.999 0 10-1.414 1.414l2 2a.999.999 0 001.414 0l2-2a.999.999 0 10-1.414-1.414l-.293.293V9z" fill-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Copy">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M7 9a2 2 0 012-2h6a2 2 0 012 2v6a2 2 0 01-2 2H9a2 2 0 01-2-2V9z"></path>
            <path d="M5 3a2 2 0 00-2 2v6a2 2 0 002 2V5h8a2 2 0 00-2-2H5z"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Placement Variants -->
<Story name="Placements">
  {#snippet children(args)}
    <div class="relative h-96 grid grid-cols-2 gap-8">
      <div class="flex items-end justify-center">
        <p class="absolute top-0 left-0 text-sm text-gray-500 dark:text-gray-400">Top</p>
        <SpeedDial placement="top">
          <SpeedDialTrigger />
          <SpeedDialButton name="Share">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
            </svg>
          </SpeedDialButton>
          <SpeedDialButton name="Print">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
            </svg>
          </SpeedDialButton>
        </SpeedDial>
      </div>

      <div class="flex items-start justify-center">
        <p class="absolute top-0 right-0 text-sm text-gray-500 dark:text-gray-400">Bottom</p>
        <SpeedDial placement="bottom">
          <SpeedDialTrigger />
          <SpeedDialButton name="Share">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
            </svg>
          </SpeedDialButton>
          <SpeedDialButton name="Print">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
            </svg>
          </SpeedDialButton>
        </SpeedDial>
      </div>

      <div class="flex items-center justify-end">
        <p class="absolute bottom-0 left-0 text-sm text-gray-500 dark:text-gray-400">Left</p>
        <SpeedDial placement="left">
          <SpeedDialTrigger />
          <SpeedDialButton name="Share">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
            </svg>
          </SpeedDialButton>
          <SpeedDialButton name="Print">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
            </svg>
          </SpeedDialButton>
        </SpeedDial>
      </div>

      <div class="flex items-center justify-start">
        <p class="absolute bottom-0 right-0 text-sm text-gray-500 dark:text-gray-400">Right</p>
        <SpeedDial placement="right">
          <SpeedDialTrigger />
          <SpeedDialButton name="Share">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
            </svg>
          </SpeedDialButton>
          <SpeedDialButton name="Print">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
            </svg>
          </SpeedDialButton>
        </SpeedDial>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Click Trigger -->
<Story name="Click Trigger">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">Click the button to toggle the menu</p>
      <SpeedDial trigger="click">
        <SpeedDialTrigger />
        <SpeedDialButton name="Share">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Print">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Download">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path clip-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V8a2 2 0 00-2-2h-5L9 4H4zm7 5a1 1 0 10-2 0v1.586l-.293-.293a.999.999 0 10-1.414 1.414l2 2a.999.999 0 001.414 0l2-2a.999.999 0 10-1.414-1.414l-.293.293V9z" fill-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Text Outside -->
<Story name="Text Outside">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">Labels shown beside buttons</p>
      <SpeedDial textOutside>
        <SpeedDialTrigger />
        <SpeedDialButton name="Share">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Print">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Download">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path clip-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V8a2 2 0 00-2-2h-5L9 4H4zm7 5a1 1 0 10-2 0v1.586l-.293-.293a.999.999 0 10-1.414 1.414l2 2a.999.999 0 001.414 0l2-2a.999.999 0 10-1.414-1.414l-.293.293V9z" fill-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- No Tooltips -->
<Story name="No Tooltips">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">No tooltips - labels shown inline</p>
      <SpeedDial tooltip="none">
        <SpeedDialTrigger />
        <SpeedDialButton name="Share">
          <svg class="w-5 h-5 me-2" fill="currentColor" viewBox="0 0 20 20">
            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Print">
          <svg class="w-5 h-5 me-2" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Download">
          <svg class="w-5 h-5 me-2" fill="currentColor" viewBox="0 0 20 20">
            <path clip-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V8a2 2 0 00-2-2h-5L9 4H4zm7 5a1 1 0 10-2 0v1.586l-.293-.293a.999.999 0 10-1.414 1.414l2 2a.999.999 0 001.414 0l2-2a.999.999 0 10-1.414-1.414l-.293.293V9z" fill-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Square Buttons -->
<Story name="Square Buttons">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">Non-pill (square) buttons</p>
      <SpeedDial pill={false}>
        <SpeedDialTrigger pill={false} />
        <SpeedDialButton name="Share">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Print">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Download">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path clip-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V8a2 2 0 00-2-2h-5L9 4H4zm7 5a1 1 0 10-2 0v1.586l-.293-.293a.999.999 0 10-1.414 1.414l2 2a.999.999 0 001.414 0l2-2a.999.999 0 10-1.414-1.414l-.293.293V9z" fill-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Gradient Trigger -->
<Story name="Gradient Trigger">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">Gradient style trigger button</p>
      <SpeedDial>
        <SpeedDialTrigger gradient color="purpleToBlue" />
        <SpeedDialButton name="Share">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Print">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4v3H4a2 2 0 00-2 2v3a2 2 0 002 2h1v2a2 2 0 002 2h6a2 2 0 002-2v-2h1a2 2 0 002-2V9a2 2 0 00-2-2h-1V4a2 2 0 00-2-2H7a2 2 0 00-2 2zm8 0H7v3h6V4zm0 8H7v4h6v-4z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Download">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path clip-rule="evenodd" d="M4 4a2 2 0 00-2 2v8a2 2 0 002 2h12a2 2 0 002-2V8a2 2 0 00-2-2h-5L9 4H4zm7 5a1 1 0 10-2 0v1.586l-.293-.293a.999.999 0 10-1.414 1.414l2 2a.999.999 0 001.414 0l2-2a.999.999 0 10-1.414-1.414l-.293.293V9z" fill-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Custom Trigger Icon -->
<Story name="Custom Trigger Icon">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">Custom trigger icon</p>
      <SpeedDial>
        <SpeedDialTrigger color="primary">
          {#snippet icon()}
            <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path>
            </svg>
          {/snippet}
        </SpeedDialTrigger>
        <SpeedDialButton name="Settings">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Profile">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Logout">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M3 3a1 1 0 00-1 1v12a1 1 0 102 0V4a1 1 0 00-1-1zm10.293 9.293a1 1 0 001.414 1.414l3-3a1 1 0 000-1.414l-3-3a1 1 0 10-1.414 1.414L14.586 9H7a1 1 0 100 2h7.586l-1.293 1.293z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Colored Buttons -->
<Story name="Colored Buttons">
  {#snippet children(args)}
    <div class="relative h-80 flex items-end justify-center">
      <p class="absolute top-4 text-sm text-gray-500 dark:text-gray-400">Different button colors</p>
      <SpeedDial>
        <SpeedDialTrigger color="primary" />
        <SpeedDialButton name="Danger" color="red">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Success" color="green">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
        <SpeedDialButton name="Info" color="blue">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
          </svg>
        </SpeedDialButton>
      </SpeedDial>
    </div>
  {/snippet}
</Story>

<!-- Fixed Position Example -->
<Story name="Fixed Position Example">
  {#snippet children(args)}
    <div class="relative h-96 bg-gray-100 dark:bg-gray-800 rounded-lg overflow-hidden">
      <div class="p-4">
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
          In a real application, you would use fixed positioning to place the speed dial in a corner.
        </p>
        <p class="text-gray-600 dark:text-gray-400">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        </p>
      </div>

      <div class="absolute bottom-4 right-4">
        <SpeedDial>
          <SpeedDialTrigger />
          <SpeedDialButton name="New Post">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" clip-rule="evenodd"></path>
            </svg>
          </SpeedDialButton>
          <SpeedDialButton name="Upload">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M3 17a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM6.293 6.707a1 1 0 010-1.414l3-3a1 1 0 011.414 0l3 3a1 1 0 01-1.414 1.414L11 5.414V13a1 1 0 11-2 0V5.414L7.707 6.707a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
            </svg>
          </SpeedDialButton>
          <SpeedDialButton name="Message">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
              <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
            </svg>
          </SpeedDialButton>
        </SpeedDial>
      </div>
    </div>
  {/snippet}
</Story>

