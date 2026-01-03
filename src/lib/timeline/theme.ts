import { tv, type VariantProps } from "tailwind-variants";
import type { Classes } from "$lib/theme/themeUtils";

// Variants
export type TimelineVariants = VariantProps<typeof timeline>;
export type ActivityItemVariants = VariantProps<typeof activityItem> & Classes<typeof activityItem>;
export type GroupVariants = VariantProps<typeof group> & Classes<typeof group>;
export type GroupItemVariants = VariantProps<typeof groupItem> & Classes<typeof groupItem>;
export type TimelineItemVariants = VariantProps<typeof timelineItem> & Classes<typeof timelineItem>;

export const activity = tv({
  base: "relative border-s border-gray-200 dark:border-gray-700"
});

export const activityItem = tv({
  slots: {
    li: "mb-10 ms-6",
    span: "flex absolute -start-3 justify-center items-center w-6 h-6 bg-blue-200 rounded-full ring-8 ring-white dark:ring-gray-900 dark:bg-blue-900",
    img: "rounded-full shadow-lg",
    outer: "p-4 bg-white rounded-lg border border-gray-200 shadow-xs dark:bg-gray-700 dark:border-gray-600",
    inner: "justify-between items-center mb-3 sm:flex",
    time: "mb-1 text-xs font-normal text-gray-400 sm:order-last sm:mb-0",
    title: "text-sm font-normal text-gray-500 lex dark:text-gray-300",
    text: "p-3 text-xs italic font-normal text-gray-500 bg-gray-50 rounded-lg border border-gray-200 dark:bg-gray-600 dark:border-gray-500 dark:text-gray-300"
  }
});

export const group = tv({
  slots: {
    div: "p-5 mb-4 bg-gray-50 rounded-lg border border-gray-100 dark:bg-gray-800 dark:border-gray-700",
    time: "text-lg font-semibold text-gray-900 dark:text-white",
    ol: "mt-3 divide-y divider-gray-200 dark:divide-gray-700"
  }
});

export const groupItem = tv({
  slots: {
    base: "",
    a: "block items-center p-3 sm:flex hover:bg-gray-100 dark:hover:bg-gray-700",
    img: "me-3 mb-3 w-12 h-12 rounded-full sm:mb-0",
    div: "text-gray-600 dark:text-gray-400",
    title: "text-base font-normal",
    span: "inline-flex items-center bg-gray-100 border border-gray-200 text-xs font-medium px-1.5 py-0.5 rounded",
    svg: "me-1 h-3 w-3"
  }
});

const colorVariants = {
  primary: {
    dot: "bg-primary-200 dark:bg-primary-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-primary-600 dark:text-primary-400",
    connectorBg: "bg-primary-200 dark:bg-primary-700"
  },
  secondary: {
    dot: "bg-secondary-200 dark:bg-secondary-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-secondary-600 dark:text-secondary-400",
    connectorBg: "bg-secondary-200 dark:bg-secondary-700"
  },
  gray: {
    dot: "bg-gray-200 dark:bg-gray-700",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-gray-600 dark:text-gray-400",
    connectorBg: "bg-gray-200 dark:bg-gray-700"
  },
  red: {
    dot: "bg-red-200 dark:bg-red-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-red-600 dark:text-red-400",
    connectorBg: "bg-red-200 dark:bg-red-700"
  },
  orange: {
    dot: "bg-orange-200 dark:bg-orange-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-orange-600 dark:text-orange-400",
    connectorBg: "bg-orange-200 dark:bg-orange-700"
  },
  amber: {
    dot: "bg-amber-200 dark:bg-amber-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-amber-600 dark:text-amber-400",
    connectorBg: "bg-amber-200 dark:bg-amber-700"
  },
  yellow: {
    dot: "bg-yellow-200 dark:bg-yellow-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-yellow-600 dark:text-yellow-400",
    connectorBg: "bg-yellow-200 dark:bg-yellow-700"
  },
  lime: {
    dot: "bg-lime-200 dark:bg-lime-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-lime-600 dark:text-lime-400",
    connectorBg: "bg-lime-200 dark:bg-lime-700"
  },
  green: {
    dot: "bg-green-200 dark:bg-green-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-green-600 dark:text-green-400",
    connectorBg: "bg-green-200 dark:bg-green-700"
  },
  emerald: {
    dot: "bg-emerald-200 dark:bg-emerald-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-emerald-600 dark:text-emerald-400",
    connectorBg: "bg-emerald-200 dark:bg-emerald-700"
  },
  teal: {
    dot: "bg-teal-200 dark:bg-teal-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-teal-600 dark:text-teal-400",
    connectorBg: "bg-teal-200 dark:bg-teal-700"
  },
  cyan: {
    dot: "bg-cyan-200 dark:bg-cyan-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-cyan-600 dark:text-cyan-400",
    connectorBg: "bg-cyan-200 dark:bg-cyan-700"
  },
  sky: {
    dot: "bg-sky-200 dark:bg-sky-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-sky-600 dark:text-sky-400",
    connectorBg: "bg-sky-200 dark:bg-sky-700"
  },
  blue: {
    dot: "bg-blue-200 dark:bg-blue-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-blue-600 dark:text-blue-400",
    connectorBg: "bg-blue-200 dark:bg-blue-700"
  },
  indigo: {
    dot: "bg-indigo-200 dark:bg-indigo-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-indigo-600 dark:text-indigo-400",
    connectorBg: "bg-indigo-200 dark:bg-indigo-700"
  },
  violet: {
    dot: "bg-violet-200 dark:bg-violet-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-violet-600 dark:text-violet-400",
    connectorBg: "bg-violet-200 dark:bg-violet-700"
  },
  purple: {
    dot: "bg-purple-200 dark:bg-purple-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-purple-600 dark:text-purple-400",
    connectorBg: "bg-purple-200 dark:bg-purple-700"
  },
  fuchsia: {
    dot: "bg-fuchsia-200 dark:bg-fuchsia-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-fuchsia-600 dark:text-fuchsia-400",
    connectorBg: "bg-fuchsia-200 dark:bg-fuchsia-700"
  },
  pink: {
    dot: "bg-pink-200 dark:bg-pink-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-pink-600 dark:text-pink-400",
    connectorBg: "bg-pink-200 dark:bg-pink-700"
  },
  rose: {
    dot: "bg-rose-200 dark:bg-rose-900",
    ring: "ring-white dark:ring-gray-900",
    icon: "text-rose-600 dark:text-rose-400",
    connectorBg: "bg-rose-200 dark:bg-rose-700"
  }
};

