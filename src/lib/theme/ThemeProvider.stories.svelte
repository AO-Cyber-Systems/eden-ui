<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import ThemeProvider from './ThemeProvider.svelte';
  import Button from '../buttons/Button.svelte';
  import Card from '../card/Card.svelte';
  import Alert from '../alert/Alert.svelte';
  import Badge from '../badge/Badge.svelte';
  import Input from '../forms/input-field/Input.svelte';
  import Spinner from '../spinner/Spinner.svelte';

  const { Story } = defineMeta({
    title: 'Components/ThemeProvider',
    component: ThemeProvider,
    tags: ['autodocs'],
    argTypes: {},
    args: {},
  });
</script>

<!-- Default ThemeProvider -->
<Story name="Default">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        ThemeProvider wraps your application and provides theme customization context to all child components.
        Without a theme prop, components use their default styling.
      </p>
      <ThemeProvider>
        <div class="flex flex-wrap gap-4">
          <Button>Default Button</Button>
          <Badge>Default Badge</Badge>
          <Alert>This is a default alert message.</Alert>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Custom Button Theme -->
<Story name="Custom Button Theme">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Override the button's base styles globally. All buttons inside this provider will have rounded-full corners.
      </p>
      <ThemeProvider theme={{ button: { base: 'rounded-full' } }}>
        <div class="flex flex-wrap gap-4">
          <Button>Pill Button 1</Button>
          <Button color="blue">Pill Button 2</Button>
          <Button color="green">Pill Button 3</Button>
          <Button color="red">Pill Button 4</Button>
        </div>
      </ThemeProvider>

      <div class="border-t border-gray-200 dark:border-gray-700 pt-4">
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
          Buttons outside the ThemeProvider use default styles:
        </p>
        <div class="flex flex-wrap gap-4">
          <Button>Normal Button</Button>
          <Button color="blue">Normal Button</Button>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Custom Alert Theme -->
<Story name="Custom Alert Theme">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Customize alert component styling globally within the provider scope.
      </p>
      <ThemeProvider theme={{
        alert: {
          base: 'border-2 shadow-lg',
          icon: 'text-2xl'
        }
      }}>
        <div class="space-y-4">
          <Alert color="blue">Custom styled info alert with border and shadow.</Alert>
          <Alert color="green">Custom styled success alert with border and shadow.</Alert>
          <Alert color="red">Custom styled error alert with border and shadow.</Alert>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Multiple Component Overrides -->
<Story name="Multiple Component Overrides">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Override multiple components at once to create a cohesive custom theme.
      </p>
      <ThemeProvider theme={{
        button: { base: 'rounded-full shadow-lg' },
        badge: 'rounded-full',
        card: { base: 'shadow-2xl border-2' }
      }}>
        <div class="space-y-6">
          <div class="flex flex-wrap gap-4 items-center">
            <Button color="primary">Themed Button</Button>
            <Badge color="blue">Themed Badge</Badge>
            <Badge color="green">Another Badge</Badge>
          </div>

          <Card class="max-w-sm">
            <h5 class="text-xl font-bold text-gray-900 dark:text-white mb-2">Themed Card</h5>
            <p class="text-gray-600 dark:text-gray-400">
              This card has custom shadow and border styling from the theme provider.
            </p>
          </Card>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Nested Theme Providers -->
<Story name="Nested Theme Providers">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Inner ThemeProviders override outer ones. This allows for section-specific theming.
      </p>

      <ThemeProvider theme={{ button: { base: 'rounded-lg' } }}>
        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <p class="text-sm text-gray-600 dark:text-gray-300 mb-4">Outer theme (rounded-lg buttons):</p>
          <div class="flex gap-4 mb-6">
            <Button color="blue">Outer Theme Button</Button>
            <Button color="green">Outer Theme Button</Button>
          </div>

          <ThemeProvider theme={{ button: { base: 'rounded-full' } }}>
            <div class="p-4 bg-gray-200 dark:bg-gray-700 rounded-lg">
              <p class="text-sm text-gray-600 dark:text-gray-300 mb-4">Inner theme (rounded-full buttons):</p>
              <div class="flex gap-4">
                <Button color="purple">Inner Theme Button</Button>
                <Button color="pink">Inner Theme Button</Button>
              </div>
            </div>
          </ThemeProvider>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Dark Mode Optimized Theme -->
