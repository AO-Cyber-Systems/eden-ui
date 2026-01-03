<script lang="ts" module>
  import type { Hst } from '@histoire/plugin-svelte';
  export const hstMeta: Hst.Story = {
    title: 'Application/Authentication',
    group: 'application'
  };
</script>

<script lang="ts">
  import SignIn from '../../routes/docs-examples/blocks/application/auth/SignIn.svelte';
  import SignUp from '../../routes/docs-examples/blocks/application/auth/SignUp.svelte';
  import ForgotPassword from '../../routes/docs-examples/blocks/application/auth/ForgotPassword.svelte';
  import ResetPassword from '../../routes/docs-examples/blocks/application/auth/ResetPassword.svelte';
  import AccountRecovery from '../../routes/docs-examples/blocks/application/auth/AccountRecovery.svelte';
  import AuthLayout from '../../routes/docs-examples/blocks/application/auth/AuthLayout.svelte';
  import EmailVerification from '../../routes/docs-examples/blocks/application/auth/EmailVerification.svelte';
  import ProfileLock from '../../routes/docs-examples/blocks/application/auth/ProfileLock.svelte';
  import SocialLogin from '../../routes/docs-examples/blocks/application/auth/SocialLogin.svelte';
  import TwoFactorAuth from '../../routes/docs-examples/blocks/application/auth/TwoFactorAuth.svelte';
</script>

<Hst.Story title="Sign In" layout={{ type: 'single', iframe: true }}>
  <SignIn />
</Hst.Story>

<Hst.Story title="Sign Up" layout={{ type: 'single', iframe: true }}>
  <SignUp />
</Hst.Story>

<Hst.Story title="Forgot Password" layout={{ type: 'single', iframe: true }}>
  <ForgotPassword />
</Hst.Story>

<Hst.Story title="Reset Password" layout={{ type: 'single', iframe: true }}>
  <ResetPassword />
</Hst.Story>

<Hst.Story title="Account Recovery" layout={{ type: 'single', iframe: true }}>
  <AccountRecovery />
</Hst.Story>

<Hst.Story title="Auth Layout" layout={{ type: 'single', iframe: true }}>
  <AuthLayout />
</Hst.Story>

<Hst.Story title="Email Verification" layout={{ type: 'single', iframe: true }}>
  <EmailVerification />
</Hst.Story>

<Hst.Story title="Profile Lock" layout={{ type: 'single', iframe: true }}>
  <ProfileLock />
</Hst.Story>

<Hst.Story title="Social Login" layout={{ type: 'single', iframe: true }}>
  <SocialLogin />
</Hst.Story>

<Hst.Story title="Two Factor Auth" layout={{ type: 'single', iframe: true }}>
  <TwoFactorAuth />
</Hst.Story>
