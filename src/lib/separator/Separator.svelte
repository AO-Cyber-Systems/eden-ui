<script lang="ts">
  import { separator } from "./theme";
  import clsx from "clsx";
  import type { SeparatorProps } from "$lib";
  import { getTheme } from "$lib/theme/themeUtils";

  let {
    children,
    orientation = "horizontal",
    style = "solid",
    size = "md",
    color = "default",
    class: className,
    classes,
    ...restProps
  }: SeparatorProps = $props();

  const theme = $derived(getTheme("separator"));
  const styles = $derived(separator({ orientation, style, size, color }));

  const hasContent = $derived(!!children);
</script>

<div
  class={styles.base({ class: clsx(theme?.base, className) })}
  role="separator"
  aria-orientation={orientation}
  {...restProps}
>
  <div class={styles.line({ class: clsx(theme?.line, classes?.line) })}></div>
  {#if hasContent && children}
    <span class={styles.content({ class: clsx(theme?.content, classes?.content) })}>
      {@render children()}
    </span>
    <div class={styles.line({ class: clsx(theme?.line, classes?.line) })}></div>
  {/if}
</div>

<!--
@component
[Go to docs](https://flowbite-svelte.com/)
## Type
[SeparatorProps](https://github.com/themesberg/flowbite-svelte/blob/main/src/lib/types.ts)
## Props
@prop children
@prop orientation = "horizontal"
@prop style = "solid"
@prop size = "md"
@prop color = "default"
@prop class: className
@prop classes
@prop ...restProps
-->
