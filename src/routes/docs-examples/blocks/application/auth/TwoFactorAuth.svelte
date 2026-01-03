<script lang="ts">
  import { Button, Input, Label, Card, Alert, Helper } from "flowbite-svelte";
  import { DevicePhoneMobileOutline, ShieldCheckOutline, KeyOutline, ArrowPathOutline, ExclamationCircleOutline, CheckCircleOutline, ClipboardDocumentOutline } from "flowbite-svelte-icons";

  // OTP Input State
  let otpDigits = $state(["", "", "", "", "", ""]);
  let error = $state(false);
  let verifying = $state(false);

  function handleOtpInput(index: number, event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;

    // Only allow single digit
    if (value.length > 1) {
      otpDigits[index] = value.slice(-1);
    } else {
      otpDigits[index] = value;
    }

    // Auto-focus next input
    if (value && index < 5) {
      const nextInput = document.getElementById(`otp-${index + 1}`);
      nextInput?.focus();
    }
  }

  function handleOtpKeyDown(index: number, event: KeyboardEvent) {
    // Handle backspace to go to previous input
    if (event.key === "Backspace" && !otpDigits[index] && index > 0) {
      const prevInput = document.getElementById(`otp-${index - 1}`);
      prevInput?.focus();
    }
  }

  const otpComplete = $derived(otpDigits.every(d => d !== ""));

  // Backup codes
  const backupCodes = [
    "ABCD-1234-EFGH",
    "IJKL-5678-MNOP",
    "QRST-9012-UVWX",
    "YZAB-3456-CDEF",
    "GHIJ-7890-KLMN",
    "OPQR-1234-STUV"
  ];

  let copiedCode = $state("");

  function copyCode(code: string) {
    navigator.clipboard.writeText(code);
    copiedCode = code;
    setTimeout(() => copiedCode = "", 2000);
  }

  function copyAllCodes() {
    navigator.clipboard.writeText(backupCodes.join("\n"));
    copiedCode = "all";
    setTimeout(() => copiedCode = "", 2000);
  }
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- OTP Input -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">OTP Verification</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">6-digit code input</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <DevicePhoneMobileOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Two-factor authentication</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Enter the 6-digit code from your authenticator app
          </p>
        </div>

        <!-- OTP Inputs -->
        <div class="flex justify-center gap-2">
          {#each otpDigits as digit, i}
            <input
              id="otp-{i}"
              type="text"
              inputmode="numeric"
              maxlength="1"
              value={digit}
              oninput={(e) => handleOtpInput(i, e)}
              onkeydown={(e) => handleOtpKeyDown(i, e)}
              class="h-12 w-12 rounded-lg border border-gray-300 bg-gray-50 text-center text-xl font-semibold text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white dark:focus:border-primary-500 {error ? 'border-red-500 focus:border-red-500 focus:ring-red-500' : ''}"
            />
          {/each}
        </div>

        {#if error}
          <Alert color="red" class="text-center">
            <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
            Invalid code. Please try again.
          </Alert>
        {/if}

        <Button class="w-full" disabled={!otpComplete || verifying}>
          {#if verifying}
            Verifying...
          {:else}
            Verify code
          {/if}
        </Button>

        <div class="text-center">
          <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
            Use backup code instead
          </a>
        </div>
      </div>
    </Card>
  </div>

  <!-- SMS Verification -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">SMS Verification</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Code sent via text message</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-green-100 dark:bg-green-900">
            <DevicePhoneMobileOutline class="h-6 w-6 text-green-600 dark:text-green-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Verify your phone</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            We sent a verification code to<br />
            <strong class="text-gray-700 dark:text-gray-300">+1 (555) ***-1234</strong>
          </p>
        </div>

        <div>
          <Label for="sms-code" class="mb-2">Verification code</Label>
          <Input type="text" id="sms-code" placeholder="Enter 6-digit code" maxlength="6" class="text-center text-lg tracking-widest" />
        </div>

        <Button class="w-full">Verify code</Button>

        <div class="flex items-center justify-center gap-2 text-sm text-gray-500 dark:text-gray-400">
          <span>Didn't receive the code?</span>
          <button class="font-medium text-primary-600 hover:underline dark:text-primary-500">
            Resend
          </button>
        </div>

        <div class="border-t border-gray-200 pt-4 dark:border-gray-700">
          <button class="flex w-full items-center justify-center gap-2 text-sm text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300">
            <DevicePhoneMobileOutline class="h-4 w-4" />
            Try a different phone number
          </button>
        </div>
      </div>
    </Card>
  </div>

  <!-- Backup Codes -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Backup Codes</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Recovery codes list</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-yellow-100 dark:bg-yellow-900">
            <KeyOutline class="h-6 w-6 text-yellow-600 dark:text-yellow-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Backup codes</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Save these codes in a secure place. Each code can only be used once.
          </p>
        </div>

        <div class="grid grid-cols-2 gap-2">
          {#each backupCodes as code}
            <button
              class="flex items-center justify-between rounded-lg border border-gray-200 bg-gray-50 px-3 py-2 font-mono text-sm hover:bg-gray-100 dark:border-gray-700 dark:bg-gray-800 dark:hover:bg-gray-700"
              onclick={() => copyCode(code)}
            >
              <span class="text-gray-700 dark:text-gray-300">{code}</span>
              {#if copiedCode === code}
                <CheckCircleOutline class="h-4 w-4 text-green-500" />
              {:else}
                <ClipboardDocumentOutline class="h-4 w-4 text-gray-400" />
              {/if}
            </button>
          {/each}
        </div>

        <Button color="light" class="w-full" onclick={copyAllCodes}>
          <ClipboardDocumentOutline class="me-2 h-4 w-4" />
          {copiedCode === "all" ? "Copied!" : "Copy all codes"}
        </Button>

        <Alert color="yellow">
          <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
          <span class="font-medium">Warning:</span> These codes will not be shown again.
        </Alert>

        <Button class="w-full">I've saved my codes</Button>
      </div>
    </Card>
  </div>

  <!-- Full 2FA Setup -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">2FA Setup Page</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Complete setup flow with QR code</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-8 dark:bg-gray-800">
      <div class="mx-auto max-w-xl">
        <div class="mb-8 text-center">
          <div class="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <ShieldCheckOutline class="h-8 w-8 text-primary-600 dark:text-primary-400" />
          </div>
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Set up two-factor authentication</h2>
          <p class="mt-2 text-gray-500 dark:text-gray-400">
            Add an extra layer of security to your account
          </p>
        </div>

        <div class="grid gap-6 md:grid-cols-2">
          <!-- QR Code Section -->
          <div class="rounded-lg bg-white p-6 shadow-sm dark:bg-gray-900">
            <h3 class="mb-4 font-medium text-gray-900 dark:text-white">1. Scan QR code</h3>
            <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
              Use your authenticator app (Google Authenticator, Authy, etc.) to scan this QR code
            </p>

            <!-- Placeholder QR Code -->
            <div class="mx-auto mb-4 flex h-48 w-48 items-center justify-center rounded-lg border-2 border-dashed border-gray-300 bg-gray-50 dark:border-gray-600 dark:bg-gray-800">
              <div class="text-center text-gray-400">
                <svg class="mx-auto h-16 w-16" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M3 3h6v6H3V3zm2 2v2h2V5H5zm8-2h6v6h-6V3zm2 2v2h2V5h-2zM3 13h6v6H3v-6zm2 2v2h2v-2H5zm13-2h1v1h-1v-1zm-3 0h1v1h-1v-1zm2 1h1v1h-1v-1zm-2 2h1v1h-1v-1zm2 0h1v1h-1v-1zm2 0h1v1h-1v-1zm-2 2h1v1h-1v-1zm2 0h1v1h-1v-1z"/>
                </svg>
                <p class="mt-2 text-sm">QR Code</p>
              </div>
            </div>

            <div class="text-center">
              <button class="text-sm text-primary-600 hover:underline dark:text-primary-500">
                Can't scan? Enter code manually
              </button>
            </div>
          </div>

          <!-- Verify Section -->
          <div class="rounded-lg bg-white p-6 shadow-sm dark:bg-gray-900">
            <h3 class="mb-4 font-medium text-gray-900 dark:text-white">2. Enter verification code</h3>
            <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
              Enter the 6-digit code from your authenticator app
            </p>

            <div class="flex justify-center gap-2">
              {#each [0, 1, 2, 3, 4, 5] as i}
                <input
                  type="text"
                  inputmode="numeric"
                  maxlength="1"
                  class="h-10 w-10 rounded-lg border border-gray-300 bg-gray-50 text-center text-lg font-semibold text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                />
              {/each}
            </div>

            <Button class="mt-6 w-full">
              Verify and activate
            </Button>

            <div class="mt-4 rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
              <h4 class="text-sm font-medium text-gray-900 dark:text-white">Manual entry key:</h4>
              <code class="mt-1 block break-all text-xs text-gray-600 dark:text-gray-400">
                JBSWY3DPEHPK3PXP
              </code>
            </div>
          </div>
        </div>

        <div class="mt-6 flex justify-between">
          <Button color="light">Cancel</Button>
          <Button disabled>Complete setup</Button>
        </div>
      </div>
    </div>
  </div>
</div>
