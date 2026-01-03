<script lang="ts">
  import { chatBubble } from "./theme";
  import clsx from "clsx";
  import type { ChatBubbleProps } from "$lib";
  import { getTheme } from "$lib/theme/themeUtils";

  let {
    children,
    position = "receiver",
    size = "md",
    color = "default",
    name: userName,
    time,
    avatarSrc,
    avatarAlt = "User avatar",
    avatar,
    status,
    statusIcon,
    footer,
    class: className,
    classes,
    ...restProps
  }: ChatBubbleProps = $props();

  const theme = $derived(getTheme("chatBubble"));
  const styles = $derived(chatBubble({ position, size, color }));
</script>

<div class={styles.base({ class: clsx(theme?.base, className) })} {...restProps}>
  {#if avatar}
    {@render avatar()}
  {:else if avatarSrc}
    <img src={avatarSrc} alt={avatarAlt} class={styles.avatar({ class: clsx(theme?.avatar, classes?.avatar) })} />
  {/if}

  <div class={styles.wrapper({ class: clsx(theme?.wrapper, classes?.wrapper) })}>
    {#if userName || time}
      <div class={styles.header({ class: clsx(theme?.header, classes?.header) })}>
        {#if userName}
          <span class={styles.name({ class: clsx(theme?.name, classes?.name) })}>{userName}</span>
        {/if}
        {#if time}
          <span class={styles.time({ class: clsx(theme?.time, classes?.time) })}>{time}</span>
        {/if}
      </div>
    {/if}

    <div class={styles.bubble({ class: clsx(theme?.bubble, classes?.bubble) })}>
      <div class={styles.content({ class: clsx(theme?.content, classes?.content) })}>
        {#if children}
          {@render children()}
        {/if}
      </div>
    </div>

    {#if status || statusIcon || footer}
      <div class={styles.footer({ class: clsx(theme?.footer, classes?.footer) })}>
        {#if statusIcon}
          {@render statusIcon()}
        {/if}
        {#if status}
          <span class={styles.status({ class: clsx(theme?.status, classes?.status) })}>{status}</span>
        {/if}
        {#if footer}
          {@render footer()}
        {/if}
      </div>
    {/if}
  </div>
</div>

<!--
@component
[Go to docs](https://flowbite-svelte.com/)
## Type
[ChatBubbleProps](https://github.com/themesberg/flowbite-svelte/blob/main/src/lib/types.ts)
## Props
@prop children
@prop position = "receiver"
@prop size = "md"
@prop color = "default"
@prop name: userName
@prop time
@prop avatarSrc
@prop avatarAlt = "User avatar"
@prop avatar
@prop status
@prop statusIcon
@prop footer
@prop class: className
@prop classes
@prop ...restProps
-->
