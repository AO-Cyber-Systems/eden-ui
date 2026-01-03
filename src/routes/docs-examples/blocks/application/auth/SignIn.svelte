<script lang="ts">
  import { Button, Input, Checkbox, Label, Card, Helper } from "flowbite-svelte";
  import { EnvelopeOutline, LockClosedOutline, EyeOutline, EyeSlashOutline } from "flowbite-svelte-icons";

  // Simple Sign In
  let email = $state("");
  let password = $state("");
  let showPassword = $state(false);
  let rememberMe = $state(false);

  // With Validation
  let email2 = $state("");
  let password2 = $state("");
  let emailError = $state("");
  let passwordError = $state("");

  function validateEmail(value: string) {
    if (!value) {
      emailError = "Email is required";
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value)) {
      emailError = "Please enter a valid email";
    } else {
      emailError = "";
    }
  }

  function validatePassword(value: string) {
    if (!value) {
      passwordError = "Password is required";
    } else if (value.length < 8) {
      passwordError = "Password must be at least 8 characters";
    } else {
      passwordError = "";
    }
  }
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Simple Sign In -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Simple Sign In</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Basic login form</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <h5 class="text-xl font-medium text-gray-900 dark:text-white">Sign in to your account</h5>

        <div>
          <Label for="email-simple" class="mb-2">Your email</Label>
          <Input
            type="email"
            id="email-simple"
            placeholder="name@company.com"
            bind:value={email}
            required
          />
        </div>

        <div>
          <Label for="password-simple" class="mb-2">Your password</Label>
          <Input
            type="password"
            id="password-simple"
            placeholder="••••••••"
            bind:value={password}
            required
          />
        </div>

        <div class="flex items-center justify-between">
          <Checkbox bind:checked={rememberMe}>Remember me</Checkbox>
          <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
            Forgot password?
          </a>
        </div>

        <Button type="submit" class="w-full">Sign in</Button>

        <div class="text-sm font-medium text-gray-500 dark:text-gray-300">
          Not registered?
          <a href="#" class="text-primary-600 hover:underline dark:text-primary-500">Create account</a>
        </div>
      </form>
    </Card>
  </div>

  <!-- Sign In with Icons -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With Input Icons</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Icons and password toggle</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <div class="text-center">
          <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-full bg-primary-100 dark:bg-primary-900">
            <LockClosedOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Welcome back</h5>
          <p class="text-sm text-gray-500 dark:text-gray-400">Please enter your credentials</p>
        </div>

        <div>
          <Label for="email-icon" class="mb-2">Email address</Label>
          <Input type="email" id="email-icon" placeholder="name@company.com">
            {#snippet left()}
              <EnvelopeOutline class="h-5 w-5 text-gray-500 dark:text-gray-400" />
            {/snippet}
          </Input>
        </div>

        <div>
          <Label for="password-icon" class="mb-2">Password</Label>
          <Input
            type={showPassword ? "text" : "password"}
            id="password-icon"
            placeholder="••••••••"
          >
            {#snippet left()}
              <LockClosedOutline class="h-5 w-5 text-gray-500 dark:text-gray-400" />
            {/snippet}
            {#snippet right()}
              <button
                type="button"
                onclick={() => showPassword = !showPassword}
                class="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-300"
              >
                {#if showPassword}
                  <EyeSlashOutline class="h-5 w-5" />
                {:else}
                  <EyeOutline class="h-5 w-5" />
                {/if}
              </button>
            {/snippet}
          </Input>
        </div>

        <div class="flex items-center justify-between">
          <Checkbox>Keep me signed in</Checkbox>
          <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
            Reset password
          </a>
        </div>

        <Button type="submit" class="w-full">Sign in</Button>
      </form>
    </Card>
  </div>

  <!-- Sign In with Validation -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With Validation</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Real-time form validation</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <h5 class="text-xl font-medium text-gray-900 dark:text-white">Sign in to your account</h5>

        <div>
          <Label for="email-valid" class="mb-2" color={emailError ? "red" : undefined}>
            Email address
          </Label>
          <Input
            type="email"
            id="email-valid"
            placeholder="name@company.com"
            bind:value={email2}
            color={emailError ? "red" : "base"}
            oninput={() => validateEmail(email2)}
          />
          {#if emailError}
            <Helper class="mt-2" color="red">{emailError}</Helper>
          {/if}
        </div>

        <div>
          <Label for="password-valid" class="mb-2" color={passwordError ? "red" : undefined}>
            Password
          </Label>
          <Input
            type="password"
            id="password-valid"
            placeholder="••••••••"
            bind:value={password2}
            color={passwordError ? "red" : "base"}
            oninput={() => validatePassword(password2)}
          />
          {#if passwordError}
            <Helper class="mt-2" color="red">{passwordError}</Helper>
          {/if}
        </div>

        <Button type="submit" class="w-full" disabled={!email2 || !password2 || !!emailError || !!passwordError}>
          Sign in
        </Button>

        <p class="text-center text-sm text-gray-500 dark:text-gray-400">
          Don't have an account?
          <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign up</a>
        </p>
      </form>
    </Card>
  </div>

  <!-- Centered Sign In -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Centered Layout</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Full-width centered form</p>
    </div>

    <div class="rounded-lg bg-gray-50 p-8 dark:bg-gray-800">
      <div class="mx-auto max-w-sm">
        <div class="mb-8 text-center">
          <div class="mb-4 flex justify-center">
            <div class="flex h-12 w-12 items-center justify-center rounded-lg bg-primary-600 text-white">
              <svg class="h-7 w-7" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
              </svg>
            </div>
          </div>
          <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Welcome to Flowbite</h2>
          <p class="mt-2 text-gray-500 dark:text-gray-400">Sign in to continue to your dashboard</p>
        </div>

        <form class="space-y-6">
          <div>
            <Label for="email-center" class="mb-2">Email</Label>
            <Input type="email" id="email-center" placeholder="name@company.com" size="lg" />
          </div>

          <div>
            <div class="mb-2 flex items-center justify-between">
              <Label for="password-center">Password</Label>
              <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
                Forgot password?
              </a>
            </div>
            <Input type="password" id="password-center" placeholder="••••••••" size="lg" />
          </div>

          <Checkbox>Remember this device</Checkbox>

          <Button type="submit" class="w-full" size="lg">Sign in</Button>

          <div class="relative">
            <div class="absolute inset-0 flex items-center">
              <div class="w-full border-t border-gray-300 dark:border-gray-600"></div>
            </div>
            <div class="relative flex justify-center text-sm">
              <span class="bg-gray-50 px-2 text-gray-500 dark:bg-gray-800 dark:text-gray-400">Or continue with</span>
            </div>
          </div>

          <div class="grid grid-cols-2 gap-3">
            <Button color="light" class="w-full">
              <svg class="me-2 h-5 w-5" viewBox="0 0 24 24">
                <path fill="currentColor" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                <path fill="currentColor" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                <path fill="currentColor" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                <path fill="currentColor" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
              </svg>
              Google
            </Button>
            <Button color="dark" class="w-full">
              <svg class="me-2 h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
              </svg>
              GitHub
            </Button>
          </div>

          <p class="text-center text-sm text-gray-500 dark:text-gray-400">
            Don't have an account yet?
            <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign up</a>
          </p>
        </form>
      </div>
    </div>
  </div>
</div>
