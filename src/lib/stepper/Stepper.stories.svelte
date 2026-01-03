<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Stepper from './Stepper.svelte';
  import ProgressStepper from './ProgressStepper.svelte';
  import DetailedStepper from './DetailedStepper.svelte';
  import VerticalStepper from './VerticalStepper.svelte';
  import BreadcrumbStepper from './BreadcrumbStepper.svelte';
  import TimelineStepper from './TimelineStepper.svelte';

  const { Story } = defineMeta({
    title: 'Components/Stepper',
    component: Stepper,
    tags: ['autodocs'],
    argTypes: {
      current: {
        control: { type: 'number', min: 0, max: 5 },
        description: 'Current active step (1-indexed, 0 = all pending)',
      },
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'Size of the stepper',
      },
      clickable: {
        control: 'boolean',
        description: 'Allow clicking steps to navigate',
      },
      showCheckmarkForCompleted: {
        control: 'boolean',
        description: 'Show checkmark icon for completed steps',
      },
    },
    args: {
      current: 2,
      size: 'md',
      clickable: true,
      showCheckmarkForCompleted: true,
    },
  });

  // Basic steps for default stepper
  const basicSteps = [
    { id: 1, label: 'Account Info' },
    { id: 2, label: 'Personal Details' },
    { id: 3, label: 'Review' },
  ];

  // Steps with descriptions
  const detailedSteps = [
    { id: 1, label: 'Account Info', description: 'Enter your email and password' },
    { id: 2, label: 'Personal Details', description: 'Add your name and contact info' },
    { id: 3, label: 'Preferences', description: 'Customize your experience' },
    { id: 4, label: 'Review', description: 'Verify your information' },
  ];

  // Checkout flow steps
  const checkoutSteps = [
    { id: 1, label: 'Cart' },
    { id: 2, label: 'Shipping' },
    { id: 3, label: 'Payment' },
    { id: 4, label: 'Confirm' },
  ];

  // Timeline steps
  const timelineSteps = [
    { id: 1, label: 'Application Submitted', description: 'Your application has been received' },
    { id: 2, label: 'Under Review', description: 'Our team is reviewing your application' },
    { id: 3, label: 'Interview Scheduled', description: 'Schedule your interview slot' },
    { id: 4, label: 'Decision', description: 'Final decision will be made' },
  ];

  function handleStepClick(event) {
    console.log('Step clicked:', event);
  }
</script>

