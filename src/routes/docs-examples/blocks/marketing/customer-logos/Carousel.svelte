<script lang="ts">
  import { Button } from "flowbite-svelte";
  import { ChevronLeftOutline, ChevronRightOutline } from "flowbite-svelte-icons";

  let currentIndex = $state(0);

  const logos = [
    { name: "Spotify", icon: "🎵" },
    { name: "Airbnb", icon: "🏠" },
    { name: "Slack", icon: "💬" },
    { name: "Vercel", icon: "▲" },
    { name: "Microsoft", icon: "⊞" },
    { name: "Stripe", icon: "💳" },
    { name: "Netflix", icon: "🎬" },
    { name: "Amazon", icon: "📦" },
    { name: "Google", icon: "🔍" },
    { name: "Apple", icon: "🍎" },
  ];

  const visibleCount = 5;
  const maxIndex = Math.max(0, logos.length - visibleCount);

  function next() {
    currentIndex = Math.min(currentIndex + 1, maxIndex);
  }

  function prev() {
    currentIndex = Math.max(currentIndex - 1, 0);
  }
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="mx-auto mb-8 max-w-screen-sm text-center">
      <p class="text-lg font-medium text-gray-600 dark:text-gray-300">
        Powering products at over 5,000 companies
      </p>
    </div>
    <div class="relative flex items-center justify-center gap-4">
      <Button color="light" class="!p-2" onclick={prev} disabled={currentIndex === 0}>
        <ChevronLeftOutline class="h-5 w-5" />
      </Button>
      <div class="flex overflow-hidden">
        <div
          class="flex gap-12 transition-transform duration-300"
          style="transform: translateX(-{currentIndex * 160}px)"
        >
          {#each logos as logo}
            <a
              href="#"
              class="flex min-w-[120px] flex-col items-center gap-2 transition-opacity hover:opacity-70"
            >
              <span class="text-4xl">{logo.icon}</span>
              <span class="font-semibold text-gray-600 dark:text-gray-300">{logo.name}</span>
            </a>
          {/each}
        </div>
      </div>
      <Button color="light" class="!p-2" onclick={next} disabled={currentIndex === maxIndex}>
        <ChevronRightOutline class="h-5 w-5" />
      </Button>
    </div>
  </div>
</section>
