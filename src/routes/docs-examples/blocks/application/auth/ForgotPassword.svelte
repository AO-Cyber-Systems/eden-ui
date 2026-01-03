<script lang="ts">
  import { Button, Input, Label, Card, Alert } from "flowbite-svelte";
  import { EnvelopeOutline, ArrowLeftOutline, CheckCircleOutline, ExclamationCircleOutline, InformationCircleOutline } from "flowbite-svelte-icons";

  let email = $state("");
  let email2 = $state("");
  let submitted = $state(false);
  let submitted2 = $state(false);
  let error = $state(false);
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Simple Forgot Password -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Simple Request</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Basic password reset request</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <EnvelopeOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Forgot your password?</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            No worries! Enter your email and we'll send you reset instructions.
          </p>
        </div>

        <div>
          <Label for="email-forgot" class="mb-2">Email address</Label>
          <Input type="email" id="email-forgot" placeholder="name@company.com" bind:value={email} required />
        </div>

        <Button type="submit" class="w-full">Send reset link</Button>

        <a href="#" class="flex items-center justify-center gap-2 text-sm font-medium text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
          <ArrowLeftOutline class="h-4 w-4" />
          Back to sign in
        </a>
      </form>
    </Card>
  </div>

  <!-- With Success State -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With Success State</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Shows confirmation after submit</p>
    </div>

    <Card class="max-w-md">
      {#if submitted}
        <div class="space-y-6 text-center">
          <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-green-100 dark:bg-green-900">
            <CheckCircleOutline class="h-8 w-8 text-green-600 dark:text-green-400" />
          </div>

          <div>
            <h5 class="text-xl font-medium text-gray-900 dark:text-white">Check your email</h5>
            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
              We've sent a password reset link to <strong class="text-gray-700 dark:text-gray-300">{email2}</strong>
            </p>
          </div>

          <Alert color="blue">
            {#snippet icon()}
              <InformationCircleOutline class="h-5 w-5" />
            {/snippet}
            Didn't receive the email? Check your spam folder or try again.
          </Alert>

          <div class="space-y-3">
            <Button class="w-full" onclick={() => submitted = false}>Resend email</Button>
            <a href="#" class="flex items-center justify-center gap-2 text-sm font-medium text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
              <ArrowLeftOutline class="h-4 w-4" />
              Back to sign in
            </a>
          </div>
        </div>
      {:else}
        <form class="space-y-6" onsubmit={(e) => { e.preventDefault(); submitted = true; }}>
          <div class="text-center">
            <h5 class="text-xl font-medium text-gray-900 dark:text-white">Reset your password</h5>
            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
              Enter the email address associated with your account
            </p>
          </div>

          <div>
            <Label for="email-success" class="mb-2">Email address</Label>
            <Input type="email" id="email-success" placeholder="name@company.com" bind:value={email2} required>
              {#snippet left()}
                <EnvelopeOutline class="h-5 w-5 text-gray-500" />
              {/snippet}
            </Input>
          </div>

          <Button type="submit" class="w-full">Send reset link</Button>

          <p class="text-center text-sm text-gray-500 dark:text-gray-400">
            Remember your password?
            <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign in</a>
          </p>
        </form>
      {/if}
    </Card>
  </div>

  <!-- With Error Handling -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With Error State</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Shows error message</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <div class="text-center">
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Forgot password</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            We'll email you a link to reset your password
          </p>
        </div>

        {#if error}
          <Alert color="red" dismissable onclose={() => error = false}>
            {#snippet icon()}
              <ExclamationCircleOutline class="h-5 w-5" />
            {/snippet}
            <span class="font-medium">Error!</span> No account found with that email address.
          </Alert>
        {/if}

        <div>
          <Label for="email-error" class="mb-2">Email address</Label>
          <Input
            type="email"
            id="email-error"
            placeholder="name@company.com"
            color={error ? "red" : "base"}
            required
          />
        </div>

        <div class="flex gap-3">
          <Button color="light" class="w-full" href="#">Cancel</Button>
          <Button type="submit" class="w-full" onclick={() => error = true}>Send link</Button>
        </div>
      </form>
    </Card>
  </div>

  <!-- Full Page Layout -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Full Page Layout</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Centered with branding</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-8 dark:bg-gray-800">
      <div class="mx-auto max-w-md">
        <!-- Logo -->
        <div class="mb-8 text-center">
          <div class="mb-4 flex justify-center">
            <div class="flex h-12 w-12 items-center justify-center rounded-lg bg-primary-600 text-white">
              <svg class="h-7 w-7" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
              </svg>
            </div>
          </div>
        </div>

        <div class="rounded-lg bg-white p-8 shadow-sm dark:bg-gray-900">
          {#if submitted2}
            <div class="space-y-6 text-center">
              <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-green-100 dark:bg-green-900">
                <CheckCircleOutline class="h-8 w-8 text-green-600 dark:text-green-400" />
              </div>

              <div>
                <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Email sent!</h2>
                <p class="mt-2 text-gray-500 dark:text-gray-400">
                  Check your inbox for password reset instructions. The link will expire in 24 hours.
                </p>
              </div>

              <div class="space-y-3">
                <Button class="w-full" size="lg" onclick={() => submitted2 = false}>
                  Try different email
                </Button>
                <Button color="light" class="w-full" href="#">
                  Return to login
                </Button>
              </div>
            </div>
          {:else}
            <div class="space-y-6">
              <div class="text-center">
                <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Forgot your password?</h2>
                <p class="mt-2 text-gray-500 dark:text-gray-400">
                  Don't worry, happens to the best of us. Enter your email to receive reset instructions.
                </p>
              </div>

              <form class="space-y-4" onsubmit={(e) => { e.preventDefault(); submitted2 = true; }}>
                <div>
                  <Label for="email-full" class="mb-2">Email</Label>
                  <Input type="email" id="email-full" placeholder="name@company.com" size="lg" required />
                </div>

                <Button type="submit" class="w-full" size="lg">
                  Send reset instructions
                </Button>
              </form>

              <div class="relative">
                <div class="absolute inset-0 flex items-center">
                  <div class="w-full border-t border-gray-300 dark:border-gray-600"></div>
                </div>
                <div class="relative flex justify-center text-sm">
                  <span class="bg-white px-2 text-gray-500 dark:bg-gray-900 dark:text-gray-400">Or</span>
                </div>
              </div>

              <div class="text-center">
                <p class="text-sm text-gray-500 dark:text-gray-400">
                  Remember your password?
                  <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign in</a>
                </p>
              </div>
            </div>
          {/if}
        </div>

        <p class="mt-6 text-center text-sm text-gray-500 dark:text-gray-400">
          Need help? <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Contact support</a>
        </p>
      </div>
    </div>
  </div>
</div>
