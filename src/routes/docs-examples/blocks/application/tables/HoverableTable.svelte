<script lang="ts">
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Card, Button, Avatar, Badge, Checkbox } from "flowbite-svelte";
  import { EyeOutline, PenOutline, TrashBinOutline } from "flowbite-svelte-icons";

  let selectedItems = $state<number[]>([]);

  const projects = [
    { id: 1, name: "Website Redesign", client: "Acme Corp", progress: 75, status: "In Progress", dueDate: "2026-01-15", team: ["NS", "BG", "JL"] },
    { id: 2, name: "Mobile App v2", client: "TechStart", progress: 100, status: "Completed", dueDate: "2025-12-20", team: ["TL", "LL"] },
    { id: 3, name: "API Integration", client: "DataFlow", progress: 30, status: "In Progress", dueDate: "2026-02-01", team: ["NS", "TL", "BG"] },
    { id: 4, name: "Dashboard Analytics", client: "Metrics Inc", progress: 50, status: "On Hold", dueDate: "2026-01-30", team: ["JL", "LL"] },
    { id: 5, name: "E-commerce Platform", client: "ShopEasy", progress: 90, status: "Review", dueDate: "2026-01-10", team: ["NS", "BG", "TL", "JL"] }
  ];

  const files = [
    { id: 1, name: "Q4_Report_2025.pdf", type: "PDF", size: "2.4 MB", modified: "2 hours ago", owner: "Neil Sims" },
    { id: 2, name: "Design_Assets.zip", type: "Archive", size: "156 MB", modified: "Yesterday", owner: "Bonnie Green" },
    { id: 3, name: "Presentation_Final.pptx", type: "PowerPoint", size: "8.2 MB", modified: "3 days ago", owner: "Jese Leos" },
    { id: 4, name: "Budget_2026.xlsx", type: "Excel", size: "1.1 MB", modified: "1 week ago", owner: "Thomas Lean" },
    { id: 5, name: "Meeting_Notes.docx", type: "Word", size: "45 KB", modified: "2 weeks ago", owner: "Leslie Livingston" }
  ];

  function toggleItem(id: number) {
    if (selectedItems.includes(id)) {
      selectedItems = selectedItems.filter(i => i !== id);
    } else {
      selectedItems = [...selectedItems, id];
    }
  }

  const statusColors: Record<string, "green" | "yellow" | "blue" | "purple"> = {
    "Completed": "green",
    "In Progress": "blue",
    "On Hold": "yellow",
    "Review": "purple"
  };

  const fileTypeIcons: Record<string, string> = {
    "PDF": "text-red-500",
    "Archive": "text-yellow-500",
    "PowerPoint": "text-orange-500",
    "Excel": "text-green-500",
    "Word": "text-blue-500"
  };
</script>

