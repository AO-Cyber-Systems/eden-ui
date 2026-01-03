<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Helper from './Helper.svelte';
  import Input from '../input-field/Input.svelte';
  import Label from '../label/Label.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Helper',
    component: Helper,
    tags: ['autodocs'],
    argTypes: {
      color: {
        control: { type: 'select' },
        options: ['gray', 'green', 'red', 'disabled'],
        description: 'The color of the helper text',
      },
    },
    args: {
      color: 'gray',
    },
  });
</script>

<!-- Default Helper -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="helper-input" class="mb-2">Email</Label>
      <Input id="helper-input" type="email" placeholder="name@example.com" />
      <Helper {...args}>We'll never share your email with anyone else.</Helper>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label for="gray-helper" class="mb-2">Default</Label>
        <Input id="gray-helper" placeholder="Enter text" />
        <Helper color="gray">This is a helpful hint.</Helper>
      </div>
      <div>
        <Label for="green-helper" color="green" class="mb-2">Success</Label>
        <Input id="green-helper" color="green" placeholder="Valid input" />
        <Helper color="green">Great! This looks good.</Helper>
      </div>
      <div>
        <Label for="red-helper" color="red" class="mb-2">Error</Label>
        <Input id="red-helper" color="red" placeholder="Invalid input" />
        <Helper color="red">Please enter a valid value.</Helper>
      </div>
      <div>
        <Label for="disabled-helper" color="disabled" class="mb-2">Disabled</Label>
        <Input id="disabled-helper" disabled placeholder="Disabled" />
        <Helper color="disabled">This field is disabled.</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- With Link -->
<Story name="With Link">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="password-input" class="mb-2">Password</Label>
      <Input id="password-input" type="password" placeholder="Enter password" />
      <Helper>
        Must be at least 8 characters. <a href="#" class="text-blue-600 hover:underline dark:text-blue-500">Learn more</a>
      </Helper>
    </div>
  {/snippet}
</Story>

<!-- Form Validation Example -->
<Story name="Form Validation">
  {#snippet children(args)}
    <form class="space-y-4 max-w-md">
      <div>
        <Label for="username" class="mb-2">Username</Label>
        <Input id="username" color="green" value="johndoe" />
        <Helper color="green">Username is available!</Helper>
      </div>
      <div>
        <Label for="email-val" class="mb-2">Email</Label>
        <Input id="email-val" color="red" type="email" value="invalid-email" />
        <Helper color="red">Please enter a valid email address.</Helper>
      </div>
      <div>
        <Label for="password-val" class="mb-2">Password</Label>
        <Input id="password-val" type="password" />
        <Helper>Password must contain at least 8 characters, one uppercase letter, and one number.</Helper>
      </div>
    </form>
  {/snippet}
</Story>

<!-- Character Count Example -->
<Story name="Character Count">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="bio" class="mb-2">Bio</Label>
      <Input id="bio" placeholder="Tell us about yourself" />
      <Helper>
        <span class="font-medium">0</span>/160 characters
      </Helper>
    </div>
  {/snippet}
</Story>

