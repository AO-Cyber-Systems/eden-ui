<script lang="ts">
  import { Button, Card, Badge, Modal, Input, Label, Alert, Toggle, Helper } from "flowbite-svelte";
  import { KeyOutline, PlusOutline, TrashBinOutline, ClipboardDocumentOutline, EyeOutline, EyeSlashOutline, CheckCircleOutline, ExclamationCircleOutline, ArrowPathOutline, LinkOutline } from "flowbite-svelte-icons";

  let showCreateKeyModal = $state(false);
  let showRevokeModal = $state(false);
  let showWebhookModal = $state(false);
  let selectedKey = $state<any>(null);
  let copiedKey = $state("");
  let showSecretKey = $state(false);

  const apiKeys = [
    { id: 1, name: "Production API Key", key: "sk_live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx", created: "Jan 15, 2025", lastUsed: "Today", status: "active" },
    { id: 2, name: "Development API Key", key: "sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx", created: "Dec 1, 2024", lastUsed: "2 days ago", status: "active" },
    { id: 3, name: "Legacy Integration", key: "sk_live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx", created: "Jun 10, 2024", lastUsed: "3 months ago", status: "inactive" }
  ];

  const webhooks = [
    { id: 1, url: "https://example.com/webhooks/payments", events: ["payment.succeeded", "payment.failed"], status: "active", lastTriggered: "5 min ago" },
    { id: 2, url: "https://api.myapp.com/hooks/users", events: ["user.created", "user.updated"], status: "active", lastTriggered: "1 hour ago" },
    { id: 3, url: "https://old-integration.com/webhook", events: ["all"], status: "disabled", lastTriggered: "Never" }
  ];

  const integrations = [
    { id: 1, name: "Slack", description: "Get notifications in Slack", connected: true, icon: "slack" },
    { id: 2, name: "GitHub", description: "Connect your repositories", connected: true, icon: "github" },
    { id: 3, name: "Jira", description: "Sync with Jira projects", connected: false, icon: "jira" },
    { id: 4, name: "Zapier", description: "Connect 5000+ apps", connected: false, icon: "zapier" }
  ];

  function copyToClipboard(text: string) {
    navigator.clipboard.writeText(text);
    copiedKey = text;
    setTimeout(() => copiedKey = "", 2000);
  }

  function openRevokeModal(key: any) {
    selectedKey = key;
    showRevokeModal = true;
  }

  function maskKey(key: string) {
    return key.substring(0, 7) + "•".repeat(20) + key.substring(key.length - 4);
  }
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- API Keys -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">API Keys</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage your API access tokens</p>
    </div>

    <Card>
      <div class="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <Alert color="blue" class="flex-1">
          <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
          Keep your API keys secure. Never share them in public repositories or client-side code.
        </Alert>
        <Button onclick={() => showCreateKeyModal = true}>
          <PlusOutline class="me-2 h-4 w-4" />
          Create new key
        </Button>
      </div>

      <div class="space-y-4">
        {#each apiKeys as apiKey}
          <div class="flex flex-col gap-4 rounded-lg border border-gray-200 p-4 dark:border-gray-700 sm:flex-row sm:items-center sm:justify-between">
            <div class="flex items-center gap-4">
              <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-700">
                <KeyOutline class="h-5 w-5 text-gray-500" />
              </div>
              <div>
                <div class="flex items-center gap-2">
                  <p class="font-medium text-gray-900 dark:text-white">{apiKey.name}</p>
                  <Badge color={apiKey.status === "active" ? "green" : "gray"}>
                    {apiKey.status}
                  </Badge>
                </div>
                <div class="flex items-center gap-2 font-mono text-sm text-gray-500 dark:text-gray-400">
                  <span>{maskKey(apiKey.key)}</span>
                  <button onclick={() => copyToClipboard(apiKey.key)} class="hover:text-gray-700 dark:hover:text-gray-300">
                    {#if copiedKey === apiKey.key}
                      <CheckCircleOutline class="h-4 w-4 text-green-500" />
                    {:else}
                      <ClipboardDocumentOutline class="h-4 w-4" />
                    {/if}
                  </button>
                </div>
                <p class="text-xs text-gray-400 dark:text-gray-500">
                  Created {apiKey.created} · Last used {apiKey.lastUsed}
                </p>
              </div>
            </div>
            <div class="flex gap-2">
              <Button size="xs" color="light">Edit</Button>
              <Button size="xs" color="light" class="text-red-600" onclick={() => openRevokeModal(apiKey)}>
                <TrashBinOutline class="me-1 h-3 w-3" />
                Revoke
              </Button>
            </div>
          </div>
        {/each}
      </div>
    </Card>
  </div>

  <!-- Webhooks -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Webhooks</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Configure webhook endpoints for real-time events</p>
    </div>

    <Card>
      <div class="mb-4 flex justify-end">
        <Button onclick={() => showWebhookModal = true}>
          <PlusOutline class="me-2 h-4 w-4" />
          Add endpoint
        </Button>
      </div>

      <div class="space-y-4">
        {#each webhooks as webhook}
          <div class="rounded-lg border border-gray-200 p-4 dark:border-gray-700">
            <div class="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
              <div class="flex-1">
                <div class="flex items-center gap-2">
                  <LinkOutline class="h-4 w-4 text-gray-400" />
                  <code class="text-sm text-gray-900 dark:text-white">{webhook.url}</code>
                  <Badge color={webhook.status === "active" ? "green" : "gray"}>
                    {webhook.status}
                  </Badge>
                </div>
                <div class="mt-2 flex flex-wrap gap-1">
                  {#each webhook.events as event}
                    <Badge color="gray">{event}</Badge>
                  {/each}
                </div>
                <p class="mt-2 text-xs text-gray-400 dark:text-gray-500">
                  Last triggered: {webhook.lastTriggered}
                </p>
              </div>
              <div class="flex gap-2">
                <Button size="xs" color="light">
                  <ArrowPathOutline class="me-1 h-3 w-3" />
                  Test
                </Button>
                <Button size="xs" color="light">Edit</Button>
                <Button size="xs" color="light" class="text-red-600">
                  <TrashBinOutline class="h-3 w-3" />
                </Button>
              </div>
            </div>
          </div>
        {/each}
      </div>

      <div class="mt-4 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <h4 class="mb-2 font-medium text-gray-900 dark:text-white">Webhook signing secret</h4>
        <p class="mb-3 text-sm text-gray-500 dark:text-gray-400">
          Use this secret to verify webhook signatures and ensure requests are from us.
        </p>
        <div class="flex items-center gap-2">
          <code class="flex-1 rounded bg-gray-200 px-3 py-2 font-mono text-sm dark:bg-gray-700">
            {showSecretKey ? "whsec_1234567890abcdefghijklmnopqrstuvwxyz" : "whsec_••••••••••••••••••••••••••••••••"}
          </code>
          <Button size="sm" color="light" onclick={() => showSecretKey = !showSecretKey}>
            {#if showSecretKey}
              <EyeSlashOutline class="h-4 w-4" />
            {:else}
              <EyeOutline class="h-4 w-4" />
            {/if}
          </Button>
          <Button size="sm" color="light" onclick={() => copyToClipboard("whsec_1234567890abcdefghijklmnopqrstuvwxyz")}>
            <ClipboardDocumentOutline class="h-4 w-4" />
          </Button>
        </div>
      </div>
    </Card>
  </div>

  <!-- Integrations -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Integrations</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Connect with third-party services</p>
    </div>

    <div class="grid gap-4 md:grid-cols-2">
      {#each integrations as integration}
        <Card class="max-w-none">
          <div class="flex items-center justify-between">
            <div class="flex items-center gap-4">
              <div class="flex h-12 w-12 items-center justify-center rounded-lg {integration.connected ? 'bg-primary-100 dark:bg-primary-900' : 'bg-gray-100 dark:bg-gray-700'}">
                {#if integration.icon === "slack"}
                  <svg class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M5.042 15.165a2.528 2.528 0 0 1-2.52 2.523A2.528 2.528 0 0 1 0 15.165a2.527 2.527 0 0 1 2.522-2.52h2.52v2.52zM6.313 15.165a2.527 2.527 0 0 1 2.521-2.52 2.527 2.527 0 0 1 2.521 2.52v6.313A2.528 2.528 0 0 1 8.834 24a2.528 2.528 0 0 1-2.521-2.522v-6.313zM8.834 5.042a2.528 2.528 0 0 1-2.521-2.52A2.528 2.528 0 0 1 8.834 0a2.528 2.528 0 0 1 2.521 2.522v2.52H8.834zM8.834 6.313a2.528 2.528 0 0 1 2.521 2.521 2.528 2.528 0 0 1-2.521 2.521H2.522A2.528 2.528 0 0 1 0 8.834a2.528 2.528 0 0 1 2.522-2.521h6.312zM18.956 8.834a2.528 2.528 0 0 1 2.522-2.521A2.528 2.528 0 0 1 24 8.834a2.528 2.528 0 0 1-2.522 2.521h-2.522V8.834zM17.688 8.834a2.528 2.528 0 0 1-2.523 2.521 2.527 2.527 0 0 1-2.52-2.521V2.522A2.527 2.527 0 0 1 15.165 0a2.528 2.528 0 0 1 2.523 2.522v6.312zM15.165 18.956a2.528 2.528 0 0 1 2.523 2.522A2.528 2.528 0 0 1 15.165 24a2.527 2.527 0 0 1-2.52-2.522v-2.522h2.52zM15.165 17.688a2.527 2.527 0 0 1-2.52-2.523 2.526 2.526 0 0 1 2.52-2.52h6.313A2.527 2.527 0 0 1 24 15.165a2.528 2.528 0 0 1-2.522 2.523h-6.313z"/>
                  </svg>
                {:else if integration.icon === "github"}
                  <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
                  </svg>
                {:else if integration.icon === "jira"}
                  <svg class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M11.571 11.513H0a5.218 5.218 0 0 0 5.232 5.215h2.13v2.057A5.215 5.215 0 0 0 12.575 24V12.518a1.005 1.005 0 0 0-1.004-1.005zm5.723-5.756H5.736a5.215 5.215 0 0 0 5.213 5.214h2.129v2.058a5.218 5.218 0 0 0 5.215 5.214V6.758a1.001 1.001 0 0 0-1-1.001zM23.013 0H11.455a5.215 5.215 0 0 0 5.215 5.215h2.129v2.057A5.215 5.215 0 0 0 24 12.483V1.005A1.001 1.001 0 0 0 23.013 0z"/>
                  </svg>
                {:else}
                  <svg class="h-6 w-6" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M18.014 4.003c.353 0 .694.029 1.028.081L12 13.746 4.958 4.084A6.08 6.08 0 0 1 5.986 4.003h12.028zm-15.86 2.86a6.07 6.07 0 0 0-.151 1.345v7.584c0 .462.052.912.151 1.345l6.012-6.612-6.012-3.662zm19.693 0l-6.012 3.662 6.012 6.612a6.07 6.07 0 0 0 .151-1.345V8.208c0-.462-.052-.912-.151-1.345zM12 15.57l-7.386 8.126c.323.063.656.097.986.097h12.8c.33 0 .663-.034.986-.097L12 15.57z"/>
                  </svg>
                {/if}
              </div>
              <div>
                <p class="font-medium text-gray-900 dark:text-white">{integration.name}</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">{integration.description}</p>
              </div>
            </div>
            {#if integration.connected}
              <div class="flex items-center gap-2">
                <Badge color="green">Connected</Badge>
                <Button size="xs" color="light">Configure</Button>
              </div>
            {:else}
              <Button size="sm">Connect</Button>
            {/if}
          </div>
        </Card>
      {/each}
    </div>
  </div>
</div>

<!-- Create API Key Modal -->
<Modal bind:open={showCreateKeyModal} size="md" title="Create API Key">
  <form class="space-y-4">
    <div>
      <Label for="key-name" class="mb-2">Key name</Label>
      <Input type="text" id="key-name" placeholder="e.g., Production API Key" />
      <Helper class="mt-2">A descriptive name to identify this key</Helper>
    </div>

    <div>
      <Label class="mb-2">Environment</Label>
      <div class="flex gap-4">
        <label class="flex items-center gap-2">
          <input type="radio" name="env" value="live" checked class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">Live</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="radio" name="env" value="test" class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">Test</span>
        </label>
      </div>
    </div>

    <div>
      <Label class="mb-2">Permissions</Label>
      <div class="space-y-2 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <label class="flex items-center gap-2">
          <input type="checkbox" checked class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">Read access</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="checkbox" checked class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">Write access</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">Delete access</span>
        </label>
      </div>
    </div>

    <Alert color="yellow">
      <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
      The API key will only be shown once. Make sure to copy it before closing.
    </Alert>
  </form>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showCreateKeyModal = false}>Cancel</Button>
      <Button>
        <KeyOutline class="me-2 h-4 w-4" />
        Create key
      </Button>
    </div>
  {/snippet}
</Modal>

<!-- Revoke Key Modal -->
<Modal bind:open={showRevokeModal} size="md" title="Revoke API Key">
  {#if selectedKey}
    <div class="space-y-4">
      <Alert color="red">
        <ExclamationCircleOutline class="me-2 inline h-4 w-4" />
        This action cannot be undone. Any applications using this key will stop working.
      </Alert>

      <p class="text-gray-600 dark:text-gray-300">
        Are you sure you want to revoke the API key <strong>{selectedKey.name}</strong>?
      </p>

      <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <p class="font-mono text-sm text-gray-600 dark:text-gray-300">{maskKey(selectedKey.key)}</p>
        <p class="mt-2 text-xs text-gray-400">Created: {selectedKey.created}</p>
      </div>
    </div>
  {/if}

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showRevokeModal = false}>Cancel</Button>
      <Button color="red">
        <TrashBinOutline class="me-2 h-4 w-4" />
        Revoke key
      </Button>
    </div>
  {/snippet}
</Modal>

<!-- Add Webhook Modal -->
<Modal bind:open={showWebhookModal} size="md" title="Add Webhook Endpoint">
  <form class="space-y-4">
    <div>
      <Label for="webhook-url" class="mb-2">Endpoint URL</Label>
      <Input type="url" id="webhook-url" placeholder="https://example.com/webhooks" />
    </div>

    <div>
      <Label class="mb-2">Events to send</Label>
      <div class="max-h-48 space-y-2 overflow-y-auto rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">All events</span>
        </label>
        <hr class="my-2 border-gray-200 dark:border-gray-700" />
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">payment.succeeded</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">payment.failed</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">user.created</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">user.updated</span>
        </label>
        <label class="flex items-center gap-2">
          <input type="checkbox" class="h-4 w-4 rounded border-gray-300 text-primary-600 focus:ring-primary-500" />
          <span class="text-gray-900 dark:text-white">user.deleted</span>
        </label>
      </div>
    </div>
  </form>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showWebhookModal = false}>Cancel</Button>
      <Button>
        <PlusOutline class="me-2 h-4 w-4" />
        Add endpoint
      </Button>
    </div>
  {/snippet}
</Modal>