export const timeline = tv({
  variants: {
    order: {
      group: "p-5 mb-4 bg-gray-50 rounded-lg border border-gray-100 dark:bg-gray-800 dark:border-gray-700",
      horizontal: "sm:flex",
      activity: "relative",
      vertical: "relative",
      default: "relative border-s border-gray-200 dark:border-gray-700"
    }
  },
  defaultVariants: {
    order: "default"
  }
});

export const timelineItem = tv({
  slots: {
    base: "relative",
    div: "",
    defaultDiv: "absolute w-2 h-2 bg-gray-200 rounded-full mt-1.5 -start-5 border border-buffer",
    time: "",
    h3: "",
    svg: "w-4 h-4",
    connector: "absolute top-6 left-3 w-px h-full"
  },
  variants: {
    order: {
      default: {
        base: "mb-10 ms-4",
        div: "absolute w-3 h-3 bg-gray-200 rounded-full mt-1.5 -left-1.5 border border-white dark:border-gray-900 dark:bg-gray-700",
        time: "mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500",
        h3: "text-lg font-semibold text-gray-900 dark:text-white"
      },
      vertical: {
        base: "mb-10 ms-6 relative",
        div: "flex absolute -left-4 top-1.5 justify-center items-center w-6 h-6 rounded-full ring-8",
        time: "mb-1 pl-4 text-sm font-normal leading-none text-gray-400 dark:text-gray-500",
        h3: "flex ml-4 items-center mb-1 text-lg font-semibold text-gray-900 dark:text-white",
        connector: "absolute top-7 -left-1.5 w-px h-full"
      },
      horizontal: {
        base: "relative mb-6 sm:mb-0",
        div: "flex items-center",
        time: "mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500",
        h3: "text-lg font-semibold text-gray-900 dark:text-white"
      },
      activity: {
        base: "mb-10 ms-6 relative",
        div: "flex absolute -left-4 top-1.5 justify-center items-center w-6 h-6 rounded-full ring-8",
        time: "mb-1 text-sm font-normal leading-none text-gray-400 dark:text-gray-500",
        h3: "text-lg font-semibold text-gray-900 dark:text-white",
        connector: "absolute top-7 -left-4 w-px h-full"
      },
      group: {
        base: "",
        div: "p-5 mb-4 bg-gray-50 rounded-lg border border-gray-100 dark:bg-gray-800 dark:border-gray-700",
        time: "text-lg font-semibold text-gray-900 dark:text-white",
        h3: "text-lg font-semibold text-gray-900 dark:text-white"
      }
    },
    color: {
      primary: {},
      secondary: {},
      gray: {},
      red: {},
      orange: {},
      amber: {},
      yellow: {},
      lime: {},
      green: {},
      emerald: {},
      teal: {},
      cyan: {},
      sky: {},
      blue: {},
      indigo: {},
      violet: {},
      purple: {},
      fuchsia: {},
      pink: {},
      rose: {}
    },
    isLast: {
      true: {},
      false: {}
    }
  },
  compoundVariants: [
    // Vertical color variants - all 20 colors
    ...Object.keys(colorVariants).map((color) => ({
      order: "vertical" as const,
      color: color as keyof typeof colorVariants,
      class: {
        div: colorVariants[color as keyof typeof colorVariants].dot + " " + colorVariants[color as keyof typeof colorVariants].ring,
        svg: colorVariants[color as keyof typeof colorVariants].icon,
        connector: colorVariants[color as keyof typeof colorVariants].connectorBg
      }
    })),
    // Horizontal color variants - all 20 colors
    ...Object.keys(colorVariants).map((color) => ({
      order: "horizontal" as const,
      color: color as keyof typeof colorVariants,
      class: {
        div: colorVariants[color as keyof typeof colorVariants].dot + " " + colorVariants[color as keyof typeof colorVariants].ring,
        svg: colorVariants[color as keyof typeof colorVariants].icon
      }
    })),
    // Activity color variants - all 20 colors
    ...Object.keys(colorVariants).map((color) => ({
      order: "activity" as const,
      color: color as keyof typeof colorVariants,
      class: {
        div: colorVariants[color as keyof typeof colorVariants].dot + " " + colorVariants[color as keyof typeof colorVariants].ring,
        svg: colorVariants[color as keyof typeof colorVariants].icon,
        connector: colorVariants[color as keyof typeof colorVariants].connectorBg
      }
    })),
    // Hide connector on last item
    {
      isLast: true,
      class: {
        connector: "hidden"
      }
    }
  ],
  defaultVariants: {
    order: "default",
    color: "primary",
    isLast: false
  }
});
