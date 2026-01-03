<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Tour from './Tour.svelte';

  const { Story } = defineMeta({
    title: 'Components/Tour',
    component: Tour,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'Size of the tour tooltip',
      },
      color: {
        control: { type: 'select' },
        options: ['primary', 'blue', 'purple', 'green', 'red'],
        description: 'Color theme for highlight and buttons',
      },
      showOverlay: {
        control: 'boolean',
        description: 'Show dark overlay behind the tour',
      },
      scrollBehavior: {
        control: { type: 'select' },
        options: ['smooth', 'instant', 'auto'],
        description: 'Scroll behavior when focusing elements',
      },
      tooltipOffset: {
        control: { type: 'number', min: 0, max: 50 },
        description: 'Offset distance from target element',
      },
    },
    args: {
      size: 'md',
      color: 'blue',
      showOverlay: true,
      scrollBehavior: 'smooth',
      tooltipOffset: 12,
    },
  });

  // Sample tour steps for demo
  const basicSteps = [
    {
      target: '#tour-demo-header',
      title: 'Welcome!',
      description: 'This is the header section. Click Next to continue the tour.',
      placement: 'bottom',
    },
    {
      target: '#tour-demo-content',
      title: 'Main Content',
      description: 'Here you will find the main content area of the application.',
      placement: 'right',
    },
    {
      target: '#tour-demo-button',
      title: 'Action Button',
      description: 'Click this button to perform an action. This concludes our tour!',
      placement: 'top',
    },
  ];

  const featureTourSteps = [
    {
      target: '#feature-search',
      title: 'Search Feature',
      description: 'Use the search box to find items quickly. Just type and results appear instantly.',
      placement: 'bottom',
    },
    {
      target: '#feature-filters',
      title: 'Filters',
      description: 'Apply filters to narrow down your results by category, date, or status.',
      placement: 'bottom',
    },
    {
      target: '#feature-export',
      title: 'Export Data',
      description: 'Export your filtered data to CSV or PDF format for offline access.',
      placement: 'left',
    },
    {
      target: '#feature-settings',
      title: 'Settings',
      description: 'Customize your preferences and notification settings here.',
      placement: 'left',
    },
  ];

  function handleComplete() {
    console.log('Tour completed!');
  }

  function handleSkip() {
    console.log('Tour skipped');
  }
</script>

