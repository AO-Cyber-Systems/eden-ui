<script module>
  import { defineMeta } from '@storybook/addon-svelte-csf';
  import SplitPane from './SplitPane.svelte';
  import Pane from './Pane.svelte';

  const { Story } = defineMeta({
    title: 'Components/SplitPane',
    component: SplitPane,
    tags: ['autodocs'],
    argTypes: {
      direction: {
        control: { type: 'select' },
        options: ['horizontal', 'vertical'],
        description: 'Direction of the split',
      },
      minSize: {
        control: { type: 'number', min: 50, max: 300 },
        description: 'Minimum size of each pane in pixels',
      },
      responsive: {
        control: 'boolean',
        description: 'Switch to vertical on small screens',
      },
      breakpoint: {
        control: { type: 'number', min: 320, max: 1200 },
        description: 'Breakpoint for responsive switch',
      },
      transition: {
        control: 'boolean',
        description: 'Enable smooth transitions',
      },
      transitionDuration: {
        control: { type: 'number', min: 0, max: 500 },
        description: 'Transition duration in ms',
      },
      keyboardStep: {
        control: { type: 'number', min: 1, max: 10 },
        description: 'Step size for keyboard resize (percentage)',
      },
    },
    args: {
      direction: 'horizontal',
      minSize: 100,
      responsive: true,
      breakpoint: 768,
      transition: true,
      transitionDuration: 150,
      keyboardStep: 2,
    },
  });
</script>

