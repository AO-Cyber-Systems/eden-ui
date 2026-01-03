<script lang="ts">
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Card, Badge } from "flowbite-svelte";

  const transactions = [
    { id: "TXN001", date: "2026-01-02", description: "Payment from Client A", amount: "+$2,500.00", status: "Completed" },
    { id: "TXN002", date: "2026-01-02", description: "Subscription renewal", amount: "-$49.99", status: "Completed" },
    { id: "TXN003", date: "2026-01-01", description: "Payment from Client B", amount: "+$1,200.00", status: "Pending" },
    { id: "TXN004", date: "2025-12-31", description: "Office supplies", amount: "-$156.00", status: "Completed" },
    { id: "TXN005", date: "2025-12-30", description: "Payment from Client C", amount: "+$3,750.00", status: "Completed" },
    { id: "TXN006", date: "2025-12-29", description: "Software license", amount: "-$299.00", status: "Failed" }
  ];

  const employees = [
    { id: 1, name: "John Doe", department: "Engineering", role: "Senior Developer", salary: "$95,000", joined: "2022-03-15" },
    { id: 2, name: "Jane Smith", department: "Design", role: "Lead Designer", salary: "$85,000", joined: "2021-06-01" },
    { id: 3, name: "Bob Johnson", department: "Marketing", role: "Marketing Manager", salary: "$78,000", joined: "2023-01-10" },
    { id: 4, name: "Alice Brown", department: "Engineering", role: "Frontend Developer", salary: "$72,000", joined: "2023-08-20" },
    { id: 5, name: "Charlie Wilson", department: "Sales", role: "Sales Executive", salary: "$65,000", joined: "2024-02-28" },
    { id: 6, name: "Diana Miller", department: "HR", role: "HR Specialist", salary: "$58,000", joined: "2024-05-15" }
  ];

  const statusColors: Record<string, "green" | "yellow" | "red"> = {
    "Completed": "green",
    "Pending": "yellow",
    "Failed": "red"
  };
</script>

<div class="space-y-8 p-4">
  <!-- Striped Transactions Table -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recent Transactions</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Striped rows for better readability.</p>
    </div>
    <Table striped>
      <TableHead>
        <TableHeadCell>Transaction ID</TableHeadCell>
        <TableHeadCell>Date</TableHeadCell>
        <TableHeadCell>Description</TableHeadCell>
        <TableHeadCell>Amount</TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each transactions as txn}
          <TableBodyRow>
            <TableBodyCell class="font-mono text-sm">{txn.id}</TableBodyCell>
            <TableBodyCell>{txn.date}</TableBodyCell>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">{txn.description}</TableBodyCell>
            <TableBodyCell class={txn.amount.startsWith('+') ? 'text-green-600 dark:text-green-400 font-medium' : 'text-red-600 dark:text-red-400 font-medium'}>
              {txn.amount}
            </TableBodyCell>
            <TableBodyCell>
              <Badge color={statusColors[txn.status]}>{txn.status}</Badge>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Striped Employee Table with Colors -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Employee Directory</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Striped table with colored header.</p>
    </div>
    <Table striped>
      <TableHead class="bg-primary-600 dark:bg-primary-700">
        <TableHeadCell class="text-white">ID</TableHeadCell>
        <TableHeadCell class="text-white">Name</TableHeadCell>
        <TableHeadCell class="text-white">Department</TableHeadCell>
        <TableHeadCell class="text-white">Role</TableHeadCell>
        <TableHeadCell class="text-white">Salary</TableHeadCell>
        <TableHeadCell class="text-white">Joined</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each employees as emp}
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">#{emp.id}</TableBodyCell>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">{emp.name}</TableBodyCell>
            <TableBodyCell>
              <Badge color="dark">{emp.department}</Badge>
            </TableBodyCell>
            <TableBodyCell>{emp.role}</TableBodyCell>
            <TableBodyCell class="font-medium">{emp.salary}</TableBodyCell>
            <TableBodyCell>{emp.joined}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Alternate Color Striped -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Custom Striped Colors</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Custom background colors for alternating rows.</p>
    </div>
    <Table>
      <TableHead class="bg-gray-100 dark:bg-gray-700">
        <TableHeadCell>Name</TableHeadCell>
        <TableHeadCell>Department</TableHeadCell>
        <TableHeadCell>Role</TableHeadCell>
        <TableHeadCell>Salary</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each employees as emp, i}
          <TableBodyRow class={i % 2 === 0 ? 'bg-blue-50 dark:bg-blue-900/20' : 'bg-white dark:bg-gray-800'}>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">{emp.name}</TableBodyCell>
            <TableBodyCell>{emp.department}</TableBodyCell>
            <TableBodyCell>{emp.role}</TableBodyCell>
            <TableBodyCell>{emp.salary}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>
</div>
