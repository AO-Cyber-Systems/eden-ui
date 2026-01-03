<script lang="ts">
  import { Button, Input, Label, Card, Alert, Helper, Progressbar } from "flowbite-svelte";
  import { LockClosedOutline, EyeOutline, EyeSlashOutline, CheckCircleOutline, XCircleOutline, ShieldCheckOutline } from "flowbite-svelte-icons";

  let password = $state("");
  let confirmPassword = $state("");
  let showPassword = $state(false);
  let showConfirm = $state(false);
  let success = $state(false);

  // Password strength calculation
  const passwordStrength = $derived(() => {
    let strength = 0;
    if (password.length >= 8) strength += 25;
    if (/[a-z]/.test(password)) strength += 25;
    if (/[A-Z]/.test(password)) strength += 25;
    if (/[0-9]/.test(password) || /[^a-zA-Z0-9]/.test(password)) strength += 25;
    return strength;
  });

  const strengthColor = $derived(() => {
    const s = passwordStrength();
    if (s <= 25) return "red";
    if (s <= 50) return "yellow";
    if (s <= 75) return "blue";
    return "green";
  });

  const passwordsMatch = $derived(password && confirmPassword && password === confirmPassword);
  const passwordsMismatch = $derived(confirmPassword && password !== confirmPassword);
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Simple Reset Password -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Simple Reset</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Basic password reset form</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <LockClosedOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Set new password</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Your new password must be different from previous passwords
          </p>
        </div>

        <div>
          <Label for="new-password" class="mb-2">New password</Label>
          <Input
            type={showPassword ? "text" : "password"}
            id="new-password"
            placeholder="••••••••"
            bind:value={password}
          >
            {#snippet right()}
              <button type="button" onclick={() => showPassword = !showPassword} class="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300">
                {#if showPassword}
                  <EyeSlashOutline class="h-5 w-5" />
                {:else}
                  <EyeOutline class="h-5 w-5" />
                {/if}
              </button>
            {/snippet}
          </Input>
        </div>

        <div>
          <Label for="confirm-new" class="mb-2">Confirm password</Label>
          <Input
            type={showConfirm ? "text" : "password"}
            id="confirm-new"
            placeholder="••••••••"
            bind:value={confirmPassword}
            color={passwordsMismatch ? "red" : passwordsMatch ? "green" : "base"}
          >
            {#snippet right()}
              <button type="button" onclick={() => showConfirm = !showConfirm} class="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300">
                {#if showConfirm}
                  <EyeSlashOutline class="h-5 w-5" />
                {:else}
                  <EyeOutline class="h-5 w-5" />
                {/if}
              </button>
            {/snippet}
          </Input>
          {#if passwordsMismatch}
            <Helper class="mt-2" color="red">Passwords do not match</Helper>
          {/if}
        </div>

        <Button type="submit" class="w-full" disabled={!passwordsMatch}>Reset password</Button>
      </form>
    </Card>
  </div>

  <!-- With Strength Indicator -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With Strength Indicator</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Shows password requirements</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <h5 class="text-xl font-medium text-gray-900 dark:text-white">Create new password</h5>

        <div>
          <Label for="password-strong" class="mb-2">Password</Label>
          <Input
            type={showPassword ? "text" : "password"}
            id="password-strong"
            placeholder="••••••••"
            bind:value={password}
          >
            {#snippet left()}
              <LockClosedOutline class="h-5 w-5 text-gray-500" />
            {/snippet}
            {#snippet right()}
              <button type="button" onclick={() => showPassword = !showPassword} class="text-gray-500 hover:text-gray-700">
                {#if showPassword}
                  <EyeSlashOutline class="h-5 w-5" />
                {:else}
                  <EyeOutline class="h-5 w-5" />
                {/if}
              </button>
            {/snippet}
          </Input>

          {#if password}
            <div class="mt-3">
              <Progressbar progress={passwordStrength()} color={strengthColor()} size="h-1.5" />
              <div class="mt-2 grid grid-cols-2 gap-2 text-xs">
                <div class="flex items-center gap-1 {password.length >= 8 ? 'text-green-600' : 'text-gray-400'}">
                  {#if password.length >= 8}
                    <CheckCircleOutline class="h-3 w-3" />
                  {:else}
                    <XCircleOutline class="h-3 w-3" />
                  {/if}
                  8+ characters
                </div>
                <div class="flex items-center gap-1 {/[a-z]/.test(password) ? 'text-green-600' : 'text-gray-400'}">
                  {#if /[a-z]/.test(password)}
                    <CheckCircleOutline class="h-3 w-3" />
                  {:else}
                    <XCircleOutline class="h-3 w-3" />
                  {/if}
                  Lowercase
                </div>
                <div class="flex items-center gap-1 {/[A-Z]/.test(password) ? 'text-green-600' : 'text-gray-400'}">
                  {#if /[A-Z]/.test(password)}
                    <CheckCircleOutline class="h-3 w-3" />
                  {:else}
                    <XCircleOutline class="h-3 w-3" />
                  {/if}
                  Uppercase
                </div>
                <div class="flex items-center gap-1 {/[0-9]/.test(password) || /[^a-zA-Z0-9]/.test(password) ? 'text-green-600' : 'text-gray-400'}">
                  {#if /[0-9]/.test(password) || /[^a-zA-Z0-9]/.test(password)}
                    <CheckCircleOutline class="h-3 w-3" />
                  {:else}
                    <XCircleOutline class="h-3 w-3" />
                  {/if}
                  Number/Symbol
                </div>
              </div>
            </div>
          {/if}
        </div>

        <div>
          <Label for="confirm-strong" class="mb-2">Confirm password</Label>
          <Input
            type="password"
            id="confirm-strong"
            placeholder="••••••••"
            bind:value={confirmPassword}
            color={passwordsMismatch ? "red" : passwordsMatch ? "green" : "base"}
          >
            {#snippet left()}
              <LockClosedOutline class="h-5 w-5 text-gray-500" />
            {/snippet}
            {#snippet right()}
              {#if passwordsMatch}
                <CheckCircleOutline class="h-5 w-5 text-green-500" />
              {:else if passwordsMismatch}
                <XCircleOutline class="h-5 w-5 text-red-500" />
              {/if}
            {/snippet}
          </Input>
        </div>

        <Button type="submit" class="w-full" disabled={passwordStrength() < 100 || !passwordsMatch}>
          Update password
        </Button>
      </form>
    </Card>
  </div>

  <!-- Success State -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Success State</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Password reset complete</p>
    </div>

    <Card class="max-w-md">
      {#if success}
        <div class="space-y-6 text-center">
          <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-green-100 dark:bg-green-900">
            <CheckCircleOutline class="h-8 w-8 text-green-600 dark:text-green-400" />
          </div>

          <div>
            <h5 class="text-xl font-medium text-gray-900 dark:text-white">Password updated!</h5>
            <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
              Your password has been changed successfully. You can now sign in with your new password.
            </p>
          </div>

          <Button class="w-full" href="#">Continue to sign in</Button>
        </div>
      {:else}
        <form class="space-y-6" onsubmit={(e) => { e.preventDefault(); success = true; }}>
          <div class="text-center">
            <h5 class="text-xl font-medium text-gray-900 dark:text-white">Reset your password</h5>
          </div>

          <Alert color="blue">
            <span class="font-medium">Tip:</span> Use a strong password with at least 8 characters, including letters, numbers, and symbols.
          </Alert>

          <div>
            <Label for="new-pw-success" class="mb-2">New password</Label>
            <Input type="password" id="new-pw-success" placeholder="••••••••" required />
          </div>

          <div>
            <Label for="confirm-pw-success" class="mb-2">Confirm new password</Label>
            <Input type="password" id="confirm-pw-success" placeholder="••••••••" required />
          </div>

          <Button type="submit" class="w-full">Reset password</Button>
        </form>
      {/if}
    </Card>
  </div>

  <!-- Full Page Reset -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Full Page Layout</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Complete reset password page</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-8 dark:bg-gray-800">
      <div class="mx-auto max-w-md">
        <div class="mb-8 text-center">
          <div class="mb-4 flex justify-center">
            <div class="flex h-14 w-14 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
              <ShieldCheckOutline class="h-7 w-7 text-primary-600 dark:text-primary-400" />
            </div>
          </div>
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Create new password</h2>
          <p class="mt-2 text-gray-500 dark:text-gray-400">
            Please create a secure password for your account
          </p>
        </div>

        <div class="rounded-lg bg-white p-6 shadow-sm dark:bg-gray-900">
          <form class="space-y-5">
            <div>
              <Label for="full-password" class="mb-2">New password</Label>
              <Input type="password" id="full-password" placeholder="Enter new password" size="lg" />
              <p class="mt-2 text-xs text-gray-500 dark:text-gray-400">
                Must be at least 8 characters with uppercase, lowercase, and number
              </p>
            </div>

            <div>
              <Label for="full-confirm" class="mb-2">Confirm new password</Label>
              <Input type="password" id="full-confirm" placeholder="Confirm new password" size="lg" />
            </div>

            <Button type="submit" class="w-full" size="lg">
              Reset password
            </Button>
          </form>
        </div>

        <p class="mt-6 text-center text-sm text-gray-500 dark:text-gray-400">
          This link will expire in 24 hours.
          <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Request new link</a>
        </p>
      </div>
    </div>
  </div>
</div>