<Story name="Dark Mode Optimized Theme">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Create themes that work well in both light and dark modes using Tailwind's dark: prefix.
      </p>
      <ThemeProvider theme={{
        button: { base: 'ring-2 ring-offset-2 ring-primary-500 dark:ring-primary-400 dark:ring-offset-gray-900' },
        alert: { base: 'backdrop-blur-sm bg-opacity-90 dark:bg-opacity-90' }
      }}>
        <div class="space-y-4">
          <div class="flex flex-wrap gap-4">
            <Button>Primary Action</Button>
            <Button color="blue">Secondary Action</Button>
          </div>
          <Alert color="blue">
            This alert has a subtle blur effect and semi-transparent background.
          </Alert>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Form Components Theme -->
<Story name="Form Components Theme">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Customize form input styling across your application.
      </p>
      <ThemeProvider theme={{
        input: { base: 'rounded-full border-2' }
      }}>
        <div class="max-w-md space-y-4">
          <Input placeholder="Rounded input field" />
          <Input placeholder="Another rounded input" type="email" />
          <div class="flex gap-4">
            <Input placeholder="Half width" class="flex-1" />
            <Button>Submit</Button>
          </div>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Brand Theme Example -->
<Story name="Brand Theme Example">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Create a consistent brand theme by customizing multiple components together.
      </p>
      <ThemeProvider theme={{
        button: {
          base: 'font-bold tracking-wide uppercase text-xs'
        },
        card: {
          base: 'rounded-2xl border-0 bg-gradient-to-br from-white to-gray-50 dark:from-gray-800 dark:to-gray-900'
        },
        badge: 'font-bold tracking-wider uppercase'
      }}>
        <Card class="max-w-md p-6">
          <div class="flex justify-between items-start mb-4">
            <h5 class="text-xl font-bold text-gray-900 dark:text-white">Premium Feature</h5>
            <Badge color="yellow">New</Badge>
          </div>
          <p class="text-gray-600 dark:text-gray-400 mb-4">
            This card demonstrates a cohesive brand theme with bold typography
            and modern gradient backgrounds.
          </p>
          <div class="flex gap-3">
            <Button color="primary">Get Started</Button>
            <Button color="alternative">Learn More</Button>
          </div>
        </Card>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Minimal Theme -->
<Story name="Minimal Theme">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        A minimal, understated theme that reduces visual noise.
      </p>
      <ThemeProvider theme={{
        button: {
          base: 'shadow-none hover:shadow-sm transition-shadow',
          shadow: 'hidden'
        },
        alert: {
          base: 'border-l-4 border-t-0 border-r-0 border-b-0 rounded-none bg-transparent'
        },
        card: {
          base: 'shadow-none border rounded-none'
        }
      }}>
        <div class="space-y-6">
          <Alert color="blue">A minimal left-bordered alert style.</Alert>

          <Card class="max-w-sm p-4">
            <h5 class="font-medium text-gray-900 dark:text-white mb-2">Minimal Card</h5>
            <p class="text-sm text-gray-600 dark:text-gray-400 mb-3">Clean, borderless design.</p>
            <Button color="alternative">Action</Button>
          </Card>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Slot-Based Theming -->
<Story name="Slot-Based Theming">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Many components have multiple "slots" that can be themed independently.
        For example, buttons have base, outline, shadow, and spinner slots.
      </p>

      <div class="space-y-4">
        <div>
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Theme with base slot only:</h4>
          <ThemeProvider theme={{ button: { base: 'italic' } }}>
            <Button>Italic Button Text</Button>
          </ThemeProvider>
        </div>

        <div>
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Theme with shadow slot:</h4>
          <ThemeProvider theme={{ button: { shadow: 'shadow-xl shadow-blue-500/50' } }}>
            <Button color="blue" shadow>Enhanced Shadow</Button>
          </ThemeProvider>
        </div>

        <div>
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Theme with spinner slot:</h4>
          <ThemeProvider theme={{ button: { spinner: 'ms-4 animate-spin' } }}>
            <div class="flex items-center gap-2">
              <Button disabled>
                <Spinner size="4" class="me-2" />
                Loading...
              </Button>
              <span class="text-sm text-gray-500">(Spinner customized via theme)</span>
            </div>
          </ThemeProvider>
        </div>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Dynamic Theme Switching -->
