<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Breadcrumb from './Breadcrumb.svelte';
  import BreadcrumbItem from './BreadcrumbItem.svelte';

  const { Story } = defineMeta({
    title: 'Components/Breadcrumb',
    component: Breadcrumb,
    tags: ['autodocs'],
    argTypes: {
      solid: {
        control: 'boolean',
        description: 'Whether the breadcrumb has a solid background',
      },
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the breadcrumb',
      },
    },
    args: {
      solid: false,
      size: 'md',
    },
  });
</script>

<!-- Default Breadcrumb -->
<Story name="Default">
  {#snippet children(args)}
    <Breadcrumb {...args}>
      <BreadcrumbItem href="/" home>Home</BreadcrumbItem>
      <BreadcrumbItem href="/projects">Projects</BreadcrumbItem>
      <BreadcrumbItem>Current Page</BreadcrumbItem>
    </Breadcrumb>
  {/snippet}
</Story>

<!-- Solid Background -->
<Story name="Solid Background" args={{ solid: true }}>
  {#snippet children(args)}
    <Breadcrumb {...args}>
      <BreadcrumbItem href="/" home>Home</BreadcrumbItem>
      <BreadcrumbItem href="/category">Category</BreadcrumbItem>
      <BreadcrumbItem href="/subcategory">Subcategory</BreadcrumbItem>
      <BreadcrumbItem>Current Page</BreadcrumbItem>
    </Breadcrumb>
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <div>
        <p class="text-sm text-gray-500 mb-2">Small</p>
        <Breadcrumb size="sm">
          <BreadcrumbItem href="/" home>Home</BreadcrumbItem>
          <BreadcrumbItem href="/docs">Docs</BreadcrumbItem>
          <BreadcrumbItem>Page</BreadcrumbItem>
        </Breadcrumb>
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Medium (default)</p>
        <Breadcrumb size="md">
          <BreadcrumbItem href="/" home>Home</BreadcrumbItem>
          <BreadcrumbItem href="/docs">Docs</BreadcrumbItem>
          <BreadcrumbItem>Page</BreadcrumbItem>
        </Breadcrumb>
      </div>
      <div>
        <p class="text-sm text-gray-500 mb-2">Large</p>
        <Breadcrumb size="lg">
          <BreadcrumbItem href="/" home>Home</BreadcrumbItem>
          <BreadcrumbItem href="/docs">Docs</BreadcrumbItem>
          <BreadcrumbItem>Page</BreadcrumbItem>
        </Breadcrumb>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Long Path -->
<Story name="Long Path">
  {#snippet children(args)}
    <Breadcrumb>
      <BreadcrumbItem href="/" home>Home</BreadcrumbItem>
      <BreadcrumbItem href="/products">Products</BreadcrumbItem>
      <BreadcrumbItem href="/electronics">Electronics</BreadcrumbItem>
      <BreadcrumbItem href="/computers">Computers</BreadcrumbItem>
      <BreadcrumbItem href="/laptops">Laptops</BreadcrumbItem>
      <BreadcrumbItem>MacBook Pro</BreadcrumbItem>
    </Breadcrumb>
  {/snippet}
</Story>

<!-- Without Home Icon -->
<Story name="Without Home Icon">
  {#snippet children(args)}
    <Breadcrumb>
      <BreadcrumbItem href="/">Home</BreadcrumbItem>
      <BreadcrumbItem href="/products">Products</BreadcrumbItem>
      <BreadcrumbItem>Details</BreadcrumbItem>
    </Breadcrumb>
  {/snippet}
</Story>

<!-- Custom Home Icon -->
<Story name="Custom Icon">
  {#snippet children(args)}
    <Breadcrumb>
      <BreadcrumbItem href="/" home>
        {#snippet icon()}
          <svg class="w-4 h-4 me-2" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"/>
          </svg>
        {/snippet}
        Dashboard
      </BreadcrumbItem>
      <BreadcrumbItem href="/settings">Settings</BreadcrumbItem>
      <BreadcrumbItem>Profile</BreadcrumbItem>
    </Breadcrumb>
  {/snippet}
</Story>
