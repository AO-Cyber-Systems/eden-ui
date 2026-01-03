import type { Preview } from '@storybook/sveltekit'
// Import Tailwind CSS and Eden UI theme
import '../src/app.css';

const preview: Preview = {
  parameters: {
    controls: {
      matchers: {
        color: /(background|color)$/i,
        date: /Date$/i,
      },
    },
    backgrounds: {
      default: 'light',
      values: [
        { name: 'light', value: '#ffffff' },
        { name: 'dark', value: '#1f2937' },
      ],
    },
    docs: {
      toc: true,
    },
  },
  decorators: [
    // Add dark mode toggle support
    (story, context) => {
      const isDark = context.globals.theme === 'dark';
      if (typeof document !== 'undefined') {
        document.documentElement.classList.toggle('dark', isDark);
      }
      return story();
    },
  ],
  globalTypes: {
    theme: {
      description: 'Global theme for components',
      defaultValue: 'light',
      toolbar: {
        title: 'Theme',
        icon: 'circlehollow',
        items: ['light', 'dark'],
        dynamicTitle: true,
      },
    },
  },
};

export default preview;