import { tv, type VariantProps } from "tailwind-variants";
import type { Classes } from "$lib/theme/themeUtils";

// Variants
export type StepperVariants = VariantProps<typeof stepper> & Classes<typeof stepper>;
export type ProgressStepperVariants = VariantProps<typeof progressStepper> & Classes<typeof progressStepper>;
export type DetailedStepperVariants = VariantProps<typeof detailedStepper> & Classes<typeof detailedStepper>;
export type VerticalStepperVariants = VariantProps<typeof verticalStepper> & Classes<typeof verticalStepper>;
export type BreadcrumbStepperVariants = VariantProps<typeof breadcrumbStepper> & Classes<typeof breadcrumbStepper>;
export type TimelineStepperVariants = VariantProps<typeof timelineStepper> & Classes<typeof timelineStepper>;

export const stepper = tv({
  slots: {
    base: "flex items-center w-full font-medium text-center text-gray-500 dark:text-gray-400",
    item: "flex items-center",
    content: "flex items-center",
    icon: ""
  },
  variants: {
    status: {
      completed: {
        item: "text-primary-600 dark:text-primary-500 md:w-full sm:after:content-[''] after:w-full after:h-1 after:border-b after:border-gray-200 after:border-1 after:hidden sm:after:inline-block dark:after:border-gray-700",
        content: "after:content-['/'] sm:after:hidden after:mx-2 after:text-gray-200 dark:after:text-gray-500"
      },
      current: {
        item: "text-primary-600 dark:text-primary-500 md:w-full sm:after:content-[''] after:w-full after:h-1 after:border-b after:border-gray-200 after:border-1 after:hidden sm:after:inline-block dark:after:border-gray-700",
        content: "after:content-['/'] sm:after:hidden after:mx-2 after:text-gray-200 dark:after:text-gray-500"
      },
      pending: {
        item: "md:w-full sm:after:content-[''] after:w-full after:h-1 after:border-b after:border-gray-200 after:border-1 after:hidden sm:after:inline-block dark:after:border-gray-700",
        content: "after:content-['/'] sm:after:hidden after:mx-2 after:text-gray-200 dark:after:text-gray-500"
      }
    },
    size: {
      xs: {
        base: "text-xs",
        item: "after:mx-2 xl:after:mx-4",
        icon: "me-1.5 h-3 w-3"
      },
      sm: {
        base: "text-sm",
        item: "after:mx-4 xl:after:mx-6",
        icon: "me-2 h-3.5 w-3.5"
      },
      md: {
        base: "text-sm sm:text-base",
        item: "after:mx-6 xl:after:mx-10",
        icon: "me-2.5 h-3.5 w-3.5 sm:h-4 sm:w-4"
      },
      lg: {
        base: "text-base sm:text-lg",
        item: "after:mx-8 xl:after:mx-12",
        icon: "me-3 h-4 w-4 sm:h-5 sm:w-5"
      },
      xl: {
        base: "text-lg sm:text-xl",
        item: "after:mx-10 xl:after:mx-14",
        icon: "me-3 h-5 w-5 sm:h-6 sm:w-6"
      }
    },
    isLast: {
      true: {
        item: "after:!hidden",
        content: "after:!hidden"
      },
      false: {}
    }
  },

  defaultVariants: {
    status: "pending",
    size: "md",
    isLast: false
  }
});

// ProgressStepper
export const progressStepper = tv({
  slots: {
    base: "flex items-center w-full relative",
    item: "flex items-center justify-center z-10",
    circle: "flex items-center justify-center rounded-full shrink-0",
    line: "absolute top-1/2 -translate-y-1/2 bg-gray-200 dark:bg-gray-700",
    progressLine: "absolute top-1/2 -translate-y-1/2 bg-primary-600 dark:bg-primary-500 transition-all duration-300 ease-in-out",
    icon: "",
    number: "font-semibold"
  },

  variants: {
    status: {
      completed: {
        item: "text-primary-600 dark:text-primary-400 flex-1",
        circle: "bg-primary-600 dark:bg-primary-500 text-white"
      },
      current: {
        item: "flex-1",
        circle: "bg-primary-600 dark:bg-primary-500 text-white"
      },
      pending: {
        item: "flex-1",
        circle: "bg-gray-200 dark:bg-gray-700 text-gray-600 dark:text-gray-400"
      }
    },
    size: {
      xs: {
        circle: "w-6 h-6",
        line: "h-0.5",
        progressLine: "h-0.5",
        icon: "h-3 w-3",
        number: "text-xs"
      },
      sm: {
        circle: "w-8 h-8",
        line: "h-0.5",
        progressLine: "h-0.5",
        icon: "h-4 w-4",
        number: "text-xs"
      },
      md: {
        circle: "w-10 h-10 lg:h-12 lg:w-12",
        line: "h-1",
        progressLine: "h-1",
        icon: "h-5 w-5 lg:h-6 lg:w-6",
        number: "text-sm"
      },
      lg: {
        circle: "w-12 h-12 lg:h-14 lg:w-14",
        line: "h-1",
        progressLine: "h-1",
        icon: "h-6 w-6 lg:h-7 lg:w-7",
        number: "text-base"
      },
      xl: {
        circle: "w-14 h-14 lg:h-16 lg:w-16",
        line: "h-1.5",
        progressLine: "h-1.5",
        icon: "h-7 w-7 lg:h-8 lg:w-8",
        number: "text-lg"
      }
    }
  },

  defaultVariants: {
    status: "pending",
    size: "md"
  }
});

