<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import KanbanBoard from './KanbanBoard.svelte';
  import KanbanCard from './KanbanCard.svelte';

  const { Story } = defineMeta({
    title: 'Components/Kanban',
    component: KanbanBoard,
    tags: ['autodocs'],
    argTypes: {},
    args: {},
  });

  // Basic columns for examples
  let basicColumns = $state([
    {
      id: 'todo',
      title: 'To Do',
      cards: [
        { id: 1, title: 'Research competitors' },
        { id: 2, title: 'Create wireframes' },
        { id: 3, title: 'Write documentation' },
      ],
    },
    {
      id: 'progress',
      title: 'In Progress',
      cards: [
        { id: 4, title: 'Design homepage' },
        { id: 5, title: 'Implement auth' },
      ],
    },
    {
      id: 'done',
      title: 'Done',
      cards: [
        { id: 6, title: 'Project setup' },
      ],
    },
  ]);

  // Colored columns
  let coloredColumns = $state([
    {
      id: 'backlog',
      title: 'Backlog',
      color: '#6b7280',
      cards: [
        { id: 1, title: 'User research' },
        { id: 2, title: 'Analytics integration' },
      ],
    },
    {
      id: 'todo',
      title: 'To Do',
      color: '#3b82f6',
      cards: [
        { id: 3, title: 'Landing page design' },
      ],
    },
    {
      id: 'progress',
      title: 'In Progress',
      color: '#f59e0b',
      cards: [
        { id: 4, title: 'API development' },
        { id: 5, title: 'Database schema' },
      ],
    },
    {
      id: 'done',
      title: 'Done',
      color: '#10b981',
      cards: [
        { id: 6, title: 'Project kickoff' },
        { id: 7, title: 'Team onboarding' },
      ],
    },
  ]);

  // Columns with tags
  let taggedColumns = $state([
    {
      id: 'todo',
      title: 'To Do',
      cards: [
        { id: 1, title: 'Fix login bug', tags: ['bug', 'high-priority'] },
        { id: 2, title: 'Add dark mode', tags: ['feature', 'ui'] },
        { id: 3, title: 'Update dependencies', tags: ['maintenance'] },
      ],
    },
    {
      id: 'progress',
      title: 'In Progress',
      cards: [
        { id: 4, title: 'Refactor auth module', tags: ['refactor', 'backend'] },
      ],
    },
    {
      id: 'review',
      title: 'Code Review',
      cards: [
        { id: 5, title: 'Add unit tests', tags: ['testing'] },
      ],
    },
    {
      id: 'done',
      title: 'Done',
      cards: [],
    },
  ]);

  // Columns with descriptions
  let detailedColumns = $state([
    {
      id: 'todo',
      title: 'To Do',
      cards: [
        {
          id: 1,
          title: 'User authentication',
          description: 'Implement login, registration, and password reset functionality',
          tags: ['feature', 'security'],
        },
        {
          id: 2,
          title: 'Dashboard layout',
          description: 'Create responsive dashboard with sidebar navigation',
          tags: ['ui', 'design'],
        },
      ],
    },
    {
      id: 'progress',
      title: 'In Progress',
      cards: [
        {
          id: 3,
          title: 'API endpoints',
          description: 'Build REST API for user management and data retrieval',
          tags: ['backend', 'api'],
        },
      ],
    },
    {
      id: 'done',
      title: 'Done',
      cards: [
        {
          id: 4,
          title: 'Project setup',
          description: 'Initialize repository, configure build tools, and set up CI/CD',
          tags: ['setup'],
        },
      ],
    },
  ]);

  // Project management board
  let projectColumns = $state([
    {
      id: 'backlog',
      title: 'Backlog',
      color: '#94a3b8',
      cards: [
        { id: 1, title: 'Mobile app version', description: 'Plan and design mobile app', tags: ['mobile', 'planning'] },
        { id: 2, title: 'Performance audit', tags: ['optimization'] },
        { id: 3, title: 'Accessibility review', tags: ['a11y'] },
      ],
    },
    {
      id: 'sprint',
      title: 'Sprint',
      color: '#3b82f6',
      cards: [
        { id: 4, title: 'User profile page', description: 'Allow users to edit their profile', tags: ['feature'] },
        { id: 5, title: 'Notification system', tags: ['feature', 'backend'] },
      ],
    },
    {
      id: 'progress',
      title: 'In Progress',
      color: '#f59e0b',
      cards: [
        { id: 6, title: 'Payment integration', description: 'Integrate Stripe for payments', tags: ['payments', 'critical'] },
      ],
    },
    {
      id: 'review',
      title: 'Review',
      color: '#8b5cf6',
      cards: [
        { id: 7, title: 'Search functionality', tags: ['feature', 'ux'] },
      ],
    },
    {
      id: 'done',
      title: 'Done',
      color: '#10b981',
      cards: [
        { id: 8, title: 'Authentication', tags: ['security'] },
        { id: 9, title: 'Database setup', tags: ['backend'] },
      ],
    },
  ]);

  function handleMove(card, from, to) {
    console.log(`Moved "${card.title}" from "${from.title}" to "${to.title}"`);
  }

  function handleAddCard(col) {
    console.log(`Add card requested for column: ${col.title}`);
  }

  // Standalone card for card demo
  const demoCard = { id: 1, title: 'Sample Task', description: 'This is a sample kanban card', tags: ['demo', 'example'] };
