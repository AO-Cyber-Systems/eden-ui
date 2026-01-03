<script lang="ts">
  import { Footer, FooterCopyright, FooterLink, FooterLinkGroup, Button, Input, Label } from "flowbite-svelte";
</script>

<Footer class="rounded-none bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto w-full max-w-screen-xl px-4 py-8 lg:py-12">
    <div class="md:flex md:justify-between">
      <div class="mb-6 md:mb-0 md:w-1/3">
        <a href="/" class="flex items-center">
          <img src="https://flowbite.com/docs/images/logo.svg" class="mr-3 h-8" alt="Flowbite Logo" />
          <span class="self-center whitespace-nowrap text-2xl font-semibold dark:text-white">Flowbite</span>
        </a>
        <p class="mt-4 text-gray-500 dark:text-gray-400">
          Build modern web applications faster with our comprehensive component library.
        </p>
        <form class="mt-6">
          <Label for="newsletter" class="sr-only">Email address</Label>
          <div class="flex gap-2">
            <Input type="email" id="newsletter" placeholder="Enter your email" required class="flex-1" />
            <Button type="submit">Subscribe</Button>
          </div>
        </form>
      </div>
      <div class="grid grid-cols-2 gap-8 sm:grid-cols-3 sm:gap-6">
        <div>
          <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Resources</h2>
          <FooterLinkGroup class="flex-col">
            <FooterLink href="#flowbite">Flowbite</FooterLink>
            <FooterLink href="#tailwindcss">Tailwind CSS</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Follow us</h2>
          <FooterLinkGroup class="flex-col">
            <FooterLink href="#github">Github</FooterLink>
            <FooterLink href="#discord">Discord</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold uppercase text-gray-900 dark:text-white">Legal</h2>
          <FooterLinkGroup class="flex-col">
            <FooterLink href="#privacy">Privacy Policy</FooterLink>
            <FooterLink href="#terms">Terms & Conditions</FooterLink>
          </FooterLinkGroup>
        </div>
      </div>
    </div>
    <hr class="my-6 border-gray-200 sm:mx-auto lg:my-8 dark:border-gray-700" />
    <FooterCopyright href="/" by="Flowbite™" year={2024} />
  </div>
</Footer>