<Story name="Dynamic Theme Switching">
  {#snippet children(args)}
    <script>
      let currentTheme = $state('rounded');

      const themes = {
        rounded: { button: { base: 'rounded-full' } },
        sharp: { button: { base: 'rounded-none' } },
        soft: { button: { base: 'rounded-lg shadow-lg' } },
      };
    </script>

    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        Themes can be switched dynamically. The reactive getter pattern in ThemeProvider
        ensures all child components update when the theme changes.
      </p>

      <div class="flex gap-2 p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
        <span class="text-sm font-medium text-gray-700 dark:text-gray-300 self-center">Select theme:</span>
        <button
          class="px-3 py-1 text-sm rounded {currentTheme === 'rounded' ? 'bg-primary-600 text-white' : 'bg-gray-200 dark:bg-gray-700'}"
          onclick={() => currentTheme = 'rounded'}
        >
          Rounded
        </button>
        <button
          class="px-3 py-1 text-sm rounded {currentTheme === 'sharp' ? 'bg-primary-600 text-white' : 'bg-gray-200 dark:bg-gray-700'}"
          onclick={() => currentTheme = 'sharp'}
        >
          Sharp
        </button>
        <button
          class="px-3 py-1 text-sm rounded {currentTheme === 'soft' ? 'bg-primary-600 text-white' : 'bg-gray-200 dark:bg-gray-700'}"
          onclick={() => currentTheme = 'soft'}
        >
          Soft
        </button>
      </div>

      <ThemeProvider theme={themes[currentTheme]}>
        <div class="flex flex-wrap gap-4">
          <Button color="primary">Primary</Button>
          <Button color="blue">Blue</Button>
          <Button color="green">Green</Button>
          <Button color="red">Red</Button>
          <Button color="purple">Purple</Button>
        </div>
      </ThemeProvider>
    </div>
  {/snippet}
</Story>

<!-- Real World Example: Dashboard Theme -->
<Story name="Dashboard Theme Example">
  {#snippet children(args)}
    <ThemeProvider theme={{
      button: { base: 'text-xs font-medium' },
      badge: 'text-xs font-medium',
      card: { base: 'shadow-sm hover:shadow-md transition-shadow' },
      alert: { base: 'text-sm' }
    }}>
      <div class="space-y-6 p-6 bg-gray-50 dark:bg-gray-900 rounded-lg">
        <div class="flex justify-between items-center">
          <h2 class="text-xl font-bold text-gray-900 dark:text-white">Dashboard</h2>
          <div class="flex gap-2">
            <Button color="alternative" size="sm">Export</Button>
            <Button color="primary" size="sm">New Report</Button>
          </div>
        </div>

        <Alert color="blue" dismissable>
          <span class="font-medium">Heads up!</span> You have 3 pending tasks that need attention.
        </Alert>

        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Card class="p-4">
            <div class="flex justify-between items-start">
              <div>
                <p class="text-sm text-gray-500 dark:text-gray-400">Total Users</p>
                <p class="text-2xl font-bold text-gray-900 dark:text-white">12,345</p>
              </div>
              <Badge color="green">+12%</Badge>
            </div>
          </Card>

          <Card class="p-4">
            <div class="flex justify-between items-start">
              <div>
                <p class="text-sm text-gray-500 dark:text-gray-400">Revenue</p>
                <p class="text-2xl font-bold text-gray-900 dark:text-white">$45,678</p>
              </div>
              <Badge color="green">+8%</Badge>
            </div>
          </Card>

          <Card class="p-4">
            <div class="flex justify-between items-start">
              <div>
                <p class="text-sm text-gray-500 dark:text-gray-400">Active Sessions</p>
                <p class="text-2xl font-bold text-gray-900 dark:text-white">1,234</p>
              </div>
              <Badge color="yellow">-2%</Badge>
            </div>
          </Card>
        </div>
      </div>
    </ThemeProvider>
  {/snippet}
</Story>

<!-- Available Theme Keys -->
<Story name="Available Theme Keys">
  {#snippet children(args)}
    <div class="space-y-6">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        ThemeConfig supports overrides for all exported component themes. Here are some common keys:
      </p>

      <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Buttons</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">button</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">gradientButton</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Feedback</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">alert</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">toast</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">badge</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Layout</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">card</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">modal</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">drawer</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Forms</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">input</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">select</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">checkbox</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Navigation</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">navbar</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">sidebar</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">tabs</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Data Display</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">table</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">pagination</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">avatar</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Overlays</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">tooltip</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">popover</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">dropdown</code>
        </div>

        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg">
          <h4 class="font-medium text-gray-900 dark:text-white mb-2">Progress</h4>
          <code class="text-xs text-gray-600 dark:text-gray-400">spinner</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">progressbar</code><br>
          <code class="text-xs text-gray-600 dark:text-gray-400">skeleton</code>
        </div>
      </div>

      <p class="text-xs text-gray-500 dark:text-gray-400">
        See <code>src/lib/theme/themes.ts</code> for the complete list of themeable components.
      </p>
    </div>
  {/snippet}
</Story>
