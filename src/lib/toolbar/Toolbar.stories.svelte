<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Toolbar from './Toolbar.svelte';
  import ToolbarGroup from './ToolbarGroup.svelte';
  import ToolbarButton from './ToolbarButton.svelte';

  const { Story } = defineMeta({
    title: 'Components/Toolbar',
    component: Toolbar,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['default', 'primary', 'secondary', 'gray', 'red', 'yellow', 'green', 'indigo', 'purple', 'pink', 'blue', 'dark'],
        description: 'Color theme for the toolbar',
      },
      embedded: {
        control: 'boolean',
        description: 'Whether the toolbar is embedded (no padding/border)',
      },
    },
    args: {
      color: 'default',
      embedded: false,
    },
  });
</script>

<!-- Default Toolbar -->
<Story name="Default">
  {#snippet children(args)}
    <Toolbar {...args}>
      <ToolbarGroup>
        <ToolbarButton name="Bold">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M6 4a1 1 0 00-1 1v10a1 1 0 001 1h4a4 4 0 001.62-7.66A3.5 3.5 0 0010 4H6zm3 4a1.5 1.5 0 110-3H9a1.5 1.5 0 010 3H9zm0 2H9a2 2 0 110 4H9a2 2 0 010-4z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Italic">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M8 4a1 1 0 100 2h1.586l-3.293 8H5a1 1 0 100 2h5a1 1 0 100-2h-1.586l3.293-8H13a1 1 0 100-2H8z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Underline">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 17a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zM10 4a2 2 0 00-2 2v4a2 2 0 104 0V6a2 2 0 00-2-2z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
    </Toolbar>
  {/snippet}
</Story>

<!-- With Multiple Groups -->
<Story name="Multiple Groups">
  {#snippet children(args)}
    <Toolbar {...args}>
      <ToolbarGroup position="first">
        <ToolbarButton name="Bold">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M6 4a1 1 0 00-1 1v10a1 1 0 001 1h4a4 4 0 001.62-7.66A3.5 3.5 0 0010 4H6zm3 4a1.5 1.5 0 110-3H9a1.5 1.5 0 010 3H9zm0 2H9a2 2 0 110 4H9a2 2 0 010-4z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Italic">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M8 4a1 1 0 100 2h1.586l-3.293 8H5a1 1 0 100 2h5a1 1 0 100-2h-1.586l3.293-8H13a1 1 0 100-2H8z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Underline">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 17a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zM10 4a2 2 0 00-2 2v4a2 2 0 104 0V6a2 2 0 00-2-2z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
      <ToolbarGroup>
        <ToolbarButton name="Align left">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h8a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm0 4a1 1 0 011-1h8a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Align center">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm2 4a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zm-2 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm2 4a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Align right">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M3 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm4 4a1 1 0 011-1h8a1 1 0 110 2H8a1 1 0 01-1-1zm-4 4a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zm4 4a1 1 0 011-1h8a1 1 0 110 2H8a1 1 0 01-1-1z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
      <ToolbarGroup position="last">
        <ToolbarButton name="List">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 4a1 1 0 100 2 1 1 0 000-2zM8 5a1 1 0 011-1h8a1 1 0 110 2H9a1 1 0 01-1-1zM5 9a1 1 0 100 2 1 1 0 000-2zM8 10a1 1 0 011-1h8a1 1 0 110 2H9a1 1 0 01-1-1zM5 14a1 1 0 100 2 1 1 0 000-2zM8 15a1 1 0 011-1h8a1 1 0 110 2H9a1 1 0 01-1-1z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Code">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
    </Toolbar>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      {#each ['default', 'primary', 'blue', 'green', 'red', 'yellow', 'purple', 'pink'] as color}
        <div>
          <p class="text-sm text-gray-500 dark:text-gray-400 mb-2 capitalize">{color}</p>
          <Toolbar {color}>
            <ToolbarGroup>
              <ToolbarButton name="Home">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
                </svg>
              </ToolbarButton>
              <ToolbarButton name="Settings">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
                </svg>
              </ToolbarButton>
              <ToolbarButton name="User">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
                </svg>
              </ToolbarButton>
            </ToolbarGroup>
          </Toolbar>
        </div>
      {/each}
    </div>
  {/snippet}
</Story>

<!-- Embedded Toolbar -->
<Story name="Embedded">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Standard (with background)</p>
        <Toolbar color="default">
          <ToolbarGroup>
            <ToolbarButton name="Home">
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
              </svg>
            </ToolbarButton>
            <ToolbarButton name="Settings">
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
              </svg>
            </ToolbarButton>
          </ToolbarGroup>
        </Toolbar>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Embedded (transparent, no padding)</p>
        <Toolbar embedded>
          <ToolbarGroup>
            <ToolbarButton name="Home">
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
              </svg>
            </ToolbarButton>
            <ToolbarButton name="Settings">
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
              </svg>
            </ToolbarButton>
          </ToolbarGroup>
        </Toolbar>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Button Sizes -->
<Story name="Button Sizes">
  {#snippet children(args)}
    <div class="space-y-6">
      {#each ['xs', 'sm', 'md', 'lg'] as size}
        <div>
          <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Size: {size}</p>
          <Toolbar>
            <ToolbarGroup>
              <ToolbarButton name="Bold" {size}>
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M6 4a1 1 0 00-1 1v10a1 1 0 001 1h4a4 4 0 001.62-7.66A3.5 3.5 0 0010 4H6zm3 4a1.5 1.5 0 110-3H9a1.5 1.5 0 010 3H9zm0 2H9a2 2 0 110 4H9a2 2 0 010-4z"></path>
                </svg>
              </ToolbarButton>
              <ToolbarButton name="Italic" {size}>
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M8 4a1 1 0 100 2h1.586l-3.293 8H5a1 1 0 100 2h5a1 1 0 100-2h-1.586l3.293-8H13a1 1 0 100-2H8z"></path>
                </svg>
              </ToolbarButton>
              <ToolbarButton name="Underline" {size}>
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M5 17a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zM10 4a2 2 0 00-2 2v4a2 2 0 104 0V6a2 2 0 00-2-2z" clip-rule="evenodd"></path>
                </svg>
              </ToolbarButton>
            </ToolbarGroup>
          </Toolbar>
        </div>
      {/each}
    </div>
  {/snippet}
</Story>

<!-- Button Colors -->
<Story name="Button Colors">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">ToolbarButton supports various color options</p>
      <Toolbar>
        <ToolbarGroup spacing="loose">
          <ToolbarButton name="Default" color="default">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Primary" color="primary">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Blue" color="blue">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Green" color="green">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Red" color="red">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Purple" color="purple">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M5 4a2 2 0 012-2h6a2 2 0 012 2v14l-5-2.5L5 18V4z"></path>
            </svg>
          </ToolbarButton>
        </ToolbarGroup>
      </Toolbar>
    </div>
  {/snippet}
</Story>

<!-- Group Spacing -->
<Story name="Group Spacing">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Tight spacing</p>
        <Toolbar>
          <ToolbarGroup spacing="tight">
            <ToolbarButton name="1">1</ToolbarButton>
            <ToolbarButton name="2">2</ToolbarButton>
            <ToolbarButton name="3">3</ToolbarButton>
            <ToolbarButton name="4">4</ToolbarButton>
          </ToolbarGroup>
        </Toolbar>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Default spacing</p>
        <Toolbar>
          <ToolbarGroup spacing="default">
            <ToolbarButton name="1">1</ToolbarButton>
            <ToolbarButton name="2">2</ToolbarButton>
            <ToolbarButton name="3">3</ToolbarButton>
            <ToolbarButton name="4">4</ToolbarButton>
          </ToolbarGroup>
        </Toolbar>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Loose spacing</p>
        <Toolbar>
          <ToolbarGroup spacing="loose">
            <ToolbarButton name="1">1</ToolbarButton>
            <ToolbarButton name="2">2</ToolbarButton>
            <ToolbarButton name="3">3</ToolbarButton>
            <ToolbarButton name="4">4</ToolbarButton>
          </ToolbarGroup>
        </Toolbar>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With End Slot -->
<Story name="With End Slot">
  {#snippet children(args)}
    <Toolbar>
      <ToolbarGroup>
        <ToolbarButton name="Bold">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M6 4a1 1 0 00-1 1v10a1 1 0 001 1h4a4 4 0 001.62-7.66A3.5 3.5 0 0010 4H6zm3 4a1.5 1.5 0 110-3H9a1.5 1.5 0 010 3H9zm0 2H9a2 2 0 110 4H9a2 2 0 010-4z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Italic">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M8 4a1 1 0 100 2h1.586l-3.293 8H5a1 1 0 100 2h5a1 1 0 100-2h-1.586l3.293-8H13a1 1 0 100-2H8z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Underline">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 17a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zM10 4a2 2 0 00-2 2v4a2 2 0 104 0V6a2 2 0 00-2-2z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>

      {#snippet end()}
        <button class="px-3 py-1.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700">
          Publish
        </button>
      {/snippet}
    </Toolbar>
  {/snippet}
</Story>

<!-- Link Buttons -->
<Story name="Link Buttons">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        ToolbarButton renders as an anchor when href is provided
      </p>
      <Toolbar>
        <ToolbarGroup>
          <ToolbarButton name="Home" href="/">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Documentation" href="/docs">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M9 4.804A7.968 7.968 0 005.5 4c-1.255 0-2.443.29-3.5.804v10A7.969 7.969 0 015.5 14c1.669 0 3.218.51 4.5 1.385A7.962 7.962 0 0114.5 14c1.255 0 2.443.29 3.5.804v-10A7.968 7.968 0 0014.5 4c-1.255 0-2.443.29-3.5.804V12a1 1 0 11-2 0V4.804z"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="GitHub" href="https://github.com">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 0C4.477 0 0 4.484 0 10.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0110 4.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.203 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.942.359.31.678.921.678 1.856 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0020 10.017C20 4.484 15.522 0 10 0z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
        </ToolbarGroup>
      </Toolbar>
    </div>
  {/snippet}
</Story>

<!-- Text Editor Toolbar -->
<Story name="Text Editor">
  {#snippet children(args)}
    <div class="border rounded-lg dark:border-gray-700 overflow-hidden">
      <Toolbar embedded>
        <ToolbarGroup position="first">
          <ToolbarButton name="Bold">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M6 4a1 1 0 00-1 1v10a1 1 0 001 1h4a4 4 0 001.62-7.66A3.5 3.5 0 0010 4H6zm3 4a1.5 1.5 0 110-3H9a1.5 1.5 0 010 3H9zm0 2H9a2 2 0 110 4H9a2 2 0 010-4z"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Italic">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M8 4a1 1 0 100 2h1.586l-3.293 8H5a1 1 0 100 2h5a1 1 0 100-2h-1.586l3.293-8H13a1 1 0 100-2H8z"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Underline">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 17a1 1 0 011-1h8a1 1 0 110 2H6a1 1 0 01-1-1zM10 4a2 2 0 00-2 2v4a2 2 0 104 0V6a2 2 0 00-2-2z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Strikethrough">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
        </ToolbarGroup>
        <ToolbarGroup>
          <ToolbarButton name="Link">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M12.586 4.586a2 2 0 112.828 2.828l-3 3a2 2 0 01-2.828 0 1 1 0 00-1.414 1.414 4 4 0 005.656 0l3-3a4 4 0 00-5.656-5.656l-1.5 1.5a1 1 0 101.414 1.414l1.5-1.5zm-5 5a2 2 0 012.828 0 1 1 0 101.414-1.414 4 4 0 00-5.656 0l-3 3a4 4 0 105.656 5.656l1.5-1.5a1 1 0 10-1.414-1.414l-1.5 1.5a2 2 0 11-2.828-2.828l3-3z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Image">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Code">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 0 11-1.898-.632l4-12a1 1 0 011.265-.633zM5.707 6.293a1 1 0 010 1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 0 010 1.414l-3 3a1 1 0 11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
        </ToolbarGroup>
        <ToolbarGroup position="last">
          <ToolbarButton name="List">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 4a1 1 0 100 2 1 1 0 000-2zM8 5a1 1 0 011-1h8a1 1 0 110 2H9a1 1 0 01-1-1zM5 9a1 1 0 100 2 1 1 0 000-2zM8 10a1 1 0 011-1h8a1 1 0 110 2H9a1 1 0 01-1-1zM5 14a1 1 0 100 2 1 1 0 000-2zM8 15a1 1 0 011-1h8a1 1 0 110 2H9a1 1 0 01-1-1z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
          <ToolbarButton name="Ordered list">
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M5 4a1 1 0 011-1h12a1 1 0 110 2H6a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H6a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H6a1 1 0 01-1-1zm0 4a1 1 0 011-1h12a1 1 0 110 2H6a1 1 0 01-1-1z" clip-rule="evenodd"></path>
            </svg>
          </ToolbarButton>
        </ToolbarGroup>

        {#snippet end()}
          <div class="flex items-center gap-2">
            <button class="px-3 py-1.5 text-sm font-medium text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200">
              Save Draft
            </button>
            <button class="px-3 py-1.5 text-sm font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700">
              Publish
            </button>
          </div>
        {/snippet}
      </Toolbar>

      <textarea
        class="w-full p-4 border-t dark:border-gray-700 bg-white dark:bg-gray-900 text-gray-900 dark:text-white focus:outline-none"
        rows="6"
        placeholder="Write your content here..."
      ></textarea>
    </div>
  {/snippet}
</Story>

<!-- Media Controls -->
<Story name="Media Controls">
  {#snippet children(args)}
    <Toolbar color="dark">
      <ToolbarGroup position="first">
        <ToolbarButton name="Previous">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M8.445 14.832A1 1 0 0010 14v-2.798l5.445 3.63A1 1 0 0017 14V6a1 1 0 00-1.555-.832L10 8.798V6a1 1 0 00-1.555-.832l-6 4a1 1 0 000 1.664l6 4z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Play" size="lg">
          <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM9.555 7.168A1 1 0 008 8v4a1 1 0 001.555.832l3-2a1 1 0 000-1.664l-3-2z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Next">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M4.555 5.168A1 1 0 003 6v8a1 1 0 001.555.832L10 11.202V14a1 1 0 001.555.832l6-4a1 1 0 000-1.664l-6-4A1 1 0 0010 6v2.798l-5.445-3.63z"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
      <ToolbarGroup position="last">
        <ToolbarButton name="Volume">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M9.383 3.076A1 1 0 0110 4v12a1 1 0 01-1.707.707L4.586 13H2a1 1 0 01-1-1V8a1 1 0 011-1h2.586l3.707-3.707a1 1 0 011.09-.217zM14.657 2.929a1 1 0 011.414 0A9.972 9.972 0 0119 10a9.972 9.972 0 01-2.929 7.071 1 1 0 01-1.414-1.414A7.971 7.971 0 0017 10c0-2.21-.894-4.208-2.343-5.657a1 1 0 010-1.414zm-2.829 2.828a1 1 0 011.415 0A5.983 5.983 0 0115 10a5.984 5.984 0 01-1.757 4.243 1 1 0 01-1.415-1.415A3.984 3.984 0 0013 10a3.983 3.983 0 00-1.172-2.828 1 1 0 010-1.415z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Fullscreen">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M3 4a1 1 0 011-1h4a1 1 0 010 2H6.414l2.293 2.293a1 1 0 11-1.414 1.414L5 6.414V8a1 1 0 01-2 0V4zm9 1a1 1 0 010-2h4a1 1 0 011 1v4a1 1 0 01-2 0V6.414l-2.293 2.293a1 1 0 11-1.414-1.414L13.586 5H12zm-9 7a1 1 0 012 0v1.586l2.293-2.293a1 1 0 111.414 1.414L6.414 15H8a1 1 0 010 2H4a1 1 0 01-1-1v-4zm13-1a1 1 0 011 1v4a1 1 0 01-1 1h-4a1 1 0 010-2h1.586l-2.293-2.293a1 1 0 111.414-1.414L15 13.586V12a1 1 0 011-1z"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
    </Toolbar>
  {/snippet}
</Story>

<!-- File Actions Toolbar -->
<Story name="File Actions">
  {#snippet children(args)}
    <Toolbar color="primary">
      <ToolbarGroup>
        <ToolbarButton name="New file">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M6 2a2 2 0 00-2 2v12a2 2 0 002 2h8a2 2 0 002-2V7.414A2 2 0 0015.414 6L12 2.586A2 2 0 0010.586 2H6zm5 6a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V8z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Open folder">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M2 6a2 2 0 012-2h5l2 2h5a2 2 0 012 2v6a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Save">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M7.707 10.293a1 1 0 10-1.414 1.414l3 3a1 1 0 001.414 0l3-3a1 1 0 00-1.414-1.414L11 11.586V6h5a2 2 0 012 2v7a2 2 0 01-2 2H4a2 2 0 01-2-2V8a2 2 0 012-2h5v5.586l-1.293-1.293zM9 4a1 1 0 012 0v2H9V4z"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
      <ToolbarGroup>
        <ToolbarButton name="Undo">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M9.707 16.707a1 1 0 01-1.414 0l-6-6a1 1 0 010-1.414l6-6a1 1 0 011.414 1.414L5.414 9H17a1 1 0 110 2H5.414l4.293 4.293a1 1 0 010 1.414z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Redo">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>
      <ToolbarGroup>
        <ToolbarButton name="Search">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
        <ToolbarButton name="Settings">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M11.49 3.17c-.38-1.56-2.6-1.56-2.98 0a1.532 1.532 0 01-2.286.948c-1.372-.836-2.942.734-2.106 2.106.54.886.061 2.042-.947 2.287-1.561.379-1.561 2.6 0 2.978a1.532 1.532 0 01.947 2.287c-.836 1.372.734 2.942 2.106 2.106a1.532 1.532 0 012.287.947c.379 1.561 2.6 1.561 2.978 0a1.533 1.533 0 012.287-.947c1.372.836 2.942-.734 2.106-2.106a1.533 1.533 0 01.947-2.287c1.561-.379 1.561-2.6 0-2.978a1.532 1.532 0 01-.947-2.287c.836-1.372-.734-2.942-2.106-2.106a1.532 1.532 0 01-2.287-.947zM10 13a3 3 0 100-6 3 3 0 000 6z" clip-rule="evenodd"></path>
          </svg>
        </ToolbarButton>
      </ToolbarGroup>

      {#snippet end()}
        <span class="text-sm text-gray-500 dark:text-gray-400">
          Last saved: 2 min ago
        </span>
      {/snippet}
    </Toolbar>
  {/snippet}
</Story>
