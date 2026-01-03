<script lang="ts">
  import { Button, Card, Toggle, Badge, Modal, Alert, Input, Label } from "flowbite-svelte";
  import { ShieldCheckOutline, DevicePhoneMobileOutline, KeyOutline, FingerPrintOutline, ExclamationCircleOutline, CheckCircleOutline, TrashBinOutline, GlobeAltOutline, ComputerDesktopOutline } from "flowbite-svelte-icons";

  let twoFactorEnabled = $state(true);
  let biometricEnabled = $state(false);
  let showSessionModal = $state(false);
  let showDisable2FAModal = $state(false);

  const sessions = [
    { id: 1, device: "MacBook Pro", browser: "Chrome", location: "San Francisco, CA", lastActive: "Active now", current: true },
    { id: 2, device: "iPhone 14 Pro", browser: "Safari", location: "San Francisco, CA", lastActive: "2 hours ago", current: false },
    { id: 3, device: "Windows PC", browser: "Firefox", location: "New York, NY", lastActive: "3 days ago", current: false },
    { id: 4, device: "iPad Pro", browser: "Safari", location: "Los Angeles, CA", lastActive: "1 week ago", current: false }
  ];

  const loginHistory = [
    { date: "Jan 2, 2026", time: "10:30 AM", device: "Chrome on MacOS", location: "San Francisco, CA", status: "success" },
    { date: "Jan 1, 2026", time: "8:15 PM", device: "Safari on iPhone", location: "San Francisco, CA", status: "success" },
    { date: "Dec 31, 2025", time: "11:45 PM", device: "Unknown", location: "Moscow, Russia", status: "blocked" },
    { date: "Dec 30, 2025", time: "3:20 PM", device: "Firefox on Windows", location: "New York, NY", status: "success" },
    { date: "Dec 28, 2025", time: "9:00 AM", device: "Chrome on MacOS", location: "San Francisco, CA", status: "success" }
  ];
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Two-Factor Authentication -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Two-Factor Authentication</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Add extra security to your account</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-12 w-12 items-center justify-center rounded-lg {twoFactorEnabled ? 'bg-green-100 dark:bg-green-900' : 'bg-gray-100 dark:bg-gray-700'}">
              <ShieldCheckOutline class="h-6 w-6 {twoFactorEnabled ? 'text-green-600 dark:text-green-400' : 'text-gray-500 dark:text-gray-400'}" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Two-factor authentication</p>
              <Badge color={twoFactorEnabled ? "green" : "gray"}>
                {twoFactorEnabled ? "Enabled" : "Disabled"}
              </Badge>
            </div>
          </div>
          <Toggle bind:checked={twoFactorEnabled} />
        </div>

        {#if twoFactorEnabled}
          <div class="space-y-4 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
            <h4 class="font-medium text-gray-900 dark:text-white">Authentication methods</h4>

            <div class="flex items-center justify-between">
              <div class="flex items-center gap-3">
                <DevicePhoneMobileOutline class="h-5 w-5 text-gray-500" />
                <div>
                  <p class="font-medium text-gray-900 dark:text-white">Authenticator app</p>
                  <p class="text-sm text-gray-500 dark:text-gray-400">Google Authenticator</p>
                </div>
              </div>
              <Badge color="green">Active</Badge>
            </div>

            <div class="flex items-center justify-between">
              <div class="flex items-center gap-3">
                <KeyOutline class="h-5 w-5 text-gray-500" />
                <div>
                  <p class="font-medium text-gray-900 dark:text-white">Backup codes</p>
                  <p class="text-sm text-gray-500 dark:text-gray-400">4 codes remaining</p>
                </div>
              </div>
              <Button size="xs" color="light">Regenerate</Button>
            </div>
          </div>

          <Button color="red" outline onclick={() => showDisable2FAModal = true}>
            Disable two-factor authentication
          </Button>
        {:else}
          <Alert color="yellow">
            <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
            <span class="font-medium">Recommended:</span> Enable 2FA for better account security.
          </Alert>

          <Button>
            <ShieldCheckOutline class="me-2 h-4 w-4" />
            Enable two-factor authentication
          </Button>
        {/if}
      </div>
    </Card>
  </div>

  <!-- Biometric Authentication -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Biometric Authentication</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Use fingerprint or face recognition</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-12 w-12 items-center justify-center rounded-lg bg-purple-100 dark:bg-purple-900">
              <FingerPrintOutline class="h-6 w-6 text-purple-600 dark:text-purple-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Biometric login</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Use Face ID or fingerprint</p>
            </div>
          </div>
          <Toggle bind:checked={biometricEnabled} />
        </div>

        {#if biometricEnabled}
          <div class="space-y-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
            <p class="text-sm text-gray-600 dark:text-gray-300">
              Biometric authentication is enabled for quick sign-in on supported devices.
            </p>
            <div class="flex items-center gap-2">
              <CheckCircleOutline class="h-5 w-5 text-green-500" />
              <span class="text-sm text-gray-900 dark:text-white">Face ID registered on iPhone 14 Pro</span>
            </div>
          </div>
        {:else}
          <p class="text-sm text-gray-500 dark:text-gray-400">
            Enable biometric authentication to sign in faster using your device's fingerprint or face recognition.
          </p>
        {/if}
      </div>
    </Card>
  </div>

  <!-- Active Sessions -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Active Sessions</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage devices where you're signed in</p>
    </div>

    <Card>
      <div class="mb-4 flex items-center justify-between">
        <p class="text-sm text-gray-500 dark:text-gray-400">{sessions.length} active sessions</p>
        <Button color="red" size="sm" outline>Sign out all other sessions</Button>
      </div>

      <div class="space-y-4">
        {#each sessions as session}
          <div class="flex items-center justify-between rounded-lg border border-gray-200 p-4 dark:border-gray-700 {session.current ? 'bg-green-50 dark:bg-green-900/20' : ''}">
            <div class="flex items-center gap-4">
              <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-700">
                {#if session.device.includes("iPhone") || session.device.includes("iPad")}
                  <DevicePhoneMobileOutline class="h-5 w-5 text-gray-500" />
                {:else}
                  <ComputerDesktopOutline class="h-5 w-5 text-gray-500" />
                {/if}
              </div>
              <div>
                <div class="flex items-center gap-2">
                  <p class="font-medium text-gray-900 dark:text-white">{session.device}</p>
                  {#if session.current}
                    <Badge color="green">Current</Badge>
                  {/if}
                </div>
                <p class="text-sm text-gray-500 dark:text-gray-400">
                  {session.browser} · {session.location}
                </p>
                <p class="text-xs text-gray-400 dark:text-gray-500">{session.lastActive}</p>
              </div>
            </div>
            {#if !session.current}
              <Button size="xs" color="light">
                <TrashBinOutline class="me-1 h-3 w-3" />
                Revoke
              </Button>
            {/if}
          </div>
        {/each}
      </div>
    </Card>
  </div>

  <!-- Login History -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Login History</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Recent sign-in activity</p>
    </div>

    <Card>
      <div class="overflow-x-auto">
        <table class="w-full text-left text-sm">
          <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th class="px-4 py-3">Date</th>
              <th class="px-4 py-3">Device</th>
              <th class="px-4 py-3">Location</th>
              <th class="px-4 py-3">Status</th>
            </tr>
          </thead>
          <tbody>
            {#each loginHistory as entry}
              <tr class="border-b dark:border-gray-700">
                <td class="whitespace-nowrap px-4 py-3">
                  <p class="font-medium text-gray-900 dark:text-white">{entry.date}</p>
                  <p class="text-gray-500 dark:text-gray-400">{entry.time}</p>
                </td>
                <td class="px-4 py-3 text-gray-900 dark:text-white">{entry.device}</td>
                <td class="px-4 py-3">
                  <div class="flex items-center gap-2">
                    <GlobeAltOutline class="h-4 w-4 text-gray-400" />
                    <span class="text-gray-900 dark:text-white">{entry.location}</span>
                  </div>
                </td>
                <td class="px-4 py-3">
                  {#if entry.status === "success"}
                    <Badge color="green">Success</Badge>
                  {:else if entry.status === "blocked"}
                    <Badge color="red">Blocked</Badge>
                  {:else}
                    <Badge color="yellow">Failed</Badge>
                  {/if}
                </td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>

      <div class="mt-4 flex justify-center">
        <Button color="light">View full history</Button>
      </div>
    </Card>
  </div>
</div>

<!-- Disable 2FA Modal -->
<Modal bind:open={showDisable2FAModal} size="md" title="Disable Two-Factor Authentication">
  <div class="space-y-4">
    <Alert color="red">
      <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
      This will make your account less secure.
    </Alert>

    <p class="text-gray-600 dark:text-gray-300">
      Disabling two-factor authentication will remove the extra layer of security from your account.
      Are you sure you want to continue?
    </p>

    <div>
      <Label for="confirm-password-2fa" class="mb-2">Confirm with password</Label>
      <Input type="password" id="confirm-password-2fa" placeholder="Enter your password" />
    </div>
  </div>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showDisable2FAModal = false}>Cancel</Button>
      <Button color="red">Disable 2FA</Button>
    </div>
  {/snippet}
</Modal>
