<script lang="ts">
  import { Button, Input, Label, Card, Alert, Modal, Helper, Badge } from "flowbite-svelte";
  import { EnvelopeOutline, LockClosedOutline, ExclamationCircleOutline, CheckCircleOutline, TrashBinOutline, ArrowDownTrayOutline, ShieldCheckOutline } from "flowbite-svelte-icons";

  let currentPassword = $state("");
  let newPassword = $state("");
  let confirmPassword = $state("");
  let deleteConfirmation = $state("");
  let showDeleteModal = $state(false);
  let email = $state("neil.sims@company.com");
  let newEmail = $state("");
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Email Settings -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Email Address</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage your email settings</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-start justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <EnvelopeOutline class="h-5 w-5 text-primary-600 dark:text-primary-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">{email}</p>
              <div class="flex items-center gap-2">
                <Badge color="green">Verified</Badge>
                <span class="text-sm text-gray-500 dark:text-gray-400">Primary</span>
              </div>
            </div>
          </div>
        </div>

        <div class="border-t border-gray-200 pt-6 dark:border-gray-700">
          <h4 class="mb-4 font-medium text-gray-900 dark:text-white">Change email address</h4>
          <form class="space-y-4">
            <div>
              <Label for="new-email" class="mb-2">New email address</Label>
              <Input type="email" id="new-email" bind:value={newEmail} placeholder="Enter new email" />
            </div>
            <div>
              <Label for="confirm-password-email" class="mb-2">Confirm with password</Label>
              <Input type="password" id="confirm-password-email" placeholder="Enter your password" />
            </div>
            <Button type="submit" disabled={!newEmail}>Update email</Button>
          </form>
        </div>
      </div>
    </Card>
  </div>

  <!-- Password Settings -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Password</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Update your password</p>
    </div>

    <Card class="max-w-lg">
      <form class="space-y-6">
        <div>
          <Label for="current-password" class="mb-2">Current password</Label>
          <Input type="password" id="current-password" bind:value={currentPassword} placeholder="••••••••" />
        </div>

        <div>
          <Label for="new-password" class="mb-2">New password</Label>
          <Input type="password" id="new-password" bind:value={newPassword} placeholder="••••••••" />
          <Helper class="mt-2">Must be at least 8 characters with uppercase, lowercase, and numbers</Helper>
        </div>

        <div>
          <Label for="confirm-password" class="mb-2">Confirm new password</Label>
          <Input type="password" id="confirm-password" bind:value={confirmPassword} placeholder="••••••••" />
          {#if confirmPassword && newPassword !== confirmPassword}
            <Helper class="mt-2 text-red-600">Passwords do not match</Helper>
          {/if}
        </div>

        <Alert color="blue">
          <ShieldCheckOutline class="me-2 inline h-4 w-4" />
          <span class="font-medium">Security tip:</span> Use a unique password you don't use elsewhere.
        </Alert>

        <div class="flex justify-end gap-3">
          <Button color="light">Cancel</Button>
          <Button type="submit" disabled={!currentPassword || !newPassword || newPassword !== confirmPassword}>
            Update password
          </Button>
        </div>
      </form>
    </Card>
  </div>

  <!-- Account Activity -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Account Activity</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Recent activity on your account</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-4">
        <div class="flex items-start gap-3 rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
          <CheckCircleOutline class="mt-0.5 h-5 w-5 text-green-500" />
          <div class="flex-1">
            <p class="font-medium text-gray-900 dark:text-white">Password changed</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">December 15, 2024 at 10:23 AM</p>
          </div>
        </div>

        <div class="flex items-start gap-3 rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
          <CheckCircleOutline class="mt-0.5 h-5 w-5 text-green-500" />
          <div class="flex-1">
            <p class="font-medium text-gray-900 dark:text-white">Login from new device</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">December 10, 2024 at 3:45 PM</p>
            <p class="text-xs text-gray-400 dark:text-gray-500">Chrome on MacOS · San Francisco, CA</p>
          </div>
        </div>

        <div class="flex items-start gap-3 rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
          <ExclamationCircleOutline class="mt-0.5 h-5 w-5 text-yellow-500" />
          <div class="flex-1">
            <p class="font-medium text-gray-900 dark:text-white">Failed login attempt</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">December 8, 2024 at 11:12 PM</p>
            <p class="text-xs text-gray-400 dark:text-gray-500">IP: 192.168.1.1 · Unknown location</p>
          </div>
        </div>

        <div class="flex items-start gap-3 rounded-lg bg-gray-50 p-3 dark:bg-gray-800">
          <CheckCircleOutline class="mt-0.5 h-5 w-5 text-green-500" />
          <div class="flex-1">
            <p class="font-medium text-gray-900 dark:text-white">Two-factor authentication enabled</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">November 28, 2024 at 9:00 AM</p>
          </div>
        </div>

        <Button color="light" class="w-full">View all activity</Button>
      </div>
    </Card>
  </div>

  <!-- Data Export & Danger Zone -->
  <div class="space-y-8">
    <!-- Data Export -->
    <div>
      <div class="mb-4">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Export Data</h3>
        <p class="text-sm text-gray-500 dark:text-gray-400">Download a copy of your data</p>
      </div>

      <Card class="max-w-lg">
        <div class="space-y-4">
          <p class="text-gray-600 dark:text-gray-300">
            Request a copy of your account data including your profile, posts, and settings.
            The export will be sent to your email as a ZIP file.
          </p>

          <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Last export</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">November 15, 2024</p>
              </div>
              <Button color="light" size="sm">
                <ArrowDownTrayOutline class="me-2 h-4 w-4" />
                Download
              </Button>
            </div>
          </div>

          <Button color="light" class="w-full">
            <ArrowDownTrayOutline class="me-2 h-4 w-4" />
            Request new export
          </Button>
        </div>
      </Card>
    </div>

    <!-- Danger Zone -->
    <div>
      <div class="mb-4">
        <h3 class="text-lg font-semibold text-red-600 dark:text-red-500">Danger Zone</h3>
        <p class="text-sm text-gray-500 dark:text-gray-400">Irreversible actions</p>
      </div>

      <Card class="max-w-lg border-red-200 dark:border-red-900">
        <div class="space-y-4">
          <Alert color="red">
            <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
            <span class="font-medium">Warning:</span> These actions cannot be undone.
          </Alert>

          <div class="flex items-center justify-between rounded-lg border border-red-200 p-4 dark:border-red-900">
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Delete account</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">
                Permanently delete your account and all data
              </p>
            </div>
            <Button color="red" onclick={() => showDeleteModal = true}>
              <TrashBinOutline class="me-2 h-4 w-4" />
              Delete
            </Button>
          </div>
        </div>
      </Card>
    </div>
  </div>
</div>

<!-- Delete Account Modal -->
<Modal bind:open={showDeleteModal} size="md" title="Delete Account">
  <div class="space-y-4">
    <Alert color="red">
      <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
      This action is permanent and cannot be undone.
    </Alert>

    <p class="text-gray-600 dark:text-gray-300">
      Are you sure you want to delete your account? All of your data will be permanently removed.
      This includes your profile, posts, comments, and any other associated data.
    </p>

    <div>
      <Label for="delete-confirm" class="mb-2">
        Type <strong>DELETE</strong> to confirm
      </Label>
      <Input
        type="text"
        id="delete-confirm"
        bind:value={deleteConfirmation}
        placeholder="Type DELETE to confirm"
      />
    </div>
  </div>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showDeleteModal = false}>Cancel</Button>
      <Button color="red" disabled={deleteConfirmation !== "DELETE"}>
        <TrashBinOutline class="me-2 h-4 w-4" />
        Delete my account
      </Button>
    </div>
  {/snippet}
</Modal>
