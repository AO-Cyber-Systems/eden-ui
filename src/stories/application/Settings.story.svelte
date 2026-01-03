<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Application/Settings',
    group: 'application'
  };
</script>

<script lang="ts">
  import ProfileSettings from '../../routes/docs-examples/blocks/application/settings/ProfileSettings.svelte';
  import AccountSettings from '../../routes/docs-examples/blocks/application/settings/AccountSettings.svelte';
  import SecuritySettings from '../../routes/docs-examples/blocks/application/settings/SecuritySettings.svelte';
  import NotificationSettings from '../../routes/docs-examples/blocks/application/settings/NotificationSettings.svelte';
  import AppearanceSettings from '../../routes/docs-examples/blocks/application/settings/AppearanceSettings.svelte';
  import BillingSettings from '../../routes/docs-examples/blocks/application/settings/BillingSettings.svelte';
  import TeamSettings from '../../routes/docs-examples/blocks/application/settings/TeamSettings.svelte';
  import ApiSettings from '../../routes/docs-examples/blocks/application/settings/ApiSettings.svelte';
</script>

<Hst.Story title="Profile Settings" layout={{ type: 'single', iframe: true }}>
  <ProfileSettings />
</Hst.Story>

<Hst.Story title="Account Settings" layout={{ type: 'single', iframe: true }}>
  <AccountSettings />
</Hst.Story>

<Hst.Story title="Security Settings" layout={{ type: 'single', iframe: true }}>
  <SecuritySettings />
</Hst.Story>

<Hst.Story title="Notification Settings" layout={{ type: 'single', iframe: true }}>
  <NotificationSettings />
</Hst.Story>

<Hst.Story title="Appearance Settings" layout={{ type: 'single', iframe: true }}>
  <AppearanceSettings />
</Hst.Story>

<Hst.Story title="Billing Settings" layout={{ type: 'single', iframe: true }}>
  <BillingSettings />
</Hst.Story>

<Hst.Story title="Team Settings" layout={{ type: 'single', iframe: true }}>
  <TeamSettings />
</Hst.Story>

<Hst.Story title="API Settings" layout={{ type: 'single', iframe: true }}>
  <ApiSettings />
</Hst.Story>
