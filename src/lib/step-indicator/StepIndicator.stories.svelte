<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import StepIndicator from './StepIndicator.svelte';

  const { Story } = defineMeta({
    title: 'Components/StepIndicator',
    component: StepIndicator,
    tags: ['autodocs'],
    argTypes: {
      currentStep: {
        control: { type: 'number', min: 1, max: 5 },
        description: 'Current active step (1-indexed)',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'Size of the step indicator bars',
      },
      color: {
        control: { type: 'select' },
        options: ['primary', 'secondary', 'gray', 'red', 'yellow', 'green', 'indigo', 'purple', 'pink', 'blue', 'custom'],
        description: 'Color theme for the indicator',
      },
      glow: {
        control: 'boolean',
        description: 'Enable glow effect on current step',
      },
      hideLabel: {
        control: 'boolean',
        description: 'Hide the current step label text',
      },
      clickable: {
        control: 'boolean',
        description: 'Allow clicking steps to navigate',
      },
    },
    args: {
      currentStep: 2,
      size: 'md',
      color: 'primary',
      glow: false,
      hideLabel: false,
      clickable: true,
    },
  });

  // Default steps
  const defaultSteps = ['Step 1', 'Step 2', 'Step 3', 'Step 4', 'Step 5'];

  // Checkout flow steps
  const checkoutSteps = ['Cart', 'Shipping', 'Payment', 'Review', 'Confirm'];

  // Onboarding steps
  const onboardingSteps = ['Account', 'Profile', 'Preferences', 'Complete'];

  function handleStepClick(event) {
    console.log('Step clicked:', event);
  }
</script>

<!-- Default StepIndicator -->
<Story name="Default">
  {#snippet children(args)}
    <StepIndicator {...args} steps={defaultSteps} onStepClick={handleStepClick} />
  {/snippet}
</Story>

<!-- Different Progress States -->
<Story name="Progress States">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Just started (Step 1 of 5)</p>
        <StepIndicator steps={defaultSteps} currentStep={1} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">In progress (Step 3 of 5)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Almost done (Step 4 of 5)</p>
        <StepIndicator steps={defaultSteps} currentStep={4} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Completed (Step 5 of 5)</p>
        <StepIndicator steps={defaultSteps} currentStep={5} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Extra Small (xs)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} size="xs" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small (sm)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium (md) - Default</p>
        <StepIndicator steps={defaultSteps} currentStep={3} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large (lg)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} size="lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Extra Large (xl)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} size="xl" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Primary</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="primary" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Secondary</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="secondary" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Gray</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="gray" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Red</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="red" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Yellow</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="yellow" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Green</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="green" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Blue</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="blue" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Indigo</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="indigo" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Purple</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="purple" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Pink</p>
        <StepIndicator steps={defaultSteps} currentStep={3} color="pink" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Glow Effect -->
<Story name="With Glow Effect">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Primary with glow</p>
        <StepIndicator steps={defaultSteps} currentStep={3} glow color="primary" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Blue with glow</p>
        <StepIndicator steps={defaultSteps} currentStep={3} glow color="blue" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Green with glow</p>
        <StepIndicator steps={defaultSteps} currentStep={3} glow color="green" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Purple with glow (Large)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} glow color="purple" size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Hidden Label -->
<Story name="Hidden Label">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">With label (default)</p>
        <StepIndicator steps={checkoutSteps} currentStep={2} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Label hidden</p>
        <StepIndicator steps={checkoutSteps} currentStep={2} hideLabel />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Non-Clickable -->
<Story name="Non-Clickable">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Clickable (hover over steps to see pointer cursor)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} clickable />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Non-clickable (static display only)</p>
        <StepIndicator steps={defaultSteps} currentStep={3} clickable={false} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Custom Colors -->
<Story name="Custom Colors">
  {#snippet children(args)}
    <div class="space-y-8">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Use the 'custom' color with completedCustom and currentCustom props for custom styling.
      </p>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Custom gradient colors</p>
        <StepIndicator
          steps={defaultSteps}
          currentStep={3}
          color="custom"
          completedCustom="bg-gradient-to-r from-teal-400 to-cyan-500"
          currentCustom="bg-gradient-to-r from-orange-400 to-pink-500"
        />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Custom solid colors</p>
        <StepIndicator
          steps={defaultSteps}
          currentStep={3}
          color="custom"
          completedCustom="bg-emerald-500"
          currentCustom="bg-amber-500"
        />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Checkout Flow Example -->
<Story name="Checkout Flow">
  {#snippet children(args)}
    <div class="max-w-lg p-6 border rounded-lg dark:border-gray-700">
      <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-4">Checkout Progress</h3>
      <StepIndicator
        steps={checkoutSteps}
        currentStep={3}
        color="green"
        size="lg"
        onStepClick={handleStepClick}
      />
      <div class="mt-6 p-4 bg-gray-50 dark:bg-gray-800 rounded-lg">
        <h4 class="font-medium text-gray-900 dark:text-white mb-2">Payment Information</h4>
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Enter your payment details to complete your order.
        </p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Onboarding Example -->
<Story name="Onboarding Flow">
  {#snippet children(args)}
    <div class="max-w-lg p-6 border rounded-lg dark:border-gray-700">
      <h3 class="text-xl font-semibold text-gray-900 dark:text-white mb-4">Complete Your Profile</h3>
      <StepIndicator
        steps={onboardingSteps}
        currentStep={2}
        color="blue"
        glow
        size="lg"
        onStepClick={handleStepClick}
      />
      <div class="mt-6">
        <p class="text-sm text-gray-500 dark:text-gray-400">
          Tell us a bit about yourself so we can personalize your experience.
        </p>
        <div class="mt-4 space-y-4">
          <div>
            <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Display Name</label>
            <input type="text" class="w-full px-3 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-600" placeholder="John Doe" />
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Bio</label>
            <textarea class="w-full px-3 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-600" rows="3" placeholder="Tell us about yourself..."></textarea>
          </div>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Comparison All Sizes -->
<Story name="All Sizes Comparison">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        Side-by-side comparison of all size variants at the same progress level.
      </p>
      <div class="grid grid-cols-1 gap-4">
        {#each ['xs', 'sm', 'md', 'lg', 'xl'] as size}
          <div class="flex items-center gap-4">
            <span class="w-8 text-xs font-mono text-gray-500 dark:text-gray-400">{size}</span>
            <div class="flex-1">
              <StepIndicator steps={defaultSteps} currentStep={3} {size} hideLabel />
            </div>
          </div>
        {/each}
      </div>
    </div>
  {/snippet}
</Story>

<!-- Minimal Steps -->
<Story name="Minimal Steps">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Two steps only</p>
        <StepIndicator steps={['Start', 'Finish']} currentStep={1} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Three steps</p>
        <StepIndicator steps={['Start', 'Middle', 'End']} currentStep={2} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Many Steps -->
<Story name="Many Steps">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Eight steps</p>
        <StepIndicator
          steps={['Step 1', 'Step 2', 'Step 3', 'Step 4', 'Step 5', 'Step 6', 'Step 7', 'Step 8']}
          currentStep={5}
          size="sm"
        />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Ten steps with glow</p>
        <StepIndicator
          steps={['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']}
          currentStep={7}
          size="sm"
          glow
          color="purple"
        />
      </div>
    </div>
  {/snippet}
</Story>
