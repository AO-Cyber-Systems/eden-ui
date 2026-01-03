<script lang="ts">
  /**
   * Button Component Stories
   *
   * Interactive demos for all Button variants.
   * Each story showcases different prop combinations.
   */
  import Button from '$lib/buttons/Button.svelte';
  import GradientButton from '$lib/buttons/GradientButton.svelte';
</script>

<!-- Default Button -->
<story name="Default">
  <Button>Click Me</Button>
</story>

<!-- Color Variants -->
<story name="Colors">
  <div class="flex flex-wrap gap-2 p-4">
    <Button color="primary">Primary</Button>
    <Button color="secondary">Secondary</Button>
    <Button color="gray">Gray</Button>
    <Button color="red">Red</Button>
    <Button color="green">Green</Button>
    <Button color="blue">Blue</Button>
    <Button color="yellow">Yellow</Button>
    <Button color="purple">Purple</Button>
  </div>
</story>

<!-- Size Variants -->
<story name="Sizes">
  <div class="flex items-center gap-2 p-4">
    <Button size="xs">Extra Small</Button>
    <Button size="sm">Small</Button>
    <Button size="md">Medium</Button>
    <Button size="lg">Large</Button>
    <Button size="xl">Extra Large</Button>
  </div>
</story>

<!-- Outline Variants -->
<story name="Outline">
  <div class="flex flex-wrap gap-2 p-4">
    <Button outline>Default</Button>
    <Button color="primary" outline>Primary</Button>
    <Button color="red" outline>Danger</Button>
    <Button color="green" outline>Success</Button>
  </div>
</story>

<!-- Pill Shape -->
<story name="Pill">
  <div class="flex flex-wrap gap-2 p-4">
    <Button pill>Default Pill</Button>
    <Button color="primary" pill>Primary Pill</Button>
    <Button color="gradient-purple-blue" pill>Gradient Pill</Button>
  </div>
</story>

<!-- With Shadow -->
<story name="Shadow">
  <div class="flex flex-wrap gap-2 p-4">
    <Button shadow>Shadow</Button>
    <Button color="primary" shadow>Primary Shadow</Button>
    <Button color="green" shadow>Success Shadow</Button>
    <Button color="red" shadow>Danger Shadow</Button>
  </div>
</story>

<!-- Disabled State -->
<story name="Disabled">
  <div class="flex flex-wrap gap-2 p-4">
    <Button disabled>Disabled</Button>
    <Button color="primary" disabled>Primary Disabled</Button>
    <Button outline disabled>Outline Disabled</Button>
  </div>
</story>

<!-- Gradient Buttons -->
<story name="Gradient">
  <div class="flex flex-wrap gap-2 p-4">
    <GradientButton color="blue">Blue Gradient</GradientButton>
    <GradientButton color="green">Green Gradient</GradientButton>
    <GradientButton color="cyan">Cyan Gradient</GradientButton>
    <GradientButton color="teal">Teal Gradient</GradientButton>
    <GradientButton color="lime">Lime Gradient</GradientButton>
    <GradientButton color="red">Red Gradient</GradientButton>
    <GradientButton color="pink">Pink Gradient</GradientButton>
    <GradientButton color="purple">Purple Gradient</GradientButton>
  </div>
</story>

<!-- Compound Gradients -->
<story name="Compound Gradient">
  <div class="flex flex-wrap gap-2 p-4">
    <GradientButton color="purple-blue">Purple to Blue</GradientButton>
    <GradientButton color="cyan-blue">Cyan to Blue</GradientButton>
    <GradientButton color="green-blue">Green to Blue</GradientButton>
    <GradientButton color="purple-pink">Purple to Pink</GradientButton>
    <GradientButton color="pink-orange">Pink to Orange</GradientButton>
    <GradientButton color="teal-lime">Teal to Lime</GradientButton>
    <GradientButton color="red-yellow">Red to Yellow</GradientButton>
  </div>
</story>
