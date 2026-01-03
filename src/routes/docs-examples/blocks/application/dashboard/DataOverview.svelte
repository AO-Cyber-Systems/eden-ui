<script lang="ts">
  import { Card, Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Avatar, Badge, Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";

  const recentOrders = [
    { id: "#12345", customer: "John Doe", product: "MacBook Pro", amount: "$2,499", status: "Completed", date: "Jan 2, 2026" },
    { id: "#12346", customer: "Jane Smith", product: "iPhone 15", amount: "$999", status: "Processing", date: "Jan 2, 2026" },
    { id: "#12347", customer: "Bob Johnson", product: "AirPods Pro", amount: "$249", status: "Shipped", date: "Jan 1, 2026" },
    { id: "#12348", customer: "Alice Brown", product: "iPad Air", amount: "$599", status: "Pending", date: "Jan 1, 2026" }
  ];

  const topProducts = [
    { name: "MacBook Pro 14&quot;", sales: 234, revenue: "$584,166", growth: "+12.5%" },
    { name: "iPhone 15 Pro", sales: 456, revenue: "$547,200", growth: "+8.2%" },
    { name: "AirPods Pro", sales: 789, revenue: "$196,461", growth: "+15.3%" },
    { name: "iPad Air", sales: 321, revenue: "$192,279", growth: "-2.4%" }
  ];

  const teamMembers = [
    { name: "Bonnie Green", role: "Developer", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png", status: "online" },
    { name: "Thomas Lean", role: "Designer", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/thomas-lean.png", status: "online" },
    { name: "Jese Leos", role: "PM", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/jese-leos.png", status: "away" },
    { name: "Roberta Casas", role: "Marketing", avatar: "https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/roberta-casas.png", status: "offline" }
  ];

  const statusColors: Record<string, "green" | "blue" | "yellow" | "red"> = {
    Completed: "green",
    Processing: "blue",
    Shipped: "yellow",
    Pending: "red"
  };
</script>

<div class="grid gap-4 xl:grid-cols-3">
  <!-- Recent Orders -->
  <Card class="p-4 xl:col-span-2">
    <div class="mb-4 flex items-center justify-between">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Recent Orders</h3>
      <Button size="sm" color="alternative">
        View all
        <ArrowRightOutline class="ms-2 h-4 w-4" />
      </Button>
    </div>
    <Table>
      <TableHead>
        <TableHeadCell>Order ID</TableHeadCell>
        <TableHeadCell>Customer</TableHeadCell>
        <TableHeadCell>Product</TableHeadCell>
        <TableHeadCell>Amount</TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
        <TableHeadCell>Date</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each recentOrders as order}
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">{order.id}</TableBodyCell>
            <TableBodyCell>{order.customer}</TableBodyCell>
            <TableBodyCell>{order.product}</TableBodyCell>
            <TableBodyCell>{order.amount}</TableBodyCell>
            <TableBodyCell>
              <Badge color={statusColors[order.status]}>{order.status}</Badge>
            </TableBodyCell>
            <TableBodyCell>{order.date}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Team Members -->
  <Card class="p-4">
    <div class="mb-4 flex items-center justify-between">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Team Members</h3>
      <Button size="sm" color="alternative">View all</Button>
    </div>
    <div class="space-y-4">
      {#each teamMembers as member}
        <div class="flex items-center justify-between">
          <div class="flex items-center">
            <div class="relative">
              <Avatar src={member.avatar} alt={member.name} size="sm" />
              <span
                class="absolute bottom-0 right-0 h-3 w-3 rounded-full border-2 border-white dark:border-gray-800
                {member.status === 'online' ? 'bg-green-500' : member.status === 'away' ? 'bg-yellow-500' : 'bg-gray-400'}"
              ></span>
            </div>
            <div class="ms-3">
              <p class="text-sm font-medium text-gray-900 dark:text-white">{member.name}</p>
              <p class="text-xs text-gray-500 dark:text-gray-400">{member.role}</p>
            </div>
          </div>
          <Button size="xs" color="alternative">Message</Button>
        </div>
      {/each}
    </div>
  </Card>

  <!-- Top Products -->
  <Card class="p-4 xl:col-span-3">
    <div class="mb-4 flex items-center justify-between">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Top Products</h3>
      <Button size="sm" color="alternative">Full Report</Button>
    </div>
    <div class="overflow-x-auto">
      <Table>
        <TableHead>
          <TableHeadCell>Product Name</TableHeadCell>
          <TableHeadCell>Units Sold</TableHeadCell>
          <TableHeadCell>Revenue</TableHeadCell>
          <TableHeadCell>Growth</TableHeadCell>
        </TableHead>
        <TableBody>
          {#each topProducts as product}
            <TableBodyRow>
              <TableBodyCell class="font-medium text-gray-900 dark:text-white">{product.name}</TableBodyCell>
              <TableBodyCell>{product.sales.toLocaleString()}</TableBodyCell>
              <TableBodyCell>{product.revenue}</TableBodyCell>
              <TableBodyCell>
                <span class={product.growth.startsWith('+') ? 'text-green-500' : 'text-red-500'}>
                  {product.growth}
                </span>
              </TableBodyCell>
            </TableBodyRow>
          {/each}
        </TableBody>
      </Table>
    </div>
  </Card>
</div>
