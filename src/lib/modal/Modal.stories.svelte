<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Modal from './Modal.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/Modal',
    component: Modal,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl', '2xl', '3xl', '4xl', '5xl', '6xl', '7xl'],
        description: 'The size of the modal',
      },
      placement: {
        control: { type: 'select' },
        options: ['top-left', 'top-center', 'top-right', 'center-left', 'center', 'center-right', 'bottom-left', 'bottom-center', 'bottom-right'],
        description: 'The placement of the modal',
      },
      dismissable: {
        control: 'boolean',
        description: 'Whether the modal can be dismissed by clicking outside',
      },
      permanent: {
        control: 'boolean',
        description: 'Whether the modal is permanent (cannot be closed)',
      },
      fullscreen: {
        control: 'boolean',
        description: 'Whether the modal is fullscreen',
      },
    },
    args: {
      size: 'md',
      dismissable: true,
      permanent: false,
      fullscreen: false,
    },
  });

  let defaultOpen = $state(false);
  let titleOpen = $state(false);
  let headerOpen = $state(false);
  let footerOpen = $state(false);
  let sizeOpen = $state(false);
  let formOpen = $state(false);
  let permanentOpen = $state(false);
  let fullscreenOpen = $state(false);
</script>

<!-- Default Modal -->
<Story name="Default">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (defaultOpen = true)}>Open Modal</Button>
    <Modal {...args} bind:open={defaultOpen} title="Terms of Service">
      <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
        With less than a month to go before the European Union enacts new consumer privacy laws for its citizens, companies around the world are updating their terms of service agreements to comply.
      </p>
      <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
        The European Union's General Data Protection Regulation (G.D.P.R.) goes into effect on May 25 and is meant to ensure a common set of data rights in the European Union. It requires organizations to notify users as soon as possible of high-risk data breaches that could personally affect them.
      </p>
    </Modal>
  {/snippet}
</Story>

<!-- With Title -->
<Story name="With Title">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (titleOpen = true)}>Modal with Title</Button>
    <Modal bind:open={titleOpen} title="Privacy Policy">
      <p class="text-gray-500 dark:text-gray-400">
        We value your privacy. This modal demonstrates the title prop which automatically adds a header with a close button.
      </p>
    </Modal>
  {/snippet}
</Story>

<!-- With Custom Header -->
<Story name="With Custom Header">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (headerOpen = true)}>Custom Header</Button>
    <Modal bind:open={headerOpen}>
      {#snippet header()}
        <div class="flex items-center gap-2">
          <svg class="w-6 h-6 text-blue-600" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"/>
          </svg>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Information</h3>
        </div>
      {/snippet}
      <p class="text-gray-500 dark:text-gray-400">
        This modal uses a custom header snippet for complete control over the header content.
      </p>
    </Modal>
  {/snippet}
</Story>

<!-- With Footer -->
<Story name="With Footer">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (footerOpen = true)}>Modal with Footer</Button>
    <Modal bind:open={footerOpen} title="Confirm Action">
      <p class="text-gray-500 dark:text-gray-400">
        Are you sure you want to proceed with this action? This cannot be undone.
      </p>
      {#snippet footer()}
        <div class="flex justify-end gap-2">
          <Button color="alternative" onclick={() => (footerOpen = false)}>Cancel</Button>
          <Button color="primary" onclick={() => (footerOpen = false)}>Confirm</Button>
        </div>
      {/snippet}
    </Modal>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (sizeOpen = true)}>Large Modal</Button>
    <Modal bind:open={sizeOpen} title="Large Modal" size="xl">
      <p class="text-gray-500 dark:text-gray-400">
        This is a larger modal using the size="xl" prop. Modals support sizes from xs to 7xl.
      </p>
      <p class="text-gray-500 dark:text-gray-400 mt-4">
        Available sizes: xs, sm, md (default), lg, xl, 2xl, 3xl, 4xl, 5xl, 6xl, 7xl
      </p>
    </Modal>
  {/snippet}
</Story>

<!-- Form Modal -->
<Story name="Form Modal">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (formOpen = true)}>Sign In Modal</Button>
    <Modal bind:open={formOpen} title="Sign in to our platform" size="sm">
      <form class="space-y-4">
        <div>
          <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your email</label>
          <input type="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" placeholder="name@company.com" required />
        </div>
        <div>
          <label for="password" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Your password</label>
          <input type="password" id="password" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-600 dark:border-gray-500 dark:placeholder-gray-400 dark:text-white" required />
        </div>
        <div class="flex items-center justify-between">
          <div class="flex items-center">
            <input id="remember" type="checkbox" class="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-600 dark:border-gray-500 dark:focus:ring-blue-600" />
            <label for="remember" class="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300">Remember me</label>
          </div>
          <a href="#" class="text-sm text-blue-700 hover:underline dark:text-blue-500">Forgot Password?</a>
        </div>
        <Button type="submit" color="primary" class="w-full">Login to your account</Button>
        <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
          Not registered? <a href="#" class="text-blue-700 hover:underline dark:text-blue-500">Create account</a>
        </div>
      </form>
    </Modal>
  {/snippet}
</Story>

<!-- Permanent Modal -->
<Story name="Permanent Modal">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (permanentOpen = true)}>Permanent Modal</Button>
    <Modal bind:open={permanentOpen} title="Important Notice" permanent>
      <p class="text-gray-500 dark:text-gray-400">
        This modal cannot be closed by clicking outside or pressing Escape. You must use the button below.
      </p>
      {#snippet footer()}
        <Button color="primary" onclick={() => (permanentOpen = false)}>I Understand</Button>
      {/snippet}
    </Modal>
  {/snippet}
</Story>

<!-- Fullscreen Modal -->
<Story name="Fullscreen">
  {#snippet children(args)}
    <Button color="primary" onclick={() => (fullscreenOpen = true)}>Fullscreen Modal</Button>
    <Modal bind:open={fullscreenOpen} title="Fullscreen Modal" fullscreen>
      <div class="h-full flex items-center justify-center">
        <div class="text-center">
          <p class="text-xl text-gray-500 dark:text-gray-400">
            This modal takes up the entire screen.
          </p>
          <Button color="alternative" class="mt-4" onclick={() => (fullscreenOpen = false)}>Close</Button>
        </div>
      </div>
    </Modal>
  {/snippet}
</Story>
