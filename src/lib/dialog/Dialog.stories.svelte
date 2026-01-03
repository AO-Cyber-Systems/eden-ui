<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Dialog from './Dialog.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Dialog',
    component: Dialog,
    tags: ['autodocs'],
    argTypes: {
      modal: {
        control: 'boolean',
        description: 'Whether the dialog is modal (has backdrop)',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the dialog has a close button',
      },
      permanent: {
        control: 'boolean',
        description: 'Whether the dialog cannot be closed',
      },
      outsideclose: {
        control: 'boolean',
        description: 'Whether clicking outside closes the dialog',
      },
      autoclose: {
        control: 'boolean',
        description: 'Whether clicking any button closes the dialog',
      },
    },
    args: {
      modal: true,
      dismissable: true,
      permanent: false,
      outsideclose: true,
      autoclose: false,
    },
  });

  let open = $state(false);
  let confirmOpen = $state(false);
  let formOpen = $state(false);
  let permanentOpen = $state(false);
</script>

<!-- Default Dialog -->
<Story name="Default">
  {#snippet children(args)}
    <Button onclick={() => open = true}>Open Dialog</Button>
    <Dialog {...args} bind:open class="p-6 max-w-md">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
        Dialog Title
      </h3>
      <p class="text-gray-600 dark:text-gray-400 mb-6">
        This is a simple dialog with some content. You can put any content here including forms, images, or other components.
      </p>
      <div class="flex justify-end gap-2">
        <Button color="alternative" onclick={() => open = false}>Cancel</Button>
        <Button color="primary" onclick={() => open = false}>Confirm</Button>
      </div>
    </Dialog>
  {/snippet}
</Story>

<!-- Confirmation Dialog -->
<Story name="Confirmation">
  {#snippet children(args)}
    <Button color="red" onclick={() => confirmOpen = true}>Delete Item</Button>
    <Dialog bind:open={confirmOpen} class="p-6 max-w-sm">
      <div class="text-center">
        <svg class="mx-auto mb-4 text-gray-400 w-12 h-12 dark:text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
        </svg>
        <h3 class="mb-5 text-lg font-normal text-gray-500 dark:text-gray-400">
          Are you sure you want to delete this item?
        </h3>
        <div class="flex justify-center gap-2">
          <Button color="red" onclick={() => confirmOpen = false}>Yes, delete</Button>
          <Button color="alternative" onclick={() => confirmOpen = false}>No, cancel</Button>
        </div>
      </div>
    </Dialog>
  {/snippet}
</Story>

<!-- Form Dialog -->
<Story name="With Form">
  {#snippet children(args)}
    <Button onclick={() => formOpen = true}>Open Form Dialog</Button>
    <Dialog bind:open={formOpen} form class="p-6 max-w-md">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
        Sign In
      </h3>
      <div class="space-y-4">
        <div>
          <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Email</label>
          <input type="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:text-white" placeholder="name@company.com" />
        </div>
        <div>
          <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Password</label>
          <input type="password" id="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:text-white" />
        </div>
      </div>
      <div class="flex justify-end gap-2 mt-6">
        <Button type="submit" formnovalidate color="alternative">Cancel</Button>
        <Button type="submit" value="login" color="primary">Sign In</Button>
      </div>
    </Dialog>
  {/snippet}
</Story>

<!-- Permanent Dialog -->
<Story name="Permanent (No Close)" args={{ permanent: true, dismissable: false }}>
  {#snippet children(args)}
    <Button onclick={() => permanentOpen = true}>Open Permanent Dialog</Button>
    <Dialog {...args} bind:open={permanentOpen} class="p-6 max-w-sm">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
        Required Action
      </h3>
      <p class="text-gray-600 dark:text-gray-400 mb-6">
        This dialog requires you to take an action before it can be closed.
      </p>
      <Button color="primary" class="w-full" onclick={() => permanentOpen = false}>
        Accept and Continue
      </Button>
    </Dialog>
  {/snippet}
</Story>

<!-- Auto-close Dialog -->
<Story name="Auto-close on Button Click" args={{ autoclose: true }}>
  {#snippet children(args)}
    <script>
      let autoOpen = $state(false);
    </script>
    <Button onclick={() => autoOpen = true}>Open Auto-close Dialog</Button>
    <Dialog {...args} bind:open={autoOpen} class="p-6 max-w-md">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
        Auto-close Dialog
      </h3>
      <p class="text-gray-600 dark:text-gray-400 mb-6">
        Clicking any button in this dialog will automatically close it.
      </p>
      <div class="flex justify-end gap-2">
        <Button color="alternative">Option A</Button>
        <Button color="primary">Option B</Button>
      </div>
    </Dialog>
  {/snippet}
</Story>

<!-- Large Content Dialog -->
<Story name="Scrollable Content">
  {#snippet children(args)}
    <script>
      let scrollOpen = $state(false);
    </script>
    <Button onclick={() => scrollOpen = true}>Open Scrollable Dialog</Button>
    <Dialog bind:open={scrollOpen} class="p-6 max-w-lg max-h-[80vh] overflow-y-auto">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">
        Terms of Service
      </h3>
      <div class="text-gray-600 dark:text-gray-400 space-y-4">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
        <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.</p>
        <p>Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.</p>
      </div>
      <div class="flex justify-end gap-2 mt-6 sticky bottom-0 bg-white dark:bg-gray-900 pt-4">
        <Button color="alternative" onclick={() => scrollOpen = false}>Decline</Button>
        <Button color="primary" onclick={() => scrollOpen = false}>Accept</Button>
      </div>
    </Dialog>
  {/snippet}
</Story>
