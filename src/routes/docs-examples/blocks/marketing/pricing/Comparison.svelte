<script lang="ts">
  import { Button, Table, TableHead, TableHeadCell, TableBody, TableBodyRow, TableBodyCell } from "flowbite-svelte";
  import { CheckCircleSolid, CloseCircleSolid } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        Compare plans
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Find the perfect plan for your needs.
      </p>
    </div>

    <div class="overflow-x-auto">
      <Table striped>
        <TableHead>
          <TableHeadCell class="w-1/3">Features</TableHeadCell>
          <TableHeadCell class="text-center">Free</TableHeadCell>
          <TableHeadCell class="text-center bg-primary-50 dark:bg-primary-900/20">Pro</TableHeadCell>
          <TableHeadCell class="text-center">Enterprise</TableHeadCell>
        </TableHead>
        <TableBody>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Price</TableBodyCell>
            <TableBodyCell class="text-center">$0/mo</TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20 font-semibold text-primary-600 dark:text-primary-400">$49/mo</TableBodyCell>
            <TableBodyCell class="text-center">Custom</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Users</TableBodyCell>
            <TableBodyCell class="text-center">1</TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">5</TableBodyCell>
            <TableBodyCell class="text-center">Unlimited</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Projects</TableBodyCell>
            <TableBodyCell class="text-center">3</TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">Unlimited</TableBodyCell>
            <TableBodyCell class="text-center">Unlimited</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Storage</TableBodyCell>
            <TableBodyCell class="text-center">1 GB</TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">100 GB</TableBodyCell>
            <TableBodyCell class="text-center">Unlimited</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">API Access</TableBodyCell>
            <TableBodyCell class="text-center">
              <CloseCircleSolid class="mx-auto h-5 w-5 text-gray-300 dark:text-gray-600" />
            </TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">
              <CheckCircleSolid class="mx-auto h-5 w-5 text-green-500" />
            </TableBodyCell>
            <TableBodyCell class="text-center">
              <CheckCircleSolid class="mx-auto h-5 w-5 text-green-500" />
            </TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Custom Domains</TableBodyCell>
            <TableBodyCell class="text-center">
              <CloseCircleSolid class="mx-auto h-5 w-5 text-gray-300 dark:text-gray-600" />
            </TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">
              <CheckCircleSolid class="mx-auto h-5 w-5 text-green-500" />
            </TableBodyCell>
            <TableBodyCell class="text-center">
              <CheckCircleSolid class="mx-auto h-5 w-5 text-green-500" />
            </TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Analytics</TableBodyCell>
            <TableBodyCell class="text-center">Basic</TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">Advanced</TableBodyCell>
            <TableBodyCell class="text-center">Enterprise</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">SSO/SAML</TableBodyCell>
            <TableBodyCell class="text-center">
              <CloseCircleSolid class="mx-auto h-5 w-5 text-gray-300 dark:text-gray-600" />
            </TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">
              <CloseCircleSolid class="mx-auto h-5 w-5 text-gray-300 dark:text-gray-600" />
            </TableBodyCell>
            <TableBodyCell class="text-center">
              <CheckCircleSolid class="mx-auto h-5 w-5 text-green-500" />
            </TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">Support</TableBodyCell>
            <TableBodyCell class="text-center">Community</TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">Priority</TableBodyCell>
            <TableBodyCell class="text-center">24/7 Dedicated</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell class="font-medium text-gray-900 dark:text-white">SLA</TableBodyCell>
            <TableBodyCell class="text-center">
              <CloseCircleSolid class="mx-auto h-5 w-5 text-gray-300 dark:text-gray-600" />
            </TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">99.9%</TableBodyCell>
            <TableBodyCell class="text-center">99.99%</TableBodyCell>
          </TableBodyRow>
          <TableBodyRow>
            <TableBodyCell></TableBodyCell>
            <TableBodyCell class="text-center">
              <Button outline size="sm">Get started</Button>
            </TableBodyCell>
            <TableBodyCell class="text-center bg-primary-50 dark:bg-primary-900/20">
              <Button size="sm">Get started</Button>
            </TableBodyCell>
            <TableBodyCell class="text-center">
              <Button outline size="sm">Contact sales</Button>
            </TableBodyCell>
          </TableBodyRow>
        </TableBody>
      </Table>
    </div>
  </div>
</section>