<!-- Default Stepper -->
<Story name="Default">
  {#snippet children(args)}
    <Stepper {...args} steps={basicSteps} onStepClick={handleStepClick} />
  {/snippet}
</Story>

<!-- Progress States -->
<Story name="Progress States">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Not started (current=0)</p>
        <Stepper steps={basicSteps} current={0} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Step 1 active</p>
        <Stepper steps={basicSteps} current={1} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Step 2 active (Step 1 completed)</p>
        <Stepper steps={basicSteps} current={2} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">All completed</p>
        <Stepper steps={basicSteps} current={3} />
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
        <Stepper steps={basicSteps} current={2} size="xs" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Small (sm)</p>
        <Stepper steps={basicSteps} current={2} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Medium (md) - Default</p>
        <Stepper steps={basicSteps} current={2} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Large (lg)</p>
        <Stepper steps={basicSteps} current={2} size="lg" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Extra Large (xl)</p>
        <Stepper steps={basicSteps} current={2} size="xl" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Without Checkmarks -->
<Story name="Without Checkmarks">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">With checkmarks (default)</p>
        <Stepper steps={basicSteps} current={3} showCheckmarkForCompleted={true} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Without checkmarks (shows step numbers)</p>
        <Stepper steps={basicSteps} current={3} showCheckmarkForCompleted={false} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Non-Clickable -->
<Story name="Non-Clickable">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Clickable (hover to see pointer)</p>
        <Stepper steps={basicSteps} current={2} clickable />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-2">Non-clickable (display only)</p>
        <Stepper steps={basicSteps} current={2} clickable={false} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Progress Stepper -->
<Story name="Progress Stepper">
  {#snippet children(args)}
    <div class="space-y-8">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Circular progress stepper with animated connecting lines.
      </p>
      <ProgressStepper steps={checkoutSteps} current={2} onStepClick={handleStepClick} />
    </div>
  {/snippet}
</Story>

<!-- Progress Stepper Sizes -->
<Story name="Progress Stepper Sizes">
  {#snippet children(args)}
    <div class="space-y-12">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Small</p>
        <ProgressStepper steps={checkoutSteps} current={2} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Medium (default)</p>
        <ProgressStepper steps={checkoutSteps} current={2} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Large</p>
        <ProgressStepper steps={checkoutSteps} current={2} size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Progress Stepper States -->
<Story name="Progress Stepper States">
  {#snippet children(args)}
    <div class="space-y-12">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Not started</p>
        <ProgressStepper steps={checkoutSteps} current={0} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">First step active</p>
        <ProgressStepper steps={checkoutSteps} current={1} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Mid progress</p>
        <ProgressStepper steps={checkoutSteps} current={3} />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">All completed</p>
        <ProgressStepper steps={checkoutSteps} current={4} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Detailed Stepper -->
<Story name="Detailed Stepper">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Stepper with titles and descriptions for each step.
      </p>
      <DetailedStepper steps={detailedSteps} current={2} onStepClick={handleStepClick} />
    </div>
  {/snippet}
</Story>

<!-- Detailed Stepper Sizes -->
<Story name="Detailed Stepper Sizes">
  {#snippet children(args)}
    <div class="space-y-10">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Small</p>
        <DetailedStepper steps={detailedSteps} current={2} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Medium (default)</p>
        <DetailedStepper steps={detailedSteps} current={2} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Large</p>
        <DetailedStepper steps={detailedSteps} current={2} size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Vertical Stepper -->
<Story name="Vertical Stepper">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Vertical card-based stepper with status indicators.
      </p>
      <VerticalStepper steps={detailedSteps} current={2} onStepClick={handleStepClick} />
    </div>
  {/snippet}
</Story>

<!-- Vertical Stepper Sizes -->
<Story name="Vertical Stepper Sizes">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Small</p>
        <VerticalStepper steps={detailedSteps} current={2} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Medium (default)</p>
        <VerticalStepper steps={detailedSteps} current={2} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Large</p>
        <VerticalStepper steps={detailedSteps} current={2} size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Breadcrumb Stepper -->
<Story name="Breadcrumb Stepper">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Breadcrumb-style navigation with double arrow separators.
      </p>
      <BreadcrumbStepper steps={checkoutSteps} current={2} onStepClick={handleStepClick} />
    </div>
  {/snippet}
</Story>

<!-- Breadcrumb Stepper Sizes -->
<Story name="Breadcrumb Stepper Sizes">
  {#snippet children(args)}
    <div class="space-y-6">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Small</p>
        <BreadcrumbStepper steps={checkoutSteps} current={2} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Medium (default)</p>
        <BreadcrumbStepper steps={checkoutSteps} current={2} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Large</p>
        <BreadcrumbStepper steps={checkoutSteps} current={2} size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Timeline Stepper -->
<Story name="Timeline Stepper">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Vertical timeline layout with status indicators.
      </p>
      <TimelineStepper steps={timelineSteps} current={2} onStepClick={handleStepClick} />
    </div>
  {/snippet}
</Story>

<!-- Timeline Stepper Sizes -->
<Story name="Timeline Stepper Sizes">
  {#snippet children(args)}
    <div class="flex flex-wrap gap-12">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Small</p>
        <TimelineStepper steps={timelineSteps} current={2} size="sm" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Medium (default)</p>
        <TimelineStepper steps={timelineSteps} current={2} size="md" />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Large</p>
        <TimelineStepper steps={timelineSteps} current={2} size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- All Stepper Variants -->
<Story name="All Variants Comparison">
  {#snippet children(args)}
    <div class="space-y-12">
      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Basic Stepper</h3>
        <Stepper steps={checkoutSteps} current={2} />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Progress Stepper</h3>
        <ProgressStepper steps={checkoutSteps} current={2} />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Detailed Stepper</h3>
        <DetailedStepper steps={detailedSteps} current={2} />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Vertical Stepper</h3>
        <VerticalStepper steps={detailedSteps} current={2} />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Breadcrumb Stepper</h3>
        <BreadcrumbStepper steps={checkoutSteps} current={2} />
      </div>

      <div>
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Timeline Stepper</h3>
        <TimelineStepper steps={timelineSteps} current={2} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Checkout Flow Example -->
<Story name="Checkout Flow Example">
  {#snippet children(args)}
    <div class="max-w-2xl p-6 border rounded-lg dark:border-gray-700">
      <h2 class="text-xl font-semibold text-gray-900 dark:text-white mb-6">Complete Your Order</h2>

      <ProgressStepper steps={checkoutSteps} current={3} size="lg" />

      <div class="mt-8 p-6 bg-gray-50 dark:bg-gray-800 rounded-lg">
        <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Payment Method</h3>
        <div class="space-y-4">
          <div class="flex items-center p-4 border rounded-lg dark:border-gray-600">
            <input type="radio" name="payment" class="mr-3" checked />
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Credit Card</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Visa, Mastercard, Amex</p>
            </div>
          </div>
          <div class="flex items-center p-4 border rounded-lg dark:border-gray-600">
            <input type="radio" name="payment" class="mr-3" />
            <div>
              <p class="font-medium text-gray-900 dark:text-white">PayPal</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Fast and secure checkout</p>
            </div>
          </div>
        </div>
      </div>

      <div class="mt-6 flex justify-between">
        <button class="px-4 py-2 text-gray-500 hover:text-gray-700 dark:text-gray-400">Back</button>
        <button class="px-6 py-2 bg-primary-600 text-white rounded-lg hover:bg-primary-700">Continue to Review</button>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Onboarding Flow Example -->
<Story name="Onboarding Flow Example">
  {#snippet children(args)}
    <div class="max-w-xl p-6 border rounded-lg dark:border-gray-700">
      <DetailedStepper
        steps={[
          { id: 1, label: 'Welcome', description: 'Get started' },
          { id: 2, label: 'Profile', description: 'Tell us about yourself' },
          { id: 3, label: 'Team', description: 'Invite your team' },
          { id: 4, label: 'Done', description: 'Ready to go!' },
        ]}
        current={2}
        size="sm"
      />

      <div class="mt-8 text-center">
        <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-2">Set Up Your Profile</h2>
        <p class="text-gray-500 dark:text-gray-400 mb-6">Help us personalize your experience</p>

        <div class="space-y-4 text-left">
          <div>
            <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Full Name</label>
            <input type="text" class="w-full px-4 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-600" placeholder="John Doe" />
          </div>
          <div>
            <label class="block text-sm font-medium text-gray-900 dark:text-white mb-1">Job Title</label>
            <input type="text" class="w-full px-4 py-2 border rounded-lg dark:bg-gray-800 dark:border-gray-600" placeholder="Software Engineer" />
          </div>
        </div>

        <div class="mt-6">
          <button class="w-full px-6 py-3 bg-primary-600 text-white rounded-lg hover:bg-primary-700">
            Continue
          </button>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Application Status Example -->
<Story name="Application Status Example">
  {#snippet children(args)}
    <div class="max-w-md p-6 border rounded-lg dark:border-gray-700">
      <h2 class="text-xl font-semibold text-gray-900 dark:text-white mb-6">Application Status</h2>

      <TimelineStepper
        steps={[
          { id: 1, label: 'Application Received', description: 'March 15, 2024' },
          { id: 2, label: 'Initial Review', description: 'March 17, 2024' },
          { id: 3, label: 'Technical Interview', description: 'Scheduled for March 22' },
          { id: 4, label: 'Final Decision', description: 'Pending' },
        ]}
        current={3}
        clickable={false}
      />

      <div class="mt-8 p-4 bg-blue-50 dark:bg-blue-900/20 rounded-lg">
        <h4 class="font-medium text-blue-900 dark:text-blue-300 mb-2">Next Step</h4>
        <p class="text-sm text-blue-700 dark:text-blue-400">
          Your technical interview is scheduled for March 22, 2024 at 2:00 PM EST.
        </p>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Many Steps -->
<Story name="Many Steps">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">7-step wizard with Progress Stepper</p>
        <ProgressStepper
          steps={[
            { id: 1, label: 'Start' },
            { id: 2, label: 'Info' },
            { id: 3, label: 'Details' },
            { id: 4, label: 'Options' },
            { id: 5, label: 'Upload' },
            { id: 6, label: 'Review' },
            { id: 7, label: 'Submit' },
          ]}
          current={4}
          size="sm"
        />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Minimal Steps -->
<Story name="Minimal Steps">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Two-step process</p>
        <ProgressStepper
          steps={[
            { id: 1, label: 'Setup' },
            { id: 2, label: 'Confirm' },
          ]}
          current={1}
        />
      </div>
      <div>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">Three-step process</p>
        <BreadcrumbStepper
          steps={[
            { id: 1, label: 'Start' },
            { id: 2, label: 'Process' },
            { id: 3, label: 'Finish' },
          ]}
          current={2}
        />
      </div>
    </div>
  {/snippet}
</Story>
