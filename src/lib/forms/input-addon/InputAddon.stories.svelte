<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import InputAddon from './InputAddon.svelte';
  import Input from '../input-field/Input.svelte';
  import ButtonGroup from '$lib/button-group/ButtonGroup.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/InputAddon',
    component: InputAddon,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the addon',
      },
    },
    args: {
      size: 'md',
    },
  });
</script>

<!-- Default InputAddon -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Website URL</Label>
      <ButtonGroup>
        <InputAddon {...args}>https://</InputAddon>
        <Input placeholder="flowbite.com" />
      </ButtonGroup>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Small</Label>
        <ButtonGroup size="sm">
          <InputAddon size="sm">@</InputAddon>
          <Input placeholder="username" />
        </ButtonGroup>
      </div>
      <div>
        <Label class="mb-2">Medium (default)</Label>
        <ButtonGroup size="md">
          <InputAddon size="md">@</InputAddon>
          <Input placeholder="username" />
        </ButtonGroup>
      </div>
      <div>
        <Label class="mb-2">Large</Label>
        <ButtonGroup size="lg">
          <InputAddon size="lg">@</InputAddon>
          <Input placeholder="username" />
        </ButtonGroup>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Icon -->
<Story name="With Icon">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Email</Label>
      <ButtonGroup>
        <InputAddon>
          <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20">
            <path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z"/>
            <path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z"/>
          </svg>
        </InputAddon>
        <Input type="email" placeholder="name@company.com" />
      </ButtonGroup>
    </div>
  {/snippet}
</Story>

<!-- Prefix and Suffix -->
<Story name="Prefix and Suffix">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Price</Label>
      <ButtonGroup>
        <InputAddon>$</InputAddon>
        <Input type="number" placeholder="0.00" />
        <InputAddon>USD</InputAddon>
      </ButtonGroup>
    </div>
  {/snippet}
</Story>

<!-- Various Examples -->
<Story name="Various Examples">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Twitter Handle</Label>
        <ButtonGroup>
          <InputAddon>
            <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 24 24">
              <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
            </svg>
          </InputAddon>
          <Input placeholder="username" />
        </ButtonGroup>
      </div>
      <div>
        <Label class="mb-2">Phone</Label>
        <ButtonGroup>
          <InputAddon>+1</InputAddon>
          <Input type="tel" placeholder="(555) 123-4567" />
        </ButtonGroup>
      </div>
      <div>
        <Label class="mb-2">Weight</Label>
        <ButtonGroup>
          <Input type="number" placeholder="0" />
          <InputAddon>kg</InputAddon>
        </ButtonGroup>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Domain Input Example -->
<Story name="Domain Input">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Label class="mb-2">Your subdomain</Label>
      <ButtonGroup>
        <Input placeholder="yoursite" />
        <InputAddon>.flowbite.com</InputAddon>
      </ButtonGroup>
      <Helper>Your site will be available at yoursite.flowbite.com</Helper>
    </div>
  {/snippet}
</Story>

<!-- Search with Button -->
<Story name="Search Form">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Label class="mb-2">Search</Label>
      <ButtonGroup>
        <InputAddon>
          <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"/>
          </svg>
        </InputAddon>
        <Input placeholder="Search products..." />
        <InputAddon>
          <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2.586a1 1 0 01-.293.707l-6.414 6.414a1 1 0 00-.293.707V17l-4 4v-6.586a1 1 0 00-.293-.707L3.293 7.293A1 1 0 013 6.586V4z"/>
          </svg>
        </InputAddon>
      </ButtonGroup>
    </div>
  {/snippet}
</Story>

