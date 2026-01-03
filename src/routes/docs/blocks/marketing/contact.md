---
layout: componentLayout
title: Contact Sections - Flowbite Svelte Blocks
breadcrumb_title: Contact Sections
component_title: Contact
dir: Blocks
description: Professional contact form sections with input validation, location maps, and support information for customer inquiries
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
  const dirName = 'blocks/marketing/contact';
</script>

Contact sections enable customers to reach out with questions, feedback, or support requests. These components combine forms with contact information and visual elements for a complete communication experience.

## Default contact

A clean contact form with essential fields and a submit button.

```svelte example
{#include Default.svelte}
```

## Contact with details

Includes company contact information alongside the form.

```svelte example
{#include WithDetails.svelte}
```

## Contact with map

Features an embedded location map for physical business locations.

```svelte example
{#include WithMap.svelte}
```

## Support contact

A specialized contact form for customer support inquiries with category selection.

```svelte example
{#include Support.svelte}
```
