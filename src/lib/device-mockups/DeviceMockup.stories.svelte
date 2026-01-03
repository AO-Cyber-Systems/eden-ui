<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import DeviceMockup from './DeviceMockup.svelte';
  import Android from './Android.svelte';
  import Ios from './Ios.svelte';
  import Laptop from './Laptop.svelte';
  import Desktop from './Desktop.svelte';
  import Tablet from './Tablet.svelte';
  import Smartwatch from './Smartwatch.svelte';

  const { Story } = defineMeta({
    title: 'Components/DeviceMockup',
    component: DeviceMockup,
    tags: ['autodocs'],
    argTypes: {
      device: {
        control: { type: 'select' },
        options: ['default', 'android', 'ios', 'tablet', 'laptop', 'desktop', 'smartwatch'],
        description: 'The type of device to display',
      },
    },
    args: {
      device: 'default',
    },
  });
</script>

<!-- Default DeviceMockup -->
<Story name="Default">
  {#snippet children(args)}
    <DeviceMockup {...args}>
      <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="dark:hidden w-full h-full" alt="mockup" />
      <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-dark.png" class="hidden dark:block w-full h-full" alt="mockup dark" />
    </DeviceMockup>
  {/snippet}
</Story>

<!-- All Device Types -->
<Story name="All Device Types">
  {#snippet children(args)}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">Default</p>
        <DeviceMockup device="default">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="default mockup" />
        </DeviceMockup>
      </div>
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">Android</p>
        <DeviceMockup device="android">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="android mockup" />
        </DeviceMockup>
      </div>
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">iOS</p>
        <DeviceMockup device="ios">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="ios mockup" />
        </DeviceMockup>
      </div>
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">Tablet</p>
        <DeviceMockup device="tablet">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="tablet mockup" />
        </DeviceMockup>
      </div>
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">Laptop</p>
        <DeviceMockup device="laptop">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="laptop mockup" />
        </DeviceMockup>
      </div>
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">Desktop</p>
        <DeviceMockup device="desktop">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="desktop mockup" />
        </DeviceMockup>
      </div>
      <div class="text-center">
        <p class="mb-4 text-sm font-medium text-gray-500 dark:text-gray-400">Smartwatch</p>
        <DeviceMockup device="smartwatch">
          <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="w-full h-full object-cover" alt="smartwatch mockup" />
        </DeviceMockup>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Android Device -->
<Story name="Android">
  {#snippet children(args)}
    <div class="flex justify-center">
      <Android>
        <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-light.png" class="dark:hidden w-full h-full object-cover" alt="android mockup" />
        <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-1-dark.png" class="hidden dark:block w-full h-full object-cover" alt="android mockup dark" />
      </Android>
    </div>
  {/snippet}
</Story>

<!-- iOS Device -->
<Story name="iOS">
  {#snippet children(args)}
    <div class="flex justify-center">
      <Ios>
        <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-2-light.png" class="dark:hidden w-full h-full object-cover" alt="ios mockup" />
        <img src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/hero/mockup-2-dark.png" class="hidden dark:block w-full h-full object-cover" alt="ios mockup dark" />
      </Ios>
    </div>
  {/snippet}
</Story>

<!-- Tablet -->
<Story name="Tablet">
  {#snippet children(args)}
    <div class="flex justify-center">
      <Tablet>
        <img src="https://flowbite.s3.amazonaws.com/docs/device-mockups/tablet-mockup-image.png" class="w-full h-full object-cover" alt="tablet mockup" />
      </Tablet>
    </div>
  {/snippet}
</Story>

<!-- Laptop -->
<Story name="Laptop">
  {#snippet children(args)}
    <div class="flex justify-center">
      <Laptop>
        <img src="https://flowbite.s3.amazonaws.com/docs/device-mockups/laptop-screen.png" class="w-full h-full object-cover rounded-xl" alt="laptop mockup" />
      </Laptop>
    </div>
  {/snippet}
</Story>

<!-- Desktop -->
<Story name="Desktop">
  {#snippet children(args)}
    <div class="flex justify-center">
      <Desktop>
        <img src="https://flowbite.s3.amazonaws.com/docs/device-mockups/screen-image-imac.png" class="w-full h-full object-cover" alt="desktop mockup" />
      </Desktop>
    </div>
  {/snippet}
</Story>

<!-- Smartwatch -->
<Story name="Smartwatch">
  {#snippet children(args)}
    <div class="flex justify-center">
      <Smartwatch>
        <img src="https://flowbite.s3.amazonaws.com/docs/device-mockups/watch-screen-image.png" class="w-full h-full object-cover" alt="smartwatch mockup" />
      </Smartwatch>
    </div>
  {/snippet}
</Story>

<!-- With Custom Content -->
<Story name="With Custom Content">
  {#snippet children(args)}
    <div class="flex justify-center">
      <DeviceMockup device="ios">
        <div class="flex flex-col items-center justify-center h-full bg-gradient-to-b from-blue-500 to-purple-600 text-white p-4">
          <svg class="w-16 h-16 mb-4" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
          </svg>
          <h2 class="text-xl font-bold">Welcome</h2>
          <p class="text-sm opacity-75">Your App Here</p>
        </div>
      </DeviceMockup>
    </div>
  {/snippet}
</Story>

<!-- Side by Side Comparison -->
<Story name="Mobile Comparison">
  {#snippet children(args)}
    <div class="flex flex-wrap justify-center gap-8">
      <div class="text-center">
        <p class="mb-4 font-medium text-gray-700 dark:text-gray-300">Android</p>
        <Android>
          <div class="flex items-center justify-center h-full bg-green-500">
            <span class="text-white text-2xl font-bold">Android</span>
          </div>
        </Android>
      </div>
      <div class="text-center">
        <p class="mb-4 font-medium text-gray-700 dark:text-gray-300">iOS</p>
        <Ios>
          <div class="flex items-center justify-center h-full bg-gray-900">
            <span class="text-white text-2xl font-bold">iOS</span>
          </div>
        </Ios>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Desktop Comparison -->
<Story name="Desktop Comparison">
  {#snippet children(args)}
    <div class="space-y-12">
      <div class="text-center">
        <p class="mb-4 font-medium text-gray-700 dark:text-gray-300">Laptop</p>
        <Laptop>
          <div class="flex items-center justify-center h-full bg-gradient-to-r from-cyan-500 to-blue-500">
            <span class="text-white text-2xl font-bold">Laptop View</span>
          </div>
        </Laptop>
      </div>
      <div class="text-center">
        <p class="mb-4 font-medium text-gray-700 dark:text-gray-300">Desktop</p>
        <Desktop>
          <div class="flex items-center justify-center h-full bg-gradient-to-r from-purple-500 to-pink-500">
            <span class="text-white text-3xl font-bold">Desktop View</span>
          </div>
        </Desktop>
      </div>
    </div>
  {/snippet}
</Story>

