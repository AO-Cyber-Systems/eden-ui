# Eden UI - Marketing & Application UI Examples Plan

## Executive Summary

This document outlines the implementation plan for adding comprehensive Marketing UI and Application UI examples to Eden UI's documentation system.

**Documentation System:** mdsvex with custom preprocessor (NOT Histoire)
- Examples stored in: `/src/routes/docs-examples/`
- Documentation in: `/src/routes/docs/`
- Uses `{#include FileName.svelte}` syntax to embed examples

---

## Phase 3: Marketing UI Examples

### 3.1 Section Breakdown

| Section Category | Variations | Priority | Composed From |
|------------------|------------|----------|---------------|
| **Hero Sections** | 5-7 | High | Button, Heading, Image, Badge |
| **CTA Sections** | 5-7 | High | Button, Card, Heading |
| **Footer Sections** | 4-5 | High | Link, List, Grid layouts |
| **Feature Sections** | 5-6 | High | Card, Icon, Heading |
| **Pricing Tables** | 3-4 | High | Card, Button, Badge, List |
| **Testimonial** | 3-4 | Medium | Card, Avatar, Blockquote |
| **Content Sections** | 4-5 | Medium | Heading, Paragraph, Image |
| **FAQ Sections** | 3-4 | Medium | Accordion, Heading |
| **Team Sections** | 3-4 | Medium | Card, Avatar, SocialIcons |
| **Newsletter Sections** | 3-4 | Medium | Input, Button, Heading |
| **Customer Logos** | 2-3 | Medium | Image grid |
| **Social Proof** | 2-3 | Medium | Avatar, Badge, Stats |
| **Blog Sections** | 3-4 | Low | Card, Badge, Avatar, Heading |
| **Contact Forms** | 3-4 | Low | Input, Textarea, Button |
| **Headers/Navbar** | 3-4 | Low | Navbar, Button, Dropdown |
| **Banners** | 2-3 | Low | Alert-like, Button |
| **Portfolio** | 2-3 | Low | Card, Image, Modal |
| **Event Schedule** | 2-3 | Low | Timeline, Card |
| **404 Pages** | 2-3 | Low | Heading, Button, Image |
| **500 Pages** | 2-3 | Low | Heading, Button, Image |
| **Maintenance Pages** | 2-3 | Low | Heading, Button, Progress |

### 3.2 File Structure

```
src/routes/
├── docs/
│   └── blocks/
│       └── marketing/
│           ├── hero.md
│           ├── cta.md
│           ├── footer.md
│           ├── feature.md
│           ├── pricing.md
│           ├── testimonial.md
│           ├── content.md
│           ├── faq.md
│           ├── team.md
│           ├── newsletter.md
│           ├── logos.md
│           ├── social-proof.md
│           ├── blog.md
│           ├── contact.md
│           ├── header.md
│           ├── banner.md
│           ├── portfolio.md
│           ├── schedule.md
│           ├── 404.md
│           ├── 500.md
│           └── maintenance.md
│
└── docs-examples/
    └── blocks/
        └── marketing/
            ├── hero/
            │   ├── Default.svelte
            │   ├── WithImage.svelte
            │   ├── WithVideo.svelte
            │   ├── Centered.svelte
            │   ├── Split.svelte
            │   ├── WithBadge.svelte
            │   └── FullPage.svelte        # Full page example
            ├── cta/
            │   ├── Default.svelte
            │   ├── WithImage.svelte
            │   ├── Split.svelte
            │   ├── Centered.svelte
            │   ├── Gradient.svelte
            │   └── FullPage.svelte
            ├── footer/
            │   ├── Default.svelte
            │   ├── WithNewsletter.svelte
            │   ├── MultiColumn.svelte
            │   ├── Minimal.svelte
            │   └── FullPage.svelte
            └── ... (similar pattern for all sections)
```

### 3.3 Individual Section Component Pattern

Each section example should be:
1. **Self-contained** - Works as a standalone section
2. **Themed** - Uses Eden UI theming system
3. **Responsive** - Mobile-first design
4. **Accessible** - ARIA labels, keyboard navigation
5. **Customizable** - Props for colors, variants

Example structure for a Hero section:

```svelte
<!-- src/routes/docs-examples/blocks/marketing/hero/Default.svelte -->
<script lang="ts">
  import { Button, Heading, Badge } from "flowbite-svelte";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 text-center lg:py-16">
    <Badge class="mb-4">New</Badge>
    <Heading tag="h1" class="mb-4">
      We invest in the world's potential
    </Heading>
    <p class="mb-8 text-lg text-gray-500 dark:text-gray-400 sm:px-16 lg:px-48">
      Here at Flowbite we focus on markets where technology, innovation,
      and capital can unlock long-term value and drive economic growth.
    </p>
    <div class="flex flex-col gap-4 sm:flex-row sm:justify-center">
      <Button size="lg">Get started</Button>
      <Button size="lg" color="alternative">Learn more</Button>
    </div>
  </div>
</section>
```

