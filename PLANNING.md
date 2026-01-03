# Eden UI - Forking Strategy

## Overview

Eden UI is AO Cyber Systems' fork of the flowbite-svelte component library. This document outlines the forking strategy, what has been completed, and what remains to be done.

## Completed Work

### Phase 1: Core Library Transformation

- **Package renamed** from `flowbite-svelte` to `eden-ui`
- **Local Tailwind plugins** created (`eden-plugin.cjs`, `eden-typography.cjs`)
- **Removed Flowbite dependency** - all plugin functionality is now self-contained
- **Updated branding** - logos, navigation, documentation
- **Removed unused routes** - `/blocks`, `/admin-dashboard`, `/illustrations`
- **Build verified** - both library package and documentation site build successfully

### Phase 2: Icons

- **Created icons re-export module** at `src/lib/icons/index.ts`
- **Added `eden-icons` alias** in Vite config for gradual migration
- **Package export added** for `eden-ui/icons`
- Currently re-exports from `flowbite-svelte-icons` for compatibility

### Phase 3: Documentation

- **Updated key documentation pages**:
  - `introduction.md` - Eden UI branding and installation
  - `quickstart.md` - Quick start guide
  - `how-to-contribute.md` - Contributing guidelines
  - `license.md` - MIT License with acknowledgements
- **Updated navigation** in `FlowbiteSvelteLayout.svelte`
- **Updated sitemap** to use `eden-ui.dev` domain

### Phase 4: Scope Clarification

- **Removed SaaS modules** - Server-side features don't belong in a UI library
- Eden UI is now a **pure UI component library**
- SaaS features (auth, subscriptions, database) should live in `eden-app-framework`

## Remaining Work

### Phase 5: Fork Plugin Packages

The following @flowbite-svelte-plugins packages need to be forked to ao-cyber-systems:

| Original Package | Fork Target | Status |
|-----------------|-------------|--------|
| `@flowbite-svelte-plugins/chart` | `@eden-ui/chart` | Pending |
| `@flowbite-svelte-plugins/datatable` | `@eden-ui/datatable` | Pending |
| `@flowbite-svelte-plugins/texteditor` | `@eden-ui/texteditor` | Pending |

**Fork Process:**
1. Fork repository from themesberg org
2. Rename package in package.json
3. Update dependencies to use `eden-ui` instead of `flowbite-svelte`
4. Update documentation branding
5. Publish to npm under @eden-ui scope

### Phase 6: Icons Package (Optional)

The `flowbite-svelte-icons` package can be forked if custom icons are needed:

| Original Package | Fork Target | Status |
|-----------------|-------------|--------|
| `flowbite-svelte-icons` | `@eden-ui/icons` | Optional |

The current re-export strategy allows gradual migration without breaking changes.

### Remaining Documentation Updates

Many component documentation files still reference "Flowbite Svelte" and need updating:

```bash
# Files with Flowbite references (run to get current count)
grep -r "Flowbite" src/routes/docs --include="*.md" | wc -l
```

**Priority:**
- Low priority - component functionality is correct
- Update as part of ongoing maintenance

## Package Structure

```
eden-ui/
├── dist/                    # Built library
│   ├── index.js             # Main entry
│   ├── icons/               # Icons re-export
│   └── tailwind-plugin/     # Tailwind plugins
├── src/lib/                 # Source
│   ├── components/          # UI components
│   ├── icons/               # Icons module
│   └── tailwind-plugin/     # Plugins
└── package.json
```

## Exports Available

```typescript
// Main export
import { Button, Card, Modal } from "eden-ui";

// Icons namespace
import { Icons } from "eden-ui";
// or direct
import { ArrowRightOutline } from "eden-ui/icons";

// Tailwind plugins
@plugin "eden-ui/plugins/eden-plugin"
@plugin "eden-ui/plugins/eden-typography"
```

## Peer Dependencies

Required:
- `svelte` ^5.40.0
- `tailwindcss` ^4.1.4
- `@sveltejs/kit` ^2.0.0

## Development Commands

```bash
# Install dependencies
pnpm install

# Development server
pnpm dev

# Build documentation site
pnpm build

# Build library package
pnpm package

# Run tests
pnpm test:unit
pnpm test:e2e

# Type checking
pnpm check

# Lint and format
pnpm lint
pnpm format
```

## Migration Guide for Consumers

### From flowbite-svelte to eden-ui

```diff
- import { Button, Card } from "flowbite-svelte";
+ import { Button, Card } from "eden-ui";

- @plugin "flowbite/plugin"
+ @plugin "eden-ui/plugins/eden-plugin"

- @source "../node_modules/flowbite-svelte/dist"
+ @source "../node_modules/eden-ui/dist"
```

### CSS Configuration

```css
@import "tailwindcss";
@plugin "eden-ui/plugins/eden-plugin";
@custom-variant dark (&:where(.dark, .dark *));
@source "../node_modules/eden-ui/dist";
```

## Acknowledgements

Eden UI is built upon the excellent work of:
- [Flowbite Svelte](https://github.com/themesberg/flowbite-svelte)
- [Flowbite](https://flowbite.com)
- [Tailwind CSS](https://tailwindcss.com)
