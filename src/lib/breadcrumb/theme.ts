import { tv, type VariantProps } from "tailwind-variants";
import type { Classes } from "$lib/theme/themeUtils";

// Variants
export type BreadcrumbVariants = VariantProps<typeof breadcrumb> & Classes<typeof breadcrumb>;
export type BreadcrumbItemVariants = VariantProps<typeof breadcrumbItem> & Classes<typeof breadcrumbItem>;

export const breadcrumb = tv({
  slots: {
    base: "flex",
    list: "inline-flex items-center"
  },
  variants: {
    solid: {
      true: {
        base: "text-gray-700 border border-gray-200 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700"
      },
      false: ""
    },
    size: {
      xs: {
        list: "space-x-0.5 rtl:space-x-reverse"
      },
      sm: {
        list: "space-x-1 rtl:space-x-reverse"
      },
      md: {
        list: "space-x-1 rtl:space-x-reverse md:space-x-2"
      },
      lg: {
        list: "space-x-2 rtl:space-x-reverse md:space-x-3"
      },
      xl: {
        list: "space-x-3 rtl:space-x-reverse md:space-x-4"
      }
    }
  },
  compoundVariants: [
    // Solid + size combinations for padding
    { solid: true, size: "xs", class: { base: "px-2 py-1" } },
    { solid: true, size: "sm", class: { base: "px-3 py-2" } },
    { solid: true, size: "md", class: { base: "px-4 py-2.5" } },
    { solid: true, size: "lg", class: { base: "px-5 py-3" } },
    { solid: true, size: "xl", class: { base: "px-6 py-4" } }
  ],
  defaultVariants: {
    solid: false,
    size: "md"
  }
});

export const breadcrumbItem = tv({
  slots: {
    base: "inline-flex items-center",
    separator: "text-gray-400 rtl:-scale-x-100"
  },
  variants: {
    home: {
      true: "",
      false: ""
    },
    hasHref: {
      true: "",
      false: ""
    },
    size: {
      xs: {
        base: "text-xs",
        separator: "h-3 w-3"
      },
      sm: {
        base: "text-sm",
        separator: "h-4 w-4"
      },
      md: {
        base: "text-sm",
        separator: "h-5 w-5"
      },
      lg: {
        base: "text-base",
        separator: "h-6 w-6"
      },
      xl: {
        base: "text-lg",
        separator: "h-7 w-7"
      }
    }
  },
  compoundVariants: [
    // Home link styling (all sizes share base styling, size handles text)
    {
      home: true,
      class: {
        base: "font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white"
      }
    },
    // Home icon size adjustments
    { home: true, size: "xs", class: { separator: "me-1 h-3 w-3" } },
    { home: true, size: "sm", class: { separator: "me-1.5 h-3.5 w-3.5" } },
    { home: true, size: "md", class: { separator: "me-2 h-4 w-4" } },
    { home: true, size: "lg", class: { separator: "me-2 h-5 w-5" } },
    { home: true, size: "xl", class: { separator: "me-3 h-6 w-6" } },
    // Non-home with href
    {
      home: false,
      hasHref: true,
      class: {
        base: "font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white"
      }
    },
    // Non-home with href - size-specific margins
    { home: false, hasHref: true, size: "xs", class: { base: "ms-0.5" } },
    { home: false, hasHref: true, size: "sm", class: { base: "ms-1" } },
    { home: false, hasHref: true, size: "md", class: { base: "ms-1 md:ms-2" } },
    { home: false, hasHref: true, size: "lg", class: { base: "ms-2 md:ms-3" } },
    { home: false, hasHref: true, size: "xl", class: { base: "ms-3 md:ms-4" } },
    // Non-home without href (current page)
    {
      home: false,
      hasHref: false,
      class: {
        base: "font-medium text-gray-500 dark:text-gray-400"
      }
    },
    // Non-home without href - size-specific margins
    { home: false, hasHref: false, size: "xs", class: { base: "ms-0.5" } },
    { home: false, hasHref: false, size: "sm", class: { base: "ms-1" } },
    { home: false, hasHref: false, size: "md", class: { base: "ms-1 md:ms-2" } },
    { home: false, hasHref: false, size: "lg", class: { base: "ms-2 md:ms-3" } },
    { home: false, hasHref: false, size: "xl", class: { base: "ms-3 md:ms-4" } }
  ],
  defaultVariants: {
    size: "md"
  }
});
