<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Footer from './Footer.svelte';
  import FooterBrand from './FooterBrand.svelte';
  import FooterCopyright from './FooterCopyright.svelte';
  import FooterLink from './FooterLink.svelte';
  import FooterLinkGroup from './FooterLinkGroup.svelte';
  import FooterIcon from './FooterIcon.svelte';

  const { Story } = defineMeta({
    title: 'Components/Footer',
    component: Footer,
    tags: ['autodocs'],
    argTypes: {
      footerType: {
        control: { type: 'select' },
        options: ['default', 'logo', 'sitemap', 'socialmedia', 'sticky'],
        description: 'The type of footer layout',
      },
    },
    args: {
      footerType: 'default',
    },
  });
</script>

<!-- Default Footer -->
<Story name="Default">
  {#snippet children(args)}
    <Footer {...args}>
      <FooterCopyright href="/" by="Flowbite" year={2024} />
      <FooterLinkGroup class="flex flex-wrap items-center mt-3 text-sm font-medium text-gray-500 dark:text-gray-400 sm:mt-0">
        <FooterLink href="#">About</FooterLink>
        <FooterLink href="#">Privacy Policy</FooterLink>
        <FooterLink href="#">Licensing</FooterLink>
        <FooterLink href="#">Contact</FooterLink>
      </FooterLinkGroup>
    </Footer>
  {/snippet}
</Story>

<!-- With Logo -->
<Story name="With Logo" args={{ footerType: 'logo' }}>
  {#snippet children(args)}
    <Footer {...args}>
      <div class="sm:flex sm:items-center sm:justify-between">
        <FooterBrand
          href="/"
          src="https://flowbite.com/docs/images/logo.svg"
          alt="Flowbite Logo"
          name="Flowbite"
        />
        <FooterLinkGroup class="flex flex-wrap items-center mb-6 text-sm font-medium text-gray-500 sm:mb-0 dark:text-gray-400">
          <FooterLink href="#">About</FooterLink>
          <FooterLink href="#">Privacy Policy</FooterLink>
          <FooterLink href="#">Licensing</FooterLink>
          <FooterLink href="#">Contact</FooterLink>
        </FooterLinkGroup>
      </div>
      <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
      <FooterCopyright href="/" by="Flowbite" />
    </Footer>
  {/snippet}
</Story>

<!-- Sitemap Footer -->
<Story name="Sitemap" args={{ footerType: 'sitemap' }}>
  {#snippet children(args)}
    <Footer {...args}>
      <div class="grid grid-cols-2 gap-8 px-6 py-8 md:grid-cols-4">
        <div>
          <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Company</h2>
          <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
            <FooterLink href="#">About</FooterLink>
            <FooterLink href="#">Careers</FooterLink>
            <FooterLink href="#">Brand Center</FooterLink>
            <FooterLink href="#">Blog</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Help center</h2>
          <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
            <FooterLink href="#">Discord Server</FooterLink>
            <FooterLink href="#">Twitter</FooterLink>
            <FooterLink href="#">Facebook</FooterLink>
            <FooterLink href="#">Contact Us</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Legal</h2>
          <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
            <FooterLink href="#">Privacy Policy</FooterLink>
            <FooterLink href="#">Licensing</FooterLink>
            <FooterLink href="#">Terms &amp; Conditions</FooterLink>
          </FooterLinkGroup>
        </div>
        <div>
          <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Download</h2>
          <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
            <FooterLink href="#">iOS</FooterLink>
            <FooterLink href="#">Android</FooterLink>
            <FooterLink href="#">Windows</FooterLink>
            <FooterLink href="#">MacOS</FooterLink>
          </FooterLinkGroup>
        </div>
      </div>
      <div class="px-4 py-6 bg-gray-100 dark:bg-gray-700 md:flex md:items-center md:justify-between">
        <FooterCopyright href="/" by="Flowbite" />
      </div>
    </Footer>
  {/snippet}
</Story>

<!-- With Social Icons -->
<Story name="With Social Icons" args={{ footerType: 'socialmedia' }}>
  {#snippet children(args)}
    <Footer {...args}>
      <div class="md:flex md:justify-between">
        <div class="mb-6 md:mb-0">
          <FooterBrand
            href="/"
            src="https://flowbite.com/docs/images/logo.svg"
            alt="Flowbite Logo"
            name="Flowbite"
          />
        </div>
        <div class="grid grid-cols-2 gap-8 sm:gap-6 sm:grid-cols-3">
          <div>
            <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Resources</h2>
            <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
              <FooterLink href="#">Flowbite</FooterLink>
              <FooterLink href="#">Tailwind CSS</FooterLink>
            </FooterLinkGroup>
          </div>
          <div>
            <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Follow us</h2>
            <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
              <FooterLink href="#">Github</FooterLink>
              <FooterLink href="#">Discord</FooterLink>
            </FooterLinkGroup>
          </div>
          <div>
            <h2 class="mb-6 text-sm font-semibold text-gray-900 uppercase dark:text-white">Legal</h2>
            <FooterLinkGroup class="text-gray-500 dark:text-gray-400">
              <FooterLink href="#">Privacy Policy</FooterLink>
              <FooterLink href="#">Terms</FooterLink>
            </FooterLinkGroup>
          </div>
        </div>
      </div>
      <hr class="my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8" />
      <div class="sm:flex sm:items-center sm:justify-between">
        <FooterCopyright href="/" by="Flowbite" />
        <div class="flex mt-4 space-x-5 sm:justify-center sm:mt-0">
          <FooterIcon href="#">
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
              <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd"/>
            </svg>
          </FooterIcon>
          <FooterIcon href="#">
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
              <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84"/>
            </svg>
          </FooterIcon>
        </div>
      </div>
    </Footer>
  {/snippet}
</Story>

<!-- Sticky Footer -->
<Story name="Sticky" args={{ footerType: 'sticky' }}>
  {#snippet children(args)}
    <div class="relative min-h-[300px]">
      <div class="p-4 mb-20">
        <p class="text-gray-600 dark:text-gray-400">Content area above the sticky footer.</p>
      </div>
      <Footer {...args}>
        <FooterCopyright href="/" by="Flowbite" year={2024} />
      </Footer>
    </div>
  {/snippet}
</Story>
