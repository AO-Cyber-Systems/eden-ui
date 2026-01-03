<script lang="ts">
  import { Button, Card, Badge, Modal, Input, Label, Select, Alert, Avatar } from "flowbite-svelte";
  import { UserGroupOutline, PlusOutline, EnvelopeOutline, TrashBinOutline, PencilOutline, ClockOutline, CheckCircleOutline, XCircleOutline, ShieldCheckOutline } from "flowbite-svelte-icons";

  let showInviteModal = $state(false);
  let showEditRoleModal = $state(false);
  let selectedMember = $state<any>(null);
  let inviteEmail = $state("");
  let inviteRole = $state("member");

  const teamMembers = [
    { id: 1, name: "Neil Sims", email: "neil.sims@company.com", role: "owner", avatar: "NS", status: "active", joinedAt: "Jan 2024" },
    { id: 2, name: "Bonnie Green", email: "bonnie.green@company.com", role: "admin", avatar: "BG", status: "active", joinedAt: "Mar 2024" },
    { id: 3, name: "Michael Gough", email: "michael.gough@company.com", role: "member", avatar: "MG", status: "active", joinedAt: "Jun 2024" },
    { id: 4, name: "Lana Byrd", email: "lana.byrd@company.com", role: "member", avatar: "LB", status: "active", joinedAt: "Sep 2024" },
    { id: 5, name: "Thomas Lean", email: "thomas.lean@company.com", role: "viewer", avatar: "TL", status: "active", joinedAt: "Nov 2024" }
  ];

  const pendingInvites = [
    { id: 1, email: "sarah.johnson@company.com", role: "member", sentAt: "2 days ago", expiresIn: "5 days" },
    { id: 2, email: "james.wilson@company.com", role: "admin", sentAt: "1 week ago", expiresIn: "Expired" }
  ];

  const roles = [
    { value: "owner", label: "Owner", description: "Full access to all settings and billing" },
    { value: "admin", label: "Admin", description: "Manage team members and projects" },
    { value: "member", label: "Member", description: "Access to projects and collaboration" },
    { value: "viewer", label: "Viewer", description: "View-only access to projects" }
  ];

  function getRoleBadgeColor(role: string) {
    switch (role) {
      case "owner": return "purple";
      case "admin": return "blue";
      case "member": return "green";
      case "viewer": return "gray";
      default: return "gray";
    }
  }

  function openEditRole(member: any) {
    selectedMember = member;
    showEditRoleModal = true;
  }
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Team Overview -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Team Overview</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Your team at a glance</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center justify-between">
          <div class="flex items-center gap-3">
            <div class="flex h-12 w-12 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <UserGroupOutline class="h-6 w-6 text-primary-600 dark:text-primary-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Flowbite Team</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">5 members · Pro plan</p>
            </div>
          </div>
          <Button size="sm" onclick={() => showInviteModal = true}>
            <PlusOutline class="me-2 h-4 w-4" />
            Invite
          </Button>
        </div>

        <div class="grid grid-cols-2 gap-4">
          <div class="rounded-lg bg-gray-50 p-4 text-center dark:bg-gray-800">
            <p class="text-2xl font-bold text-gray-900 dark:text-white">5</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Total members</p>
          </div>
          <div class="rounded-lg bg-gray-50 p-4 text-center dark:bg-gray-800">
            <p class="text-2xl font-bold text-gray-900 dark:text-white">2</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Pending invites</p>
          </div>
          <div class="rounded-lg bg-gray-50 p-4 text-center dark:bg-gray-800">
            <p class="text-2xl font-bold text-gray-900 dark:text-white">10</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Seats available</p>
          </div>
          <div class="rounded-lg bg-gray-50 p-4 text-center dark:bg-gray-800">
            <p class="text-2xl font-bold text-gray-900 dark:text-white">2</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Admins</p>
          </div>
        </div>

        <div class="border-t border-gray-200 pt-4 dark:border-gray-700">
          <p class="mb-3 text-sm font-medium text-gray-900 dark:text-white">Role distribution</p>
          <div class="space-y-2">
            {#each roles as role}
              {@const count = teamMembers.filter(m => m.role === role.value).length}
              <div class="flex items-center justify-between">
                <span class="text-sm text-gray-600 dark:text-gray-300">{role.label}</span>
                <span class="text-sm font-medium text-gray-900 dark:text-white">{count}</span>
              </div>
            {/each}
          </div>
        </div>
      </div>
    </Card>
  </div>

  <!-- Pending Invitations -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Pending Invitations</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Invites waiting for response</p>
    </div>

    <Card class="max-w-lg">
      {#if pendingInvites.length === 0}
        <div class="py-8 text-center">
          <EnvelopeOutline class="mx-auto h-12 w-12 text-gray-400" />
          <p class="mt-4 text-gray-500 dark:text-gray-400">No pending invitations</p>
        </div>
      {:else}
        <div class="space-y-4">
          {#each pendingInvites as invite}
            <div class="flex items-center justify-between rounded-lg border border-gray-200 p-4 dark:border-gray-700 {invite.expiresIn === 'Expired' ? 'opacity-60' : ''}">
              <div class="flex items-center gap-3">
                <div class="flex h-10 w-10 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-700">
                  <EnvelopeOutline class="h-5 w-5 text-gray-500" />
                </div>
                <div>
                  <p class="font-medium text-gray-900 dark:text-white">{invite.email}</p>
                  <div class="flex items-center gap-2 text-sm text-gray-500 dark:text-gray-400">
                    <Badge color={getRoleBadgeColor(invite.role)}>{invite.role}</Badge>
                    <span>·</span>
                    <span>Sent {invite.sentAt}</span>
                  </div>
                </div>
              </div>
              <div class="flex items-center gap-2">
                {#if invite.expiresIn === "Expired"}
                  <Badge color="red">Expired</Badge>
                  <Button size="xs" color="light">Resend</Button>
                {:else}
                  <span class="text-xs text-gray-500">Expires in {invite.expiresIn}</span>
                  <Button size="xs" color="light" class="text-red-600">
                    <XCircleOutline class="h-4 w-4" />
                  </Button>
                {/if}
              </div>
            </div>
          {/each}
        </div>
      {/if}
    </Card>
  </div>

  <!-- Team Members List -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Team Members</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Manage your team's access and roles</p>
    </div>

    <Card>
      <div class="mb-4 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
        <Input type="search" placeholder="Search members..." class="max-w-xs" />
        <Button onclick={() => showInviteModal = true}>
          <PlusOutline class="me-2 h-4 w-4" />
          Invite member
        </Button>
      </div>

      <div class="overflow-x-auto">
        <table class="w-full text-left text-sm">
          <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th class="px-4 py-3">Member</th>
              <th class="px-4 py-3">Role</th>
              <th class="px-4 py-3">Status</th>
              <th class="px-4 py-3">Joined</th>
              <th class="px-4 py-3">Actions</th>
            </tr>
          </thead>
          <tbody>
            {#each teamMembers as member}
              <tr class="border-b dark:border-gray-700">
                <td class="px-4 py-3">
                  <div class="flex items-center gap-3">
                    <div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-100 text-sm font-bold text-primary-800 dark:bg-primary-900 dark:text-primary-200">
                      {member.avatar}
                    </div>
                    <div>
                      <p class="font-medium text-gray-900 dark:text-white">{member.name}</p>
                      <p class="text-gray-500 dark:text-gray-400">{member.email}</p>
                    </div>
                  </div>
                </td>
                <td class="px-4 py-3">
                  <Badge color={getRoleBadgeColor(member.role)}>
                    {#if member.role === "owner"}
                      <ShieldCheckOutline class="me-1 h-3 w-3" />
                    {/if}
                    {member.role.charAt(0).toUpperCase() + member.role.slice(1)}
                  </Badge>
                </td>
                <td class="px-4 py-3">
                  <div class="flex items-center gap-2">
                    <div class="h-2 w-2 rounded-full bg-green-500"></div>
                    <span class="text-gray-900 dark:text-white">Active</span>
                  </div>
                </td>
                <td class="px-4 py-3 text-gray-500 dark:text-gray-400">{member.joinedAt}</td>
                <td class="px-4 py-3">
                  <div class="flex gap-2">
                    {#if member.role !== "owner"}
                      <Button size="xs" color="light" onclick={() => openEditRole(member)}>
                        <PencilOutline class="h-3 w-3" />
                      </Button>
                      <Button size="xs" color="light" class="text-red-600">
                        <TrashBinOutline class="h-3 w-3" />
                      </Button>
                    {:else}
                      <span class="text-xs text-gray-400">—</span>
                    {/if}
                  </div>
                </td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>
    </Card>
  </div>

  <!-- Role Permissions -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Role Permissions</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">What each role can do</p>
    </div>

    <Card>
      <div class="overflow-x-auto">
        <table class="w-full text-left text-sm">
          <thead class="bg-gray-50 text-xs uppercase text-gray-700 dark:bg-gray-700 dark:text-gray-400">
            <tr>
              <th class="px-4 py-3">Permission</th>
              <th class="px-4 py-3 text-center">Owner</th>
              <th class="px-4 py-3 text-center">Admin</th>
              <th class="px-4 py-3 text-center">Member</th>
              <th class="px-4 py-3 text-center">Viewer</th>
            </tr>
          </thead>
          <tbody>
            {#each [
              { name: "View projects", owner: true, admin: true, member: true, viewer: true },
              { name: "Edit projects", owner: true, admin: true, member: true, viewer: false },
              { name: "Delete projects", owner: true, admin: true, member: false, viewer: false },
              { name: "Invite members", owner: true, admin: true, member: false, viewer: false },
              { name: "Remove members", owner: true, admin: true, member: false, viewer: false },
              { name: "Manage roles", owner: true, admin: false, member: false, viewer: false },
              { name: "Billing access", owner: true, admin: false, member: false, viewer: false },
              { name: "Delete team", owner: true, admin: false, member: false, viewer: false }
            ] as permission}
              <tr class="border-b dark:border-gray-700">
                <td class="px-4 py-3 font-medium text-gray-900 dark:text-white">{permission.name}</td>
                <td class="px-4 py-3 text-center">
                  {#if permission.owner}
                    <CheckCircleOutline class="mx-auto h-5 w-5 text-green-500" />
                  {:else}
                    <XCircleOutline class="mx-auto h-5 w-5 text-gray-300" />
                  {/if}
                </td>
                <td class="px-4 py-3 text-center">
                  {#if permission.admin}
                    <CheckCircleOutline class="mx-auto h-5 w-5 text-green-500" />
                  {:else}
                    <XCircleOutline class="mx-auto h-5 w-5 text-gray-300" />
                  {/if}
                </td>
                <td class="px-4 py-3 text-center">
                  {#if permission.member}
                    <CheckCircleOutline class="mx-auto h-5 w-5 text-green-500" />
                  {:else}
                    <XCircleOutline class="mx-auto h-5 w-5 text-gray-300" />
                  {/if}
                </td>
                <td class="px-4 py-3 text-center">
                  {#if permission.viewer}
                    <CheckCircleOutline class="mx-auto h-5 w-5 text-green-500" />
                  {:else}
                    <XCircleOutline class="mx-auto h-5 w-5 text-gray-300" />
                  {/if}
                </td>
              </tr>
            {/each}
          </tbody>
        </table>
      </div>
    </Card>
  </div>
</div>

<!-- Invite Member Modal -->
<Modal bind:open={showInviteModal} size="md" title="Invite Team Member">
  <form class="space-y-4">
    <div>
      <Label for="invite-email" class="mb-2">Email address</Label>
      <Input type="email" id="invite-email" bind:value={inviteEmail} placeholder="colleague@company.com" />
    </div>

    <div>
      <Label for="invite-role" class="mb-2">Role</Label>
      <Select id="invite-role" bind:value={inviteRole}>
        {#each roles.filter(r => r.value !== "owner") as role}
          <option value={role.value}>{role.label} - {role.description}</option>
        {/each}
      </Select>
    </div>

    <Alert color="blue">
      An invitation email will be sent with a link to join your team.
    </Alert>
  </form>

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showInviteModal = false}>Cancel</Button>
      <Button disabled={!inviteEmail}>
        <EnvelopeOutline class="me-2 h-4 w-4" />
        Send invitation
      </Button>
    </div>
  {/snippet}
</Modal>

<!-- Edit Role Modal -->
<Modal bind:open={showEditRoleModal} size="md" title="Change Role">
  {#if selectedMember}
    <div class="space-y-4">
      <div class="flex items-center gap-3 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-100 text-sm font-bold text-primary-800 dark:bg-primary-900 dark:text-primary-200">
          {selectedMember.avatar}
        </div>
        <div>
          <p class="font-medium text-gray-900 dark:text-white">{selectedMember.name}</p>
          <p class="text-sm text-gray-500 dark:text-gray-400">{selectedMember.email}</p>
        </div>
      </div>

      <div>
        <Label class="mb-2">Select new role</Label>
        <div class="space-y-3">
          {#each roles.filter(r => r.value !== "owner") as role}
            <label class="flex cursor-pointer items-start gap-3 rounded-lg border p-4 {selectedMember.role === role.value ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-800'}">
              <input type="radio" name="new-role" value={role.value} checked={selectedMember.role === role.value} class="mt-1" />
              <div>
                <p class="font-medium text-gray-900 dark:text-white">{role.label}</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">{role.description}</p>
              </div>
            </label>
          {/each}
        </div>
      </div>
    </div>
  {/if}

  {#snippet footer()}
    <div class="flex justify-end gap-3">
      <Button color="light" onclick={() => showEditRoleModal = false}>Cancel</Button>
      <Button>Update role</Button>
    </div>
  {/snippet}
</Modal>
