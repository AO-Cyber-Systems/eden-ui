import { tv, type VariantProps } from "tailwind-variants";
import type { Classes } from "$lib/theme/themeUtils";

// Variants
export type ChatBubbleVariants = VariantProps<typeof chatBubble> & Classes<typeof chatBubble>;

export const chatBubble = tv({
  slots: {
    base: "flex gap-2.5",
    wrapper: "flex flex-col gap-1",
    bubble: "flex flex-col leading-1.5 border rounded-lg",
    avatar: "w-8 h-8 rounded-full shrink-0",
    name: "text-sm font-semibold text-gray-900 dark:text-white",
    time: "text-sm font-normal text-gray-500 dark:text-gray-400",
    header: "flex items-center gap-2",
    content: "text-sm font-normal text-gray-900 dark:text-white",
    footer: "flex items-center gap-2",
    status: "text-xs font-normal text-gray-500 dark:text-gray-400"
  },
  variants: {
    position: {
      sender: {
        base: "flex-row-reverse",
        bubble: "rounded-br-none",
        header: "flex-row-reverse"
      },
      receiver: {
        base: "flex-row",
        bubble: "rounded-bl-none",
        header: "flex-row"
      }
    },
    size: {
      sm: {
        bubble: "p-2 max-w-xs",
        avatar: "w-6 h-6",
        name: "text-xs",
        content: "text-xs",
        time: "text-xs"
      },
      md: {
        bubble: "p-3 max-w-sm",
        avatar: "w-8 h-8",
        name: "text-sm",
        content: "text-sm",
        time: "text-sm"
      },
      lg: {
        bubble: "p-4 max-w-md",
        avatar: "w-10 h-10",
        name: "text-base",
        content: "text-base",
        time: "text-sm"
      }
    },
    color: {
      default: {
        bubble: "bg-gray-100 dark:bg-gray-700 border-gray-200 dark:border-gray-600"
      },
      primary: {
        bubble: "bg-primary-100 dark:bg-primary-900 border-primary-200 dark:border-primary-800"
      },
      secondary: {
        bubble: "bg-secondary-100 dark:bg-secondary-900 border-secondary-200 dark:border-secondary-800"
      },
      gray: {
        bubble: "bg-gray-100 dark:bg-gray-700 border-gray-200 dark:border-gray-600"
      },
      red: {
        bubble: "bg-red-100 dark:bg-red-900 border-red-200 dark:border-red-800"
      },
      orange: {
        bubble: "bg-orange-100 dark:bg-orange-900 border-orange-200 dark:border-orange-800"
      },
      amber: {
        bubble: "bg-amber-100 dark:bg-amber-900 border-amber-200 dark:border-amber-800"
      },
      yellow: {
        bubble: "bg-yellow-100 dark:bg-yellow-900 border-yellow-200 dark:border-yellow-800"
      },
      lime: {
        bubble: "bg-lime-100 dark:bg-lime-900 border-lime-200 dark:border-lime-800"
      },
      green: {
        bubble: "bg-green-100 dark:bg-green-900 border-green-200 dark:border-green-800"
      },
      emerald: {
        bubble: "bg-emerald-100 dark:bg-emerald-900 border-emerald-200 dark:border-emerald-800"
      },
      teal: {
        bubble: "bg-teal-100 dark:bg-teal-900 border-teal-200 dark:border-teal-800"
      },
      cyan: {
        bubble: "bg-cyan-100 dark:bg-cyan-900 border-cyan-200 dark:border-cyan-800"
      },
      sky: {
        bubble: "bg-sky-100 dark:bg-sky-900 border-sky-200 dark:border-sky-800"
      },
      blue: {
        bubble: "bg-blue-100 dark:bg-blue-900 border-blue-200 dark:border-blue-800"
      },
      indigo: {
        bubble: "bg-indigo-100 dark:bg-indigo-900 border-indigo-200 dark:border-indigo-800"
      },
      violet: {
        bubble: "bg-violet-100 dark:bg-violet-900 border-violet-200 dark:border-violet-800"
      },
      purple: {
        bubble: "bg-purple-100 dark:bg-purple-900 border-purple-200 dark:border-purple-800"
      },
      fuchsia: {
        bubble: "bg-fuchsia-100 dark:bg-fuchsia-900 border-fuchsia-200 dark:border-fuchsia-800"
      },
      pink: {
        bubble: "bg-pink-100 dark:bg-pink-900 border-pink-200 dark:border-pink-800"
      },
      rose: {
        bubble: "bg-rose-100 dark:bg-rose-900 border-rose-200 dark:border-rose-800"
      }
    }
  },
  defaultVariants: {
    position: "receiver",
    size: "md",
    color: "default"
  }
});
