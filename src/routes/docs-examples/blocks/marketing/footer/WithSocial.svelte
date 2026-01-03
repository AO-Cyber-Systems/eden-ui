<script lang="ts">
  import { Footer, FooterCopyright, FooterLink, FooterLinkGroup, FooterIcon } from "flowbite-svelte";
  import { FacebookSolid, GithubSolid, XSolid, InstagramSolid, LinkedinSolid, YoutubeSolid } from "flowbite-svelte-icons";
</script>

<Footer class="rounded-none bg-gray-900">
  <div class="mx-auto w-full max-w-screen-xl px-4 py-8 lg:py-12">
    <div class="md:flex md:justify-between">
      <div class="mb-6 md:mb-0">
        <a href="/" class="flex items-center">
          <img src="https://flowbite.com/docs/images/logo.svg" class="mr-3 h-8" alt="Flowbite Logo" />
          <span class="self-center whitespace-nowrap text-2xl font-semibold text-white">Flowbite</span>
        </a>
      </div>
      <div class="grid grid-cols-2 gap-8 sm:grid-cols-3 sm:gap-6">
        <div>
          <h2 class="mb-6 text-sm font-semibold uppercase text-white">Resources</h2>
          <FooterLinkGroup class="flex-col">
            <FooterLink href="#flowbite" class="text-gray-400 hover:text-white">Flowbite</FooterLink>
            <FooterLink href="#tailwind" class="text-gray-400 hover:text-white">Tailwind CSS</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold uppercase text-white">Follow us</h2>
          <FooterLinkGroup class="flex-col">
            <FooterLink href="#github" class="text-gray-400 hover:text-white">Github</FooterLink>
            <FooterLink href="#discord" class="text-gray-400 hover:text-white">Discord</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold uppercase text-white">Legal</h2>
          <FooterLinkGroup class="flex-col">
            <FooterLink href="#privacy" class="text-gray-400 hover:text-white">Privacy Policy</FooterLink>
            <FooterLink href="#terms" class="text-gray-400 hover:text-white">Terms</FooterLink>
          </FooterLinkGroup>
        </div>
      </div>
    </div>
    <hr class="my-6 border-gray-700 sm:mx-auto lg:my-8" />
    <div class="sm:flex sm:items-center sm:justify-between">
      <FooterCopyright href="/" by="Flowbite™" year={2024} class="text-gray-400" />
      <div class="mt-4 flex space-x-6 sm:mt-0 sm:justify-center">
        <FooterIcon href="#facebook">
          <FacebookSolid class="h-5 w-5 text-gray-400 hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#instagram">
          <InstagramSolid class="h-5 w-5 text-gray-400 hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#twitter">
          <XSolid class="h-5 w-5 text-gray-400 hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#github">
          <GithubSolid class="h-5 w-5 text-gray-400 hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#linkedin">
          <LinkedinSolid class="h-5 w-5 text-gray-400 hover:text-white" />
        </FooterIcon>
        <FooterIcon href="#youtube">
          <YoutubeSolid class="h-5 w-5 text-gray-400 hover:text-white" />
        </FooterIcon>
      </div>
    </div>
  </div>
</Footer>
