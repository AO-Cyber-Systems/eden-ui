---
layout: componentLayout
title: Authentication Pages - Flowbite Svelte Blocks
breadcrumb_title: Authentication Pages
component_title: Auth
dir: Blocks
description: Complete authentication page templates including sign in, sign up, password reset, and two-factor authentication
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/application/auth';
</script>

Authentication pages handle user identity verification. These components provide secure, accessible forms for the complete authentication flow including social login options and multi-factor authentication.

## Sign in

The primary login page with email/password form.

```svelte example
{#include SignIn.svelte}
```

## Sign up

New user registration with form validation.

```svelte example
{#include SignUp.svelte}
```

## Forgot password

Password recovery request form.

```svelte example
{#include ForgotPassword.svelte}
```

## Reset password

Form for setting a new password with confirmation.

```svelte example
{#include ResetPassword.svelte}
```

## Email verification

Page for verifying email addresses after registration.

```svelte example
{#include EmailVerification.svelte}
```

## Two-factor authentication

OTP input for second-factor verification.

```svelte example
{#include TwoFactorAuth.svelte}
```

## Social login

Sign in options with social providers (Google, GitHub, etc.).

```svelte example
{#include SocialLogin.svelte}
```

## Profile lock

Session lock screen requiring password to continue.

```svelte example
{#include ProfileLock.svelte}
```

## Account recovery

Recovery options for locked or compromised accounts.

```svelte example
{#include AccountRecovery.svelte}
```

## Auth layout

A complete authentication page layout with branding.

```svelte example
{#include AuthLayout.svelte}
```
