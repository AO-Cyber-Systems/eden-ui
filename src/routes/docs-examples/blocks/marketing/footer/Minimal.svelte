<script lang="ts">
  import { Footer, FooterCopyright, FooterLink, FooterLinkGroup } from "flowbite-svelte";
</script>

<Footer class="rounded-none bg-white dark:bg-gray-900">
  <div class="mx-auto w-full max-w-screen-xl p-4 py-6 lg:py-8">
    <div class="flex flex-col items-center justify-between gap-4 sm:flex-row">
      <FooterCopyright href="/" by="Flowbite™" year={2024} />
      <FooterLinkGroup class="flex flex-wrap items-center text-sm font-medium text-gray-500 dark:text-gray-400">
        <FooterLink href="#about">About</FooterLink>
        <FooterLink href="#privacy">Privacy</FooterLink>
        <FooterLink href="#terms">Terms</FooterLink>
        <FooterLink href="#contact">Contact</FooterLink>
      </FooterLinkGroup>
    </div>
  </div>
</Footer>
