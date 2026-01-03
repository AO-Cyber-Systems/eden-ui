<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Textarea from './Textarea.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';
  import Button from '$lib/buttons/Button.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Textarea',
    component: Textarea,
    tags: ['autodocs'],
    argTypes: {
      disabled: {
        control: 'boolean',
        description: 'Whether the textarea is disabled',
      },
      clearable: {
        control: 'boolean',
        description: 'Whether the textarea has a clear button',
      },
    },
    args: {
      disabled: false,
      clearable: false,
    },
  });

  let message = $state('');
</script>

<!-- Default Textarea -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="message" class="mb-2">Your message</Label>
      <Textarea {...args} id="message" placeholder="Write your thoughts here..." rows={4} bind:value={message} />
    </div>
  {/snippet}
</Story>

<!-- With Helper Text -->
<Story name="With Helper">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="comment" class="mb-2">Your comment</Label>
      <Textarea id="comment" placeholder="Leave a comment..." rows={4} />
      <Helper>Remember to be respectful and constructive.</Helper>
    </div>
  {/snippet}
</Story>

<!-- Clearable -->
<Story name="Clearable">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="clearable-textarea" class="mb-2">Clearable Textarea</Label>
      <Textarea id="clearable-textarea" placeholder="Type something..." rows={4} clearable />
      <Helper>Click the X to clear the content</Helper>
    </div>
  {/snippet}
</Story>

<!-- Disabled -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="disabled-textarea" class="mb-2">Disabled Textarea</Label>
      <Textarea id="disabled-textarea" disabled rows={4} value="This content cannot be edited" />
    </div>
  {/snippet}
</Story>

<!-- With Header -->
<Story name="With Header">
  {#snippet children(args)}
    <div class="max-w-md">
      <Textarea id="header-textarea" placeholder="Write your post..." rows={4}>
        {#snippet header()}
          <div class="flex items-center gap-2 border-b border-gray-200 dark:border-gray-600 pb-2">
            <button type="button" class="p-1 text-gray-500 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
              <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path d="M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z"/>
              </svg>
            </button>
            <button type="button" class="p-1 text-gray-500 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
              <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"/>
              </svg>
            </button>
          </div>
        {/snippet}
      </Textarea>
    </div>
  {/snippet}
</Story>

<!-- With Footer -->
<Story name="With Footer">
  {#snippet children(args)}
    <div class="max-w-md">
      <Textarea id="footer-textarea" placeholder="Write your message..." rows={4}>
        {#snippet footer()}
          <div class="flex items-center justify-between pt-2 border-t border-gray-200 dark:border-gray-600">
            <div class="flex gap-2">
              <button type="button" class="p-1 text-gray-500 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M8 4a3 3 0 00-3 3v4a5 5 0 0010 0V7a1 1 0 112 0v4a7 7 0 11-14 0V7a5 5 0 0110 0v4a3 3 0 11-6 0V7a1 1 0 012 0v4a1 1 0 102 0V7a3 3 0 00-3-3z" clip-rule="evenodd"/>
                </svg>
              </button>
              <button type="button" class="p-1 text-gray-500 rounded hover:bg-gray-100 dark:hover:bg-gray-600">
                <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"/>
                </svg>
              </button>
            </div>
            <Button size="sm">Send</Button>
          </div>
        {/snippet}
      </Textarea>
    </div>
  {/snippet}
</Story>

<!-- Comment Form Example -->
<Story name="Comment Form">
  {#snippet children(args)}
    <form class="max-w-md space-y-4">
      <div>
        <Label for="author" class="mb-2">Name</Label>
        <input type="text" id="author" class="w-full p-2.5 text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white" placeholder="Your name" />
      </div>
      <div>
        <Label for="comment-form" class="mb-2">Comment</Label>
        <Textarea id="comment-form" placeholder="Write your comment..." rows={6} />
      </div>
      <Button type="submit">Post Comment</Button>
    </form>
  {/snippet}
</Story>

