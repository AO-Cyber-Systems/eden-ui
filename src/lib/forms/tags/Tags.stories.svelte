<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Tags from './Tags.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Tags',
    component: Tags,
    tags: ['autodocs'],
    argTypes: {
      unique: {
        control: 'boolean',
        description: 'Whether duplicate tags are prevented',
      },
      allowNewTags: {
        control: 'boolean',
        description: 'Whether new tags can be added',
      },
      showHelper: {
        control: 'boolean',
        description: 'Whether to show helper messages',
      },
      showAvailableTags: {
        control: 'boolean',
        description: 'Whether to show available tags hint',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the input is disabled',
      },
    },
    args: {
      unique: false,
      allowNewTags: true,
      showHelper: false,
      showAvailableTags: false,
      disabled: false,
    },
  });

  let tags = $state(['svelte', 'tailwind']);
  let skillTags = $state([]);

  const availableSkills = ['JavaScript', 'TypeScript', 'Python', 'Rust', 'Go', 'Java', 'React', 'Vue', 'Svelte', 'Angular'];
  const categories = ['Electronics', 'Clothing', 'Books', 'Sports', 'Home', 'Garden'];
</script>

<!-- Default Tags -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Tags</Label>
      <Tags {...args} bind:value={tags} placeholder="Add a tag..." />
      <Helper>Press Enter to add a tag, Backspace to remove</Helper>
    </div>
  {/snippet}
</Story>

<!-- Unique Tags Only -->
<Story name="Unique Tags">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Categories (unique only)</Label>
      <Tags value={[]} unique showHelper placeholder="Add category..." />
      <Helper>Duplicate tags will show a warning</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Available Tags -->
<Story name="With Available Tags">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Skills</Label>
      <Tags
        bind:value={skillTags}
        availableTags={availableSkills}
        showAvailableTags
        unique
        placeholder="Type to search skills..."
      />
      <Helper>
        Selected: {skillTags.length > 0 ? skillTags.join(', ') : 'None'}
      </Helper>
    </div>
  {/snippet}
</Story>

<!-- Restricted to Available Tags -->
<Story name="Restricted Tags">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Product Categories</Label>
      <Tags
        value={[]}
        availableTags={categories}
        allowNewTags={false}
        showHelper
        showAvailableTags
        unique
        placeholder="Select a category..."
      />
      <Helper>Only predefined categories can be selected</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Preselected Tags -->
<Story name="Preselected">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Technologies</Label>
      <Tags
        value={['React', 'TypeScript', 'Node.js']}
        placeholder="Add more..."
      />
    </div>
  {/snippet}
</Story>

<!-- Disabled -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Locked Tags</Label>
      <Tags
        value={['locked', 'readonly']}
        disabled
        placeholder="Cannot edit..."
      />
    </div>
  {/snippet}
</Story>

<!-- Blog Post Tags Example -->
<Story name="Blog Post Tags">
  {#snippet children(args)}
    <form class="space-y-4 max-w-lg">
      <div>
        <Label class="mb-2">Post Title</Label>
        <input
          type="text"
          class="w-full p-2.5 text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
          placeholder="Enter post title..."
        />
      </div>
      <div>
        <Label class="mb-2">Tags</Label>
        <Tags
          value={[]}
          unique
          showHelper
          placeholder="Add tags for your post..."
        />
        <Helper>Add relevant tags to help readers find your post</Helper>
      </div>
    </form>
  {/snippet}
</Story>

<!-- Product Attributes Example -->
<Story name="Product Attributes">
  {#snippet children(args)}
    <div class="space-y-4 max-w-lg p-4 border rounded-lg dark:border-gray-700">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white">Product Details</h3>
      <div>
        <Label class="mb-2">Colors</Label>
        <Tags
          value={['Red', 'Blue', 'Green']}
          unique
          placeholder="Add color variants..."
        />
      </div>
      <div>
        <Label class="mb-2">Sizes</Label>
        <Tags
          value={['S', 'M', 'L', 'XL']}
          unique
          placeholder="Add sizes..."
        />
      </div>
      <div>
        <Label class="mb-2">Materials</Label>
        <Tags
          value={['Cotton', 'Polyester']}
          unique
          placeholder="Add materials..."
        />
      </div>
    </div>
  {/snippet}
</Story>

