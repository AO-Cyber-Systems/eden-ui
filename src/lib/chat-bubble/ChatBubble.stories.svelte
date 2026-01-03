<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import ChatBubble from './ChatBubble.svelte';

  const { Story } = defineMeta({
    title: 'Components/ChatBubble',
    component: ChatBubble,
    tags: ['autodocs'],
    argTypes: {
      position: {
        control: { type: 'select' },
        options: ['sender', 'receiver'],
        description: 'Whether this is a sent or received message',
      },
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the chat bubble',
      },
      color: {
        control: { type: 'select' },
        options: ['default', 'primary', 'gray', 'alternative'],
        description: 'The color variant of the bubble',
      },
    },
    args: {
      position: 'receiver',
      size: 'md',
      color: 'default',
    },
  });
</script>

<!-- Default Chat Bubble -->
<Story name="Default">
  {#snippet children(args)}
    <ChatBubble {...args} name="John Doe" time="11:46 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
      Hello! How are you doing today?
    </ChatBubble>
  {/snippet}
</Story>

<!-- Sender Message -->
<Story name="Sender" args={{ position: 'sender' }}>
  {#snippet children(args)}
    <ChatBubble {...args} name="You" time="11:47 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-5.jpg">
      I'm doing great, thanks for asking!
    </ChatBubble>
  {/snippet}
</Story>

<!-- Conversation -->
<Story name="Conversation">
  {#snippet children(args)}
    <div class="flex flex-col gap-4 max-w-md">
      <ChatBubble position="receiver" name="John Doe" time="11:46 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
        Hey! How's the project going?
      </ChatBubble>
      <ChatBubble position="sender" name="You" time="11:47 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-5.jpg">
        It's going well! Just finished the main features.
      </ChatBubble>
      <ChatBubble position="receiver" name="John Doe" time="11:48 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
        That's great! Can you share the demo link?
      </ChatBubble>
      <ChatBubble position="sender" name="You" time="11:50 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-5.jpg">
        Sure, I'll send it over in a few minutes!
      </ChatBubble>
    </div>
  {/snippet}
</Story>

<!-- With Status -->
<Story name="With Status">
  {#snippet children(args)}
    <div class="flex flex-col gap-4 max-w-md">
      <ChatBubble position="sender" name="You" time="11:47 AM" status="Delivered" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-5.jpg">
        This message was delivered.
      </ChatBubble>
      <ChatBubble position="sender" name="You" time="11:48 AM" status="Read" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-5.jpg">
        This message was read.
      </ChatBubble>
    </div>
  {/snippet}
</Story>

<!-- Sizes -->
<Story name="Sizes">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <ChatBubble size="sm" name="User" time="11:46 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
        Small chat bubble
      </ChatBubble>
      <ChatBubble size="md" name="User" time="11:46 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
        Medium chat bubble (default)
      </ChatBubble>
      <ChatBubble size="lg" name="User" time="11:46 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
        Large chat bubble
      </ChatBubble>
    </div>
  {/snippet}
</Story>

<!-- Colors -->
<Story name="Colors">
  {#snippet children(args)}
    <div class="flex flex-col gap-4">
      <ChatBubble color="default" name="User" time="11:46 AM">
        Default color bubble
      </ChatBubble>
      <ChatBubble color="primary" name="User" time="11:46 AM">
        Primary color bubble
      </ChatBubble>
      <ChatBubble color="gray" name="User" time="11:46 AM">
        Gray color bubble
      </ChatBubble>
      <ChatBubble color="alternative" name="User" time="11:46 AM">
        Alternative color bubble
      </ChatBubble>
    </div>
  {/snippet}
</Story>

<!-- Long Message -->
<Story name="Long Message">
  {#snippet children(args)}
    <div class="max-w-md">
      <ChatBubble position="receiver" name="John Doe" time="11:46 AM" avatarSrc="https://flowbite.com/docs/images/people/profile-picture-3.jpg">
        This is a longer message that demonstrates how the chat bubble handles multiple lines of text.
        It should wrap nicely and maintain proper padding and styling throughout the entire message content.
        The bubble expands vertically to accommodate all the text while keeping the design consistent.
      </ChatBubble>
    </div>
  {/snippet}
</Story>

<!-- Without Avatar -->
<Story name="Without Avatar">
  {#snippet children(args)}
    <div class="flex flex-col gap-4 max-w-md">
      <ChatBubble position="receiver" name="Anonymous" time="11:46 AM">
        Message without an avatar image
      </ChatBubble>
      <ChatBubble position="sender" name="You" time="11:47 AM">
        Reply without an avatar
      </ChatBubble>
    </div>
  {/snippet}
</Story>