<div class="space-y-8 p-4">
  <!-- Hoverable Project Table with Actions -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Active Projects</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Hover to reveal actions and details.</p>
    </div>
    <Table hoverable>
      <TableHead>
        <TableHeadCell>Project</TableHeadCell>
        <TableHeadCell>Client</TableHeadCell>
        <TableHeadCell>Progress</TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
        <TableHeadCell>Team</TableHeadCell>
        <TableHeadCell>Due Date</TableHeadCell>
        <TableHeadCell>
          <span class="sr-only">Actions</span>
        </TableHeadCell>
      </TableHead>
      <TableBody>
        {#each projects as project}
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">
              {project.name}
            </TableBodyCell>
            <TableBodyCell>{project.client}</TableBodyCell>
            <TableBodyCell>
              <div class="flex items-center gap-2">
                <div class="h-2 w-20 rounded-full bg-gray-200 dark:bg-gray-700">
                  <div
                    class="h-2 rounded-full bg-primary-600"
                    style="width: {project.progress}%"
                  ></div>
                </div>
                <span class="text-sm text-gray-600 dark:text-gray-400">{project.progress}%</span>
              </div>
            </TableBodyCell>
            <TableBodyCell>
              <Badge color={statusColors[project.status]}>{project.status}</Badge>
            </TableBodyCell>
            <TableBodyCell>
              <div class="flex -space-x-2">
                {#each project.team.slice(0, 3) as initials}
                  <div class="flex h-8 w-8 items-center justify-center rounded-full border-2 border-white bg-primary-100 text-xs font-medium text-primary-800 dark:border-gray-800 dark:bg-primary-900 dark:text-primary-200">
                    {initials}
                  </div>
                {/each}
                {#if project.team.length > 3}
                  <div class="flex h-8 w-8 items-center justify-center rounded-full border-2 border-white bg-gray-100 text-xs font-medium text-gray-800 dark:border-gray-800 dark:bg-gray-700 dark:text-gray-200">
                    +{project.team.length - 3}
                  </div>
                {/if}
              </div>
            </TableBodyCell>
            <TableBodyCell>{project.dueDate}</TableBodyCell>
            <TableBodyCell>
              <div class="flex items-center gap-1">
                <Button size="xs" color="alternative" class="!p-2">
                  <EyeOutline class="h-4 w-4" />
                </Button>
                <Button size="xs" color="alternative" class="!p-2">
                  <PenOutline class="h-4 w-4" />
                </Button>
                <Button size="xs" color="red" class="!p-2">
                  <TrashBinOutline class="h-4 w-4" />
                </Button>
              </div>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Hoverable File Table with Selection -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <div class="flex items-center justify-between">
        <div>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recent Files</h3>
          <p class="text-sm text-gray-500 dark:text-gray-400">Click rows to select files.</p>
        </div>
        {#if selectedItems.length > 0}
          <span class="text-sm text-primary-600 dark:text-primary-400">
            {selectedItems.length} selected
          </span>
        {/if}
      </div>
    </div>
    <Table hoverable>
      <TableHead>
        <TableHeadCell class="!p-4">
          <Checkbox />
        </TableHeadCell>
        <TableHeadCell>File Name</TableHeadCell>
        <TableHeadCell>Type</TableHeadCell>
        <TableHeadCell>Size</TableHeadCell>
        <TableHeadCell>Modified</TableHeadCell>
        <TableHeadCell>Owner</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each files as file}
          <TableBodyRow
            class="cursor-pointer {selectedItems.includes(file.id) ? 'bg-primary-50 dark:bg-primary-900/20' : ''}"
            onclick={() => toggleItem(file.id)}
          >
            <TableBodyCell class="!p-4">
              <Checkbox checked={selectedItems.includes(file.id)} />
            </TableBodyCell>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">
              <div class="flex items-center gap-2">
                <div class="h-8 w-8 rounded bg-gray-100 p-1.5 dark:bg-gray-700">
                  <div class={fileTypeIcons[file.type]}>
                    <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 20 20">
                      <path fill-rule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4z" clip-rule="evenodd" />
                    </svg>
                  </div>
                </div>
                {file.name}
              </div>
            </TableBodyCell>
            <TableBodyCell>{file.type}</TableBodyCell>
            <TableBodyCell>{file.size}</TableBodyCell>
            <TableBodyCell>{file.modified}</TableBodyCell>
            <TableBodyCell>{file.owner}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Hoverable with Row Highlight -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Interactive Rows</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Hover with custom highlight colors.</p>
    </div>
    <Table>
      <TableHead>
        <TableHeadCell>Project</TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
        <TableHeadCell>Progress</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each projects as project}
          <TableBodyRow class="cursor-pointer transition-colors hover:bg-primary-50 dark:hover:bg-primary-900/20">
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">{project.name}</TableBodyCell>
            <TableBodyCell>
              <Badge color={statusColors[project.status]}>{project.status}</Badge>
            </TableBodyCell>
            <TableBodyCell>
              <div class="flex items-center gap-2">
                <div class="h-2 w-full max-w-24 rounded-full bg-gray-200 dark:bg-gray-700">
                  <div class="h-2 rounded-full bg-primary-600" style="width: {project.progress}%"></div>
                </div>
                <span>{project.progress}%</span>
              </div>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>
</div>
