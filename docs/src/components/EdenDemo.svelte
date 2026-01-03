<script lang="ts">
  /**
   * Demo component that imports from Eden UI
   * Used to verify $lib alias works in docs
   */
  import Button from '$lib/buttons/Button.svelte';
  import Card from '$lib/card/Card.svelte';
  import Badge from '$lib/badge/Badge.svelte';
</script>

<Card class="p-4">
  <h3 class="text-lg font-semibold mb-2">Eden UI Demo</h3>
  <p class="text-gray-600 dark:text-gray-400 mb-4">
    This component imports directly from the Eden UI library.
  </p>
  <div class="flex gap-2">
    <Button color="primary">Primary</Button>
    <Button color="secondary">Secondary</Button>
    <Badge color="green">Active</Badge>
  </div>
</Card>
