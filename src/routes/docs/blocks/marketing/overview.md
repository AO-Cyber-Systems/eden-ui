---
layout: componentLayout
title: Marketing UI Blocks - Flowbite Svelte
breadcrumb_title: Marketing UI
component_title: Marketing UI Overview
dir: Blocks
description: Pre-built marketing page sections including heroes, features, pricing, testimonials, and more for building landing pages
---

<script lang="ts">
  import { CompoAttributesViewer, toKebabCase } from '../../../utils';
</script>

Marketing UI blocks are pre-built page sections designed for landing pages, marketing websites, and promotional content. Each block is crafted with conversion optimization in mind and can be easily customized to match your brand.

## Available sections

### Hero Sections
Eye-catching hero sections for the top of your landing pages with various layouts and multimedia support.
- [View Hero Sections](/docs/blocks/marketing/hero)

### CTA Sections
Call-to-action sections designed to convert visitors with compelling messaging and prominent buttons.
- [View CTA Sections](/docs/blocks/marketing/cta)

### Feature Sections
Showcase your product features with icons, images, and organized layouts.
- [View Feature Sections](/docs/blocks/marketing/feature)

### Pricing Tables
Display pricing plans and subscription tiers with feature comparisons.
- [View Pricing Sections](/docs/blocks/marketing/pricing)

### Testimonials
Build trust with customer testimonials, ratings, and reviews.
- [View Testimonial Sections](/docs/blocks/marketing/testimonial)

### Team Sections
Introduce your team with profile cards and social links.
- [View Team Sections](/docs/blocks/marketing/team)

### Contact Forms
Professional contact forms with validation and support options.
- [View Contact Sections](/docs/blocks/marketing/contact)

### FAQ Sections
Organized frequently asked questions with accordion layouts.
- [View FAQ Sections](/docs/blocks/marketing/faq)

### Blog Sections
Article previews and blog listing layouts.
- [View Blog Sections](/docs/blocks/marketing/blog)

### Newsletter
Email capture forms for growing your mailing list.
- [View Newsletter Sections](/docs/blocks/marketing/newsletter)

### Headers
Responsive navigation headers with dropdowns and search.
- [View Header Sections](/docs/blocks/marketing/header)

### Footers
Professional footer layouts with navigation and social links.
- [View Footer Sections](/docs/blocks/marketing/footer)

### Banners
Announcement banners and cookie consent notices.
- [View Banner Sections](/docs/blocks/marketing/banner)

### Error Pages
404, 500, maintenance, and coming soon pages.
- [View Error Pages](/docs/blocks/marketing/error-pages)

### Customer Logos
Display trusted customer and partner logos.
- [View Customer Logos](/docs/blocks/marketing/customer-logos)

### Social Proof
User counts, ratings, and endorsements.
- [View Social Proof](/docs/blocks/marketing/social-proof)

### Portfolio
Project showcases and work samples.
- [View Portfolio Sections](/docs/blocks/marketing/portfolio)

### Content Sections
Rich content layouts with text, images, and statistics.
- [View Content Sections](/docs/blocks/marketing/content)

### Event Schedule
Conference agendas and meeting schedules.
- [View Event Schedule](/docs/blocks/marketing/event-schedule)

## Usage

All marketing blocks are built using Flowbite Svelte components and can be imported directly into your Svelte application:

```svelte
<script>
  import HeroDefault from './hero/Default.svelte';
  import CTAWithForm from './cta/WithForm.svelte';
  import PricingCards from './pricing/Cards.svelte';
</script>

<HeroDefault />
<CTAWithForm />
<PricingCards />
```

## Customization

Each block uses Tailwind CSS classes and can be customized by:
- Modifying colors using Tailwind's color palette
- Adjusting spacing with margin and padding utilities
- Changing typography with font classes
- Adding or removing sections as needed
