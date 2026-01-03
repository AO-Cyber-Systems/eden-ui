<script lang="ts">
  import { Button, Input, Checkbox, Label, Card, Helper, Progressbar } from "flowbite-svelte";
  import { EnvelopeOutline, LockClosedOutline, UserOutline, EyeOutline, EyeSlashOutline, CheckCircleOutline, XCircleOutline } from "flowbite-svelte-icons";

  // Simple Sign Up
  let name = $state("");
  let email = $state("");
  let password = $state("");
  let confirmPassword = $state("");
  let showPassword = $state(false);
  let acceptTerms = $state(false);

  // Password strength
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

  const strengthLabel = $derived(() => {
    const s = passwordStrength();
    if (s <= 25) return "Weak";
    if (s <= 50) return "Fair";
    if (s <= 75) return "Good";
    return "Strong";
  });

  const passwordsMatch = $derived(password && confirmPassword && password === confirmPassword);
  const passwordsMismatch = $derived(confirmPassword && password !== confirmPassword);

  // Multi-step
  let currentStep = $state(1);
  let step1Data = $state({ email: "", password: "" });
  let step2Data = $state({ firstName: "", lastName: "", company: "" });
  let step3Data = $state({ plan: "starter" });
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Simple Sign Up -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Simple Sign Up</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Basic registration form</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <h5 class="text-xl font-medium text-gray-900 dark:text-white">Create an account</h5>

        <div>
          <Label for="name" class="mb-2">Full name</Label>
          <Input type="text" id="name" placeholder="John Doe" bind:value={name} required />
        </div>

        <div>
          <Label for="email-signup" class="mb-2">Email address</Label>
          <Input type="email" id="email-signup" placeholder="name@company.com" bind:value={email} required />
        </div>

        <div>
          <Label for="password-signup" class="mb-2">Password</Label>
          <Input type="password" id="password-signup" placeholder="••••••••" bind:value={password} required />
        </div>

        <div>
          <Label for="confirm-password" class="mb-2">Confirm password</Label>
          <Input type="password" id="confirm-password" placeholder="••••••••" bind:value={confirmPassword} required />
        </div>

        <div class="flex items-start">
          <Checkbox bind:checked={acceptTerms}>
            I accept the <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Terms and Conditions</a>
          </Checkbox>
        </div>

        <Button type="submit" class="w-full" disabled={!acceptTerms}>Create account</Button>

        <p class="text-sm text-gray-500 dark:text-gray-300">
          Already have an account?
          <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign in</a>
        </p>
      </form>
    </Card>
  </div>

  <!-- Sign Up with Password Strength -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Password Strength</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">With strength indicator</p>
    </div>

    <Card class="max-w-md">
      <form class="space-y-6">
        <div class="text-center">
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Create your account</h5>
          <p class="text-sm text-gray-500 dark:text-gray-400">Start your free trial today</p>
        </div>

        <div>
          <Label for="email-strength" class="mb-2">Email</Label>
          <Input type="email" id="email-strength" placeholder="name@company.com">
            {#snippet left()}
              <EnvelopeOutline class="h-5 w-5 text-gray-500" />
            {/snippet}
          </Input>
        </div>

        <div>
          <Label for="password-strength" class="mb-2">Password</Label>
          <Input
            type={showPassword ? "text" : "password"}
            id="password-strength"
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
            <div class="mt-2">
              <div class="mb-1 flex items-center justify-between">
                <span class="text-sm text-gray-500 dark:text-gray-400">Password strength</span>
                <span class="text-sm font-medium text-{strengthColor()}-600 dark:text-{strengthColor()}-400">{strengthLabel()}</span>
              </div>
              <Progressbar progress={passwordStrength()} color={strengthColor()} size="h-1.5" />
            </div>

            <ul class="mt-3 space-y-1 text-sm">
              <li class="flex items-center gap-2 {password.length >= 8 ? 'text-green-600 dark:text-green-400' : 'text-gray-500 dark:text-gray-400'}">
                {#if password.length >= 8}
                  <CheckCircleOutline class="h-4 w-4" />
                {:else}
                  <XCircleOutline class="h-4 w-4" />
                {/if}
                At least 8 characters
              </li>
              <li class="flex items-center gap-2 {/[a-z]/.test(password) ? 'text-green-600 dark:text-green-400' : 'text-gray-500 dark:text-gray-400'}">
                {#if /[a-z]/.test(password)}
                  <CheckCircleOutline class="h-4 w-4" />
                {:else}
                  <XCircleOutline class="h-4 w-4" />
                {/if}
                One lowercase letter
              </li>
              <li class="flex items-center gap-2 {/[A-Z]/.test(password) ? 'text-green-600 dark:text-green-400' : 'text-gray-500 dark:text-gray-400'}">
                {#if /[A-Z]/.test(password)}
                  <CheckCircleOutline class="h-4 w-4" />
                {:else}
                  <XCircleOutline class="h-4 w-4" />
                {/if}
                One uppercase letter
              </li>
              <li class="flex items-center gap-2 {/[0-9]/.test(password) || /[^a-zA-Z0-9]/.test(password) ? 'text-green-600 dark:text-green-400' : 'text-gray-500 dark:text-gray-400'}">
                {#if /[0-9]/.test(password) || /[^a-zA-Z0-9]/.test(password)}
                  <CheckCircleOutline class="h-4 w-4" />
                {:else}
                  <XCircleOutline class="h-4 w-4" />
                {/if}
                One number or symbol
              </li>
            </ul>
          {/if}
        </div>

        <div>
          <Label for="confirm-strength" class="mb-2">Confirm password</Label>
          <Input
            type="password"
            id="confirm-strength"
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
          {#if passwordsMismatch}
            <Helper class="mt-2" color="red">Passwords do not match</Helper>
          {/if}
        </div>

        <Button type="submit" class="w-full">Create account</Button>
      </form>
    </Card>
  </div>

  <!-- Multi-step Sign Up -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Multi-step Registration</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Step-by-step wizard</p>
    </div>

    <Card class="max-w-md">
      <!-- Progress Steps -->
      <div class="mb-6">
        <ol class="flex w-full items-center text-center text-sm font-medium text-gray-500 dark:text-gray-400 sm:text-base">
          <li class="flex w-full items-center after:mx-2 after:hidden after:h-1 after:w-full after:border-b after:border-gray-200 sm:after:inline-block sm:after:content-[''] dark:after:border-gray-700 {currentStep >= 1 ? 'text-primary-600 dark:text-primary-500' : ''}">
            <span class="flex items-center after:mx-2 after:text-gray-200 after:content-['/'] sm:after:hidden dark:after:text-gray-500">
              <span class="me-2 {currentStep >= 1 ? 'bg-primary-100 text-primary-600 dark:bg-primary-900 dark:text-primary-300' : 'bg-gray-100 dark:bg-gray-700'} flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-xs">1</span>
              Account
            </span>
          </li>
          <li class="flex w-full items-center after:mx-2 after:hidden after:h-1 after:w-full after:border-b after:border-gray-200 sm:after:inline-block sm:after:content-[''] dark:after:border-gray-700 {currentStep >= 2 ? 'text-primary-600 dark:text-primary-500' : ''}">
            <span class="flex items-center after:mx-2 after:text-gray-200 after:content-['/'] sm:after:hidden dark:after:text-gray-500">
              <span class="me-2 {currentStep >= 2 ? 'bg-primary-100 text-primary-600 dark:bg-primary-900 dark:text-primary-300' : 'bg-gray-100 dark:bg-gray-700'} flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-xs">2</span>
              Profile
            </span>
          </li>
          <li class="flex items-center {currentStep >= 3 ? 'text-primary-600 dark:text-primary-500' : ''}">
            <span class="me-2 {currentStep >= 3 ? 'bg-primary-100 text-primary-600 dark:bg-primary-900 dark:text-primary-300' : 'bg-gray-100 dark:bg-gray-700'} flex h-6 w-6 shrink-0 items-center justify-center rounded-full text-xs">3</span>
            Plan
          </li>
        </ol>
      </div>

      <!-- Step Content -->
      {#if currentStep === 1}
        <form class="space-y-4">
          <h5 class="text-lg font-medium text-gray-900 dark:text-white">Account Details</h5>

          <div>
            <Label for="step1-email" class="mb-2">Email address</Label>
            <Input type="email" id="step1-email" placeholder="name@company.com" bind:value={step1Data.email} />
          </div>

          <div>
            <Label for="step1-password" class="mb-2">Create password</Label>
            <Input type="password" id="step1-password" placeholder="••••••••" bind:value={step1Data.password} />
          </div>

          <Button class="w-full" onclick={() => currentStep = 2}>
            Continue
          </Button>
        </form>
      {:else if currentStep === 2}
        <form class="space-y-4">
          <h5 class="text-lg font-medium text-gray-900 dark:text-white">Your Profile</h5>

          <div class="grid grid-cols-2 gap-4">
            <div>
              <Label for="step2-first" class="mb-2">First name</Label>
              <Input type="text" id="step2-first" placeholder="John" bind:value={step2Data.firstName} />
            </div>
            <div>
              <Label for="step2-last" class="mb-2">Last name</Label>
              <Input type="text" id="step2-last" placeholder="Doe" bind:value={step2Data.lastName} />
            </div>
          </div>

          <div>
            <Label for="step2-company" class="mb-2">Company (optional)</Label>
            <Input type="text" id="step2-company" placeholder="Your company" bind:value={step2Data.company} />
          </div>

          <div class="flex gap-3">
            <Button color="light" class="w-full" onclick={() => currentStep = 1}>Back</Button>
            <Button class="w-full" onclick={() => currentStep = 3}>Continue</Button>
          </div>
        </form>
      {:else}
        <form class="space-y-4">
          <h5 class="text-lg font-medium text-gray-900 dark:text-white">Choose Your Plan</h5>

          <div class="space-y-3">
            {#each [
              { id: "starter", name: "Starter", price: "Free", features: "5 projects, 1GB storage" },
              { id: "pro", name: "Pro", price: "$15/mo", features: "Unlimited projects, 100GB" },
              { id: "enterprise", name: "Enterprise", price: "$49/mo", features: "Everything + priority support" }
            ] as plan}
              <label class="flex cursor-pointer items-center justify-between rounded-lg border p-4 {step3Data.plan === plan.id ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-700'}">
                <div class="flex items-center gap-3">
                  <input
                    type="radio"
                    name="plan"
                    value={plan.id}
                    bind:group={step3Data.plan}
                    class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500"
                  />
                  <div>
                    <div class="font-medium text-gray-900 dark:text-white">{plan.name}</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">{plan.features}</div>
                  </div>
                </div>
                <div class="font-semibold text-gray-900 dark:text-white">{plan.price}</div>
              </label>
            {/each}
          </div>

          <div class="flex gap-3">
            <Button color="light" class="w-full" onclick={() => currentStep = 2}>Back</Button>
            <Button class="w-full">Complete signup</Button>
          </div>
        </form>
      {/if}
    </Card>
  </div>
</div>
