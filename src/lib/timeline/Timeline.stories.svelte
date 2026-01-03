<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import Timeline from './Timeline.svelte';
  import TimelineItem from './TimelineItem.svelte';
  import Activity from './Activity.svelte';
  import ActivityItem from './ActivityItem.svelte';
  import Group from './Group.svelte';
  import GroupItem from './GroupItem.svelte';
  import Button from '../buttons/Button.svelte';
  import Badge from '../badge/Badge.svelte';

  const { Story } = defineMeta({
    title: 'Components/Timeline',
    component: Timeline,
    tags: ['autodocs'],
    argTypes: {
      order: {
        control: { type: 'select' },
        options: ['default', 'horizontal', 'vertical', 'activity', 'group'],
        description: 'Layout order/style of the timeline',
      },
    },
    args: {
      order: 'default',
    },
  });

  // Sample activities data
  const activities = [
    {
      title: '<span class="font-semibold text-gray-900 dark:text-white">Bonnie Green</span> commented on your photo',
      date: 'just now',
      src: 'https://flowbite.com/docs/images/people/profile-picture-2.jpg',
      alt: 'Bonnie Green',
      text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    },
    {
      title: '<span class="font-semibold text-gray-900 dark:text-white">Thomas Lean</span> liked your post',
      date: '2 hours ago',
      src: 'https://flowbite.com/docs/images/people/profile-picture-3.jpg',
      alt: 'Thomas Lean'
    },
    {
      title: '<span class="font-semibold text-gray-900 dark:text-white">Jese Leos</span> started following you',
      date: '1 day ago',
      src: 'https://flowbite.com/docs/images/people/profile-picture-4.jpg',
      alt: 'Jese Leos'
    }
  ];

  // Sample group timelines data
  const groupTimelines = [
    {
      name: '<span class="font-semibold">Flowbite Blog</span> added a new post: <span class="font-semibold">Top 5 Design Trends</span>',
      src: 'https://flowbite.com/docs/images/people/profile-picture-1.jpg',
      alt: 'Flowbite Blog',
      href: '#',
      isPrivate: false,
      comment: '10 min read'
    },
    {
      name: '<span class="font-semibold">Bonnie Green</span> reacted to your photo',
      src: 'https://flowbite.com/docs/images/people/profile-picture-2.jpg',
      alt: 'Bonnie Green',
      href: '#',
      isPrivate: true
    }
  ];
</script>

