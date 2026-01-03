<script lang="ts">
  import { Button, Card, Alert, Spinner } from "flowbite-svelte";
  import { EnvelopeOutline, CheckCircleOutline, ExclamationCircleOutline, ClockOutline, ArrowPathOutline } from "flowbite-svelte-icons";

  let resending = $state(false);
  let resent = $state(false);

  async function handleResend() {
    resending = true;
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1500));
    resending = false;
    resent = true;
  }
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Verification Pending -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Verification Pending</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Waiting for email confirmation</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6 text-center">
        <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
          <EnvelopeOutline class="h-8 w-8 text-primary-600 dark:text-primary-400" />
        </div>

        <div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Verify your email</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            We've sent a verification link to<br />
            <strong class="text-gray-700 dark:text-gray-300">john.doe@email.com</strong>
          </p>
        </div>

        <p class="text-sm text-gray-500 dark:text-gray-400">
          Click the link in the email to verify your account. If you don't see it, check your spam folder.
        </p>

        <div class="space-y-3">
          <Button class="w-full" onclick={handleResend} disabled={resending}>
            {#if resending}
              <Spinner class="me-2 h-4 w-4" />
              Sending...
            {:else}
              Resend verification email
            {/if}
          </Button>
          <Button color="light" class="w-full" href="#">
            Change email address
          </Button>
        </div>

        {#if resent}
          <Alert color="green" dismissable onclose={() => resent = false}>
            <CheckCircleOutline class="me-2 h-4 w-4" />
            A new verification email has been sent!
          </Alert>
        {/if}
      </div>
    </Card>
  </div>

  <!-- Verification Success -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Verification Success</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Email confirmed successfully</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6 text-center">
        <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-green-100 dark:bg-green-900">
          <CheckCircleOutline class="h-8 w-8 text-green-600 dark:text-green-400" />
        </div>

        <div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Email verified!</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Your email has been successfully verified. You can now access all features of your account.
          </p>
        </div>

        <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-700">
          <p class="text-sm text-gray-600 dark:text-gray-300">
            <span class="font-medium">Verified:</span> john.doe@email.com
          </p>
        </div>

        <Button class="w-full" href="#">
          Continue to dashboard
        </Button>
      </div>
    </Card>
  </div>

  <!-- Verification Error -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Verification Error</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Link expired or invalid</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6 text-center">
        <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-red-100 dark:bg-red-900">
          <ExclamationCircleOutline class="h-8 w-8 text-red-600 dark:text-red-400" />
        </div>

        <div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Verification failed</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            The verification link has expired or is invalid. Please request a new verification email.
          </p>
        </div>

        <Alert color="red">
          {#snippet icon()}
            <ClockOutline class="h-5 w-5" />
          {/snippet}
          Verification links expire after 24 hours for security reasons.
        </Alert>

        <div class="space-y-3">
          <Button class="w-full">
            <ArrowPathOutline class="me-2 h-4 w-4" />
            Request new link
          </Button>
          <Button color="light" class="w-full" href="#">
            Contact support
          </Button>
        </div>
      </div>
    </Card>
  </div>

  <!-- Full Page Verification -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Full Page Verification</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Complete verification page layout</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-8 dark:bg-gray-800">
      <div class="mx-auto max-w-lg text-center">
        <!-- Animated Email Icon -->
        <div class="mb-8">
          <div class="mx-auto flex h-20 w-20 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <EnvelopeOutline class="h-10 w-10 text-primary-600 dark:text-primary-400" />
          </div>
        </div>

        <h1 class="text-3xl font-bold text-gray-900 dark:text-white">Check your inbox</h1>
        <p class="mt-4 text-lg text-gray-500 dark:text-gray-400">
          We've sent a verification link to
        </p>
        <p class="mt-1 text-lg font-medium text-gray-900 dark:text-white">
          john.doe@email.com
        </p>

        <div class="mt-8 rounded-lg bg-white p-6 shadow-sm dark:bg-gray-900">
          <h3 class="font-medium text-gray-900 dark:text-white">What happens next?</h3>
          <ol class="mt-4 space-y-4 text-left text-sm">
            <li class="flex items-start gap-3">
              <span class="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary-100 text-xs font-medium text-primary-600 dark:bg-primary-900 dark:text-primary-400">1</span>
              <span class="text-gray-600 dark:text-gray-400">Open the email we sent to your inbox</span>
            </li>
            <li class="flex items-start gap-3">
              <span class="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary-100 text-xs font-medium text-primary-600 dark:bg-primary-900 dark:text-primary-400">2</span>
              <span class="text-gray-600 dark:text-gray-400">Click the "Verify Email" button in the email</span>
            </li>
            <li class="flex items-start gap-3">
              <span class="flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-primary-100 text-xs font-medium text-primary-600 dark:bg-primary-900 dark:text-primary-400">3</span>
              <span class="text-gray-600 dark:text-gray-400">You'll be redirected to complete your setup</span>
            </li>
          </ol>
        </div>

        <div class="mt-8 space-y-4">
          <p class="text-sm text-gray-500 dark:text-gray-400">
            Didn't receive the email? Check your spam folder or
          </p>
          <Button color="light">
            <ArrowPathOutline class="me-2 h-4 w-4" />
            Resend verification email
          </Button>
        </div>

        <div class="mt-8 border-t border-gray-200 pt-6 dark:border-gray-700">
          <p class="text-sm text-gray-500 dark:text-gray-400">
            Wrong email?
            <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Change email address</a>
            or
            <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">contact support</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
