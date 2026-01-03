<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import OtpInput from './OtpInput.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';
  import Button from '$lib/buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Forms/OtpInput',
    component: OtpInput,
    tags: ['autodocs'],
    argTypes: {
      length: {
        control: { type: 'number', min: 4, max: 8 },
        description: 'Number of input fields',
      },
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the inputs',
      },
      color: {
        control: { type: 'select' },
        options: ['default', 'green', 'red'],
        description: 'The color/state of the inputs',
      },
      inputType: {
        control: { type: 'select' },
        options: ['text', 'numeric'],
        description: 'The type of input allowed',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the input is disabled',
      },
    },
    args: {
      length: 6,
      size: 'md',
      color: 'default',
      inputType: 'text',
      disabled: false,
    },
  });

  let otpValue = $state('');
  let verificationComplete = $state(false);

  function handleComplete(value) {
    console.log('OTP Complete:', value);
    verificationComplete = true;
  }
</script>

<!-- Default OtpInput -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Enter verification code</Label>
      <OtpInput {...args} bind:value={otpValue} />
      <Helper>
        {otpValue ? `Entered: ${otpValue}` : 'Enter the 6-digit code sent to your phone'}
      </Helper>
    </div>
  {/snippet}
</Story>

<!-- Length Variants -->
<Story name="Length Variants">
  {#snippet children(args)}
    <div class="space-y-6 max-w-md">
      <div>
        <Label class="mb-2">4-digit PIN</Label>
        <OtpInput length={4} inputType="numeric" />
      </div>
      <div>
        <Label class="mb-2">6-digit OTP (default)</Label>
        <OtpInput length={6} />
      </div>
      <div>
        <Label class="mb-2">8-digit code</Label>
        <OtpInput length={8} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-6 max-w-md">
      <div>
        <Label class="mb-2">Small</Label>
        <OtpInput size="sm" length={6} />
      </div>
      <div>
        <Label class="mb-2">Medium (default)</Label>
        <OtpInput size="md" length={6} />
      </div>
      <div>
        <Label class="mb-2">Large</Label>
        <OtpInput size="lg" length={6} />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color/State Variants -->
<Story name="State Variants">
  {#snippet children(args)}
    <div class="space-y-6 max-w-md">
      <div>
        <Label class="mb-2">Default</Label>
        <OtpInput color="default" length={6} />
      </div>
      <div>
        <Label class="mb-2" color="green">Success</Label>
        <OtpInput color="green" length={6} value="123456" />
        <Helper color="green">Verification successful!</Helper>
      </div>
      <div>
        <Label class="mb-2" color="red">Error</Label>
        <OtpInput color="red" length={6} />
        <Helper color="red">Invalid code, please try again</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Numeric Only -->
<Story name="Numeric Only">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Enter PIN</Label>
      <OtpInput inputType="numeric" length={4} />
      <Helper>Only numbers are allowed</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Separator -->
<Story name="With Separator">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Enter code</Label>
      <OtpInput length={6} separator="-" separatorPosition={3} />
      <Helper>Format: XXX-XXX</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Placeholder -->
<Story name="With Placeholder">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Enter verification code</Label>
      <OtpInput length={6} placeholder="0" />
    </div>
  {/snippet}
</Story>

<!-- Disabled -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Disabled OTP input</Label>
      <OtpInput disabled length={6} value="123456" />
    </div>
  {/snippet}
</Story>

<!-- Verification Form Example -->
<Story name="Verification Form">
  {#snippet children(args)}
    <div class="max-w-md p-6 border rounded-lg dark:border-gray-700 text-center">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-2">Verify your phone</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
        We sent a 6-digit code to +1 (555) ***-**89
      </p>
      <OtpInput
        length={6}
        inputType="numeric"
        onComplete={handleComplete}
      />
      <div class="mt-6 space-y-3">
        <Button class="w-full">Verify</Button>
        <button type="button" class="text-sm text-blue-600 hover:underline dark:text-blue-400">
          Didn't receive a code? Resend
        </button>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Two-Factor Auth Example -->
<Story name="Two-Factor Authentication">
  {#snippet children(args)}
    <div class="max-w-md p-6 border rounded-lg dark:border-gray-700">
      <div class="flex items-center gap-3 mb-4">
        <div class="p-2 bg-blue-100 rounded-lg dark:bg-blue-900">
          <svg class="w-6 h-6 text-blue-600 dark:text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
          </svg>
        </div>
        <div>
          <h3 class="text-lg font-medium text-gray-900 dark:text-white">Two-Factor Authentication</h3>
          <p class="text-sm text-gray-500 dark:text-gray-400">Enter code from your authenticator app</p>
        </div>
      </div>
      <OtpInput length={6} inputType="numeric" size="lg" />
      <div class="mt-4">
        <Button class="w-full">Authenticate</Button>
      </div>
    </div>
  {/snippet}
</Story>

