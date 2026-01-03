import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';
import svelte from '@astrojs/svelte';

export default defineConfig({
  integrations: [
    svelte(),
    starlight({
      title: 'Eden UI',
      description: 'A comprehensive design system and component library built with Svelte 5',
      logo: {
        src: './src/assets/eden-logo.svg',
        replacesTitle: false
      },
      social: {
        github: 'https://github.com/ao-cyber-systems/eden-ui'
      },
      sidebar: [
        {
          label: 'Getting Started',
          items: [
            { label: 'Introduction', slug: 'getting-started/introduction' },
            { label: 'Installation', slug: 'getting-started/installation' },
            { label: 'Quick Start', slug: 'getting-started/quick-start' },
            { label: 'Theming', slug: 'getting-started/theming' }
          ]
        },
        {
          label: 'Components',
          autogenerate: { directory: 'components' }
        },
        {
          label: 'Patterns',
          autogenerate: { directory: 'patterns' }
        },
        {
          label: 'API Reference',
          autogenerate: { directory: 'api' }
        },
        {
          label: 'Architecture',
          items: [
            { label: 'Overview', slug: 'architecture/overview' },
            { label: 'Design Tokens', slug: 'architecture/design-tokens' },
            { label: 'Theming System', slug: 'architecture/theming' }
          ]
        }
      ],
      customCss: ['./src/styles/custom.css'],
      editLink: {
        baseUrl: 'https://github.com/aocyber/eden-ui/edit/main/docs/'
      },
      head: [
        {
          tag: 'meta',
          attrs: {
            property: 'og:image',
            content: '/og-image.png'
          }
        }
      ],
      components: {
        // Override Starlight components if needed
      }
    })
  ],
  vite: {
    resolve: {
      alias: {
        // Allow importing from eden-ui directly in docs
        '$lib': '../src/lib'
      }
    }
  }
});