### 3.4 Full Page Example Pattern

Full page examples combine multiple sections:

```svelte
<!-- src/routes/docs-examples/blocks/marketing/hero/FullPage.svelte -->
<script lang="ts">
  import Default from "./Default.svelte";
  import CustomerLogos from "../logos/Default.svelte";
  import Features from "../feature/Default.svelte";
  import CTA from "../cta/Default.svelte";
  import Footer from "../footer/Default.svelte";
</script>

<div class="min-h-screen">
  <Default />
  <CustomerLogos />
  <Features />
  <CTA />
  <Footer />
</div>
```

---

## Phase 4: Application UI Examples

### 4.1 Section Breakdown

| Section Category | Variations | Priority | Composed From |
|------------------|------------|----------|---------------|
| **Dashboard Widgets** | 5-6 | High | Card, Chart, Stats |
| **CRUD Create** | 4-5 | High | Form, Modal, Drawer, Button |
| **CRUD Read** | 4-5 | High | Table, Modal, Drawer, Card |
| **CRUD Update** | 3-4 | High | Form, Modal, Drawer |
| **CRUD Delete** | 2-3 | High | Modal, Button, Alert |
| **Table Headers** | 3-4 | High | Input, Button, Dropdown |
| **Advanced Tables** | 4-5 | High | Table, Pagination, Checkbox |
| **Sidebar Navigation** | 4-5 | High | Sidebar, Dropdown, Badge |
| **Dashboard Footers** | 2-3 | Medium | Footer, Link, Badge |
| **Faceted Search** | 3-4 | Medium | Checkbox, Range, Drawer |
| **Dropdown Filters** | 3-4 | Medium | Dropdown, Checkbox, Button |
| **Settings Pages** | 4-5 | Medium | Form, Toggle, Card |
| **Profile Pages** | 3-4 | Medium | Avatar, Form, Card |
| **Auth: Login** | 3-4 | Medium | Form, Button, Checkbox |
| **Auth: Register** | 3-4 | Medium | Form, Button, Checkbox |
| **Auth: Reset Password** | 2-3 | Medium | Form, Button |
| **Auth: Account Recovery** | 2-3 | Low | Form, Button |
| **Kanban Board** | 2-3 | Low | Card, Drag-drop |
| **Calendar Views** | 2-3 | Low | Card, Grid |
| **Notification Center** | 2-3 | Low | Dropdown, Card, Badge |

### 4.2 File Structure

```
src/routes/
├── docs/
│   └── blocks/
│       └── application/
│           ├── dashboard-widgets.md
│           ├── crud-create.md
│           ├── crud-read.md
│           ├── crud-update.md
│           ├── crud-delete.md
│           ├── table-headers.md
│           ├── advanced-tables.md
│           ├── sidebar-navigation.md
│           ├── dashboard-footers.md
│           ├── faceted-search.md
│           ├── dropdown-filters.md
│           ├── settings.md
│           ├── profile.md
│           ├── auth-login.md
│           ├── auth-register.md
│           ├── auth-reset.md
│           └── kanban.md
│
└── docs-examples/
    └── blocks/
        └── application/
            ├── dashboard/
            │   ├── StatsCards.svelte
            │   ├── ChartWidget.svelte
            │   ├── ActivityFeed.svelte
            │   ├── QuickActions.svelte
            │   └── FullDashboard.svelte
            ├── crud/
            │   ├── create/
            │   │   ├── FormInDrawer.svelte
            │   │   ├── FormInModal.svelte
            │   │   ├── MultiStepForm.svelte
            │   │   └── InlineCreate.svelte
            │   ├── read/
            │   │   ├── TableWithDrawer.svelte
            │   │   ├── TableWithModal.svelte
            │   │   ├── CardGrid.svelte
            │   │   └── DetailView.svelte
            │   ├── update/
            │   │   ├── EditInDrawer.svelte
            │   │   ├── EditInModal.svelte
            │   │   └── InlineEdit.svelte
            │   └── delete/
            │       ├── ConfirmModal.svelte
            │       ├── BulkDelete.svelte
            │       └── SoftDelete.svelte
            ├── tables/
            │   ├── WithSearch.svelte
            │   ├── WithFilters.svelte
            │   ├── WithBulkActions.svelte
            │   ├── Sortable.svelte
            │   └── AdvancedTable.svelte
            ├── auth/
            │   ├── login/
            │   │   ├── Default.svelte
            │   │   ├── WithSocial.svelte
            │   │   ├── SplitScreen.svelte
            │   │   └── FullPage.svelte
            │   ├── register/
            │   │   ├── Default.svelte
            │   │   ├── MultiStep.svelte
            │   │   └── FullPage.svelte
            │   └── reset/
            │       ├── RequestReset.svelte
            │       ├── EnterCode.svelte
            │       └── NewPassword.svelte
            └── settings/
                ├── GeneralSettings.svelte
                ├── ProfileSettings.svelte
                ├── NotificationSettings.svelte
                └── FullSettingsPage.svelte
```

