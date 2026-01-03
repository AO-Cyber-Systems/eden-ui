<script lang="ts">
  import { otpInput } from "./theme";
  import clsx from "clsx";
  import type { OtpInputProps } from "$lib";
  import { getTheme } from "$lib/theme/themeUtils";

  let {
    length = 6,
    value = $bindable(""),
    size = "md",
    color = "default",
    disabled = false,
    separator,
    separatorPosition,
    inputType = "text",
    placeholder = "",
    class: className,
    classes,
    onComplete,
    ...restProps
  }: OtpInputProps = $props();

  const theme = $derived(getTheme("otpInput"));
  const { base, input, separator: separatorClass } = $derived(otpInput({ size, color }));

  // Store individual digit values - use derived length to avoid Svelte warning
  const inputLength = $derived(length);
  let digits: string[] = $state([]);
  let inputRefs: HTMLInputElement[] = $state([]);

  // Initialize/resize digits array when length changes and sync external value
  $effect(() => {
    const targetLength = inputLength;
    if (digits.length !== targetLength || value) {
      if (value) {
        const chars = value.split("").slice(0, targetLength);
        digits = [...chars, ...Array(targetLength - chars.length).fill("")];
      } else if (digits.length !== targetLength) {
        // Resize array preserving existing values
        const newDigits = Array(targetLength).fill("");
        digits.forEach((d, i) => {
          if (i < targetLength) newDigits[i] = d;
        });
        digits = newDigits;
      }
    }
  });

  // Sync internal digits to external value
  function updateValue() {
    value = digits.join("");
    if (value.length === inputLength && onComplete) {
      onComplete(value);
    }
  }

  function handleInput(index: number, event: Event) {
    const target = event.target as HTMLInputElement;
    let inputValue = target.value;

    // Handle paste - distribute characters across inputs
    if (inputValue.length > 1) {
      const chars = inputValue.split("").slice(0, inputLength - index);
      chars.forEach((char, i) => {
        if (index + i < inputLength) {
          digits[index + i] = filterInput(char);
        }
      });
      updateValue();
      // Focus the next empty input or last input
      const nextIndex = Math.min(index + chars.length, inputLength - 1);
      inputRefs[nextIndex]?.focus();
      return;
    }

    // Single character input
    digits[index] = filterInput(inputValue);
    updateValue();

    // Auto-focus next input
    if (inputValue && index < inputLength - 1) {
      inputRefs[index + 1]?.focus();
    }
  }

  function filterInput(char: string): string {
    if (inputType === "numeric") {
      return char.replace(/[^0-9]/g, "").slice(0, 1);
    }
    return char.slice(0, 1);
  }

  function handleKeyDown(index: number, event: KeyboardEvent) {
    if (event.key === "Backspace") {
      if (!digits[index] && index > 0) {
        // If current input is empty, move to previous and clear it
        event.preventDefault();
        digits[index - 1] = "";
        updateValue();
        inputRefs[index - 1]?.focus();
      } else {
        // Clear current input
        digits[index] = "";
        updateValue();
      }
    } else if (event.key === "ArrowLeft" && index > 0) {
      event.preventDefault();
      inputRefs[index - 1]?.focus();
    } else if (event.key === "ArrowRight" && index < inputLength - 1) {
      event.preventDefault();
      inputRefs[index + 1]?.focus();
    } else if (event.key === "Delete") {
      digits[index] = "";
      updateValue();
    }
  }

  function handlePaste(event: ClipboardEvent) {
    event.preventDefault();
    const pastedData = event.clipboardData?.getData("text") || "";
    const chars = pastedData.split("").slice(0, inputLength);

    chars.forEach((char, i) => {
      digits[i] = filterInput(char);
    });
    updateValue();

    // Focus the next empty input or last filled input
    const nextEmptyIndex = digits.findIndex((d) => !d);
    const focusIndex = nextEmptyIndex === -1 ? inputLength - 1 : nextEmptyIndex;
    inputRefs[focusIndex]?.focus();
  }

  function handleFocus(event: FocusEvent) {
    const target = event.target as HTMLInputElement;
    target.select();
  }

  function shouldShowSeparator(index: number): boolean {
    if (!separator) return false;
    if (separatorPosition !== undefined) {
      return index === separatorPosition - 1;
    }
    // Default: show separator at middle for even lengths
    return inputLength % 2 === 0 && index === inputLength / 2 - 1;
  }
</script>

<div class={base({ class: clsx(theme?.base, className) })} {...restProps}>
  {#each Array(inputLength) as _, index}
    <input
      bind:this={inputRefs[index]}
      type={inputType === "numeric" ? "tel" : "text"}
      inputmode={inputType === "numeric" ? "numeric" : "text"}
      maxlength="1"
      value={digits[index]}
      {placeholder}
      {disabled}
      autocomplete="one-time-code"
      class={input({ class: clsx(theme?.input, classes?.input) })}
      oninput={(e) => handleInput(index, e)}
      onkeydown={(e) => handleKeyDown(index, e)}
      onpaste={handlePaste}
      onfocus={handleFocus}
      aria-label={`Digit ${index + 1} of ${inputLength}`}
    />
    {#if shouldShowSeparator(index)}
      <span class={separatorClass({ class: clsx(theme?.separator, classes?.separator) })}>
        {#if typeof separator === "string"}
          {separator}
        {:else if separator}
          {@render separator()}
        {/if}
      </span>
    {/if}
  {/each}
</div>

<!--
@component
[Go to docs](https://flowbite-svelte.com/)
## Type
[OtpInputProps](https://github.com/themesberg/flowbite-svelte/blob/main/src/lib/types.ts)
## Props
@prop length = 6
@prop value = $bindable("")
@prop size = "md"
@prop color = "default"
@prop disabled = false
@prop separator
@prop separatorPosition
@prop inputType = "text"
@prop placeholder = ""
@prop class: className
@prop classes
@prop onComplete
@prop ...restProps
-->
