<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Fileupload from './Fileupload.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Fileupload',
    component: Fileupload,
    tags: ['autodocs'],
    argTypes: {
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the file input',
      },
      clearable: {
        control: 'boolean',
        description: 'Whether the file input has a clear button',
      },
    },
    args: {
      size: 'md',
      clearable: false,
    },
  });

  let files = $state();
</script>

<!-- Default Fileupload -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="file-upload" class="mb-2">Upload file</Label>
      <Fileupload {...args} id="file-upload" bind:files />
      <Helper>SVG, PNG, JPG or GIF (MAX. 800x400px).</Helper>
    </div>
  {/snippet}
</Story>

<!-- Size Variants -->
<Story name="Size Variants">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Small</Label>
        <Fileupload size="sm" />
      </div>
      <div>
        <Label class="mb-2">Medium (default)</Label>
        <Fileupload size="md" />
      </div>
      <div>
        <Label class="mb-2">Large</Label>
        <Fileupload size="lg" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Clearable -->
<Story name="Clearable">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="clearable-file" class="mb-2">Clearable File Input</Label>
      <Fileupload id="clearable-file" clearable />
      <Helper>Select a file and click X to clear</Helper>
    </div>
  {/snippet}
</Story>

<!-- Multiple Files -->
<Story name="Multiple Files">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label for="multi-file" class="mb-2">Upload multiple files</Label>
      <Fileupload id="multi-file" multiple />
      <Helper>You can select multiple files at once.</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Accept Attribute -->
<Story name="Accept Types">
  {#snippet children(args)}
    <div class="space-y-4 max-w-md">
      <div>
        <Label class="mb-2">Images only</Label>
        <Fileupload accept="image/*" />
        <Helper>Only image files are allowed</Helper>
      </div>
      <div>
        <Label class="mb-2">PDF files only</Label>
        <Fileupload accept=".pdf" />
        <Helper>Only PDF files are allowed</Helper>
      </div>
      <div>
        <Label class="mb-2">Documents</Label>
        <Fileupload accept=".pdf,.doc,.docx,.xls,.xlsx" />
        <Helper>PDF, Word, and Excel files</Helper>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Form Example -->
<Story name="Form Example">
  {#snippet children(args)}
    <form class="space-y-4 max-w-md">
      <div>
        <Label for="profile-pic" class="mb-2">Profile Picture</Label>
        <Fileupload id="profile-pic" accept="image/*" clearable />
        <Helper>A profile picture helps others recognize you</Helper>
      </div>
      <div>
        <Label for="resume" class="mb-2">Resume</Label>
        <Fileupload id="resume" accept=".pdf,.doc,.docx" clearable />
        <Helper>Upload your resume in PDF or Word format</Helper>
      </div>
    </form>
  {/snippet}
</Story>