// DetailedStepper
export const detailedStepper = tv({
  slots: {
    base: "items-center w-full",
    item: "flex items-center rtl:space-x-reverse",
    indicator: "flex items-center justify-center rounded-full shrink-0",
    title: "font-medium",
    description: ""
  },

  variants: {
    status: {
      completed: {
        item: "text-primary-600 dark:text-primary-500",
        indicator: "border border-primary-600 dark:border-primary-500 bg-primary-600 dark:bg-primary-500 text-white"
      },
      current: {
        item: "text-gray-500 dark:text-gray-400",
        indicator: "border border-gray-500 dark:border-gray-400 text-gray-500 dark:text-gray-400"
      },
      pending: {
        item: "text-gray-500 dark:text-gray-400",
        indicator: "border border-gray-500 dark:border-gray-400 text-gray-500 dark:text-gray-400"
      }
    },
    size: {
      xs: {
        base: "space-y-2 sm:space-x-4 sm:space-y-0",
        item: "space-x-1.5",
        indicator: "w-5 h-5 text-xs",
        title: "text-xs",
        description: "text-xs"
      },
      sm: {
        base: "space-y-3 sm:space-x-6 sm:space-y-0",
        item: "space-x-2",
        indicator: "w-6 h-6 text-xs",
        title: "text-sm",
        description: "text-xs"
      },
      md: {
        base: "space-y-4 sm:space-x-8 sm:space-y-0",
        item: "space-x-2.5",
        indicator: "w-8 h-8 text-sm",
        title: "text-base",
        description: "text-sm"
      },
      lg: {
        base: "space-y-5 sm:space-x-10 sm:space-y-0",
        item: "space-x-3",
        indicator: "w-10 h-10 text-base",
        title: "text-lg",
        description: "text-base"
      },
      xl: {
        base: "space-y-6 sm:space-x-12 sm:space-y-0",
        item: "space-x-4",
        indicator: "w-12 h-12 text-lg",
        title: "text-xl",
        description: "text-lg"
      }
    }
  },

  defaultVariants: {
    status: "pending",
    size: "md"
  }
});

export const verticalStepper = tv({
  slots: {
    base: "",
    card: "w-full border rounded-lg",
    content: "flex items-center justify-between",
    title: "font-medium",
    description: ""
  },
  variants: {
    status: {
      completed: {
        card: "text-green-700 border-green-300 bg-green-50 dark:bg-gray-800 dark:border-green-800 dark:text-green-400"
      },
      current: {
        card: "text-primary-700 bg-primary-100 border-primary-300 dark:bg-gray-800 dark:border-primary-800 dark:text-primary-400"
      },
      pending: {
        card: "text-gray-900 bg-gray-100 border-gray-300 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400"
      }
    },
    size: {
      xs: {
        base: "space-y-2 w-48",
        card: "p-2",
        title: "text-xs",
        description: "text-xs"
      },
      sm: {
        base: "space-y-3 w-56",
        card: "p-3",
        title: "text-sm",
        description: "text-xs"
      },
      md: {
        base: "space-y-4 w-72",
        card: "p-4",
        title: "text-base",
        description: "text-sm"
      },
      lg: {
        base: "space-y-5 w-80",
        card: "p-5",
        title: "text-lg",
        description: "text-base"
      },
      xl: {
        base: "space-y-6 w-96",
        card: "p-6",
        title: "text-xl",
        description: "text-lg"
      }
    }
  },
  defaultVariants: {
    status: "pending",
    size: "md"
  }
});

