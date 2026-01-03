<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Toast from './Toast.svelte';
  import ToastContainer from './ToastContainer.svelte';

  const { Story } = defineMeta({
    title: 'Components/Toast',
    component: Toast,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['primary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'],
        description: 'Color theme for the toast',
      },
      position: {
        control: { type: 'select' },
        options: ['top-left', 'top-right', 'bottom-left', 'bottom-right'],
        description: 'Position of the toast (when used standalone)',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the toast can be dismissed',
      },
      align: {
        control: 'boolean',
        description: 'Align items center (true) or start (false)',
      },
    },
    args: {
      color: 'primary',
      dismissable: true,
      align: true,
    },
  });
</script>

<!-- Default Toast -->
<Story name="Default">
  {#snippet children(args)}
    <Toast {...args}>
      {#snippet icon()}
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      Item moved successfully.
    </Toast>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Toast supports 19 color variants</p>

      <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
        {#each ['primary', 'gray', 'red', 'green', 'blue', 'yellow', 'orange', 'purple', 'pink'] as color}
          <Toast {color}>
            {#snippet icon()}
              <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
              </svg>
            {/snippet}
            This is a {color} toast notification
          </Toast>
        {/each}
      </div>
    </div>
  {/snippet}
</Story>

<!-- All Colors Showcase -->
<Story name="All Colors">
  {#snippet children(args)}
    <div class="space-y-3">
      {#each ['primary', 'gray', 'red', 'orange', 'amber', 'yellow', 'lime', 'green', 'emerald', 'teal', 'cyan', 'sky', 'blue', 'indigo', 'violet', 'purple', 'fuchsia', 'pink', 'rose'] as color}
        <Toast {color}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
            </svg>
          {/snippet}
          {color.charAt(0).toUpperCase() + color.slice(1)} toast notification
        </Toast>
      {/each}
    </div>
  {/snippet}
</Story>

<!-- Success Toast -->
<Story name="Success Toast">
  {#snippet children(args)}
    <Toast color="green">
      {#snippet icon()}
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      Your changes have been saved successfully.
    </Toast>
  {/snippet}
</Story>

<!-- Error Toast -->
<Story name="Error Toast">
  {#snippet children(args)}
    <Toast color="red">
      {#snippet icon()}
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      Failed to delete the item. Please try again.
    </Toast>
  {/snippet}
</Story>

<!-- Warning Toast -->
<Story name="Warning Toast">
  {#snippet children(args)}
    <Toast color="orange">
      {#snippet icon()}
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      Your session will expire in 5 minutes.
    </Toast>
  {/snippet}
</Story>

<!-- Info Toast -->
<Story name="Info Toast">
  {#snippet children(args)}
    <Toast color="blue">
      {#snippet icon()}
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      New version available. Click to update.
    </Toast>
  {/snippet}
</Story>

<!-- Without Icon -->
<Story name="Without Icon">
  {#snippet children(args)}
    <div class="space-y-4">
      <Toast color="primary">
        Simple toast without an icon.
      </Toast>
      <Toast color="green">
        Success message without icon.
      </Toast>
      <Toast color="red">
        Error message without icon.
      </Toast>
    </div>
  {/snippet}
</Story>

<!-- Non-Dismissable -->
<Story name="Non-Dismissable">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">No close button - useful for persistent notifications</p>
      <Toast color="blue" dismissable={false}>
        {#snippet icon()}
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd"></path>
          </svg>
        {/snippet}
        This notification cannot be dismissed.
      </Toast>
    </div>
  {/snippet}
</Story>

<!-- Alignment Variants -->
<Story name="Alignment Variants">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Centered alignment (default)</p>
        <Toast color="primary" align={true}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
            </svg>
          {/snippet}
          Single line message with centered alignment.
        </Toast>
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Top alignment (align=false)</p>
        <Toast color="blue" align={false}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
            </svg>
          {/snippet}
          <div>
            <p class="font-medium">Multi-line message</p>
            <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">
              This toast has additional details that wrap to multiple lines. Top alignment keeps the icon at the top.
            </p>
          </div>
        </Toast>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Rich Content -->
<Story name="Rich Content">
  {#snippet children(args)}
    <div class="space-y-4">
      <Toast color="gray" align={false}>
        {#snippet icon()}
          <img class="w-8 h-8 rounded-full" src="https://flowbite.com/docs/images/people/profile-picture-1.jpg" alt="User avatar" />
        {/snippet}
        <div>
          <p class="font-medium text-gray-900 dark:text-white">Bonnie Green</p>
          <p class="text-sm text-gray-500 dark:text-gray-400">commented on your photo</p>
          <p class="text-xs text-gray-400 dark:text-gray-500 mt-1">a few seconds ago</p>
        </div>
      </Toast>

      <Toast color="blue" align={false}>
        {#snippet icon()}
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path d="M2 5a2 2 0 012-2h7a2 2 0 012 2v4a2 2 0 01-2 2H9l-3 3v-3H4a2 2 0 01-2-2V5z"></path>
            <path d="M15 7v2a4 4 0 01-4 4H9.828l-1.766 1.767c.28.149.599.233.938.233h2l3 3v-3h2a2 2 0 002-2V9a2 2 0 00-2-2h-1z"></path>
          </svg>
        {/snippet}
        <div>
          <p class="font-medium text-gray-900 dark:text-white">New message received</p>
          <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">
            "Hey, are you available for a quick call today?"
          </p>
          <div class="flex gap-2 mt-2">
            <button class="text-xs text-blue-600 hover:underline dark:text-blue-400">Reply</button>
            <button class="text-xs text-gray-500 hover:underline dark:text-gray-400">Dismiss</button>
          </div>
        </div>
      </Toast>
    </div>
  {/snippet}
</Story>

<!-- With Actions -->
<Story name="With Actions">
  {#snippet children(args)}
    <Toast color="gray" align={false}>
      {#snippet icon()}
        <svg class="w-5 h-5 text-blue-500" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      <div>
        <p class="font-medium text-gray-900 dark:text-white">Update available</p>
        <p class="text-sm text-gray-500 dark:text-gray-400">A new software version is available for download.</p>
        <div class="flex gap-2 mt-3">
          <button class="px-3 py-1.5 text-xs font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700">
            Update now
          </button>
          <button class="px-3 py-1.5 text-xs font-medium text-gray-500 bg-gray-100 rounded-lg hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300 dark:hover:bg-gray-600">
            Later
          </button>
        </div>
      </div>
    </Toast>
  {/snippet}
</Story>

<!-- Toast Container -->
<Story name="Toast Container">
  {#snippet children(args)}
    <div class="relative h-80 bg-gray-100 dark:bg-gray-800 rounded-lg overflow-hidden">
      <p class="p-4 text-sm text-gray-500 dark:text-gray-400">
        ToastContainer provides fixed positioning for multiple toasts
      </p>

      <ToastContainer position="top-right">
        <Toast color="green" dismissable={false}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
            </svg>
          {/snippet}
          File uploaded!
        </Toast>
        <Toast color="blue" dismissable={false}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
            </svg>
          {/snippet}
          Processing...
        </Toast>
      </ToastContainer>
    </div>
  {/snippet}
</Story>

<!-- Container Positions -->
<Story name="Container Positions">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        ToastContainer supports 4 positions: top-left, top-right, bottom-left, bottom-right
      </p>
      <div class="relative h-96 bg-gray-100 dark:bg-gray-800 rounded-lg overflow-hidden">
        <ToastContainer position="top-left">
          <Toast color="blue" dismissable={false}>Top Left</Toast>
        </ToastContainer>

        <ToastContainer position="top-right">
          <Toast color="green" dismissable={false}>Top Right</Toast>
        </ToastContainer>

        <ToastContainer position="bottom-left">
          <Toast color="orange" dismissable={false}>Bottom Left</Toast>
        </ToastContainer>

        <ToastContainer position="bottom-right">
          <Toast color="purple" dismissable={false}>Bottom Right</Toast>
        </ToastContainer>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Notification Stack -->
<Story name="Notification Stack">
  {#snippet children(args)}
    <div class="relative h-96 bg-gray-100 dark:bg-gray-800 rounded-lg overflow-hidden">
      <p class="p-4 text-sm text-gray-500 dark:text-gray-400">
        Multiple toasts stack automatically in a ToastContainer
      </p>

      <ToastContainer position="top-right">
        <Toast color="green" dismissable={false}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
            </svg>
          {/snippet}
          Order confirmed
        </Toast>
        <Toast color="blue" dismissable={false}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M8 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM15 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0z"></path>
              <path d="M3 4a1 1 0 00-1 1v10a1 1 0 001 1h1.05a2.5 2.5 0 014.9 0H10a1 1 0 001-1V5a1 1 0 00-1-1H3zM14 7a1 1 0 00-1 1v6.05A2.5 2.5 0 0115.95 16H17a1 1 0 001-1v-5a1 1 0 00-.293-.707l-2-2A1 1 0 0015 7h-1z"></path>
            </svg>
          {/snippet}
          Shipping update
        </Toast>
        <Toast color="purple" dismissable={false}>
          {#snippet icon()}
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
              <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"></path>
              <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"></path>
            </svg>
          {/snippet}
          New message
        </Toast>
      </ToastContainer>
    </div>
  {/snippet}
</Story>

<!-- Progress Toast -->
<Story name="Progress Toast">
  {#snippet children(args)}
    <Toast color="blue" align={false} dismissable={false}>
      {#snippet icon()}
        <svg class="w-5 h-5 animate-spin" fill="none" viewBox="0 0 24 24">
          <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
          <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
        </svg>
      {/snippet}
      <div class="w-full">
        <p class="font-medium text-gray-900 dark:text-white">Uploading files...</p>
        <div class="w-full bg-gray-200 rounded-full h-2.5 mt-2 dark:bg-gray-700">
          <div class="bg-blue-600 h-2.5 rounded-full" style="width: 45%"></div>
        </div>
        <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">45% complete</p>
      </div>
    </Toast>
  {/snippet}
</Story>

<!-- Undo Action Toast -->
<Story name="Undo Action">
  {#snippet children(args)}
    <Toast color="gray">
      {#snippet icon()}
        <svg class="w-5 h-5 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      <div class="flex items-center gap-3">
        <span>Item deleted</span>
        <button class="text-sm font-medium text-blue-600 hover:underline dark:text-blue-400">
          Undo
        </button>
      </div>
    </Toast>
  {/snippet}
</Story>

<!-- Cookie Notice -->
<Story name="Cookie Notice">
  {#snippet children(args)}
    <Toast color="gray" align={false} dismissable={false} class="max-w-md">
      {#snippet icon()}
        <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm0-2a6 6 0 100-12 6 6 0 000 12zM8 7a1 1 0 100 2 1 1 0 000-2zm4 0a1 1 0 100 2 1 1 0 000-2zm-4 4a1 1 0 100 2 1 1 0 000-2zm4 0a1 1 0 100 2 1 1 0 000-2z" clip-rule="evenodd"></path>
        </svg>
      {/snippet}
      <div>
        <p class="font-medium text-gray-900 dark:text-white">Cookie Settings</p>
        <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">
          We use cookies to enhance your experience. By continuing to visit this site you agree to our use of cookies.
        </p>
        <div class="flex gap-2 mt-3">
          <button class="px-3 py-1.5 text-xs font-medium text-white bg-blue-600 rounded-lg hover:bg-blue-700">
            Accept all
          </button>
          <button class="px-3 py-1.5 text-xs font-medium text-gray-500 bg-gray-100 rounded-lg hover:bg-gray-200 dark:bg-gray-700 dark:text-gray-300">
            Manage
          </button>
        </div>
      </div>
    </Toast>
  {/snippet}
</Story>

<!-- System Notification Types -->
<Story name="System Notifications">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Common notification patterns</p>

      <!-- Success -->
      <Toast color="green">
        {#snippet icon()}
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
          </svg>
        {/snippet}
        <span><span class="font-medium">Success!</span> Profile updated successfully.</span>
      </Toast>

      <!-- Error -->
      <Toast color="red">
        {#snippet icon()}
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
          </svg>
        {/snippet}
        <span><span class="font-medium">Error!</span> Unable to connect to server.</span>
      </Toast>

      <!-- Warning -->
      <Toast color="yellow">
        {#snippet icon()}
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
          </svg>
        {/snippet}
        <span><span class="font-medium">Warning!</span> Your storage is almost full.</span>
      </Toast>

      <!-- Info -->
      <Toast color="blue">
        {#snippet icon()}
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path>
          </svg>
        {/snippet}
        <span><span class="font-medium">Info:</span> New features are available.</span>
      </Toast>
    </div>
  {/snippet}
</Story>

<!-- Interactive Demo -->
<Story name="Interactive Demo">
  {#snippet children(args)}
    {@const toasts = $state([
      { id: 1, color: 'green', message: 'File saved', visible: true },
      { id: 2, color: 'blue', message: 'Syncing data...', visible: true },
      { id: 3, color: 'purple', message: '3 new notifications', visible: true },
    ])}

    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Click the X button to dismiss toasts. The toastStatus prop is bindable for two-way state.
      </p>

      <div class="space-y-3">
        {#each toasts as toast}
          {#if toast.visible}
            <Toast color={toast.color} bind:toastStatus={toast.visible}>
              {#snippet icon()}
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path d="M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z"></path>
                </svg>
              {/snippet}
              {toast.message}
            </Toast>
          {/if}
        {/each}
      </div>
    </div>
  {/snippet}
</Story>
