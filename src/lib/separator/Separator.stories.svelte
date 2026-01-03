<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Separator from './Separator.svelte';

  const { Story } = defineMeta({
    title: 'Components/Separator',
    component: Separator,
    tags: ['autodocs'],
    argTypes: {
      orientation: {
        control: { type: 'select' },
        options: ['horizontal', 'vertical'],
        description: 'The orientation of the separator',
      },
      style: {
        control: { type: 'select' },
        options: ['solid', 'dashed', 'dotted'],
        description: 'The line style of the separator',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The thickness of the separator',
      },
      color: {
        control: { type: 'select' },
        options: ['default', 'primary', 'secondary', 'gray', 'red', 'green', 'blue', 'yellow'],
        description: 'The color of the separator',
      },
    },
    args: {
      orientation: 'horizontal',
      style: 'solid',
      size: 'md',
      color: 'default',
    },
  });
</script>

<!-- Default Separator -->
<Story name="Default">
  {#snippet children(args)}
    <div class="py-4">
      <p class="text-gray-600 dark:text-gray-400 mb-4">Content above the separator</p>
      <Separator {...args} />
      <p class="text-gray-600 dark:text-gray-400 mt-4">Content below the separator</p>
    </div>
  {/snippet}
</Story>

<!-- With Text Content -->
<Story name="With Text">
  {#snippet children(args)}
    <div class="py-4">
      <p class="text-gray-600 dark:text-gray-400 mb-4">First section content</p>
      <Separator>or</Separator>
      <p class="text-gray-600 dark:text-gray-400 mt-4">Second section content</p>
    </div>
  {/snippet}
</Story>

<!-- Style Variants -->
<Story name="Style Variants">
  {#snippet children(args)}
    <div class="space-y-8 py-4">
      <div>
        <p class="text-sm text-gray-500 mb-2">Solid (default)</p>
        <Separator style="solid" />
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Dashed</p>
        <Separator style="dashed" />
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Dotted</p>
        <Separator style="dotted" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-8 py-4">
      <div>
        <p class="text-sm text-gray-500 mb-2">Extra Small</p>
        <Separator size="xs" />
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Small</p>
        <Separator size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Medium (default)</p>
        <Separator size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Large</p>
        <Separator size="lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Extra Large</p>
        <Separator size="xl" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-6 py-4">
      <Separator color="default">Default</Separator>
      <Separator color="primary">Primary</Separator>
      <Separator color="red">Red</Separator>
      <Separator color="green">Green</Separator>
      <Separator color="blue">Blue</Separator>
      <Separator color="yellow">Yellow</Separator>
    </div>
  {/snippet}
</Story>

<!-- Vertical Separator -->
<Story name="Vertical">
  {#snippet children(args)}
    <div class="flex items-center gap-4 h-24">
      <div class="text-gray-600 dark:text-gray-400">Left content</div>
      <Separator orientation="vertical" />
      <div class="text-gray-600 dark:text-gray-400">Middle content</div>
      <Separator orientation="vertical" />
      <div class="text-gray-600 dark:text-gray-400">Right content</div>
    </div>
  {/snippet}
</Story>

<!-- In Card Context -->
<Story name="In Card Context">
  {#snippet children(args)}
    <div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow max-w-md">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Account Settings</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">Manage your account preferences</p>

      <Separator class="my-4" />

      <div class="space-y-3">
        <div class="flex justify-between">
          <span class="text-gray-600 dark:text-gray-400">Email notifications</span>
          <span class="text-gray-900 dark:text-white">Enabled</span>
        </div>
        <div class="flex justify-between">
          <span class="text-gray-600 dark:text-gray-400">Two-factor auth</span>
          <span class="text-gray-900 dark:text-white">Disabled</span>
        </div>
      </div>

      <Separator class="my-4">Security</Separator>

      <div class="space-y-3">
        <div class="flex justify-between">
          <span class="text-gray-600 dark:text-gray-400">Password</span>
          <span class="text-gray-900 dark:text-white">Last changed 30 days ago</span>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Login Form Example -->
<Story name="Login Form Divider">
  {#snippet children(args)}
    <div class="max-w-sm p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
      <button class="w-full py-2 px-4 bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-200 dark:hover:bg-gray-600 flex items-center justify-center gap-2">
        <svg class="w-5 h-5" viewBox="0 0 24 24">
          <path fill="currentColor" d="M12.545,10.239v3.821h5.445c-0.712,2.315-2.647,3.972-5.445,3.972c-3.332,0-6.033-2.701-6.033-6.032s2.701-6.032,6.033-6.032c1.498,0,2.866,0.549,3.921,1.453l2.814-2.814C17.503,2.988,15.139,2,12.545,2C7.021,2,2.543,6.477,2.543,12s4.478,10,10.002,10c8.396,0,10.249-7.85,9.426-11.748L12.545,10.239z"/>
        </svg>
        Continue with Google
      </button>

      <Separator class="my-4">or</Separator>

      <form class="space-y-4">
        <input type="email" placeholder="Email" class="w-full px-4 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" />
        <input type="password" placeholder="Password" class="w-full px-4 py-2 border rounded-lg dark:bg-gray-700 dark:border-gray-600" />
        <button class="w-full py-2 px-4 bg-blue-600 text-white rounded-lg hover:bg-blue-700">
          Sign In
        </button>
      </form>
    </div>
  {/snippet}
</Story>
