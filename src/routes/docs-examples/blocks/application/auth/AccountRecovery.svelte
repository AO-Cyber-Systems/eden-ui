<script lang="ts">
  import { Button, Input, Label, Card, Alert, Radio, Helper } from "flowbite-svelte";
  import { EnvelopeOutline, DevicePhoneMobileOutline, QuestionMarkCircleOutline, ShieldCheckOutline, KeyOutline, CheckCircleOutline, ArrowLeftOutline } from "flowbite-svelte-icons";

  let recoveryMethod = $state("email");
  let step = $state(1);
  let securityAnswer = $state("");
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Recovery Method Selection -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recovery Options</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Choose how to recover account</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <ShieldCheckOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Recover your account</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Choose a recovery method to verify your identity
          </p>
        </div>

        <div class="space-y-3">
          <label class="flex cursor-pointer items-start gap-3 rounded-lg border p-4 {recoveryMethod === 'email' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-700'}">
            <input type="radio" name="recovery" value="email" bind:group={recoveryMethod} class="mt-1" />
            <div class="flex-1">
              <div class="flex items-center gap-2">
                <EnvelopeOutline class="h-5 w-5 text-gray-500" />
                <span class="font-medium text-gray-900 dark:text-white">Email recovery</span>
              </div>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                Send a recovery link to j***@email.com
              </p>
            </div>
          </label>

          <label class="flex cursor-pointer items-start gap-3 rounded-lg border p-4 {recoveryMethod === 'phone' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-700'}">
            <input type="radio" name="recovery" value="phone" bind:group={recoveryMethod} class="mt-1" />
            <div class="flex-1">
              <div class="flex items-center gap-2">
                <DevicePhoneMobileOutline class="h-5 w-5 text-gray-500" />
                <span class="font-medium text-gray-900 dark:text-white">SMS recovery</span>
              </div>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                Send a code to +1 (***) ***-1234
              </p>
            </div>
          </label>

          <label class="flex cursor-pointer items-start gap-3 rounded-lg border p-4 {recoveryMethod === 'security' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-700'}">
            <input type="radio" name="recovery" value="security" bind:group={recoveryMethod} class="mt-1" />
            <div class="flex-1">
              <div class="flex items-center gap-2">
                <QuestionMarkCircleOutline class="h-5 w-5 text-gray-500" />
                <span class="font-medium text-gray-900 dark:text-white">Security questions</span>
              </div>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                Answer your security questions
              </p>
            </div>
          </label>

          <label class="flex cursor-pointer items-start gap-3 rounded-lg border p-4 {recoveryMethod === 'backup' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-700'}">
            <input type="radio" name="recovery" value="backup" bind:group={recoveryMethod} class="mt-1" />
            <div class="flex-1">
              <div class="flex items-center gap-2">
                <KeyOutline class="h-5 w-5 text-gray-500" />
                <span class="font-medium text-gray-900 dark:text-white">Backup code</span>
              </div>
              <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                Use one of your backup recovery codes
              </p>
            </div>
          </label>
        </div>

        <Button class="w-full">Continue</Button>

        <a href="#" class="flex items-center justify-center gap-2 text-sm text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
          <ArrowLeftOutline class="h-4 w-4" />
          Back to sign in
        </a>
      </div>
    </Card>
  </div>

  <!-- Security Questions -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Security Questions</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Answer to verify identity</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6">
        <div class="text-center">
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Security verification</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Answer your security question to continue
          </p>
        </div>

        <!-- Progress -->
        <div class="flex items-center gap-2">
          <div class="h-2 flex-1 rounded-full bg-primary-500"></div>
          <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700"></div>
          <div class="h-2 flex-1 rounded-full bg-gray-200 dark:bg-gray-700"></div>
        </div>
        <p class="text-center text-sm text-gray-500">Question 1 of 3</p>

        <form class="space-y-4">
          <div>
            <Label class="mb-2">What was the name of your first pet?</Label>
            <Input type="text" placeholder="Enter your answer" bind:value={securityAnswer} />
            <Helper class="mt-2">Answers are case-insensitive</Helper>
          </div>

          <div class="flex gap-3">
            <Button color="light" class="w-full" href="#">Skip</Button>
            <Button type="submit" class="w-full">Next</Button>
          </div>
        </form>

        <Alert color="blue">
          <QuestionMarkCircleOutline class="me-2 inline h-4 w-4" />
          <span class="font-medium">Tip:</span> Answer exactly as you did when setting up your account.
        </Alert>
      </div>
    </Card>
  </div>

  <!-- Backup Code Entry -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Backup Code</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Use recovery code</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-yellow-100 dark:bg-yellow-900">
            <KeyOutline class="h-6 w-6 text-yellow-600 dark:text-yellow-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Enter backup code</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Use one of the recovery codes you saved when setting up 2FA
          </p>
        </div>

        <form class="space-y-4">
          <div>
            <Label for="backup-code" class="mb-2">Recovery code</Label>
            <Input
              type="text"
              id="backup-code"
              placeholder="XXXX-XXXX-XXXX"
              class="font-mono text-center tracking-wider"
            />
          </div>

          <Button type="submit" class="w-full">Verify code</Button>
        </form>

        <Alert color="yellow">
          <span class="font-medium">Note:</span> Each backup code can only be used once.
        </Alert>

        <div class="border-t border-gray-200 pt-4 dark:border-gray-700">
          <p class="text-center text-sm text-gray-500 dark:text-gray-400">
            Don't have your codes?
            <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Contact support</a>
          </p>
        </div>
      </div>
    </Card>
  </div>

  <!-- Recovery Complete -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recovery Success</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Account recovered successfully</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-8 dark:bg-gray-800">
      <div class="mx-auto max-w-md text-center">
        <div class="mb-6">
          <div class="mx-auto flex h-20 w-20 items-center justify-center rounded-full bg-green-100 dark:bg-green-900">
            <CheckCircleOutline class="h-10 w-10 text-green-600 dark:text-green-400" />
          </div>
        </div>

        <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Account recovered!</h2>
        <p class="mt-4 text-gray-500 dark:text-gray-400">
          Your identity has been verified. You can now reset your password and regain access to your account.
        </p>

        <div class="mt-8 rounded-lg bg-white p-6 shadow-sm dark:bg-gray-900">
          <h3 class="font-medium text-gray-900 dark:text-white">Next steps</h3>
          <ul class="mt-4 space-y-3 text-left text-sm">
            <li class="flex items-center gap-2 text-gray-600 dark:text-gray-400">
              <CheckCircleOutline class="h-5 w-5 text-green-500" />
              <span>Identity verified</span>
            </li>
            <li class="flex items-center gap-2 text-gray-600 dark:text-gray-400">
              <div class="h-5 w-5 rounded-full border-2 border-primary-500 bg-primary-500 flex items-center justify-center">
                <span class="text-xs font-bold text-white">2</span>
              </div>
              <span class="font-medium text-gray-900 dark:text-white">Create new password</span>
            </li>
            <li class="flex items-center gap-2 text-gray-400">
              <div class="h-5 w-5 rounded-full border-2 border-gray-300 dark:border-gray-600"></div>
              <span>Sign in to your account</span>
            </li>
          </ul>
        </div>

        <div class="mt-6">
          <Button class="w-full" size="lg">Create new password</Button>
        </div>

        <div class="mt-6 rounded-lg border border-yellow-200 bg-yellow-50 p-4 text-left dark:border-yellow-800 dark:bg-yellow-900/30">
          <h4 class="font-medium text-yellow-800 dark:text-yellow-300">Security recommendation</h4>
          <p class="mt-1 text-sm text-yellow-700 dark:text-yellow-400">
            After recovering your account, we recommend:
          </p>
          <ul class="mt-2 list-inside list-disc text-sm text-yellow-700 dark:text-yellow-400">
            <li>Using a strong, unique password</li>
            <li>Enabling two-factor authentication</li>
            <li>Reviewing your account activity</li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
