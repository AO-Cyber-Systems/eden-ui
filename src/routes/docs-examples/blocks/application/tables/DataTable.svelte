<script lang="ts">
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Card, Button, Input, Select, Badge, Checkbox, Avatar, Dropdown, DropdownItem, DropdownDivider } from "flowbite-svelte";
  import { SearchOutline, ChevronLeftOutline, ChevronRightOutline, ChevronDoubleLeftOutline, ChevronDoubleRightOutline, ChevronDownOutline, ChevronUpOutline, ChevronUpDownOutline, ArrowDownTrayOutline, AdjustmentsHorizontalOutline, EyeOutline, PenOutline, TrashBinOutline } from "flowbite-svelte-icons";

  type SortField = "name" | "email" | "role" | "department" | "joined" | null;
  type SortDirection = "asc" | "desc" | null;

  let searchQuery = $state("");
  let currentPage = $state(1);
  let itemsPerPage = $state("10");
  let sortField = $state<SortField>(null);
  let sortDirection = $state<SortDirection>(null);
  let selectedItems = $state<number[]>([]);
  let selectedDepartment = $state("");
  let selectedRole = $state("");

  interface User {
    id: number;
    name: string;
    email: string;
    avatar: string;
    role: string;
    department: string;
    status: string;
    joined: string;
    lastActive: string;
  }

  const allUsers: User[] = [
    { id: 1, name: "Neil Sims", email: "neil.sims@company.com", avatar: "NS", role: "Admin", department: "Engineering", status: "Active", joined: "2022-03-15", lastActive: "2 min ago" },
    { id: 2, name: "Bonnie Green", email: "bonnie@company.com", avatar: "BG", role: "Editor", department: "Design", status: "Active", joined: "2021-06-01", lastActive: "5 min ago" },
    { id: 3, name: "Jese Leos", email: "jese@company.com", avatar: "JL", role: "Viewer", department: "Marketing", status: "Inactive", joined: "2023-01-10", lastActive: "3 days ago" },
    { id: 4, name: "Thomas Lean", email: "thom@company.com", avatar: "TL", role: "Editor", department: "Engineering", status: "Active", joined: "2023-08-20", lastActive: "1 hour ago" },
    { id: 5, name: "Leslie Livingston", email: "leslie@company.com", avatar: "LL", role: "Admin", department: "HR", status: "Active", joined: "2024-02-28", lastActive: "Just now" },
    { id: 6, name: "Michael Foster", email: "michael@company.com", avatar: "MF", role: "Viewer", department: "Sales", status: "Pending", joined: "2024-05-15", lastActive: "1 week ago" },
    { id: 7, name: "Lindsay Walton", email: "lindsay@company.com", avatar: "LW", role: "Editor", department: "Engineering", status: "Active", joined: "2023-04-22", lastActive: "30 min ago" },
    { id: 8, name: "Courtney Henry", email: "courtney@company.com", avatar: "CH", role: "Viewer", department: "Marketing", status: "Active", joined: "2024-01-08", lastActive: "2 hours ago" },
    { id: 9, name: "Tom Cook", email: "tom@company.com", avatar: "TC", role: "Admin", department: "Engineering", status: "Active", joined: "2021-12-01", lastActive: "10 min ago" },
    { id: 10, name: "Whitney Francis", email: "whitney@company.com", avatar: "WF", role: "Editor", department: "Design", status: "Inactive", joined: "2022-07-19", lastActive: "2 weeks ago" },
    { id: 11, name: "Leonard Krasner", email: "leonard@company.com", avatar: "LK", role: "Viewer", department: "Sales", status: "Active", joined: "2023-09-05", lastActive: "4 hours ago" },
    { id: 12, name: "Floyd Miles", email: "floyd@company.com", avatar: "FM", role: "Editor", department: "Marketing", status: "Active", joined: "2024-03-11", lastActive: "Yesterday" },
    { id: 13, name: "Emily Davis", email: "emily@company.com", avatar: "ED", role: "Admin", department: "HR", status: "Active", joined: "2022-11-25", lastActive: "15 min ago" },
    { id: 14, name: "Ryan Mitchell", email: "ryan@company.com", avatar: "RM", role: "Viewer", department: "Engineering", status: "Pending", joined: "2024-06-01", lastActive: "Never" },
    { id: 15, name: "Sarah Wilson", email: "sarah@company.com", avatar: "SW", role: "Editor", department: "Design", status: "Active", joined: "2023-02-14", lastActive: "1 day ago" }
  ];

  const departments = [
    { value: "", name: "All Departments" },
    { value: "Engineering", name: "Engineering" },
    { value: "Design", name: "Design" },
    { value: "Marketing", name: "Marketing" },
    { value: "Sales", name: "Sales" },
    { value: "HR", name: "HR" }
  ];

  const roles = [
    { value: "", name: "All Roles" },
    { value: "Admin", name: "Admin" },
    { value: "Editor", name: "Editor" },
    { value: "Viewer", name: "Viewer" }
  ];

  const itemsPerPageOptions = [
    { value: "5", name: "5 per page" },
    { value: "10", name: "10 per page" },
    { value: "25", name: "25 per page" },
    { value: "50", name: "50 per page" }
  ];

  function toggleSort(field: SortField) {
    if (sortField === field) {
      if (sortDirection === "asc") {
        sortDirection = "desc";
      } else {
        sortField = null;
        sortDirection = null;
      }
    } else {
      sortField = field;
      sortDirection = "asc";
    }
    currentPage = 1;
  }

  function toggleItem(id: number) {
    if (selectedItems.includes(id)) {
      selectedItems = selectedItems.filter(i => i !== id);
    } else {
      selectedItems = [...selectedItems, id];
    }
  }

  function toggleAll() {
    const pageItems = paginatedUsers();
    if (selectedItems.length === pageItems.length) {
      selectedItems = [];
    } else {
      selectedItems = pageItems.map(u => u.id);
    }
  }

  const filteredUsers = $derived(() => {
    let result = [...allUsers];

    if (searchQuery) {
      const query = searchQuery.toLowerCase();
      result = result.filter(u =>
        u.name.toLowerCase().includes(query) ||
        u.email.toLowerCase().includes(query)
      );
    }

    if (selectedDepartment) {
      result = result.filter(u => u.department === selectedDepartment);
    }

    if (selectedRole) {
      result = result.filter(u => u.role === selectedRole);
    }

    if (sortField && sortDirection) {
      result.sort((a, b) => {
        const aVal = a[sortField!];
        const bVal = b[sortField!];
        const comparison = aVal.localeCompare(bVal);
        return sortDirection === "asc" ? comparison : -comparison;
      });
    }

    return result;
  });

  const totalPages = $derived(Math.ceil(filteredUsers().length / parseInt(itemsPerPage)));
  const startItem = $derived((currentPage - 1) * parseInt(itemsPerPage) + 1);
  const endItem = $derived(Math.min(currentPage * parseInt(itemsPerPage), filteredUsers().length));

  const paginatedUsers = $derived(() => {
    const start = (currentPage - 1) * parseInt(itemsPerPage);
    const end = start + parseInt(itemsPerPage);
    return filteredUsers().slice(start, end);
  });

  function goToPage(page: number) {
    if (page >= 1 && page <= totalPages) {
      currentPage = page;
      selectedItems = [];
    }
  }

  const visiblePages = $derived(() => {
    const pages: (number | string)[] = [];
    const maxVisible = 5;

    if (totalPages <= maxVisible + 2) {
      for (let i = 1; i <= totalPages; i++) pages.push(i);
    } else {
      pages.push(1);
      if (currentPage > 3) pages.push("...");

      const start = Math.max(2, currentPage - 1);
      const end = Math.min(totalPages - 1, currentPage + 1);
      for (let i = start; i <= end; i++) pages.push(i);

      if (currentPage < totalPages - 2) pages.push("...");
      pages.push(totalPages);
    }
    return pages;
  });

  function getSortIcon(field: SortField) {
    if (sortField !== field) return ChevronUpDownOutline;
    return sortDirection === "asc" ? ChevronUpOutline : ChevronDownOutline;
  }

  const statusColors: Record<string, "green" | "red" | "yellow"> = {
    "Active": "green",
    "Inactive": "red",
    "Pending": "yellow"
  };

  const roleColors: Record<string, "purple" | "blue" | "dark"> = {
    "Admin": "purple",
    "Editor": "blue",
    "Viewer": "dark"
  };
