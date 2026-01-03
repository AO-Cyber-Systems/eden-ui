<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Timepicker from './Timepicker.svelte';
  import Label from '../label/Label.svelte';
  import Helper from '../helper/Helper.svelte';

  const { Story } = defineMeta({
    title: 'Forms/Timepicker',
    component: Timepicker,
    tags: ['autodocs'],
    argTypes: {
      type: {
        control: { type: 'select' },
        options: ['default', 'select', 'dropdown', 'range', 'timerange-dropdown', 'timerange-toggle', 'inline-buttons'],
        description: 'The type/variant of the timepicker',
      },
      size: {
        control: { type: 'select' },
        options: ['sm', 'md', 'lg'],
        description: 'The size of the timepicker',
      },
      disabled: {
        control: 'boolean',
        description: 'Whether the timepicker is disabled',
      },
    },
    args: {
      type: 'default',
      size: 'md',
      disabled: false,
    },
  });

  let time = $state('09:00');
  let endTime = $state('17:00');

  const durationOptions = [
    { value: '30', name: '30 minutes' },
    { value: '60', name: '1 hour' },
    { value: '90', name: '1.5 hours' },
    { value: '120', name: '2 hours' },
  ];

  const timeSlots = ['09:00', '09:30', '10:00', '10:30', '11:00', '11:30', '12:00', '14:00', '14:30', '15:00', '15:30', '16:00'];
</script>

<!-- Default Timepicker -->
<Story name="Default">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Select time</Label>
      <Timepicker {...args} bind:value={time} />
      <Helper>Selected: {time}</Helper>
    </div>
  {/snippet}
</Story>

<!-- Type Variants -->
<Story name="Type Variants">
  {#snippet children(args)}
    <div class="space-y-6 max-w-lg">
      <div>
        <Label class="mb-2">Default</Label>
        <Timepicker type="default" value="09:00" />
      </div>
      <div>
        <Label class="mb-2">With Select</Label>
        <Timepicker type="select" value="09:00" options={durationOptions} optionLabel="Duration" />
      </div>
      <div>
        <Label class="mb-2">With Dropdown</Label>
        <Timepicker type="dropdown" value="09:00" options={durationOptions} optionLabel="Duration" />
      </div>
    </div>
  {/snippet}
</Story>

<!-- Time Range -->
<Story name="Time Range">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Label class="mb-2">Select time range</Label>
      <Timepicker type="range" bind:value={time} bind:endValue={endTime} />
      <Helper>From {time} to {endTime}</Helper>
    </div>
  {/snippet}
</Story>

<!-- Timerange Dropdown -->
<Story name="Timerange Dropdown">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Label class="mb-2">Select meeting time</Label>
      <Timepicker
        type="timerange-dropdown"
        bind:value={time}
        bind:endValue={endTime}
        timerangeLabel="Choose time range"
        timerangeButtonLabel="Apply"
      />
    </div>
  {/snippet}
</Story>

<!-- Timerange Toggle -->
<Story name="Timerange Toggle">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Label class="mb-2">Enable time range</Label>
      <Timepicker
        type="timerange-toggle"
        bind:value={time}
        bind:endValue={endTime}
      />
      <Helper>Toggle to enable time range selection</Helper>
    </div>
  {/snippet}
</Story>

<!-- Inline Buttons -->
<Story name="Inline Buttons">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Label class="mb-2">Quick select time</Label>
      <Timepicker
        type="inline-buttons"
        bind:value={time}
        timeIntervals={timeSlots}
        columns={4}
      />
      <Helper>Selected: {time}</Helper>
    </div>
  {/snippet}
</Story>

<!-- With Min/Max -->
<Story name="With Min Max">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Business hours only</Label>
      <Timepicker value="09:00" min="09:00" max="17:00" />
      <Helper>Available: 9:00 AM - 5:00 PM</Helper>
    </div>
  {/snippet}
</Story>

<!-- Disabled -->
<Story name="Disabled">
  {#snippet children(args)}
    <div class="max-w-md">
      <Label class="mb-2">Disabled timepicker</Label>
      <Timepicker value="10:00" disabled />
    </div>
  {/snippet}
</Story>

<!-- Meeting Scheduler Example -->
<Story name="Meeting Scheduler">
  {#snippet children(args)}
    <form class="space-y-4 max-w-lg p-4 border rounded-lg dark:border-gray-700">
      <h3 class="text-lg font-medium text-gray-900 dark:text-white">Schedule a Meeting</h3>
      <div>
        <Label class="mb-2">Meeting Time</Label>
        <Timepicker type="select" value="09:00" options={durationOptions} optionLabel="Duration" />
      </div>
      <div>
        <Label class="mb-2">Or select a quick slot</Label>
        <Timepicker
          type="inline-buttons"
          timeIntervals={['09:00', '10:00', '11:00', '14:00', '15:00', '16:00']}
          columns={3}
        />
      </div>
    </form>
  {/snippet}
</Story>

