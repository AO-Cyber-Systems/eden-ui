import { tv, type VariantProps } from "tailwind-variants";
import type { Classes } from "$lib/theme/themeUtils";

// Variants
export type SeparatorVariants = VariantProps<typeof separator> & Classes<typeof separator>;

export const separator = tv({
  slots: {
    base: "flex items-center",
    line: "flex-grow",
    content: "shrink-0 px-3 text-sm font-medium text-gray-500 dark:text-gray-400"
  },
  variants: {
    orientation: {
      horizontal: {
        base: "w-full",
        line: "h-px"
      },
      vertical: {
        base: "flex-col h-full",
        line: "w-px"
      }
    },
    style: {
      solid: {
        line: "border-0"
      },
      dashed: {
        line: "border-dashed"
      },
      dotted: {
        line: "border-dotted"
      }
    },
    size: {
      sm: {
        content: "text-xs px-2"
      },
      md: {
        content: "text-sm px-3"
      },
      lg: {
        content: "text-base px-4"
      }
    },
    color: {
      default: {
        line: "bg-gray-200 dark:bg-gray-700"
      },
      primary: {
        line: "bg-primary-300 dark:bg-primary-700"
      },
      secondary: {
        line: "bg-secondary-300 dark:bg-secondary-700"
      },
      gray: {
        line: "bg-gray-300 dark:bg-gray-600"
      },
      red: {
        line: "bg-red-300 dark:bg-red-700"
      },
      orange: {
        line: "bg-orange-300 dark:bg-orange-700"
      },
      amber: {
        line: "bg-amber-300 dark:bg-amber-700"
      },
      yellow: {
        line: "bg-yellow-300 dark:bg-yellow-700"
      },
      lime: {
        line: "bg-lime-300 dark:bg-lime-700"
      },
      green: {
        line: "bg-green-300 dark:bg-green-700"
      },
      emerald: {
        line: "bg-emerald-300 dark:bg-emerald-700"
      },
      teal: {
        line: "bg-teal-300 dark:bg-teal-700"
      },
      cyan: {
        line: "bg-cyan-300 dark:bg-cyan-700"
      },
      sky: {
        line: "bg-sky-300 dark:bg-sky-700"
      },
      blue: {
        line: "bg-blue-300 dark:bg-blue-700"
      },
      indigo: {
        line: "bg-indigo-300 dark:bg-indigo-700"
      },
      violet: {
        line: "bg-violet-300 dark:bg-violet-700"
      },
      purple: {
        line: "bg-purple-300 dark:bg-purple-700"
      },
      fuchsia: {
        line: "bg-fuchsia-300 dark:bg-fuchsia-700"
      },
      pink: {
        line: "bg-pink-300 dark:bg-pink-700"
      },
      rose: {
        line: "bg-rose-300 dark:bg-rose-700"
      }
    }
  },
  defaultVariants: {
    orientation: "horizontal",
    style: "solid",
    size: "md",
    color: "default"
  }
});