---

## Implementation Strategy

### Step 1: Create Documentation Structure (Day 1)

1. Create `/src/routes/docs/blocks/` directory
2. Create `/src/routes/docs/blocks/marketing/` subdirectory
3. Create `/src/routes/docs/blocks/application/` subdirectory
4. Create corresponding `/src/routes/docs-examples/blocks/` structure

### Step 2: Marketing UI - High Priority (Days 2-4)

**Order of implementation:**

1. **Hero Sections** (5-7 variants)
   - Default centered
   - With image (left/right)
   - With video background
   - Split layout
   - With announcement badge
   - Full page combo

2. **CTA Sections** (5-7 variants)
   - Simple centered
   - With image
   - Split layout
   - Gradient background
   - With form
   - Full page combo

3. **Footer Sections** (4-5 variants)
   - Simple with links
   - Multi-column
   - With newsletter
   - Minimal
   - Full page combo

4. **Feature Sections** (5-6 variants)
   - Icon grid
   - With images
   - Alternating layout
   - Cards
   - Timeline style
   - Full page combo

5. **Pricing Tables** (3-4 variants)
   - Three-tier cards
   - Comparison table
   - With toggle (monthly/yearly)
   - Enterprise

### Step 3: Marketing UI - Medium Priority (Days 5-6)

6. Testimonial sections
7. Content sections
8. FAQ sections
9. Team sections
10. Newsletter sections
11. Customer logos
12. Social proof

### Step 4: Marketing UI - Low Priority (Day 7)

13. Blog sections
14. Contact forms
15. Headers
16. Banners
17. Portfolio
18. Event schedule
19. Error pages (404, 500)
20. Maintenance pages

### Step 5: Application UI - High Priority (Days 8-10)

1. **Dashboard Widgets**
2. **CRUD Operations** (Create, Read, Update, Delete)
3. **Table Headers**
4. **Advanced Tables**
5. **Sidebar Navigation**

### Step 6: Application UI - Medium/Low Priority (Days 11-12)

6. Dashboard footers
7. Faceted search
8. Dropdown filters
9. Settings pages
10. Profile pages
11. Auth pages (Login, Register, Reset)

---

## Naming Conventions

### Example Files
- Use PascalCase: `Default.svelte`, `WithImage.svelte`
- Use descriptive names: `SplitScreen.svelte`, `ThreeTierPricing.svelte`
- Full page examples: `FullPage.svelte` or `Complete.svelte`

### Documentation Files
- Use kebab-case: `hero.md`, `cta.md`, `pricing-tables.md`
- Match Flowbite Blocks naming where possible

### Component Sections
- Wrap in `<section>` tags
- Use semantic class names
- Include `aria-label` for accessibility

---

## Quality Checklist

For each section example:

- [ ] Works standalone
- [ ] Responsive (mobile, tablet, desktop)
- [ ] Dark mode support
- [ ] Uses Eden UI components (not raw HTML)
- [ ] Follows Eden UI theming patterns
- [ ] Accessible (ARIA, keyboard nav)
- [ ] Documented with markdown
- [ ] Has full page example variant

---

## Estimated Totals

| Category | Section Types | Individual Examples | Full Page Examples |
|----------|---------------|--------------------|--------------------|
| Marketing UI | 21 | ~70-85 | 21 |
| Application UI | 17 | ~55-65 | 17 |
| **Total** | **38** | **~125-150** | **38** |

---

## Notes

1. **Not Histoire**: This project uses mdsvex, not Histoire. All examples follow the `{#include}` pattern.

2. **Existing Landing Components**: The `/src/routes/landing/` folder has Hero, CTA, Featured, etc. that can be referenced/adapted.

3. **Flowbite Svelte Blocks**: Reference https://flowbite-svelte.com/blocks for patterns, but adapt to Eden UI's enhanced theming.

4. **Theming**: All examples should use Eden UI's 20-color palette and size variants where applicable.
