<script lang="ts">
  import { Button, Input, Label, Card, Avatar } from "flowbite-svelte";
  import { LockClosedOutline, ArrowRightToBracketOutline, UserOutline, FingerPrintOutline, DevicePhoneMobileOutline } from "flowbite-svelte-icons";

  let password = $state("");
  let pin = $state(["", "", "", ""]);

  function handlePinInput(index: number, event: Event) {
    const target = event.target as HTMLInputElement;
    const value = target.value;

    if (value.length > 1) {
      pin[index] = value.slice(-1);
    } else {
      pin[index] = value;
    }

    if (value && index < 3) {
      const nextInput = document.getElementById(`pin-${index + 1}`);
      nextInput?.focus();
    }
  }

  function handlePinKeyDown(index: number, event: KeyboardEvent) {
    if (event.key === "Backspace" && !pin[index] && index > 0) {
      const prevInput = document.getElementById(`pin-${index - 1}`);
      prevInput?.focus();
    }
  }
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2 xl:grid-cols-3">
  <!-- Simple Lock Screen -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Simple Lock</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Basic password unlock</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6 text-center">
        <div class="mx-auto flex h-16 w-16 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-700">
          <LockClosedOutline class="h-8 w-8 text-gray-500 dark:text-gray-400" />
        </div>

        <div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Session locked</h5>
          <p class="mt-2 text-sm text-gray-500 dark:text-gray-400">
            Your session has been locked due to inactivity
          </p>
        </div>

        <form class="space-y-4 text-left">
          <div>
            <Label for="lock-password" class="mb-2">Password</Label>
            <Input type="password" id="lock-password" placeholder="Enter your password" bind:value={password} />
          </div>

          <Button type="submit" class="w-full">Unlock</Button>
        </form>

        <a href="#" class="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
          <ArrowRightToBracketOutline class="h-4 w-4" />
          Sign in as different user
        </a>
      </div>
    </Card>
  </div>

  <!-- Lock with Avatar -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">With User Avatar</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Shows user information</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6 text-center">
        <div>
          <div class="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-primary-100 text-2xl font-bold text-primary-800 ring-4 ring-white dark:bg-primary-900 dark:text-primary-200 dark:ring-gray-800">
            NS
          </div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Neil Sims</h5>
          <p class="text-sm text-gray-500 dark:text-gray-400">neil.sims@company.com</p>
        </div>

        <div class="rounded-lg bg-yellow-50 p-3 text-sm text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-300">
          <LockClosedOutline class="me-2 inline h-4 w-4" />
          Session locked after 15 minutes of inactivity
        </div>

        <form class="space-y-4 text-left">
          <div>
            <Label for="avatar-password" class="mb-2">Enter password to unlock</Label>
            <Input type="password" id="avatar-password" placeholder="••••••••" />
          </div>

          <div class="flex items-center justify-between">
            <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">
              Forgot password?
            </a>
          </div>

          <Button type="submit" class="w-full">
            <LockClosedOutline class="me-2 h-4 w-4" />
            Unlock session
          </Button>
        </form>

        <button class="flex w-full items-center justify-center gap-2 text-sm text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white">
          <UserOutline class="h-4 w-4" />
          Not Neil? Sign in as different user
        </button>
      </div>
    </Card>
  </div>

  <!-- PIN Lock -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">PIN Lock</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Quick 4-digit PIN unlock</p>
    </div>

    <Card class="max-w-md">
      <div class="space-y-6 text-center">
        <div class="mx-auto flex h-20 w-20 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-700">
          <img src="https://flowbite.com/docs/images/people/profile-picture-3.jpg" alt="User" class="h-20 w-20 rounded-full object-cover" />
        </div>

        <div>
          <h5 class="text-xl font-medium text-gray-900 dark:text-white">Welcome back</h5>
          <p class="text-sm text-gray-500 dark:text-gray-400">Enter your PIN to continue</p>
        </div>

        <!-- PIN Input -->
        <div class="flex justify-center gap-3">
          {#each pin as digit, i}
            <input
              id="pin-{i}"
              type="password"
              inputmode="numeric"
              maxlength="1"
              value={digit}
              oninput={(e) => handlePinInput(i, e)}
              onkeydown={(e) => handlePinKeyDown(i, e)}
              class="h-14 w-14 rounded-xl border border-gray-300 bg-gray-50 text-center text-2xl font-bold text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
            />
          {/each}
        </div>

        <div class="flex justify-center gap-4">
          <button class="flex flex-col items-center gap-1 rounded-lg p-3 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
            <FingerPrintOutline class="h-6 w-6" />
            <span class="text-xs">Fingerprint</span>
          </button>
          <button class="flex flex-col items-center gap-1 rounded-lg p-3 text-gray-500 hover:bg-gray-100 dark:text-gray-400 dark:hover:bg-gray-700">
            <DevicePhoneMobileOutline class="h-6 w-6" />
            <span class="text-xs">Face ID</span>
          </button>
        </div>

        <a href="#" class="text-sm text-primary-600 hover:underline dark:text-primary-500">
          Forgot PIN?
        </a>
      </div>
    </Card>
  </div>

  <!-- Full Screen Lock -->
  <div class="lg:col-span-2 xl:col-span-3">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Full Screen Lock</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Complete lock screen layout</p>
    </div>

    <div class="overflow-hidden rounded-lg bg-gradient-to-br from-gray-900 to-gray-800">
      <div class="flex min-h-[500px] items-center justify-center p-8">
        <div class="w-full max-w-sm">
          <!-- Time Display -->
          <div class="mb-8 text-center">
            <div class="text-6xl font-light text-white">10:24</div>
            <div class="mt-2 text-lg text-gray-400">Thursday, January 2</div>
          </div>

          <!-- User Card -->
          <div class="rounded-2xl bg-white/10 p-6 backdrop-blur-sm">
            <div class="text-center">
              <div class="mx-auto mb-4 flex h-20 w-20 items-center justify-center rounded-full bg-primary-500 text-2xl font-bold text-white ring-4 ring-white/20">
                NS
              </div>
              <h3 class="text-xl font-medium text-white">Neil Sims</h3>
              <p class="text-sm text-gray-400">Administrator</p>
            </div>

            <form class="mt-6 space-y-4">
              <div>
                <Input type="password" placeholder="Enter password" class="bg-white/10 text-white placeholder-gray-400 border-white/20 focus:border-primary-500" />
              </div>
              <Button class="w-full">Unlock</Button>
            </form>

            <div class="mt-4 flex justify-center gap-4">
              <button class="rounded-lg p-2 text-gray-400 hover:bg-white/10 hover:text-white">
                <FingerPrintOutline class="h-6 w-6" />
              </button>
              <button class="rounded-lg p-2 text-gray-400 hover:bg-white/10 hover:text-white">
                <DevicePhoneMobileOutline class="h-6 w-6" />
              </button>
            </div>
          </div>

          <!-- Switch User -->
          <div class="mt-6 text-center">
            <button class="text-sm text-gray-400 hover:text-white">
              Switch account
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
