<script lang="ts">
  import { Footer, FooterCopyright, FooterLink, FooterLinkGroup } from "flowbite-svelte";
</script>

<Footer class="rounded-none bg-white shadow dark:bg-gray-900">
  <div class="mx-auto w-full max-w-screen-xl p-4 md:py-8">
    <div class="sm:flex sm:items-center sm:justify-between">
      <a href="/" class="mb-4 flex items-center space-x-3 sm:mb-0 rtl:space-x-reverse">
        <img src="https://flowbite.com/docs/images/logo.svg" class="h-8" alt="Flowbite Logo" />
        <span class="self-center whitespace-nowrap text-2xl font-semibold dark:text-white">Flowbite</span>
      </a>
      <FooterLinkGroup class="flex flex-wrap items-center text-sm font-medium text-gray-500 dark:text-gray-400">
        <FooterLink href="#about">About</FooterLink>
        <FooterLink href="#privacy">Privacy Policy</FooterLink>
        <FooterLink href="#licensing">Licensing</FooterLink>
        <FooterLink href="#contact">Contact</FooterLink>
      </FooterLinkGroup>
    </div>
    <hr class="my-6 border-gray-200 sm:mx-auto lg:my-8 dark:border-gray-700" />
    <FooterCopyright href="/" by="Flowbite™" year={2024} />
  </div>
</Footer>