export const breadcrumbStepper = tv({
  slots: {
    base: "flex items-center w-full font-medium text-center text-gray-500 bg-white border border-gray-200 rounded-lg shadow-xs dark:text-gray-400 dark:bg-gray-800 dark:border-gray-700 rtl:space-x-reverse",
    item: "flex items-center",
    indicator: "flex items-center justify-center rounded-full shrink-0",
    chevron: "text-gray-400 rtl:-scale-x-100"
  },
  variants: {
    status: {
      completed: {
        item: "text-primary-600 dark:text-primary-500",
        indicator: "border border-primary-600 dark:border-primary-500 bg-primary-600 dark:bg-primary-500 text-white"
      },
      current: {
        item: "text-primary-600 dark:text-primary-500",
        indicator: "border border-primary-600 dark:border-primary-500 bg-primary-600 dark:bg-primary-500 text-white"
      },
      pending: {
        item: "text-gray-500 dark:text-gray-400",
        indicator: "border border-gray-500 dark:border-gray-400 text-gray-500 dark:text-gray-400"
      }
    },
    size: {
      xs: {
        base: "p-2 space-x-1 text-xs sm:p-2.5 sm:space-x-2",
        indicator: "w-4 h-4 me-1 text-xs",
        chevron: "w-4 h-4"
      },
      sm: {
        base: "p-2.5 space-x-1.5 text-sm sm:p-3 sm:space-x-3",
        indicator: "w-4 h-4 me-1.5 text-xs",
        chevron: "w-5 h-5"
      },
      md: {
        base: "p-3 space-x-2 text-sm sm:p-4 sm:space-x-4 sm:text-base",
        indicator: "w-5 h-5 me-2 text-xs",
        chevron: "w-5 h-5"
      },
      lg: {
        base: "p-4 space-x-3 text-base sm:p-5 sm:space-x-5",
        indicator: "w-6 h-6 me-2.5 text-sm",
        chevron: "w-6 h-6"
      },
      xl: {
        base: "p-5 space-x-4 text-lg sm:p-6 sm:space-x-6",
        indicator: "w-7 h-7 me-3 text-base",
        chevron: "w-7 h-7"
      }
    },
    hasChevron: {
      true: {},
      false: {}
    }
  },
  defaultVariants: {
    status: "pending",
    size: "md",
    hasChevron: false
  }
});

export const timelineStepper = tv({
  slots: {
    base: "relative text-gray-500 border-s border-gray-200 dark:border-gray-700 dark:text-gray-400",
    item: "",
    circle: "absolute flex items-center justify-center rounded-full ring-white dark:ring-gray-900",
    icon: "",
    title: "font-medium text-gray-900 dark:text-white",
    description: ""
  },
  variants: {
    status: {
      completed: {
        circle: "bg-green-200 dark:bg-green-900"
      },
      current: {
        circle: "bg-primary-200 dark:bg-primary-900"
      },
      pending: {
        circle: "bg-gray-100 dark:bg-gray-700"
      }
    },
    size: {
      xs: {
        item: "ms-4",
        circle: "w-5 h-5 -start-2.5 ring-2",
        icon: "w-2.5 h-2.5",
        title: "text-xs",
        description: "text-xs"
      },
      sm: {
        item: "ms-5",
        circle: "w-6 h-6 -start-3 ring-3",
        icon: "w-3 h-3",
        title: "text-sm",
        description: "text-xs"
      },
      md: {
        item: "ms-6",
        circle: "w-8 h-8 -start-4 ring-4",
        icon: "w-4 h-4",
        title: "text-base",
        description: "text-sm"
      },
      lg: {
        item: "ms-8",
        circle: "w-10 h-10 -start-5 ring-4",
        icon: "w-5 h-5",
        title: "text-lg",
        description: "text-base"
      },
      xl: {
        item: "ms-10",
        circle: "w-12 h-12 -start-6 ring-4",
        icon: "w-6 h-6",
        title: "text-xl",
        description: "text-lg"
      }
    },
    isLast: {
      true: {},
      false: {}
    }
  },
  compoundVariants: [
    // Size-specific spacing for non-last items
    { isLast: false, size: "xs", class: { item: "mb-6" } },
    { isLast: false, size: "sm", class: { item: "mb-8" } },
    { isLast: false, size: "md", class: { item: "mb-10" } },
    { isLast: false, size: "lg", class: { item: "mb-12" } },
    { isLast: false, size: "xl", class: { item: "mb-14" } }
  ],
  defaultVariants: {
    status: "pending",
    size: "md",
    isLast: false
  }
});
