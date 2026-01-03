<script lang="ts">
  import type { StepStatus, TimelineStep } from "$lib/types";
  import CheckmarkIcon from "./CheckmarkIcon.svelte";
  import ProfileCardIcon from "./ProfileCardIcon.svelte";
  import { timelineStepper } from "./theme";
  import type { TimelineStepperProps } from "$lib/types";
  import clsx from "clsx";
  import { getTheme } from "$lib/theme/themeUtils";

  let { steps = [], class: className, classes, contentClass, current = $bindable(1), clickable = true, showCheckmarkForCompleted = true, size = "md", onStepClick, ...restProps }: TimelineStepperProps = $props();

  // Ensure current is within valid bounds
  $effect(() => {
    if (current < 0) current = 0;
    if (current > steps.length && steps.length > 0) current = steps.length;
  });

  const theme = $derived(getTheme("timelineStepper"));

  const { base, item, circle, icon, title, description } = $derived(timelineStepper({ size }));

  // Handle step click
  function handleStepClick(stepIndex: number) {
    if (clickable && stepIndex < steps.length) {
      const last = current;
      // Convert 0-based array index to 1-based current value
      current = stepIndex + 1;

      // Call custom onStepClick if provided
      if (onStepClick) {
        onStepClick({ current, last });
      }
    }
  }

  // Determine step status - reactive to current changes
  function getStepStatus(stepIndex: number): "completed" | "current" | "pending" {
    if (current === 0) {
      return "pending";
    }
    if (stepIndex < current - 1) {
      return "completed";
    } else if (stepIndex === current - 1) {
      return "current";
    } else {
      return "pending";
    }
  }
</script>

{#snippet stepIcon(status: StepStatus, step: TimelineStep)}
  {#if status === "completed" && showCheckmarkForCompleted}
    <CheckmarkIcon class={icon({ class: "text-green-500 dark:text-green-400" })} />
  {:else if step.icon}
    <step.icon class={icon({ class: clsx(classes?.icon, step.iconClass) })} />
  {:else}
    <ProfileCardIcon class={icon({ class: clsx(classes?.icon) })} />
  {/if}
{/snippet}

<ol class={base({ class: clsx(theme?.base, className) })} {...restProps}>
  {#each steps as step, index (step.id)}
    {@const status = step.status ?? getStepStatus(index)}
    <li class={item({ isLast: index === steps.length - 1, class: clsx(theme?.item, classes?.item) })}>
      {#if clickable}
        <button
          type="button"
          class={circle({
            status,
            class: clsx(theme?.circle, classes?.circle, "cursor-pointer transition-opacity hover:opacity-75")
          })}
          onclick={() => handleStepClick(index)}
          aria-current={status === "current" ? "step" : undefined}
        >
          {@render stepIcon(status, step)}
        </button>
      {:else}
        <span class={circle({ status, class: clsx(theme?.circle, classes?.circle) })} aria-current={status === "current" ? "step" : undefined}>
          {@render stepIcon(status, step)}
        </span>
      {/if}
      <div class={clsx(contentClass)}>
        <h3 class={title({ class: clsx(theme?.title, classes?.title, "leading-tight") })}>{step.label}</h3>
        {#if step.description}
          <p class={description({ class: clsx(theme?.description, classes?.description) })}>{step.description}</p>
        {/if}
      </div>
    </li>
  {/each}
</ol>

<!--
## Features
- **Clickable navigation**: Click or press Enter/Space on steps to navigate
- **Auto status**: Automatically determines completed/current/pending status based on current index
- **Custom icons**: Support for custom icons on completed steps
- **Accessible**: Keyboard navigation with proper ARIA attributes

## Note
The `current` prop is 1-based:
- current=0 means no step is active (all pending)
- current=1 means first step is active
- current=2 means first step is completed, second step is active
- etc.
-->

<!--
@component
[Go to docs](https://flowbite-svelte.com/)
## Type
[TimelineStepperProps](https://github.com/themesberg/flowbite-svelte/blob/main/src/lib/types.ts#L1747)
## Props
@prop steps = []
@prop class: className
@prop classes
@prop contentClass
@prop current = $bindable(1)
@prop clickable = true
@prop showCheckmarkForCompleted = true
@prop size = "md"
@prop onStepClick
@prop ...restProps
-->
