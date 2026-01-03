<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Range from './Range.svelte';
  import Label from '../label/Label.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Range',
    component: Range,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the range slider',
      },
      color: {
        control: { type: 'select' },
        options: ['blue', 'green', 'red', 'purple', 'teal', 'yellow', 'orange'],
        description: 'The color of the range slider',
      },
      appearance: {
        control: { type: 'select' },
        options: ['none', 'auto'],
        description: 'The appearance style',
      },
    },
    args: {
      size: 'md',
      color: 'blue',
      appearance: 'none',
    },
  });

  let volume = $state(50);
  let brightness = $state(75);
</script>

<!-- Default Range -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="default-range" class="mb-2">Default range</Label>
      <Range {...args} id="default-range" bind:value={volume} />
      <p class="text-sm text-gray-500 mt-2">Value: {volume}</p>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-6 max-w-md">
      <div>
        <Label class="mb-2">Small</Label>
        <Range size="sm" value={30} />
      </div>
      <div>
        <Label class="mb-2">Medium (default)</Label>
        <Range size="md" value={50} />
      </div>
      <div>
        <Label class="mb-2">Large</Label>
        <Range size="lg" value={70} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-6 max-w-md">
      <div>
        <Label class="mb-2">Blue</Label>
        <Range color="blue" value={50} />
      </div>
      <div>
        <Label class="mb-2">Green</Label>
        <Range color="green" value={50} />
      </div>
      <div>
        <Label class="mb-2">Red</Label>
        <Range color="red" value={50} />
      </div>
      <div>
        <Label class="mb-2">Purple</Label>
        <Range color="purple" value={50} />
      </div>
      <div>
        <Label class="mb-2">Orange</Label>
        <Range color="orange" value={50} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Min/Max -->
<Story name="With Min Max">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="minmax-range" class="mb-2">Price range ($0 - $1000)</Label>
      <Range id="minmax-range" min={0} max={1000} step={50} value={500} />
      <div class="flex justify-between text-sm text-gray-500 mt-1">
        <span>$0</span>
        <span>$1000</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Steps -->
<Story name="With Steps">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="steps-range" class="mb-2">Rating (1-5)</Label>
      <Range id="steps-range" min={1} max={5} step={1} value={3} />
      <div class="flex justify-between text-xs text-gray-500 mt-1">
        <span>1</span>
        <span>2</span>
        <span>3</span>
        <span>4</span>
        <span>5</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Volume Control Example -->
<Story name="Volume Control">
  {#snippet children(args)}
    <div class="max-w-md p-4 border rounded-lg dark:border-gray-700">
      <div class="flex items-center gap-4">
        <svg class="w-6 h-6 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M9.383 3.076A1 1 0 0110 4v12a1 1 0 01-1.707.707L4.586 13H2a1 1 0 01-1-1V8a1 1 0 011-1h2.586l3.707-3.707a1 1 0 011.09-.217zM14.657 2.929a1 1 0 011.414 0A9.972 9.972 0 0119 10a9.972 9.972 0 01-2.929 7.071 1 1 0 01-1.414-1.414A7.971 7.971 0 0017 10c0-2.21-.894-4.208-2.343-5.657a1 1 0 010-1.414zm-2.829 2.828a1 1 0 011.415 0A5.983 5.983 0 0115 10a5.984 5.984 0 01-1.757 4.243 1 1 0 01-1.415-1.415A3.984 3.984 0 0013 10a3.983 3.983 0 00-1.172-2.828 1 1 0 010-1.415z" clip-rule="evenodd"/>
        </svg>
        <Range class="flex-1" bind:value={volume} />
        <span class="text-sm font-medium text-gray-900 dark:text-white w-8">{volume}%</span>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Brightness Control Example -->
<Story name="Brightness Control">
  {#snippet children(args)}
    <div class="max-w-md p-4 border rounded-lg dark:border-gray-700">
      <div class="flex items-center gap-4">
        <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"/>
        </svg>
        <Range class="flex-1" color="yellow" bind:value={brightness} />
        <svg class="w-6 h-6 text-yellow-400" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z" clip-rule="evenodd"/>
        </svg>
      </div>
    </div>
  {/snippet}
</Story>