</script>

<!-- Default Kanban Board -->
<Story name="Default">
  {#snippet children(args)}
    <div class="min-h-96">
      <KanbanBoard bind:columns={basicColumns} onMove={handleMove} onAddCard={handleAddCard} />
    </div>
  {/snippet}
</Story>

<!-- Colored Columns -->
<Story name="Colored Columns">
  {#snippet children(args)}
    <div class="min-h-96">
      <KanbanBoard bind:columns={coloredColumns} onMove={handleMove} onAddCard={handleAddCard} />
    </div>
  {/snippet}
</Story>

<!-- With Tags -->
<Story name="With Tags">
  {#snippet children(args)}
    <div class="min-h-96">
      <KanbanBoard bind:columns={taggedColumns} onMove={handleMove} onAddCard={handleAddCard} />
    </div>
  {/snippet}
</Story>

<!-- With Descriptions -->
<Story name="With Descriptions">
  {#snippet children(args)}
    <div class="min-h-96">
      <KanbanBoard bind:columns={detailedColumns} onMove={handleMove} onAddCard={handleAddCard} />
    </div>
  {/snippet}
</Story>

<!-- Project Management Board -->
<Story name="Project Management">
  {#snippet children(args)}
    <div class="min-h-96">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-4">Sprint Board</h3>
      <KanbanBoard bind:columns={projectColumns} onMove={handleMove} onAddCard={handleAddCard} />
    </div>
  {/snippet}
</Story>

<!-- Standalone Card -->
<Story name="Kanban Card">
  {#snippet children(args)}
    <div class="max-w-xs">
      <p class="text-sm text-gray-500 dark:text-gray-400 mb-4">
        Individual Kanban card component with title, description, and tags
      </p>
      <KanbanCard card={demoCard} />
    </div>
  {/snippet}
</Story>

<!-- Card Variants -->
<Story name="Card Variants">
  {#snippet children(args)}
    <div class="grid grid-cols-1 md:grid-cols-3 gap-4 max-w-3xl">
      <div>
        <p class="text-sm font-medium text-gray-900 dark:text-white mb-2">Simple</p>
        <KanbanCard card={{ id: 1, title: 'Basic task' }} />
      </div>
      <div>
        <p class="text-sm font-medium text-gray-900 dark:text-white mb-2">With Description</p>
        <KanbanCard card={{ id: 2, title: 'Detailed task', description: 'This task includes additional context' }} />
      </div>
      <div>
        <p class="text-sm font-medium text-gray-900 dark:text-white mb-2">With Tags</p>
        <KanbanCard card={{ id: 3, title: 'Tagged task', tags: ['urgent', 'frontend'] }} />
      </div>
    </div>
  {/snippet}
</Story>

