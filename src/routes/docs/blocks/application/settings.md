---
layout: componentLayout
title: Settings Pages - Flowbite Svelte Blocks
breadcrumb_title: Settings Pages
component_title: Settings
dir: Blocks
description: Comprehensive settings page templates for user profiles, accounts, notifications, security, billing, and more
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/application/settings';
</script>

Settings pages allow users to customize their experience and manage their accounts. These components cover all aspects of user preferences, from profile information to billing and security.

## Profile settings

User profile management with avatar, bio, and personal information.

```svelte example
{#include ProfileSettings.svelte}
```

## Account settings

Core account settings including email, password, and data management.

```svelte example
{#include AccountSettings.svelte}
```

## Notification settings

Email, push, and in-app notification preferences.

```svelte example
{#include NotificationSettings.svelte}
```

## Security settings

Two-factor authentication, sessions, and login history.

```svelte example
{#include SecuritySettings.svelte}
```

## Billing settings

Subscription management, payment methods, and invoices.

```svelte example
{#include BillingSettings.svelte}
```

## Team settings

Team member management, roles, and permissions.

```svelte example
{#include TeamSettings.svelte}
```

## API settings

API key management, webhooks, and integrations.

```svelte example
{#include ApiSettings.svelte}
```

## Appearance settings

Theme selection, language, and accessibility preferences.

```svelte example
{#include AppearanceSettings.svelte}
```
