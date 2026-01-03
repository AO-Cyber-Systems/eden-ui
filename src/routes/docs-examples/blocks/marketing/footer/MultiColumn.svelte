<script lang="ts">
  import { Footer, FooterCopyright, FooterLink, FooterLinkGroup, FooterIcon } from "flowbite-svelte";
  import { FacebookSolid, GithubSolid, XSolid, InstagramSolid } from "flowbite-svelte-icons";
</script>

<Footer class="rounded-none bg-white dark:bg-gray-900">
  <div class="mx-auto w-full max-w-screen-xl px-4 py-8 lg:py-12">
    <div class="grid gap-8 md:grid-cols-2 lg:grid-cols-6">
      <div class="lg:col-span-2">
        <a href="/" class="mb-4 flex items-center">
          <img src="https://flowbite.com/docs/images/logo.svg" class="mr-3 h-8" alt="Flowbite Logo" />
          <span class="self-center whitespace-nowrap text-2xl font-semibold dark:text-white">Flowbite</span>
        </a>
        <p class="text-gray-500 dark:text-gray-400">
          Open-source library of over 400+ web components and interactive elements built for better web.
        </p>
      </div>
      <div>
        <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Company</h2>
        <FooterLinkGroup class="flex-col">
          <FooterLink href="#about">About</FooterLink>
          <FooterLink href="#careers">Careers</FooterLink>
          <FooterLink href="#brand">Brand Center</FooterLink>
          <FooterLink href="#blog">Blog</FooterLink>
        </FooterLinkGroup>
      </div>
      <div>
        <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Help center</h2>
        <FooterLinkGroup class="flex-col">
          <FooterLink href="#discord">Discord Server</FooterLink>
          <FooterLink href="#twitter">Twitter</FooterLink>
          <FooterLink href="#facebook">Facebook</FooterLink>
          <FooterLink href="#contact">Contact Us</FooterLink>
        </FooterLinkGroup>
      </div>
      <div>
        <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Legal</h2>
        <FooterLinkGroup class="flex-col">
          <FooterLink href="#privacy">Privacy Policy</FooterLink>
          <FooterLink href="#licensing">Licensing</FooterLink>
          <FooterLink href="#terms">Terms & Conditions</FooterLink>
        </FooterLinkGroup>
      </div>
      <div>
        <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Download</h2>
        <FooterLinkGroup class="flex-col">
          <FooterLink href="#ios">iOS</FooterLink>
          <FooterLink href="#android">Android</FooterLink>
          <FooterLink href="#windows">Windows</FooterLink>
          <FooterLink href="#macos">MacOS</FooterLink>
        </FooterLinkGroup>
      </div>
    </div>
    <hr class="my-6 border-gray-200 sm:mx-auto lg:my-8 dark:border-gray-700" />
    <div class="sm:flex sm:items-center sm:justify-between">
      <FooterCopyright href="/" by="Flowbite™" year={2024} />
      <div class="mt-4 flex space-x-6 sm:mt-0 sm:justify-center">
        <FooterIcon href="#facebook">
          <FacebookSolid class="h-5 w-5 text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#instagram">
          <InstagramSolid class="h-5 w-5 text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#twitter">
          <XSolid class="h-5 w-5 text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#github">
          <GithubSolid class="h-5 w-5 text-gray-500 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white" />
        </FooterIcon>
      </div>
    </div>
  </div>
</Footer>
