<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import ButtonGroup from './ButtonGroup.svelte';
  import Button from '../buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Components/ButtonGroup',
    component: ButtonGroup,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['xs', 'sm', 'md', 'lg', 'xl'],
        description: 'The size of buttons in the group',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether all buttons in the group are disabled',
      },
    },
    args: {
      size: 'md',
      disabled: false,
    },
  });
</script>

<!-- Default Button Group -->
<Story name="Default">
  {#snippet children(args)}
    <ButtonGroup {...args}>
      <Button>Profile</Button>
      <Button>Settings</Button>
      <Button>Messages</Button>
    </ButtonGroup>
  {/snippet}
</Story>

<!-- Outline Buttons -->
<Story name="Outline">
  {#snippet children(args)}
    <ButtonGroup>
      <Button outline>Profile</Button>
      <Button outline>Settings</Button>
      <Button outline>Messages</Button>
    </ButtonGroup>
  {/snippet}
</Story>

<!-- With Icons -->
<Story name="With Icons">
  {#snippet children(args)}
    <ButtonGroup>
      <Button>
        <svg class="w-4 h-4 me-2" fill="currentColor" viewBox="0 0 20 20">
          <path d="M10 0a10 10 0 1 0 10 10A10.011 10.011 0 0 0 10 0Zm0 5a3 3 0 1 1 0 6 3 3 0 0 1 0-6Zm0 13a8.949 8.949 0 0 1-4.951-1.488A3.987 3.987 0 0 1 9 13h2a3.987 3.987 0 0 1 3.951 3.512A8.949 8.949 0 0 1 10 18Z"/>
        </svg>
        Profile
      </Button>
      <Button>
        <svg class="w-4 h-4 me-2" fill="currentColor" viewBox="0 0 20 20">
          <path d="M18 7.5h-.423l-.452-1.09.3-.3a1.5 1.5 0 0 0 0-2.121L16.01 2.575a1.5 1.5 0 0 0-2.121 0l-.3.3-1.09-.452V2A1.5 1.5 0 0 0 11 .5H9A1.5 1.5 0 0 0 7.5 2v.423l-1.09.452-.3-.3a1.5 1.5 0 0 0-2.121 0L2.576 3.99a1.5 1.5 0 0 0 0 2.121l.3.3L2.423 7.5H2A1.5 1.5 0 0 0 .5 9v2A1.5 1.5 0 0 0 2 12.5h.423l.452 1.09-.3.3a1.5 1.5 0 0 0 0 2.121l1.415 1.413a1.5 1.5 0 0 0 2.121 0l.3-.3 1.09.452V18A1.5 1.5 0 0 0 9 19.5h2a1.5 1.5 0 0 0 1.5-1.5v-.423l1.09-.452.3.3a1.5 1.5 0 0 0 2.121 0l1.415-1.414a1.5 1.5 0 0 0 0-2.121l-.3-.3.452-1.09H18a1.5 1.5 0 0 0 1.5-1.5V9A1.5 1.5 0 0 0 18 7.5Z"/>
        </svg>
        Settings
      </Button>
      <Button>
        <svg class="w-4 h-4 me-2" fill="currentColor" viewBox="0 0 20 20">
          <path d="m17.418 3.623-.018-.008a6.713 6.713 0 0 0-2.4-.569V2h1a1 1 0 1 0 0-2h-2a1 1 0 0 0-1 1v2H9.89A6.977 6.977 0 0 1 12 8v5h1.791a.5.5 0 0 1 .394.191l2.498 3.2a.5.5 0 0 1-.394.809H5.711a.5.5 0 0 1-.394-.809l2.498-3.2A.5.5 0 0 1 8.209 13H10V8a5 5 0 0 0-5-5 1 1 0 0 0 0 2 3 3 0 0 1 3 3v5H5.209a2.5 2.5 0 0 0-1.97 4.045l2.498 3.2A2.5 2.5 0 0 0 7.711 20h6.578a2.5 2.5 0 0 0 1.97-4.045l-2.498-3.2A2.5 2.5 0 0 0 11.791 11H11V8c0-1.467.546-2.807 1.442-3.827A4.973 4.973 0 0 1 17 6a1 1 0 0 0 .418-1.877Z"/>
        </svg>
        Download
      </Button>
    </ButtonGroup>
  {/snippet}
</Story>

<!-- Disabled Group -->
<Story name="Disabled" args={{ disabled: true }}>
  {#snippet children(args)}
    <ButtonGroup {...args}>
      <Button>Profile</Button>
      <Button>Settings</Button>
      <Button>Messages</Button>
    </ButtonGroup>
  {/snippet}
</Story>

<!-- Navigation Style -->
<Story name="Navigation Style">
  {#snippet children(args)}
    <ButtonGroup>
      <Button>
        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd"/>
        </svg>
      </Button>
      <Button>1</Button>
      <Button>2</Button>
      <Button>3</Button>
      <Button>
        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
        </svg>
      </Button>
    </ButtonGroup>
  {/snippet}
</Story>

<!-- Icon Only -->
<Story name="Icon Only">
  {#snippet children(args)}
    <ButtonGroup>
      <Button>
        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clip-rule="evenodd"/>
        </svg>
      </Button>
      <Button>
        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
          <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
        </svg>
      </Button>
      <Button>
        <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
          <path d="M8 2a1 1 0 000 2h2a1 1 0 100-2H8z"/>
          <path d="M3 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v6h-4.586l1.293-1.293a1 1 0 00-1.414-1.414l-3 3a1 1 0 000 1.414l3 3a1 1 0 001.414-1.414L10.414 13H15v3a2 2 0 01-2 2H5a2 2 0 01-2-2V5zM15 11h2a1 1 0 110 2h-2v-2z"/>
        </svg>
      </Button>
    </ButtonGroup>
  {/snippet}
</Story>
