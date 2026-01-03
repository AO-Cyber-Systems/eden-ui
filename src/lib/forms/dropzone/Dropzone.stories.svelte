<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Dropzone from './Dropzone.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Dropzone',
    component: Dropzone,
    tags: ['autodocs'],
  });

  let files = $state(null);
</script>

<!-- Default Dropzone -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Dropzone bind:files>
        <svg class="w-8 h-8 mb-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 16">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2"/>
        </svg>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
          <span class="font-semibold">Click to upload</span> or drag and drop
        </p>
        <p class="text-xs text-gray-500 dark:text-gray-400">SVG, PNG, JPG or GIF (MAX. 800x400px)</p>
      </Dropzone>
      {#if files}
        <Helper color="green" class="mt-2">
          {files.length} file(s) selected
        </Helper>
      {/if}
    </div>
  {/snippet}
</Story>

<!-- With Custom Content -->
<Story name="Custom Content">
  {#snippet children(args)}
    <div class="max-w-md">
      <Dropzone>
        <div class="text-center">
          <svg class="w-10 h-10 mx-auto mb-3 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"/>
          </svg>
          <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-1">Upload files</h3>
          <p class="text-sm text-gray-500 dark:text-gray-400">Drag and drop or browse</p>
        </div>
      </Dropzone>
    </div>
  {/snippet}
</Story>

<!-- Image Upload Example -->
<Story name="Image Upload">
  {#snippet children(args)}
    <div class="max-w-md">
      <Dropzone accept="image/*">
        <svg class="w-8 h-8 mb-4 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"/>
        </svg>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
          <span class="font-semibold">Upload an image</span>
        </p>
        <p class="text-xs text-gray-500 dark:text-gray-400">PNG, JPG, GIF up to 10MB</p>
      </Dropzone>
    </div>
  {/snippet}
</Story>

<!-- Document Upload Example -->
<Story name="Document Upload">
  {#snippet children(args)}
    <div class="max-w-md">
      <Dropzone accept=".pdf,.doc,.docx">
        <svg class="w-8 h-8 mb-4 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
        </svg>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
          <span class="font-semibold">Upload documents</span>
        </p>
        <p class="text-xs text-gray-500 dark:text-gray-400">PDF, DOC, DOCX files</p>
      </Dropzone>
    </div>
  {/snippet}
</Story>

<!-- Multiple Files -->
<Story name="Multiple Files">
  {#snippet children(args)}
    <div class="max-w-md">
      <Dropzone multiple>
        <svg class="w-8 h-8 mb-4 text-gray-500 dark:text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7v8a2 2 0 002 2h6M8 7V5a2 2 0 012-2h4.586a1 1 0 01.707.293l4.414 4.414a1 1 0 01.293.707V15a2 2 0 01-2 2h-2M8 7H6a2 2 0 00-2 2v10a2 2 0 002 2h8a2 2 0 002-2v-2"/>
        </svg>
        <p class="mb-2 text-sm text-gray-500 dark:text-gray-400">
          <span class="font-semibold">Select multiple files</span>
        </p>
        <p class="text-xs text-gray-500 dark:text-gray-400">Hold Ctrl/Cmd to select multiple</p>
      </Dropzone>
    </div>
  {/snippet}
</Story>

