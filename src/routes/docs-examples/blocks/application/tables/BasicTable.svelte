<script lang="ts">
  import { Table, TableBody, TableBodyCell, TableBodyRow, TableHead, TableHeadCell, Card } from "flowbite-svelte";

  const users = [
    { name: "Neil Sims", email: "neil.sims@flowbite.com", position: "React Developer", status: "Online" },
    { name: "Bonnie Green", email: "bonnie@flowbite.com", position: "Designer", status: "Online" },
    { name: "Jese Leos", email: "jese@flowbite.com", position: "Vue Developer", status: "Offline" },
    { name: "Thomas Lean", email: "thom@flowbite.com", position: "UI/UX Engineer", status: "Online" },
    { name: "Leslie Livingston", email: "leslie@flowbite.com", position: "SEO Specialist", status: "Offline" }
  ];

  const products = [
    { name: "Apple MacBook Pro 17&quot;", color: "Silver", category: "Laptop", price: "$2999" },
    { name: "Microsoft Surface Pro", color: "White", category: "Laptop PC", price: "$1999" },
    { name: "Magic Mouse 2", color: "Black", category: "Accessories", price: "$99" },
    { name: "Google Pixel Phone", color: "Gray", category: "Phone", price: "$799" },
    { name: "Apple Watch 5", color: "Red", category: "Wearables", price: "$999" }
  ];
</script>

<div class="space-y-8 p-4">
  <!-- Basic User Table -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Team Members</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">A list of all team members with their details.</p>
    </div>
    <Table>
      <TableHead>
        <TableHeadCell>Name</TableHeadCell>
        <TableHeadCell>Email</TableHeadCell>
        <TableHeadCell>Position</TableHeadCell>
        <TableHeadCell>Status</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each users as user}
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">{user.name}</TableBodyCell>
            <TableBodyCell>{user.email}</TableBodyCell>
            <TableBodyCell>{user.position}</TableBodyCell>
            <TableBodyCell>
              <span class="inline-flex items-center">
                <span class="me-2 h-2.5 w-2.5 rounded-full {user.status === 'Online' ? 'bg-green-500' : 'bg-gray-400'}"></span>
                {user.status}
              </span>
            </TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Basic Product Table -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Product Inventory</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Basic product listing with categories.</p>
    </div>
    <Table>
      <TableHead>
        <TableHeadCell>Product name</TableHeadCell>
        <TableHeadCell>Color</TableHeadCell>
        <TableHeadCell>Category</TableHeadCell>
        <TableHeadCell>Price</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each products as product}
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 whitespace-nowrap dark:text-white">
              {product.name}
            </TableBodyCell>
            <TableBodyCell>{product.color}</TableBodyCell>
            <TableBodyCell>{product.category}</TableBodyCell>
            <TableBodyCell>{product.price}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>

  <!-- Compact Table -->
  <Card class="p-0 overflow-hidden">
    <div class="border-b border-gray-200 p-4 dark:border-gray-700">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Compact View</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Reduced padding for dense data display.</p>
    </div>
    <Table>
      <TableHead>
        <TableHeadCell class="!py-2">Name</TableHeadCell>
        <TableHeadCell class="!py-2">Position</TableHeadCell>
        <TableHeadCell class="!py-2">Status</TableHeadCell>
      </TableHead>
      <TableBody>
        {#each users as user}
          <TableBodyRow>
            <TableBodyCell class="!py-2 font-medium text-gray-900 dark:text-white">{user.name}</TableBodyCell>
            <TableBodyCell class="!py-2">{user.position}</TableBodyCell>
            <TableBodyCell class="!py-2">{user.status}</TableBodyCell>
          </TableBodyRow>
        {/each}
      </TableBody>
    </Table>
  </Card>
</div>
