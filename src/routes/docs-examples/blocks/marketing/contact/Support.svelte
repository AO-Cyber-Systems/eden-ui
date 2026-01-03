<script lang="ts">
  import { Input, Textarea, Button, Label, Select, Fileupload } from "flowbite-svelte";

  let selectedDepartment = $state("");
  let selectedPriority = $state("");
</script>

<section class="bg-gray-50 dark:bg-gray-800">
  <div class="mx-auto max-w-screen-xl px-4 py-8 lg:py-16">
    <div class="grid gap-8 lg:grid-cols-3">
      <!-- Sidebar -->
      <div class="lg:col-span-1">
        <h2 class="mb-4 text-2xl font-bold text-gray-900 dark:text-white">
          Support Center
        </h2>
        <p class="mb-6 text-gray-500 dark:text-gray-400">
          Need help? Check our resources or submit a support ticket.
        </p>

        <div class="space-y-4">
          <a href="#" class="flex items-center gap-3 rounded-lg border border-gray-200 p-4 transition-colors hover:bg-gray-100 dark:border-gray-700 dark:hover:bg-gray-700">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
              <svg class="h-5 w-5 text-primary-600 dark:text-primary-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
              </svg>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900 dark:text-white">Documentation</h4>
              <p class="text-sm text-gray-500 dark:text-gray-400">Browse our guides and tutorials</p>
            </div>
          </a>

          <a href="#" class="flex items-center gap-3 rounded-lg border border-gray-200 p-4 transition-colors hover:bg-gray-100 dark:border-gray-700 dark:hover:bg-gray-700">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900">
              <svg class="h-5 w-5 text-green-600 dark:text-green-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900 dark:text-white">FAQs</h4>
              <p class="text-sm text-gray-500 dark:text-gray-400">Find answers to common questions</p>
            </div>
          </a>

          <a href="#" class="flex items-center gap-3 rounded-lg border border-gray-200 p-4 transition-colors hover:bg-gray-100 dark:border-gray-700 dark:hover:bg-gray-700">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-purple-100 dark:bg-purple-900">
              <svg class="h-5 w-5 text-purple-600 dark:text-purple-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
              </svg>
            </div>
            <div>
              <h4 class="font-semibold text-gray-900 dark:text-white">Community</h4>
              <p class="text-sm text-gray-500 dark:text-gray-400">Join our Discord community</p>
            </div>
          </a>
        </div>
      </div>

      <!-- Support Form -->
      <div class="rounded-lg bg-white p-8 shadow-lg dark:bg-gray-900 lg:col-span-2">
        <h3 class="mb-6 text-xl font-bold text-gray-900 dark:text-white">
          Submit a Support Ticket
        </h3>
        <form action="#" class="space-y-6">
          <div class="grid gap-6 sm:grid-cols-2">
            <div>
              <Label for="name" class="mb-2 block">Your name</Label>
              <Input type="text" id="name" placeholder="John Doe" required />
            </div>
            <div>
              <Label for="email" class="mb-2 block">Email address</Label>
              <Input type="email" id="email" placeholder="name@company.com" required />
            </div>
          </div>
          <div class="grid gap-6 sm:grid-cols-2">
            <div>
              <Label for="department" class="mb-2 block">Department</Label>
              <Select id="department" bind:value={selectedDepartment}>
                <option value="">Select department</option>
                <option value="technical">Technical Support</option>
                <option value="billing">Billing</option>
                <option value="sales">Sales</option>
                <option value="general">General Inquiry</option>
              </Select>
            </div>
            <div>
              <Label for="priority" class="mb-2 block">Priority</Label>
              <Select id="priority" bind:value={selectedPriority}>
                <option value="">Select priority</option>
                <option value="low">Low</option>
                <option value="medium">Medium</option>
                <option value="high">High</option>
                <option value="critical">Critical</option>
              </Select>
            </div>
          </div>
          <div>
            <Label for="subject" class="mb-2 block">Subject</Label>
            <Input type="text" id="subject" placeholder="Brief description of your issue" required />
          </div>
          <div>
            <Label for="description" class="mb-2 block">Description</Label>
            <Textarea id="description" rows={6} placeholder="Please describe your issue in detail..." />
          </div>
          <div>
            <Label for="attachment" class="mb-2 block">Attachments (optional)</Label>
            <Fileupload id="attachment" />
            <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
              PNG, JPG, PDF up to 10MB
            </p>
          </div>
          <div class="flex justify-end gap-4">
            <Button color="alternative">Cancel</Button>
            <Button type="submit">Submit Ticket</Button>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>
