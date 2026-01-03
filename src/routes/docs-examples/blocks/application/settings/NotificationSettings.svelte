<script lang="ts">
  import { Button, Card, Toggle, Radio, Helper, Badge } from "flowbite-svelte";
  import { BellOutline, EnvelopeOutline, DevicePhoneMobileOutline, DesktopPcOutline, ChatBubbleLeftOutline, UserGroupOutline, MegaphoneOutline, CogOutline } from "flowbite-svelte-icons";

  // Email notifications
  let emailMarketing = $state(true);
  let emailUpdates = $state(true);
  let emailSecurity = $state(true);
  let emailDigest = $state("weekly");

  // Push notifications
  let pushMessages = $state(true);
  let pushMentions = $state(true);
  let pushComments = $state(false);
  let pushFollowers = $state(true);

  // Desktop notifications
  let desktopEnabled = $state(true);
  let desktopSound = $state(true);

  // Mobile notifications
  let mobileEnabled = $state(true);
  let mobileBadge = $state(true);
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Email Notifications -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Email Notifications</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage what emails you receive</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
            <EnvelopeOutline class="h-5 w-5 text-primary-600 dark:text-primary-400" />
          </div>
          <div>
            <p class="font-medium text-gray-900 dark:text-white">Email preferences</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">neil.sims@company.com</p>
          </div>
        </div>

        <div class="space-y-4 border-t border-gray-200 pt-6 dark:border-gray-700">
          <div class="flex items-center justify-between">
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Marketing emails</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Product updates, tips, and offers</p>
            </div>
            <Toggle bind:checked={emailMarketing} />
          </div>

          <div class="flex items-center justify-between">
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Product updates</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">New features and improvements</p>
            </div>
            <Toggle bind:checked={emailUpdates} />
          </div>

          <div class="flex items-center justify-between">
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Security alerts</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Important security notifications</p>
            </div>
            <Toggle bind:checked={emailSecurity} />
          </div>
        </div>

        <div class="border-t border-gray-200 pt-6 dark:border-gray-700">
          <p class="mb-4 font-medium text-gray-900 dark:text-white">Email digest frequency</p>
          <div class="space-y-3">
            <label class="flex cursor-pointer items-center gap-3">
              <Radio name="digest" value="daily" bind:group={emailDigest} />
              <div>
                <p class="text-gray-900 dark:text-white">Daily digest</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Get a summary every day</p>
              </div>
            </label>
            <label class="flex cursor-pointer items-center gap-3">
              <Radio name="digest" value="weekly" bind:group={emailDigest} />
              <div>
                <p class="text-gray-900 dark:text-white">Weekly digest</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Get a summary every week</p>
              </div>
            </label>
            <label class="flex cursor-pointer items-center gap-3">
              <Radio name="digest" value="never" bind:group={emailDigest} />
              <div>
                <p class="text-gray-900 dark:text-white">Never</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Don't send digest emails</p>
              </div>
            </label>
          </div>
        </div>
      </div>
    </Card>
  </div>

  <!-- Push Notifications -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Push Notifications</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Control in-app notifications</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-purple-100 dark:bg-purple-900">
            <BellOutline class="h-5 w-5 text-purple-600 dark:text-purple-400" />
          </div>
          <div>
            <p class="font-medium text-gray-900 dark:text-white">Push notifications</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Real-time alerts</p>
          </div>
        </div>

        <div class="space-y-4 border-t border-gray-200 pt-6 dark:border-gray-700">
          <div class="flex items-center justify-between">
            <div class="flex items-center gap-3">
              <ChatBubbleLeftOutline class="h-5 w-5 text-gray-400" />
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Direct messages</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">When someone sends you a message</p>
              </div>
            </div>
            <Toggle bind:checked={pushMessages} />
          </div>

          <div class="flex items-center justify-between">
            <div class="flex items-center gap-3">
              <MegaphoneOutline class="h-5 w-5 text-gray-400" />
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Mentions</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">When someone mentions you</p>
              </div>
            </div>
            <Toggle bind:checked={pushMentions} />
          </div>

          <div class="flex items-center justify-between">
            <div class="flex items-center gap-3">
              <ChatBubbleLeftOutline class="h-5 w-5 text-gray-400" />
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Comments</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">When someone comments on your posts</p>
              </div>
            </div>
            <Toggle bind:checked={pushComments} />
          </div>

          <div class="flex items-center justify-between">
            <div class="flex items-center gap-3">
              <UserGroupOutline class="h-5 w-5 text-gray-400" />
              <div>
                <p class="font-medium text-gray-900 dark:text-white">New followers</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">When someone follows you</p>
              </div>
            </div>
            <Toggle bind:checked={pushFollowers} />
          </div>
        </div>
      </div>
    </Card>
  </div>

  <!-- Desktop Notifications -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Desktop Notifications</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Browser notification settings</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-100 dark:bg-blue-900">
              <DesktopPcOutline class="h-5 w-5 text-blue-600 dark:text-blue-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Desktop notifications</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Show notifications in browser</p>
            </div>
          </div>
          <Toggle bind:checked={desktopEnabled} />
        </div>

        {#if desktopEnabled}
          <div class="space-y-4 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Notification sound</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Play sound with notifications</p>
              </div>
              <Toggle bind:checked={desktopSound} />
            </div>

            <div class="pt-2">
              <Button color="light" size="sm">
                <BellOutline class="me-2 h-4 w-4" />
                Test notification
              </Button>
            </div>
          </div>
        {/if}

        <div class="rounded-lg border border-yellow-200 bg-yellow-50 p-4 dark:border-yellow-800 dark:bg-yellow-900/30">
          <p class="text-sm text-yellow-800 dark:text-yellow-300">
            <strong>Note:</strong> You may need to allow notifications in your browser settings.
          </p>
        </div>
      </div>
    </Card>
  </div>

  <!-- Mobile Notifications -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Mobile Notifications</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Mobile app notification settings</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900">
              <DevicePhoneMobileOutline class="h-5 w-5 text-green-600 dark:text-green-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Mobile notifications</p>
              <div class="flex items-center gap-2">
                <Badge color="green">Connected</Badge>
                <span class="text-sm text-gray-500 dark:text-gray-400">iPhone 14 Pro</span>
              </div>
            </div>
          </div>
          <Toggle bind:checked={mobileEnabled} />
        </div>

        {#if mobileEnabled}
          <div class="space-y-4 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Badge count</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Show unread count on app icon</p>
              </div>
              <Toggle bind:checked={mobileBadge} />
            </div>
          </div>
        {/if}

        <div class="border-t border-gray-200 pt-4 dark:border-gray-700">
          <p class="mb-3 text-sm text-gray-500 dark:text-gray-400">Connected devices</p>
          <div class="space-y-3">
            <div class="flex items-center justify-between">
              <div class="flex items-center gap-3">
                <DevicePhoneMobileOutline class="h-5 w-5 text-gray-400" />
                <div>
                  <p class="text-sm font-medium text-gray-900 dark:text-white">iPhone 14 Pro</p>
                  <p class="text-xs text-gray-500 dark:text-gray-400">Last active: Today</p>
                </div>
              </div>
              <Button size="xs" color="light">Remove</Button>
            </div>
            <div class="flex items-center justify-between">
              <div class="flex items-center gap-3">
                <DevicePhoneMobileOutline class="h-5 w-5 text-gray-400" />
                <div>
                  <p class="text-sm font-medium text-gray-900 dark:text-white">iPad Pro</p>
                  <p class="text-xs text-gray-500 dark:text-gray-400">Last active: 3 days ago</p>
                </div>
              </div>
              <Button size="xs" color="light">Remove</Button>
            </div>
          </div>
        </div>
      </div>
    </Card>
  </div>

  <!-- Quiet Hours -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Quiet Hours</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Schedule notification-free time</p>
    </div>

    <Card>
      <div class="grid gap-6 md:grid-cols-2">
        <div>
          <h4 class="mb-4 font-medium text-gray-900 dark:text-white">Set quiet hours</h4>
          <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
            During quiet hours, notifications will be silenced. You can still check them manually.
          </p>

          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <p class="font-medium text-gray-900 dark:text-white">Enable quiet hours</p>
              <Toggle />
            </div>

            <div class="grid grid-cols-2 gap-4">
              <div>
                <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white">Start time</label>
                <input
                  type="time"
                  value="22:00"
                  class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                />
              </div>
              <div>
                <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white">End time</label>
                <input
                  type="time"
                  value="07:00"
                  class="block w-full rounded-lg border border-gray-300 bg-gray-50 p-2.5 text-sm text-gray-900 focus:border-primary-500 focus:ring-primary-500 dark:border-gray-600 dark:bg-gray-700 dark:text-white"
                />
              </div>
            </div>
          </div>
        </div>

        <div class="rounded-lg bg-gray-50 p-6 dark:bg-gray-800">
          <h4 class="mb-4 font-medium text-gray-900 dark:text-white">Exceptions</h4>
          <p class="mb-4 text-sm text-gray-500 dark:text-gray-400">
            These notifications will always come through, even during quiet hours.
          </p>
          <div class="space-y-3">
            <label class="flex cursor-pointer items-center gap-3">
              <input type="checkbox" checked class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
              <span class="text-gray-900 dark:text-white">Security alerts</span>
            </label>
            <label class="flex cursor-pointer items-center gap-3">
              <input type="checkbox" checked class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
              <span class="text-gray-900 dark:text-white">Direct messages from favorites</span>
            </label>
            <label class="flex cursor-pointer items-center gap-3">
              <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
              <span class="text-gray-900 dark:text-white">Calendar reminders</span>
            </label>
          </div>
        </div>
      </div>

      <div class="mt-6 flex justify-end gap-3 border-t border-gray-200 pt-6 dark:border-gray-700">
        <Button color="light">Reset to defaults</Button>
        <Button>Save preferences</Button>
      </div>
    </Card>
  </div>
</div>
