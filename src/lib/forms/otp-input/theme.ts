import { tv, type VariantProps } from "tailwind-variants";
import type { Classes } from "$lib/theme/themeUtils";

// Variants
export type OtpInputVariants = VariantProps<typeof otpInput> & Classes<typeof otpInput>;

export const otpInput = tv({
  slots: {
    base: "flex items-center gap-2",
    input:
      "text-center font-semibold focus:outline-none focus:ring-2 border rounded-lg transition-all disabled:cursor-not-allowed disabled:opacity-50",
    separator: "text-gray-400 dark:text-gray-500 font-medium"
  },
  variants: {
    size: {
      sm: {
        input: "w-8 h-10 text-sm"
      },
      md: {
        input: "w-10 h-12 text-base"
      },
      lg: {
        input: "w-12 h-14 text-lg"
      }
    },
    color: {
      default: {
        input:
          "border-gray-300 dark:border-gray-600 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-white focus:ring-primary-500 focus:border-primary-500 dark:focus:ring-primary-500 dark:focus:border-primary-500"
      },
      primary: {
        input:
          "border-primary-300 dark:border-primary-600 bg-primary-50 dark:bg-gray-700 text-primary-900 dark:text-primary-400 focus:ring-primary-500 focus:border-primary-500"
      },
      secondary: {
        input:
          "border-secondary-300 dark:border-secondary-600 bg-secondary-50 dark:bg-gray-700 text-secondary-900 dark:text-secondary-400 focus:ring-secondary-500 focus:border-secondary-500"
      },
      gray: {
        input:
          "border-gray-300 dark:border-gray-500 bg-gray-50 dark:bg-gray-700 text-gray-900 dark:text-gray-400 focus:ring-gray-500 focus:border-gray-500"
      },
      red: {
        input:
          "border-red-300 dark:border-red-600 bg-red-50 dark:bg-gray-700 text-red-900 dark:text-red-400 focus:ring-red-500 focus:border-red-500"
      },
      orange: {
        input:
          "border-orange-300 dark:border-orange-600 bg-orange-50 dark:bg-gray-700 text-orange-900 dark:text-orange-400 focus:ring-orange-500 focus:border-orange-500"
      },
      amber: {
        input:
          "border-amber-300 dark:border-amber-600 bg-amber-50 dark:bg-gray-700 text-amber-900 dark:text-amber-400 focus:ring-amber-500 focus:border-amber-500"
      },
      yellow: {
        input:
          "border-yellow-300 dark:border-yellow-600 bg-yellow-50 dark:bg-gray-700 text-yellow-900 dark:text-yellow-400 focus:ring-yellow-500 focus:border-yellow-500"
      },
      lime: {
        input:
          "border-lime-300 dark:border-lime-600 bg-lime-50 dark:bg-gray-700 text-lime-900 dark:text-lime-400 focus:ring-lime-500 focus:border-lime-500"
      },
      green: {
        input:
          "border-green-300 dark:border-green-600 bg-green-50 dark:bg-gray-700 text-green-900 dark:text-green-400 focus:ring-green-500 focus:border-green-500"
      },
      emerald: {
        input:
          "border-emerald-300 dark:border-emerald-600 bg-emerald-50 dark:bg-gray-700 text-emerald-900 dark:text-emerald-400 focus:ring-emerald-500 focus:border-emerald-500"
      },
      teal: {
        input:
          "border-teal-300 dark:border-teal-600 bg-teal-50 dark:bg-gray-700 text-teal-900 dark:text-teal-400 focus:ring-teal-500 focus:border-teal-500"
      },
      cyan: {
        input:
          "border-cyan-300 dark:border-cyan-600 bg-cyan-50 dark:bg-gray-700 text-cyan-900 dark:text-cyan-400 focus:ring-cyan-500 focus:border-cyan-500"
      },
      sky: {
        input:
          "border-sky-300 dark:border-sky-600 bg-sky-50 dark:bg-gray-700 text-sky-900 dark:text-sky-400 focus:ring-sky-500 focus:border-sky-500"
      },
      blue: {
        input:
          "border-blue-300 dark:border-blue-600 bg-blue-50 dark:bg-gray-700 text-blue-900 dark:text-blue-400 focus:ring-blue-500 focus:border-blue-500"
      },
      indigo: {
        input:
          "border-indigo-300 dark:border-indigo-600 bg-indigo-50 dark:bg-gray-700 text-indigo-900 dark:text-indigo-400 focus:ring-indigo-500 focus:border-indigo-500"
      },
      violet: {
        input:
          "border-violet-300 dark:border-violet-600 bg-violet-50 dark:bg-gray-700 text-violet-900 dark:text-violet-400 focus:ring-violet-500 focus:border-violet-500"
      },
      purple: {
        input:
          "border-purple-300 dark:border-purple-600 bg-purple-50 dark:bg-gray-700 text-purple-900 dark:text-purple-400 focus:ring-purple-500 focus:border-purple-500"
      },
      fuchsia: {
        input:
          "border-fuchsia-300 dark:border-fuchsia-600 bg-fuchsia-50 dark:bg-gray-700 text-fuchsia-900 dark:text-fuchsia-400 focus:ring-fuchsia-500 focus:border-fuchsia-500"
      },
      pink: {
        input:
          "border-pink-300 dark:border-pink-600 bg-pink-50 dark:bg-gray-700 text-pink-900 dark:text-pink-400 focus:ring-pink-500 focus:border-pink-500"
      },
      rose: {
        input:
          "border-rose-300 dark:border-rose-600 bg-rose-50 dark:bg-gray-700 text-rose-900 dark:text-rose-400 focus:ring-rose-500 focus:border-rose-500"
      }
    }
  },
  defaultVariants: {
    size: "md",
    color: "default"
  }
});
