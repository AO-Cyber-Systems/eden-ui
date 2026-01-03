<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import ButtonToggle from './ButtonToggle.svelte';
  import ButtonToggleGroup from './ButtonToggleGroup.svelte';

  const { Story } = defineMeta({
    title: 'Forms/ButtonToggle',
    component: ButtonToggle,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'blue', 'green', 'red', 'yellow', 'purple'],
        description: 'The color of the toggle button',
      },
      selected: {
        control: 'boolean',
        description: 'Whether the button is selected',
      },
    },
    args: {
      color: 'primary',
      selected: false,
    },
  });

  let selectedValue = $state(null);
  let multiValues = $state([]);
</script>

<!-- Default ButtonToggle Group -->
<Story name="Default">
  {#snippet children(args)}
    <div class="space-y-4">
      <ButtonToggleGroup bind:value={selectedValue}>
        <ButtonToggle value="left">Left</ButtonToggle>
        <ButtonToggle value="center">Center</ButtonToggle>
        <ButtonToggle value="right">Right</ButtonToggle>
      </ButtonToggleGroup>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Selected: {selectedValue ?? 'None'}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <ButtonToggleGroup color="primary">
        <ButtonToggle value="a">Primary A</ButtonToggle>
        <ButtonToggle value="b">Primary B</ButtonToggle>
      </ButtonToggleGroup>
      <ButtonToggleGroup color="green">
        <ButtonToggle value="a">Green A</ButtonToggle>
        <ButtonToggle value="b">Green B</ButtonToggle>
      </ButtonToggleGroup>
      <ButtonToggleGroup color="red">
        <ButtonToggle value="a">Red A</ButtonToggle>
        <ButtonToggle value="b">Red B</ButtonToggle>
      </ButtonToggleGroup>
      <ButtonToggleGroup color="purple">
        <ButtonToggle value="a">Purple A</ButtonToggle>
        <ButtonToggle value="b">Purple B</ButtonToggle>
      </ButtonToggleGroup>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Small</p>
        <ButtonToggleGroup size="sm">
          <ButtonToggle value="a">Option A</ButtonToggle>
          <ButtonToggle value="b">Option B</ButtonToggle>
        </ButtonToggleGroup>
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Medium (default)</p>
        <ButtonToggleGroup size="md">
          <ButtonToggle value="a">Option A</ButtonToggle>
          <ButtonToggle value="b">Option B</ButtonToggle>
        </ButtonToggleGroup>
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Large</p>
        <ButtonToggleGroup size="lg">
          <ButtonToggle value="a">Option A</ButtonToggle>
          <ButtonToggle value="b">Option B</ButtonToggle>
        </ButtonToggleGroup>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Multi Select -->
<Story name="Multi Select">
  {#snippet children(args)}
    <div class="space-y-4">
      <ButtonToggleGroup multiSelect bind:value={multiValues}>
        <ButtonToggle value="bold">Bold</ButtonToggle>
        <ButtonToggle value="italic">Italic</ButtonToggle>
        <ButtonToggle value="underline">Underline</ButtonToggle>
        <ButtonToggle value="strikethrough">Strike</ButtonToggle>
      </ButtonToggleGroup>
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Selected: {multiValues.length > 0 ? multiValues.join(', ') : 'None'}
      </p>
    </div>
  {/snippet}
</Story>

<!-- Rounded Size Variants -->
<Story name="Rounded Sizes">
  {#snippet children(args)}
    <div class="space-y-4">
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">None</p>
        <ButtonToggleGroup roundedSize="none">
          <ButtonToggle value="a">A</ButtonToggle>
          <ButtonToggle value="b">B</ButtonToggle>
          <ButtonToggle value="c">C</ButtonToggle>
        </ButtonToggleGroup>
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Small</p>
        <ButtonToggleGroup roundedSize="sm">
          <ButtonToggle value="a">A</ButtonToggle>
          <ButtonToggle value="b">B</ButtonToggle>
          <ButtonToggle value="c">C</ButtonToggle>
        </ButtonToggleGroup>
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Medium (default)</p>
        <ButtonToggleGroup roundedSize="md">
          <ButtonToggle value="a">A</ButtonToggle>
          <ButtonToggle value="b">B</ButtonToggle>
          <ButtonToggle value="c">C</ButtonToggle>
        </ButtonToggleGroup>
      </div>
      <div>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">Large</p>
        <ButtonToggleGroup roundedSize="lg">
          <ButtonToggle value="a">A</ButtonToggle>
          <ButtonToggle value="b">B</ButtonToggle>
          <ButtonToggle value="c">C</ButtonToggle>
        </ButtonToggleGroup>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Text Alignment Example -->
<Story name="Text Alignment">
  {#snippet children(args)}
    <div class="max-w-md space-y-4">
      <p class="text-sm font-medium text-gray-900 dark:text-white">Text Alignment</p>
      <ButtonToggleGroup value="left">
        <ButtonToggle value="left">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z" clip-rule="evenodd"/>
          </svg>
        </ButtonToggle>
        <ButtonToggle value="center">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10zm4 5.25a.75.75 0 01.75-.75h6.5a.75.75 0 010 1.5h-6.5a.75.75 0 01-.75-.75z" clip-rule="evenodd"/>
          </svg>
        </ButtonToggle>
        <ButtonToggle value="right">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75a.75.75 0 01-.75-.75zm7-5.25a.75.75 0 01.75-.75h7.5a.75.75 0 010 1.5h-7.5a.75.75 0 01-.75-.75z" clip-rule="evenodd"/>
          </svg>
        </ButtonToggle>
        <ButtonToggle value="justify">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M2 4.75A.75.75 0 012.75 4h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 4.75zm0 10.5a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75a.75.75 0 01-.75-.75zM2 10a.75.75 0 01.75-.75h14.5a.75.75 0 010 1.5H2.75A.75.75 0 012 10z" clip-rule="evenodd"/>
          </svg>
        </ButtonToggle>
      </ButtonToggleGroup>
    </div>
  {/snippet}
</Story>

<!-- View Mode Example -->
<Story name="View Mode">
  {#snippet children(args)}
    <div class="max-w-md space-y-4">
      <p class="text-sm font-medium text-gray-900 dark:text-white">View Mode</p>
      <ButtonToggleGroup value="grid">
        <ButtonToggle value="list">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M2 4a1 1 0 011-1h14a1 1 0 110 2H3a1 1 0 01-1-1zm0 6a1 1 0 011-1h14a1 1 0 110 2H3a1 1 0 01-1-1zm1 5a1 1 0 100 2h14a1 1 0 100-2H3z" clip-rule="evenodd"/>
          </svg>
        </ButtonToggle>
        <ButtonToggle value="grid">
          <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
            <path d="M5 3a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2V5a2 2 0 00-2-2H5zM5 11a2 2 0 00-2 2v2a2 2 0 002 2h2a2 2 0 002-2v-2a2 2 0 00-2-2H5zM11 5a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V5zM11 13a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z"/>
          </svg>
        </ButtonToggle>
      </ButtonToggleGroup>
    </div>
  {/snippet}
</Story>