<!-- Default Tour -->
<Story name="Default">
  {#snippet children(args)}
    {@const active = $state(false)}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        Click the button to start the tour. Use keyboard arrows to navigate or click the overlay to close.
      </p>

      <button
        onclick={() => active = true}
        class="px-4 py-2 mb-8 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
      >
        Start Tour
      </button>

      <div class="space-y-6">
        <div id="tour-demo-header" class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white">Header Section</h2>
          <p class="text-gray-600 dark:text-gray-400">This is the header of your application.</p>
        </div>

        <div id="tour-demo-content" class="p-6 bg-white dark:bg-gray-900 border rounded-lg dark:border-gray-700">
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Content Area</h3>
          <p class="text-gray-600 dark:text-gray-400">
            This is where your main content would appear. It could contain text, images,
            forms, or any other elements.
          </p>
        </div>

        <div class="flex justify-end">
          <button id="tour-demo-button" class="px-4 py-2 text-white bg-green-600 rounded-lg hover:bg-green-700">
            Action Button
          </button>
        </div>
      </div>

      <Tour
        {...args}
        steps={basicSteps}
        bind:active={active}
        oncomplete={handleComplete}
        onskip={handleSkip}
      />
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    {@const smallActive = $state(false)}
    {@const mediumActive = $state(false)}
    {@const largeActive = $state(false)}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        Tour tooltips come in three sizes: small, medium (default), and large.
      </p>

      <div class="flex gap-4 mb-8">
        <button onclick={() => smallActive = true} class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700">
          Small Tour
        </button>
        <button onclick={() => mediumActive = true} class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700">
          Medium Tour
        </button>
        <button onclick={() => largeActive = true} class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700">
          Large Tour
        </button>
      </div>

      <div id="size-demo-target" class="p-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Target Element</h3>
        <p class="text-gray-600 dark:text-gray-400">The tour will highlight this element.</p>
      </div>

      <Tour
        size="sm"
        steps={[{ target: '#size-demo-target', title: 'Small Size', description: 'This is a small tooltip with compact text and buttons.', placement: 'right' }]}
        bind:active={smallActive}
      />
      <Tour
        size="md"
        steps={[{ target: '#size-demo-target', title: 'Medium Size', description: 'This is the default medium size tooltip with balanced proportions.', placement: 'right' }]}
        bind:active={mediumActive}
      />
      <Tour
        size="lg"
        steps={[{ target: '#size-demo-target', title: 'Large Size', description: 'This is a large tooltip that provides more space for detailed descriptions and longer content.', placement: 'right' }]}
        bind:active={largeActive}
      />
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    {@const blueActive = $state(false)}
    {@const purpleActive = $state(false)}
    {@const greenActive = $state(false)}
    {@const redActive = $state(false)}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        Different colors for the highlight border and primary buttons.
      </p>

      <div class="flex flex-wrap gap-4 mb-8">
        <button onclick={() => blueActive = true} class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700">
          Blue Theme
        </button>
        <button onclick={() => purpleActive = true} class="px-4 py-2 text-white bg-purple-600 rounded-lg hover:bg-purple-700">
          Purple Theme
        </button>
        <button onclick={() => greenActive = true} class="px-4 py-2 text-white bg-green-600 rounded-lg hover:bg-green-700">
          Green Theme
        </button>
        <button onclick={() => redActive = true} class="px-4 py-2 text-white bg-red-600 rounded-lg hover:bg-red-700">
          Red Theme
        </button>
      </div>

      <div id="color-demo-target" class="p-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Colorful Target</h3>
        <p class="text-gray-600 dark:text-gray-400">Watch the highlight color change with each theme.</p>
      </div>

      <Tour
        color="blue"
        steps={[{ target: '#color-demo-target', title: 'Blue Theme', description: 'The classic blue theme with matching highlight and buttons.', placement: 'bottom' }]}
        bind:active={blueActive}
      />
      <Tour
        color="purple"
        steps={[{ target: '#color-demo-target', title: 'Purple Theme', description: 'A vibrant purple theme for a modern look.', placement: 'bottom' }]}
        bind:active={purpleActive}
      />
      <Tour
        color="green"
        steps={[{ target: '#color-demo-target', title: 'Green Theme', description: 'A fresh green theme perfect for success states.', placement: 'bottom' }]}
        bind:active={greenActive}
      />
      <Tour
        color="red"
        steps={[{ target: '#color-demo-target', title: 'Red Theme', description: 'A bold red theme for important highlights.', placement: 'bottom' }]}
        bind:active={redActive}
      />
    </div>
  {/snippet}
</Story>

<!-- Placement Options -->
<Story name="Placement Options">
  {#snippet children(args)}
    {@const topActive = $state(false)}
    {@const bottomActive = $state(false)}
    {@const leftActive = $state(false)}
    {@const rightActive = $state(false)}

    <div class="min-h-[500px] p-6 flex items-center justify-center">
      <div class="space-y-4 text-center">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Tooltips can be placed on any side of the target element.
        </p>

        <div class="grid grid-cols-2 gap-4 max-w-xs mx-auto mb-8">
          <button onclick={() => topActive = true} class="px-4 py-2 text-sm text-white bg-gray-600 rounded-lg hover:bg-gray-700">
            Top
          </button>
          <button onclick={() => bottomActive = true} class="px-4 py-2 text-sm text-white bg-gray-600 rounded-lg hover:bg-gray-700">
            Bottom
          </button>
          <button onclick={() => leftActive = true} class="px-4 py-2 text-sm text-white bg-gray-600 rounded-lg hover:bg-gray-700">
            Left
          </button>
          <button onclick={() => rightActive = true} class="px-4 py-2 text-sm text-white bg-gray-600 rounded-lg hover:bg-gray-700">
            Right
          </button>
        </div>

        <div id="placement-target" class="inline-block p-8 bg-blue-100 dark:bg-blue-900 rounded-lg">
          <span class="text-blue-800 dark:text-blue-200 font-medium">Target Element</span>
        </div>
      </div>

      <Tour
        steps={[{ target: '#placement-target', title: 'Top Placement', description: 'The tooltip appears above the target.', placement: 'top' }]}
        bind:active={topActive}
      />
      <Tour
        steps={[{ target: '#placement-target', title: 'Bottom Placement', description: 'The tooltip appears below the target.', placement: 'bottom' }]}
        bind:active={bottomActive}
      />
      <Tour
        steps={[{ target: '#placement-target', title: 'Left Placement', description: 'The tooltip appears to the left of the target.', placement: 'left' }]}
        bind:active={leftActive}
      />
      <Tour
        steps={[{ target: '#placement-target', title: 'Right Placement', description: 'The tooltip appears to the right of the target.', placement: 'right' }]}
        bind:active={rightActive}
      />
    </div>
  {/snippet}
</Story>

<!-- Without Overlay -->
<Story name="Without Overlay">
  {#snippet children(args)}
    {@const active = $state(false)}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        Tour without the dark overlay - useful for inline guidance.
      </p>

      <button
        onclick={() => active = true}
        class="px-4 py-2 mb-8 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
      >
        Start Tour (No Overlay)
      </button>

      <div id="no-overlay-target" class="p-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Highlighted Element</h3>
        <p class="text-gray-600 dark:text-gray-400">
          Notice how you can still interact with other elements when the overlay is disabled.
        </p>
      </div>

      <Tour
        showOverlay={false}
        steps={[{ target: '#no-overlay-target', title: 'No Overlay Mode', description: 'The page remains fully interactive while the tour is active.', placement: 'right' }]}
        bind:active={active}
      />
    </div>
  {/snippet}
</Story>

<!-- Feature Tour Example -->
<Story name="Feature Tour">
  {#snippet children(args)}
    {@const active = $state(false)}

    <div class="min-h-[500px] p-6">
      <div class="flex items-center justify-between mb-6">
        <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Dashboard</h2>
        <button
          onclick={() => active = true}
          class="px-4 py-2 text-blue-600 border border-blue-600 rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900/20"
        >
          Take a Tour
        </button>
      </div>

      <div class="flex flex-wrap gap-4 mb-6">
        <div id="feature-search" class="flex-1 min-w-48">
          <input
            type="text"
            placeholder="Search..."
            class="w-full px-4 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-700"
          />
        </div>
        <div id="feature-filters" class="flex gap-2">
          <select class="px-4 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-700">
            <option>All Categories</option>
            <option>Category A</option>
            <option>Category B</option>
          </select>
          <select class="px-4 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-700">
            <option>All Status</option>
            <option>Active</option>
            <option>Inactive</option>
          </select>
        </div>
      </div>

      <div class="flex justify-end gap-2 mb-6">
        <button id="feature-export" class="px-4 py-2 text-gray-700 dark:text-gray-200 border rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800">
          Export
        </button>
        <button id="feature-settings" class="px-4 py-2 text-gray-700 dark:text-gray-200 border rounded-lg hover:bg-gray-50 dark:hover:bg-gray-800">
          Settings
        </button>
      </div>

      <div class="p-8 bg-gray-50 dark:bg-gray-800 rounded-lg text-center">
        <p class="text-gray-500 dark:text-gray-400">Dashboard content goes here</p>
      </div>

      <Tour
        {...args}
        steps={featureTourSteps}
        bind:active={active}
        oncomplete={handleComplete}
        onskip={handleSkip}
        color="purple"
      />
    </div>
  {/snippet}
</Story>

<!-- Onboarding Flow -->
<Story name="Onboarding Flow">
  {#snippet children(args)}
    {@const active = $state(false)}
    {@const currentStep = $state(0)}

    {@const onboardingSteps = [
      {
        target: '#onboard-profile',
        title: 'Step 1: Complete Your Profile',
        description: 'Start by adding your name and profile picture. This helps others identify you in the workspace.',
        placement: 'right',
      },
      {
        target: '#onboard-workspace',
        title: 'Step 2: Join a Workspace',
        description: 'Join an existing workspace or create a new one to start collaborating with your team.',
        placement: 'right',
      },
      {
        target: '#onboard-invite',
        title: 'Step 3: Invite Team Members',
        description: 'Invite your colleagues to join your workspace. They will receive an email invitation.',
        placement: 'left',
      },
      {
        target: '#onboard-start',
        title: 'You are All Set!',
        description: 'Click this button to create your first project and start working with your team.',
        placement: 'top',
      },
    ]}

    <div class="min-h-[500px] p-6">
      <div class="max-w-2xl mx-auto">
        <div class="text-center mb-8">
          <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-2">Welcome to Our App!</h1>
          <p class="text-gray-600 dark:text-gray-400">Let us show you around.</p>
          <button
            onclick={() => { active = true; currentStep = 0; }}
            class="mt-4 px-6 py-3 text-white bg-green-600 rounded-lg hover:bg-green-700"
          >
            Start Onboarding Tour
          </button>
        </div>

        <div class="space-y-4">
          <div id="onboard-profile" class="flex items-center gap-4 p-4 bg-white dark:bg-gray-800 rounded-lg border dark:border-gray-700">
            <div class="w-12 h-12 bg-gray-200 dark:bg-gray-700 rounded-full flex items-center justify-center">
              <svg class="w-6 h-6 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Complete Your Profile</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Add your name and photo</p>
            </div>
          </div>

          <div id="onboard-workspace" class="flex items-center gap-4 p-4 bg-white dark:bg-gray-800 rounded-lg border dark:border-gray-700">
            <div class="w-12 h-12 bg-gray-200 dark:bg-gray-700 rounded-full flex items-center justify-center">
              <svg class="w-6 h-6 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h8a2 2 0 012 2v12a1 1 0 110 2h-3a1 1 0 01-1-1v-2a1 1 0 00-1-1H9a1 1 0 00-1 1v2a1 1 0 01-1 1H4a1 1 0 110-2V4zm3 1h2v2H7V5zm2 4H7v2h2V9zm2-4h2v2h-2V5zm2 4h-2v2h2V9z" clip-rule="evenodd"></path>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Join a Workspace</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Connect with your team</p>
            </div>
          </div>

          <div id="onboard-invite" class="flex items-center gap-4 p-4 bg-white dark:bg-gray-800 rounded-lg border dark:border-gray-700">
            <div class="w-12 h-12 bg-gray-200 dark:bg-gray-700 rounded-full flex items-center justify-center">
              <svg class="w-6 h-6 text-gray-500" fill="currentColor" viewBox="0 0 20 20">
                <path d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z"></path>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Invite Team Members</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Send invitations to colleagues</p>
            </div>
          </div>

          <div class="pt-4">
            <button id="onboard-start" class="w-full px-6 py-3 text-white bg-blue-600 rounded-lg hover:bg-blue-700">
              Create Your First Project
            </button>
          </div>
        </div>
      </div>

      <Tour
        steps={onboardingSteps}
        bind:active={active}
        bind:currentStep={currentStep}
        color="green"
        size="md"
        oncomplete={() => alert('Onboarding complete! You are ready to go.')}
      />
    </div>
  {/snippet}
</Story>

<!-- Multi-Step Progress -->
<Story name="Multi-Step Progress">
  {#snippet children(args)}
    {@const active = $state(false)}
    {@const currentStep = $state(0)}

    {@const steps = [
      { target: '#step1', title: 'Step 1 of 5', description: 'This is the first step. Notice the progress dots below.', placement: 'bottom' },
      { target: '#step2', title: 'Step 2 of 5', description: 'You can click the dots to jump to any step.', placement: 'bottom' },
      { target: '#step3', title: 'Step 3 of 5', description: 'Use keyboard arrows to navigate: Right/Down for next, Left/Up for previous.', placement: 'bottom' },
      { target: '#step4', title: 'Step 4 of 5', description: 'Press Escape to skip the tour at any time.', placement: 'bottom' },
      { target: '#step5', title: 'Final Step', description: 'Congratulations! You have completed all steps.', placement: 'bottom' },
    ]}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        Multi-step tour with progress indicators. Current step: {currentStep + 1} / {steps.length}
      </p>

      <button
        onclick={() => { active = true; currentStep = 0; }}
        class="px-4 py-2 mb-8 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
      >
        Start 5-Step Tour
      </button>

      <div class="grid grid-cols-5 gap-4">
        {#each [1, 2, 3, 4, 5] as num}
          <div id="step{num}" class="p-6 text-center bg-gray-100 dark:bg-gray-800 rounded-lg">
            <span class="text-2xl font-bold text-gray-400">{num}</span>
          </div>
        {/each}
      </div>

      <Tour
        {steps}
        bind:active={active}
        bind:currentStep={currentStep}
        color="purple"
      />
    </div>
  {/snippet}
</Story>

<!-- Keyboard Navigation -->
<Story name="Keyboard Navigation">
  {#snippet children(args)}
    {@const active = $state(false)}

    <div class="min-h-96 p-6">
      <div class="mb-6 p-4 bg-blue-50 dark:bg-blue-900/20 rounded-lg">
        <h3 class="font-medium text-blue-900 dark:text-blue-200 mb-2">Keyboard Controls:</h3>
        <ul class="text-sm text-blue-800 dark:text-blue-300 space-y-1">
          <li><kbd class="px-2 py-1 bg-blue-200 dark:bg-blue-800 rounded">Right Arrow</kbd> / <kbd class="px-2 py-1 bg-blue-200 dark:bg-blue-800 rounded">Down Arrow</kbd> - Next step</li>
          <li><kbd class="px-2 py-1 bg-blue-200 dark:bg-blue-800 rounded">Left Arrow</kbd> / <kbd class="px-2 py-1 bg-blue-200 dark:bg-blue-800 rounded">Up Arrow</kbd> - Previous step</li>
          <li><kbd class="px-2 py-1 bg-blue-200 dark:bg-blue-800 rounded">Escape</kbd> - Skip tour</li>
        </ul>
      </div>

      <button
        onclick={() => active = true}
        class="px-4 py-2 mb-8 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
      >
        Start Tour (Try Keyboard Navigation)
      </button>

      <div class="space-y-4">
        <div id="kbd-target-1" class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <p class="font-medium text-gray-900 dark:text-white">First Target</p>
        </div>
        <div id="kbd-target-2" class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <p class="font-medium text-gray-900 dark:text-white">Second Target</p>
        </div>
        <div id="kbd-target-3" class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <p class="font-medium text-gray-900 dark:text-white">Third Target</p>
        </div>
      </div>

      <Tour
        steps={[
          { target: '#kbd-target-1', title: 'First Step', description: 'Press the right arrow key to go to the next step.', placement: 'right' },
          { target: '#kbd-target-2', title: 'Second Step', description: 'Press the left arrow key to go back, or right to continue.', placement: 'right' },
          { target: '#kbd-target-3', title: 'Third Step', description: 'Press Escape to close, or click Finish to complete.', placement: 'right' },
        ]}
        bind:active={active}
      />
    </div>
  {/snippet}
</Story>

<!-- Single Step (Spotlight) -->
<Story name="Single Step Spotlight">
  {#snippet children(args)}
    {@const active = $state(false)}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        A single-step tour works as a spotlight/focus mode for specific elements.
      </p>

      <button
        onclick={() => active = true}
        class="px-4 py-2 mb-8 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
      >
        Spotlight Important Element
      </button>

      <div class="grid grid-cols-3 gap-4">
        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg opacity-50">
          <p class="text-gray-500">Regular Element</p>
        </div>
        <div id="spotlight-target" class="p-4 bg-yellow-100 dark:bg-yellow-900/30 border-2 border-yellow-500 rounded-lg">
          <p class="font-medium text-yellow-800 dark:text-yellow-200">Important Element!</p>
          <p class="text-sm text-yellow-700 dark:text-yellow-300">This needs attention</p>
        </div>
        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg opacity-50">
          <p class="text-gray-500">Regular Element</p>
        </div>
      </div>

      <Tour
        steps={[{
          target: '#spotlight-target',
          title: 'Important Notice',
          description: 'This element requires your attention. Click Finish to acknowledge.',
          placement: 'bottom'
        }]}
        bind:active={active}
        color="red"
        size="lg"
      />
    </div>
  {/snippet}
</Story>

<!-- Callbacks Demo -->
<Story name="Callbacks">
  {#snippet children(args)}
    {@const active = $state(false)}
    {@const logs = $state([])}

    {@const addLog = (message) => {
      logs.push(`${new Date().toLocaleTimeString()}: ${message}`);
    }}

    <div class="min-h-96 p-6">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        Tour provides callbacks for completion and skip events.
      </p>

      <button
        onclick={() => { active = true; logs.length = 0; addLog('Tour started'); }}
        class="px-4 py-2 mb-8 text-white bg-blue-600 rounded-lg hover:bg-blue-700"
      >
        Start Tour
      </button>

      <div class="grid grid-cols-2 gap-6">
        <div>
          <div id="callback-target" class="p-6 bg-gray-100 dark:bg-gray-800 rounded-lg">
            <h3 class="font-medium text-gray-900 dark:text-white">Target Element</h3>
            <p class="text-sm text-gray-600 dark:text-gray-400">Complete or skip the tour to see callbacks fire.</p>
          </div>
        </div>

        <div class="p-4 bg-gray-900 dark:bg-black rounded-lg font-mono text-sm">
          <p class="text-gray-400 mb-2">Event Log:</p>
          {#if logs.length === 0}
            <p class="text-gray-600">No events yet...</p>
          {:else}
            {#each logs as log}
              <p class="text-green-400">{log}</p>
            {/each}
          {/if}
        </div>
      </div>

      <Tour
        steps={[
          { target: '#callback-target', title: 'Try the Callbacks', description: 'Click Skip or Finish to trigger the respective callback.', placement: 'right' }
        ]}
        bind:active={active}
        oncomplete={() => addLog('oncomplete() fired - Tour completed!')}
        onskip={() => addLog('onskip() fired - Tour skipped')}
      />
    </div>
  {/snippet}
</Story>