<!-- Default SplitPane -->
<Story name="Default">
  {#snippet children(args)}
    <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
      <SplitPane {...args}>
        <Pane>
          <div class="h-full p-4 bg-blue-50 dark:bg-blue-900/20">
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Left Pane</h3>
            <p class="text-gray-600 dark:text-gray-400">Drag the divider to resize.</p>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-green-50 dark:bg-green-900/20">
            <h3 class="text-lg font-semibold text-gray-900 dark:text-white mb-2">Right Pane</h3>
            <p class="text-gray-600 dark:text-gray-400">This pane will resize accordingly.</p>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Horizontal Split -->
<Story name="Horizontal">
  {#snippet children(args)}
    <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
      <SplitPane direction="horizontal" responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-gray-50 dark:bg-gray-800">
            <h3 class="font-medium text-gray-900 dark:text-white">Panel A</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Left side content</p>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-gray-100 dark:bg-gray-700">
            <h3 class="font-medium text-gray-900 dark:text-white">Panel B</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Right side content</p>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Vertical Split -->
<Story name="Vertical">
  {#snippet children(args)}
    <div class="h-96 border rounded-lg dark:border-gray-700 overflow-hidden">
      <SplitPane direction="vertical" responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-purple-50 dark:bg-purple-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Top Pane</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Content above the divider</p>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-pink-50 dark:bg-pink-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Bottom Pane</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Content below the divider</p>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Three Panes -->
<Story name="Three Panes">
  {#snippet children(args)}
    <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
      <SplitPane direction="horizontal" responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-red-50 dark:bg-red-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Pane 1</h3>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-yellow-50 dark:bg-yellow-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Pane 2</h3>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-green-50 dark:bg-green-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Pane 3</h3>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Initial Sizes -->
<Story name="Initial Sizes">
  {#snippet children(args)}
    <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
      <p class="p-2 text-sm text-gray-500 dark:text-gray-400 bg-gray-50 dark:bg-gray-800">
        Initial sizes: 30% / 70%
      </p>
      <SplitPane direction="horizontal" initialSizes={[30, 70]} responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-blue-50 dark:bg-blue-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Sidebar (30%)</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Smaller initial size</p>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-gray-50 dark:bg-gray-800">
            <h3 class="font-medium text-gray-900 dark:text-white">Main Content (70%)</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Larger initial size</p>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Min Size Constraint -->
<Story name="Min Size Constraint">
  {#snippet children(args)}
    <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
      <p class="p-2 text-sm text-gray-500 dark:text-gray-400 bg-gray-50 dark:bg-gray-800">
        Minimum size: 150px per pane
      </p>
      <SplitPane direction="horizontal" minSize={150} responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-orange-50 dark:bg-orange-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Left</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Cannot shrink below 150px</p>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-teal-50 dark:bg-teal-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Right</h3>
            <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Cannot shrink below 150px</p>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- No Transition -->
<Story name="No Transition">
  {#snippet children(args)}
    <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
      <p class="p-2 text-sm text-gray-500 dark:text-gray-400 bg-gray-50 dark:bg-gray-800">
        Transitions disabled - instant resize
      </p>
      <SplitPane direction="horizontal" transition={false} responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-gray-100 dark:bg-gray-700">
            <h3 class="font-medium text-gray-900 dark:text-white">Pane A</h3>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-gray-200 dark:bg-gray-600">
            <h3 class="font-medium text-gray-900 dark:text-white">Pane B</h3>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Nested Split Panes -->
<Story name="Nested Split Panes">
  {#snippet children(args)}
    <div class="h-96 border rounded-lg dark:border-gray-700 overflow-hidden">
      <SplitPane direction="horizontal" responsive={false}>
        <Pane>
          <div class="h-full p-4 bg-indigo-50 dark:bg-indigo-900/20">
            <h3 class="font-medium text-gray-900 dark:text-white">Sidebar</h3>
            <ul class="mt-4 space-y-2 text-sm text-gray-600 dark:text-gray-400">
              <li>Navigation 1</li>
              <li>Navigation 2</li>
              <li>Navigation 3</li>
            </ul>
          </div>
        </Pane>
        <Pane>
          <SplitPane direction="vertical" responsive={false}>
            <Pane>
              <div class="h-full p-4 bg-cyan-50 dark:bg-cyan-900/20">
                <h3 class="font-medium text-gray-900 dark:text-white">Top Content</h3>
                <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Header or toolbar area</p>
              </div>
            </Pane>
            <Pane>
              <div class="h-full p-4 bg-slate-50 dark:bg-slate-800">
                <h3 class="font-medium text-gray-900 dark:text-white">Main Content</h3>
                <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Main workspace area</p>
              </div>
            </Pane>
          </SplitPane>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Code Editor Layout -->
<Story name="Code Editor Layout">
  {#snippet children(args)}
    <div class="h-96 border rounded-lg dark:border-gray-700 overflow-hidden bg-gray-900">
      <SplitPane direction="horizontal" initialSizes={[20, 60, 20]} minSize={80} responsive={false}>
        <Pane>
          <div class="h-full p-2 bg-gray-800 text-gray-300 text-sm">
            <div class="font-semibold text-white mb-2">Explorer</div>
            <div class="space-y-1">
              <div class="px-2 py-1 hover:bg-gray-700 rounded cursor-pointer">src/</div>
              <div class="px-4 py-1 hover:bg-gray-700 rounded cursor-pointer">index.ts</div>
              <div class="px-4 py-1 hover:bg-gray-700 rounded cursor-pointer">app.ts</div>
              <div class="px-2 py-1 hover:bg-gray-700 rounded cursor-pointer">package.json</div>
            </div>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-4 bg-gray-900 text-gray-300 font-mono text-sm">
            <div class="text-blue-400">import</div>
            <div><span class="text-purple-400">const</span> <span class="text-yellow-400">app</span> = <span class="text-blue-400">express</span>();</div>
            <div></div>
            <div><span class="text-yellow-400">app</span>.<span class="text-blue-400">get</span>(<span class="text-green-400">'/'</span>, (req, res) {"=>"} {"{"}</div>
            <div>  res.<span class="text-blue-400">send</span>(<span class="text-green-400">'Hello World'</span>);</div>
            <div>{"}"});</div>
          </div>
        </Pane>
        <Pane>
          <div class="h-full p-2 bg-gray-800 text-gray-300 text-sm">
            <div class="font-semibold text-white mb-2">Outline</div>
            <div class="space-y-1 text-xs">
              <div class="text-blue-400">app</div>
              <div class="text-yellow-400">get('/')</div>
            </div>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Email Client Layout -->
<Story name="Email Client Layout">
  {#snippet children(args)}
    <div class="h-96 border rounded-lg dark:border-gray-700 overflow-hidden">
      <SplitPane direction="horizontal" initialSizes={[25, 35, 40]} responsive={false}>
        <Pane>
          <div class="h-full bg-gray-50 dark:bg-gray-800">
            <div class="p-3 border-b dark:border-gray-700">
              <h3 class="font-semibold text-gray-900 dark:text-white">Folders</h3>
            </div>
            <div class="p-2 space-y-1">
              <div class="px-3 py-2 bg-blue-100 dark:bg-blue-900/30 rounded text-blue-800 dark:text-blue-300 text-sm">Inbox (12)</div>
              <div class="px-3 py-2 text-gray-600 dark:text-gray-400 text-sm hover:bg-gray-100 dark:hover:bg-gray-700 rounded">Sent</div>
              <div class="px-3 py-2 text-gray-600 dark:text-gray-400 text-sm hover:bg-gray-100 dark:hover:bg-gray-700 rounded">Drafts (3)</div>
              <div class="px-3 py-2 text-gray-600 dark:text-gray-400 text-sm hover:bg-gray-100 dark:hover:bg-gray-700 rounded">Trash</div>
            </div>
          </div>
        </Pane>
        <Pane>
          <div class="h-full bg-white dark:bg-gray-900">
            <div class="p-3 border-b dark:border-gray-700">
              <h3 class="font-semibold text-gray-900 dark:text-white">Messages</h3>
            </div>
            <div class="divide-y dark:divide-gray-700">
              <div class="p-3 bg-blue-50 dark:bg-blue-900/20">
                <div class="font-medium text-gray-900 dark:text-white text-sm">John Doe</div>
                <div class="text-xs text-gray-500 dark:text-gray-400 truncate">Meeting tomorrow at 3pm</div>
              </div>
              <div class="p-3">
                <div class="font-medium text-gray-900 dark:text-white text-sm">Jane Smith</div>
                <div class="text-xs text-gray-500 dark:text-gray-400 truncate">Project update</div>
              </div>
            </div>
          </div>
        </Pane>
        <Pane>
          <div class="h-full bg-gray-50 dark:bg-gray-800 p-4">
            <h3 class="font-semibold text-gray-900 dark:text-white">Meeting tomorrow at 3pm</h3>
            <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">From: John Doe</p>
            <div class="mt-4 text-sm text-gray-600 dark:text-gray-400">
              <p>Hi,</p>
              <p class="mt-2">Just a reminder about our meeting tomorrow at 3pm in the conference room.</p>
              <p class="mt-2">Best regards,<br/>John</p>
            </div>
          </div>
        </Pane>
      </SplitPane>
    </div>
  {/snippet}
</Story>

<!-- Responsive Example -->
<Story name="Responsive">
  {#snippet children(args)}
    <div class="space-y-4">
      <p class="text-sm text-gray-500 dark:text-gray-400">
        This split pane switches from horizontal to vertical on screens smaller than 768px.
      </p>
      <div class="h-80 border rounded-lg dark:border-gray-700 overflow-hidden">
        <SplitPane direction="horizontal" responsive breakpoint={768}>
          <Pane>
            <div class="h-full p-4 bg-amber-50 dark:bg-amber-900/20">
              <h3 class="font-medium text-gray-900 dark:text-white">Pane 1</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Will be on top on mobile</p>
            </div>
          </Pane>
          <Pane>
            <div class="h-full p-4 bg-emerald-50 dark:bg-emerald-900/20">
              <h3 class="font-medium text-gray-900 dark:text-white">Pane 2</h3>
              <p class="text-sm text-gray-500 dark:text-gray-400 mt-2">Will be on bottom on mobile</p>
            </div>
          </Pane>
        </SplitPane>
      </div>
    </div>
  {/snippet}
</Story>