</script>

<div class="p-4">
  <Card class="p-0 overflow-hidden">
    <!-- Header -->
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <div class="flex flex-col gap-4 lg:flex-row lg:items-center lg:justify-between">
        <div>
          <h3 class="text-lg font-semibold text-gray-900 dark:text-white">User Management</h3>
          <p class="text-sm text-gray-500 dark:text-gray-400">
            Full-featured data table with sorting, filtering, and pagination.
          </p>
        </div>
        <div class="flex flex-wrap items-center gap-2">
          <Button color="alternative" size="sm">
            <ArrowDownTrayOutline class="me-2 h-4 w-4" />
            Export CSV
          </Button>
          <Button color="alternative" size="sm">
            <AdjustmentsHorizontalOutline class="me-2 h-4 w-4" />
            Columns
          </Button>
          <Dropdown>
            <DropdownItem>Name</DropdownItem>
            <DropdownItem>Email</DropdownItem>
            <DropdownItem>Role</DropdownItem>
            <DropdownItem>Department</DropdownItem>
            <DropdownItem>Status</DropdownItem>
            <DropdownItem>Joined</DropdownItem>
            <DropdownItem>Last Active</DropdownItem>
          </Dropdown>
        </div>
      </div>

      <!-- Filters -->
      <div class="mt-4 flex flex-wrap items-center gap-3">
        <div class="flex-1 min-w-64">
          <Input bind:value={searchQuery} placeholder="Search by name or email..." size="sm">
            {#snippet left()}
              <SearchOutline class="h-4 w-4 text-gray-500" />
            {/snippet}
          </Input>
        </div>
        <Select items={departments} bind:value={selectedDepartment} size="sm" class="w-40" />
        <Select items={roles} bind:value={selectedRole} size="sm" class="w-32" />
        {#if searchQuery || selectedDepartment || selectedRole}
          <button
            class="text-sm text-primary-600 hover:underline dark:text-primary-400"
            onclick={() => { searchQuery = ""; selectedDepartment = ""; selectedRole = ""; currentPage = 1; }}
          >
            Clear filters
          </button>
        {/if}
      </div>
    </div>

    <!-- Bulk Actions -->
    {#if selectedItems.length > 0}
      <div class="flex items-center justify-between border-b border-gray-200 bg-gray-50 px-4 py-2 dark:border-gray-700 dark:bg-gray-800">
        <span class="text-sm text-gray-600 dark:text-gray-400">
          {selectedItems.length} of {paginatedUsers().length} selected
        </span>
        <div class="flex items-center gap-2">
          <Button size="xs" color="alternative">Change Role</Button>
          <Button size="xs" color="alternative">Change Department</Button>
          <Button size="xs" color="red">Delete</Button>
        </div>
      </div>
    {/if}

    <!-- Table -->
    <div class="overflow-x-auto">
      <Table hoverable>
        <TableHead>
          <TableHeadCell class="!p-4 w-4">
            <Checkbox
              checked={selectedItems.length === paginatedUsers().length && paginatedUsers().length > 0}
              onchange={toggleAll}
            />
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("name")}>
            <div class="flex items-center">
              User
              <svelte:component this={getSortIcon("name")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("role")}>
            <div class="flex items-center">
              Role
              <svelte:component this={getSortIcon("role")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("department")}>
            <div class="flex items-center">
              Department
              <svelte:component this={getSortIcon("department")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell>Status</TableHeadCell>
          <TableHeadCell class="cursor-pointer select-none" onclick={() => toggleSort("joined")}>
            <div class="flex items-center">
              Joined
              <svelte:component this={getSortIcon("joined")} class="ms-1 h-4 w-4" />
            </div>
          </TableHeadCell>
          <TableHeadCell>Last Active</TableHeadCell>
          <TableHeadCell class="w-20">
            <span class="sr-only">Actions</span>
          </TableHeadCell>
        </TableHead>
        <TableBody>
          {#each paginatedUsers() as user}
            <TableBodyRow class={selectedItems.includes(user.id) ? "bg-primary-50 dark:bg-primary-900/10" : ""}>
              <TableBodyCell class="!p-4">
                <Checkbox
                  checked={selectedItems.includes(user.id)}
                  onchange={() => toggleItem(user.id)}
                />
              </TableBodyCell>
              <TableBodyCell>
                <div class="flex items-center gap-3">
                  <div class="flex h-10 w-10 items-center justify-center rounded-full bg-primary-100 text-sm font-medium text-primary-800 dark:bg-primary-900 dark:text-primary-200">
                    {user.avatar}
                  </div>
                  <div>
                    <div class="font-medium text-gray-900 dark:text-white">{user.name}</div>
                    <div class="text-sm text-gray-500 dark:text-gray-400">{user.email}</div>
                  </div>
                </div>
              </TableBodyCell>
              <TableBodyCell>
                <Badge color={roleColors[user.role]}>{user.role}</Badge>
              </TableBodyCell>
              <TableBodyCell>{user.department}</TableBodyCell>
              <TableBodyCell>
                <Badge color={statusColors[user.status]}>{user.status}</Badge>
              </TableBodyCell>
              <TableBodyCell>{user.joined}</TableBodyCell>
              <TableBodyCell class="text-sm text-gray-500 dark:text-gray-400">{user.lastActive}</TableBodyCell>
              <TableBodyCell>
                <div class="flex items-center gap-1">
                  <button class="rounded p-1 text-gray-500 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                    <EyeOutline class="h-4 w-4" />
                  </button>
                  <button class="rounded p-1 text-gray-500 hover:bg-gray-100 hover:text-gray-900 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
                    <PenOutline class="h-4 w-4" />
                  </button>
                  <button class="rounded p-1 text-gray-500 hover:bg-gray-100 hover:text-red-600 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-red-400">
                    <TrashBinOutline class="h-4 w-4" />
                  </button>
                </div>
              </TableBodyCell>
            </TableBodyRow>
          {/each}
        </TableBody>
      </Table>
    </div>

    <!-- Empty State -->
    {#if filteredUsers().length === 0}
      <div class="p-8 text-center">
        <p class="text-gray-500 dark:text-gray-400">No users found matching your criteria.</p>
        <button
          class="mt-2 text-sm text-primary-600 hover:underline dark:text-primary-400"
          onclick={() => { searchQuery = ""; selectedDepartment = ""; selectedRole = ""; }}
        >
          Clear all filters
        </button>
      </div>
    {/if}

    <!-- Footer with Pagination -->
    <div class="flex flex-col gap-4 border-t border-gray-200 p-4 dark:border-gray-700 sm:flex-row sm:items-center sm:justify-between">
      <div class="flex items-center gap-4">
        <Select items={itemsPerPageOptions} bind:value={itemsPerPage} size="sm" class="w-32" />
        <span class="text-sm text-gray-500 dark:text-gray-400">
          Showing <span class="font-semibold text-gray-900 dark:text-white">{startItem}</span> to
          <span class="font-semibold text-gray-900 dark:text-white">{endItem}</span> of
          <span class="font-semibold text-gray-900 dark:text-white">{filteredUsers().length}</span>
        </span>
      </div>

      <div class="flex items-center gap-1">
        <Button color="alternative" size="sm" disabled={currentPage === 1} onclick={() => goToPage(1)} class="!p-2">
          <ChevronDoubleLeftOutline class="h-4 w-4" />
        </Button>
        <Button color="alternative" size="sm" disabled={currentPage === 1} onclick={() => goToPage(currentPage - 1)} class="!p-2">
          <ChevronLeftOutline class="h-4 w-4" />
        </Button>

        {#each visiblePages() as page}
          {#if page === "..."}
            <span class="px-2 text-gray-500">...</span>
          {:else}
            <Button
              color={currentPage === page ? "primary" : "alternative"}
              size="sm"
              onclick={() => goToPage(page as number)}
              class="min-w-[36px]"
            >
              {page}
            </Button>
          {/if}
        {/each}

        <Button color="alternative" size="sm" disabled={currentPage === totalPages} onclick={() => goToPage(currentPage + 1)} class="!p-2">
          <ChevronRightOutline class="h-4 w-4" />
        </Button>
        <Button color="alternative" size="sm" disabled={currentPage === totalPages} onclick={() => goToPage(totalPages)} class="!p-2">
          <ChevronDoubleRightOutline class="h-4 w-4" />
        </Button>
      </div>
    </div>
  </Card>
</div>
