<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import PhoneInput from './PhoneInput.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/PhoneInput',
    component: PhoneInput,
    tags: ['autodocs'],
    argTypes: {
      phoneType: {
        control: { type: 'select' },
        options: ['default', 'countryCode', 'floating'],
        description: 'The type/style of the phone input',
      },
      phoneIcon: {
        control: 'boolean',
        description: 'Whether to show the phone icon',
      },
    },
    args: {
      phoneType: 'default',
      phoneIcon: true,
    },
  });
</script>

<!-- Default PhoneInput -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="phone" class="mb-2">Phone Number</Label>
      <PhoneInput {...args} id="phone" placeholder="123-456-7890" />
      <Helper>Format: XXX-XXX-XXXX</Helper>
    </div>
  {/snippet}
</Story>

<!-- Phone Type Variants -->
<Story name="Phone Types">
  {#snippet children(args)}
    <div class="space-y-6 max-w-md">
      <div>
        <Label class="mb-2">Default</Label>
        <PhoneInput phoneType="default" placeholder="123-456-7890" />
      </div>
      <div>
        <Label class="mb-2">With Country Code</Label>
        <PhoneInput phoneType="countryCode" placeholder="+1 123-456-7890" />
      </div>
      <div>
        <PhoneInput phoneType="floating" floatingLabel="Phone number" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Without Icon -->
<Story name="Without Icon">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="phone-no-icon" class="mb-2">Phone Number</Label>
      <PhoneInput id="phone-no-icon" phoneIcon={false} placeholder="123-456-7890" />
    </div>
  {/snippet}
</Story>

<!-- Custom Pattern -->
<Story name="Custom Pattern">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">US Format</Label>
        <PhoneInput pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" placeholder="555-123-4567" />
        <Helper>XXX-XXX-XXXX</Helper>
      </div>
      <div>
        <Label class="mb-2">International Format</Label>
        <PhoneInput pattern="\+[0-9]{1,3}[0-9]{10}" placeholder="+1234567890123" />
        <Helper>+Country code + 10 digits</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Floating Label Style -->
<Story name="Floating Label">
  {#snippet children(args)}
    <div class="max-w-md">
      <PhoneInput phoneType="floating" floatingLabel="Enter your phone number" />
    </div>
  {/snippet}
</Story>

<!-- Contact Form Example -->
<Story name="Contact Form">
  {#snippet children(args)}
    <form class="space-y-4 max-w-md">
      <div>
        <Label for="contact-name" class="mb-2">Full Name</Label>
        <input type="text" id="contact-name" class="w-full p-2.5 text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white" placeholder="John Doe" />
      </div>
      <div>
        <Label for="contact-phone" class="mb-2">Phone Number</Label>
        <PhoneInput id="contact-phone" placeholder="123-456-7890" />
      </div>
      <div>
        <Label for="contact-alt" class="mb-2">Alternative Phone (optional)</Label>
        <PhoneInput id="contact-alt" phoneIcon={false} placeholder="123-456-7890" />
      </div>
    </form>
  {/snippet}
</Story>