<!-- Default Timeline -->
<Story name="Default">
  {#snippet children(args)}
    <Timeline {...args}>
      <TimelineItem title="Application UI code in Tailwind CSS" date="2022-02-28">
        <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
          Get access to over 20+ pages including a dashboard layout, charts, kanban board, calendar, and pre-order E-commerce & Marketing pages.
        </p>
        <Button size="sm">
          Learn more
          <svg class="ms-2 w-3 h-3" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" d="M12.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd" />
          </svg>
        </Button>
      </TimelineItem>
      <TimelineItem title="Marketing UI design in Figma" date="2022-03-15">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          All of the pages and components are first designed in Figma and we keep a parity between the two versions even as we update the project.
        </p>
      </TimelineItem>
      <TimelineItem title="E-Commerce UI code in Tailwind CSS" date="2022-04-10">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          Get started with dozens of web components and interactive elements built on top of Tailwind CSS.
        </p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- Vertical Timeline -->
<Story name="Vertical Timeline">
  {#snippet children(args)}
    <Timeline order="vertical">
      <TimelineItem title="Flowbite Application UI v2.0.0" date="2023-01-15" color="green">
        <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
          Released the second major version with new dashboard components.
        </p>
      </TimelineItem>
      <TimelineItem title="Flowbite Library v1.5.0" date="2022-10-20" color="blue">
        <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
          Added new interactive components and improved accessibility.
        </p>
      </TimelineItem>
      <TimelineItem title="Initial Release v1.0.0" date="2022-06-01" color="purple" isLast>
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          First public release of the Flowbite component library.
        </p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- Horizontal Timeline -->
<Story name="Horizontal Timeline">
  {#snippet children(args)}
    <Timeline order="horizontal">
      <TimelineItem title="Step 1" date="2023-01-01" color="primary">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          Getting started with the onboarding process.
        </p>
      </TimelineItem>
      <TimelineItem title="Step 2" date="2023-02-01" color="primary">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          Complete your profile information.
        </p>
      </TimelineItem>
      <TimelineItem title="Step 3" date="2023-03-01" color="primary">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          Final review and submission.
        </p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- Activity Timeline -->
<Story name="Activity Timeline">
  {#snippet children(args)}
    <Timeline order="activity">
      <TimelineItem title="New comment received" date="2024-01-15" color="blue">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          John commented on your latest blog post about web development.
        </p>
      </TimelineItem>
      <TimelineItem title="File uploaded" date="2024-01-14" color="green">
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          Successfully uploaded project files to the shared drive.
        </p>
      </TimelineItem>
      <TimelineItem title="Task completed" date="2024-01-13" color="purple" isLast>
        <p class="text-base font-normal text-gray-500 dark:text-gray-400">
          Finished the design review for the new landing page.
        </p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- Date Format Variants -->
<Story name="Date Format Variants">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">Month-Year (default)</h4>
        <Timeline>
          <TimelineItem title="Event One" date="2024-03-15" dateFormat="month-year">
            <p class="text-gray-500 dark:text-gray-400">Displays as "March 2024"</p>
          </TimelineItem>
        </Timeline>
      </div>

      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">Full Date</h4>
        <Timeline>
          <TimelineItem title="Event Two" date="2024-03-15" dateFormat="full-date">
            <p class="text-gray-500 dark:text-gray-400">Displays as "15 March 2024"</p>
          </TimelineItem>
        </Timeline>
      </div>

      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">Year Only</h4>
        <Timeline>
          <TimelineItem title="Event Three" date="2024-03-15" dateFormat="year">
            <p class="text-gray-500 dark:text-gray-400">Displays as "2024"</p>
          </TimelineItem>
        </Timeline>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Color Variants -->
<Story name="Color Variants">
  {#snippet children(args)}
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">Vertical with Colors</h4>
        <Timeline order="vertical">
          <TimelineItem title="Primary Color" date="2024-01-01" color="primary">
            <p class="text-gray-500 dark:text-gray-400">Using primary color theme.</p>
          </TimelineItem>
          <TimelineItem title="Blue Color" date="2024-02-01" color="blue">
            <p class="text-gray-500 dark:text-gray-400">Using blue color theme.</p>
          </TimelineItem>
          <TimelineItem title="Green Color" date="2024-03-01" color="green">
            <p class="text-gray-500 dark:text-gray-400">Using green color theme.</p>
          </TimelineItem>
          <TimelineItem title="Red Color" date="2024-04-01" color="red">
            <p class="text-gray-500 dark:text-gray-400">Using red color theme.</p>
          </TimelineItem>
          <TimelineItem title="Purple Color" date="2024-05-01" color="purple" isLast>
            <p class="text-gray-500 dark:text-gray-400">Using purple color theme.</p>
          </TimelineItem>
        </Timeline>
      </div>

      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">More Colors</h4>
        <Timeline order="vertical">
          <TimelineItem title="Orange" date="2024-01-01" color="orange">
            <p class="text-gray-500 dark:text-gray-400">Orange accent.</p>
          </TimelineItem>
          <TimelineItem title="Teal" date="2024-02-01" color="teal">
            <p class="text-gray-500 dark:text-gray-400">Teal accent.</p>
          </TimelineItem>
          <TimelineItem title="Pink" date="2024-03-01" color="pink">
            <p class="text-gray-500 dark:text-gray-400">Pink accent.</p>
          </TimelineItem>
          <TimelineItem title="Indigo" date="2024-04-01" color="indigo" isLast>
            <p class="text-gray-500 dark:text-gray-400">Indigo accent.</p>
          </TimelineItem>
        </Timeline>
      </div>
    </div>
  {/snippet}
</Story>

<!-- Activity Component -->
<Story name="Activity Feed">
  {#snippet children(args)}
    <div class="max-w-md">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Recent Activity</h3>
      <Activity>
        <ActivityItem {activities} />
      </Activity>
    </div>
  {/snippet}
</Story>

<!-- Group Component -->
<Story name="Grouped Timeline">
  {#snippet children(args)}
    <div class="max-w-lg">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Activity Log</h3>
      <Group date="January 13th, 2024">
        <GroupItem timelines={groupTimelines} />
      </Group>
      <Group date="January 12th, 2024">
        <GroupItem timelines={[
          {
            name: '<span class="font-semibold">Jese Leos</span> pushed 3 commits',
            src: 'https://flowbite.com/docs/images/people/profile-picture-4.jpg',
            alt: 'Jese Leos',
            href: '#',
            isPrivate: false,
            comment: 'feat: Add new dashboard'
          }
        ]} />
      </Group>
    </div>
  {/snippet}
</Story>

<!-- With Custom Icons -->
<Story name="Custom Orientation Slot">
  {#snippet children(args)}
    <Timeline order="vertical">
      <TimelineItem title="Code Review Passed" date="2024-01-15" color="green">
        {#snippet orientationSlot()}
          <div class="flex absolute -left-4 top-1.5 justify-center items-center w-6 h-6 bg-green-200 rounded-full ring-8 ring-white dark:ring-gray-900 dark:bg-green-900">
            <svg class="w-3 h-3 text-green-600 dark:text-green-400" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
            </svg>
          </div>
        {/snippet}
        <p class="text-gray-500 dark:text-gray-400">All tests passed and code approved.</p>
      </TimelineItem>
      <TimelineItem title="In Progress" date="2024-01-14" color="yellow">
        {#snippet orientationSlot()}
          <div class="flex absolute -left-4 top-1.5 justify-center items-center w-6 h-6 bg-yellow-200 rounded-full ring-8 ring-white dark:ring-gray-900 dark:bg-yellow-900">
            <svg class="w-3 h-3 text-yellow-600 dark:text-yellow-400 animate-spin" fill="none" viewBox="0 0 24 24">
              <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
              <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"></path>
            </svg>
          </div>
        {/snippet}
        <p class="text-gray-500 dark:text-gray-400">Currently working on feature implementation.</p>
      </TimelineItem>
      <TimelineItem title="Issue Opened" date="2024-01-13" color="red" isLast>
        {#snippet orientationSlot()}
          <div class="flex absolute -left-4 top-1.5 justify-center items-center w-6 h-6 bg-red-200 rounded-full ring-8 ring-white dark:ring-gray-900 dark:bg-red-900">
            <svg class="w-3 h-3 text-red-600 dark:text-red-400" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
            </svg>
          </div>
        {/snippet}
        <p class="text-gray-500 dark:text-gray-400">Bug report received from QA team.</p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- With Date Prefix -->
<Story name="With Date Prefix">
  {#snippet children(args)}
    <Timeline>
      <TimelineItem title="Project Deadline" date="2024-06-30" datePrefix="Due by:">
        <p class="text-gray-500 dark:text-gray-400">Complete all deliverables by this date.</p>
      </TimelineItem>
      <TimelineItem title="Review Meeting" date="2024-06-15" datePrefix="Scheduled for:">
        <p class="text-gray-500 dark:text-gray-400">Team sync to review progress.</p>
      </TimelineItem>
      <TimelineItem title="Project Started" date="2024-01-01" datePrefix="Started on:">
        <p class="text-gray-500 dark:text-gray-400">Initial project kickoff.</p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- Version History Example -->
<Story name="Version History">
  {#snippet children(args)}
    <div class="max-w-lg">
      <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6">Version History</h3>
      <Timeline order="vertical">
        <TimelineItem title="v3.0.0 - Major Release" date="2024-03-01" dateFormat="full-date" color="green">
          <div class="flex items-center gap-2 mb-2">
            <Badge color="green">Latest</Badge>
            <Badge color="blue">Stable</Badge>
          </div>
          <ul class="list-disc list-inside text-gray-500 dark:text-gray-400 text-sm space-y-1">
            <li>Complete UI redesign</li>
            <li>New component library</li>
            <li>Performance improvements</li>
          </ul>
        </TimelineItem>
        <TimelineItem title="v2.5.0 - Feature Update" date="2024-01-15" dateFormat="full-date" color="blue">
          <ul class="list-disc list-inside text-gray-500 dark:text-gray-400 text-sm space-y-1">
            <li>Added dark mode support</li>
            <li>New chart components</li>
          </ul>
        </TimelineItem>
        <TimelineItem title="v2.0.0 - Breaking Changes" date="2023-10-01" dateFormat="full-date" color="orange">
          <Badge color="yellow" class="mb-2">Breaking</Badge>
          <ul class="list-disc list-inside text-gray-500 dark:text-gray-400 text-sm space-y-1">
            <li>API restructuring</li>
            <li>Deprecated legacy components</li>
          </ul>
        </TimelineItem>
        <TimelineItem title="v1.0.0 - Initial Release" date="2023-06-01" dateFormat="full-date" color="gray" isLast>
          <p class="text-gray-500 dark:text-gray-400 text-sm">
            First public release of the library.
          </p>
        </TimelineItem>
      </Timeline>
    </div>
  {/snippet}
</Story>

<!-- Order Tracking Example -->
<Story name="Order Tracking">
  {#snippet children(args)}
    <div class="max-w-md p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
      <h3 class="text-lg font-bold text-gray-900 dark:text-white mb-2">Order #12345</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">Track your package delivery</p>

      <Timeline order="vertical">
        <TimelineItem title="Out for Delivery" date="2024-01-15" dateFormat="full-date" color="green">
          {#snippet orientationSlot()}
            <div class="flex absolute -left-4 top-1.5 justify-center items-center w-6 h-6 bg-green-500 rounded-full ring-8 ring-white dark:ring-gray-800">
              <svg class="w-3 h-3 text-white" fill="currentColor" viewBox="0 0 20 20">
                <path d="M8 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM15 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0z"/>
                <path d="M3 4a1 1 0 00-1 1v10a1 1 0 001 1h1.05a2.5 2.5 0 014.9 0H10a1 1 0 001-1V5a1 1 0 00-1-1H3z"/>
                <path d="M14 7a1 1 0 00-1 1v6.05A2.5 2.5 0 0115.95 16H17a1 1 0 001-1v-5a1 1 0 00-.293-.707l-2-2A1 1 0 0015 7h-1z"/>
              </svg>
            </div>
          {/snippet}
          <p class="text-sm text-gray-500 dark:text-gray-400">Package is on its way to you!</p>
        </TimelineItem>
        <TimelineItem title="Shipped" date="2024-01-14" dateFormat="full-date" color="blue">
          <p class="text-sm text-gray-500 dark:text-gray-400">Left the distribution center</p>
        </TimelineItem>
        <TimelineItem title="Processing" date="2024-01-13" dateFormat="full-date" color="blue">
          <p class="text-sm text-gray-500 dark:text-gray-400">Your order is being prepared</p>
        </TimelineItem>
        <TimelineItem title="Order Placed" date="2024-01-12" dateFormat="full-date" color="blue" isLast>
          <p class="text-sm text-gray-500 dark:text-gray-400">Thank you for your order!</p>
        </TimelineItem>
      </Timeline>
    </div>
  {/snippet}
</Story>

<!-- Project Roadmap Example -->
<Story name="Project Roadmap">
  {#snippet children(args)}
    <div class="p-6 bg-gray-50 dark:bg-gray-900 rounded-lg">
      <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6">2024 Roadmap</h3>

      <Timeline order="horizontal">
        <TimelineItem title="Q1: Foundation" date="2024-03-31" color="green">
          <Badge color="green" class="mb-2">Completed</Badge>
          <p class="text-sm text-gray-500 dark:text-gray-400">Core architecture and basic features</p>
        </TimelineItem>
        <TimelineItem title="Q2: Growth" date="2024-06-30" color="blue">
          <Badge color="blue" class="mb-2">In Progress</Badge>
          <p class="text-sm text-gray-500 dark:text-gray-400">User acquisition and feature expansion</p>
        </TimelineItem>
        <TimelineItem title="Q3: Scale" date="2024-09-30" color="gray">
          <Badge color="gray" class="mb-2">Planned</Badge>
          <p class="text-sm text-gray-500 dark:text-gray-400">Infrastructure scaling and optimization</p>
        </TimelineItem>
        <TimelineItem title="Q4: Expansion" date="2024-12-31" color="gray">
          <Badge color="gray" class="mb-2">Planned</Badge>
          <p class="text-sm text-gray-500 dark:text-gray-400">New markets and enterprise features</p>
        </TimelineItem>
      </Timeline>
    </div>
  {/snippet}
</Story>

<!-- Social Activity Feed -->
<Story name="Social Activity Feed">
  {#snippet children(args)}
    <div class="max-w-md">
      <div class="flex justify-between items-center mb-4">
        <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Notifications</h3>
        <button class="text-sm text-blue-600 hover:underline">Mark all as read</button>
      </div>

      <Activity>
        <ActivityItem activities={[
          {
            title: '<span class="font-semibold text-gray-900 dark:text-white">Sarah Wilson</span> mentioned you in a comment',
            date: '2 min ago',
            src: 'https://flowbite.com/docs/images/people/profile-picture-1.jpg',
            alt: 'Sarah Wilson',
            text: '@you Great work on the new design! The color scheme is perfect.'
          },
          {
            title: '<span class="font-semibold text-gray-900 dark:text-white">Mike Johnson</span> sent you a friend request',
            date: '1 hour ago',
            src: 'https://flowbite.com/docs/images/people/profile-picture-3.jpg',
            alt: 'Mike Johnson'
          },
          {
            title: '<span class="font-semibold text-gray-900 dark:text-white">Emily Davis</span> shared your post',
            date: '3 hours ago',
            src: 'https://flowbite.com/docs/images/people/profile-picture-5.jpg',
            alt: 'Emily Davis'
          },
          {
            title: '<span class="font-semibold text-gray-900 dark:text-white">Team Project</span> deadline reminder',
            date: 'Yesterday',
            src: 'https://flowbite.com/docs/images/people/profile-picture-2.jpg',
            alt: 'Team',
            text: 'Sprint review meeting tomorrow at 10 AM.'
          }
        ]} />
      </Activity>
    </div>
  {/snippet}
</Story>

<!-- Git Commit History -->
<Story name="Git Commit History">
  {#snippet children(args)}
    <div class="max-w-lg">
      <Group date="Today">
        <GroupItem timelines={[
          {
            name: '<span class="font-semibold">feat:</span> Add user authentication',
            src: 'https://flowbite.com/docs/images/people/profile-picture-1.jpg',
            alt: 'Developer',
            href: '#',
            isPrivate: false,
            comment: 'abc1234'
          },
          {
            name: '<span class="font-semibold">fix:</span> Resolve login redirect issue',
            src: 'https://flowbite.com/docs/images/people/profile-picture-1.jpg',
            alt: 'Developer',
            href: '#',
            isPrivate: false,
            comment: 'def5678'
          }
        ]} />
      </Group>
      <Group date="Yesterday">
        <GroupItem timelines={[
          {
            name: '<span class="font-semibold">chore:</span> Update dependencies',
            src: 'https://flowbite.com/docs/images/people/profile-picture-2.jpg',
            alt: 'Developer 2',
            href: '#',
            isPrivate: true,
            comment: 'ghi9012'
          },
          {
            name: '<span class="font-semibold">docs:</span> Update README',
            src: 'https://flowbite.com/docs/images/people/profile-picture-3.jpg',
            alt: 'Developer 3',
            href: '#',
            isPrivate: false,
            comment: 'jkl3456'
          }
        ]} />
      </Group>
    </div>
  {/snippet}
</Story>

<!-- Minimal Timeline -->
<Story name="Minimal Timeline">
  {#snippet children(args)}
    <Timeline>
      <TimelineItem title="Step completed" date="2024-01-15">
        <p class="text-gray-500 dark:text-gray-400">Task finished successfully.</p>
      </TimelineItem>
      <TimelineItem title="Step completed" date="2024-01-14">
        <p class="text-gray-500 dark:text-gray-400">Another task done.</p>
      </TimelineItem>
      <TimelineItem title="Step completed" date="2024-01-13">
        <p class="text-gray-500 dark:text-gray-400">Initial task completed.</p>
      </TimelineItem>
    </Timeline>
  {/snippet}
</Story>

<!-- isLast Prop Demo -->
<Story name="isLast Prop (Connector Control)">
  {#snippet children(args)}
    <div class="space-y-8">
      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">Without isLast (connector visible)</h4>
        <Timeline order="vertical">
          <TimelineItem title="Item 1" date="2024-01-01" color="blue">
            <p class="text-gray-500 dark:text-gray-400">Has connector line below.</p>
          </TimelineItem>
          <TimelineItem title="Item 2" date="2024-01-02" color="blue">
            <p class="text-gray-500 dark:text-gray-400">Connector continues.</p>
          </TimelineItem>
        </Timeline>
      </div>

      <div>
        <h4 class="text-sm font-medium text-gray-900 dark:text-white mb-4">With isLast (connector hidden on last item)</h4>
        <Timeline order="vertical">
          <TimelineItem title="Item 1" date="2024-01-01" color="green">
            <p class="text-gray-500 dark:text-gray-400">Has connector line below.</p>
          </TimelineItem>
          <TimelineItem title="Item 2" date="2024-01-02" color="green" isLast>
            <p class="text-gray-500 dark:text-gray-400">No connector (isLast=true).</p>
          </TimelineItem>
        </Timeline>
      </div>
    </div>
  {/snippet}
</Story>
