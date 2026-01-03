<script lang="ts">
  import { Button, Navbar, NavBrand, NavLi, NavUl, NavHamburger, Dropdown, DropdownItem, Chevron } from "flowbite-svelte";
</script>

<header>
  <Navbar class="border-b border-gray-200 bg-white dark:border-gray-700 dark:bg-gray-900">
    <NavBrand href="/">
      <svg class="me-3 h-8" viewBox="0 0 52 72" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M1.87 72H0V0h1.87v71.19c0 .29.12.55.32.75.2.2.47.32.75.32H72V72H1.87z" fill="currentColor" />
      </svg>
      <span class="self-center whitespace-nowrap text-xl font-semibold dark:text-white">
        Flowbite
      </span>
    </NavBrand>
    <div class="flex items-center gap-3 md:order-2">
      <Button size="sm">Sign up</Button>
      <NavHamburger />
    </div>
    <NavUl>
      <NavLi href="/" active>Home</NavLi>
      <NavLi class="cursor-pointer">
        <Chevron aligned>Products</Chevron>
      </NavLi>
      <Dropdown class="w-56 divide-y divide-gray-100 dark:divide-gray-700">
        <DropdownItem href="#">
          <div class="font-semibold">Analytics</div>
          <div class="text-sm text-gray-500 dark:text-gray-400">Track your visitors</div>
        </DropdownItem>
        <DropdownItem href="#">
          <div class="font-semibold">Automation</div>
          <div class="text-sm text-gray-500 dark:text-gray-400">Streamline workflows</div>
        </DropdownItem>
        <DropdownItem href="#">
          <div class="font-semibold">Integrations</div>
          <div class="text-sm text-gray-500 dark:text-gray-400">Connect your tools</div>
        </DropdownItem>
      </Dropdown>
      <NavLi class="cursor-pointer">
        <Chevron aligned>Resources</Chevron>
      </NavLi>
      <Dropdown class="w-56">
        <DropdownItem href="#">Documentation</DropdownItem>
        <DropdownItem href="#">API Reference</DropdownItem>
        <DropdownItem href="#">Blog</DropdownItem>
        <DropdownItem href="#">Community</DropdownItem>
      </Dropdown>
      <NavLi href="#">Pricing</NavLi>
      <NavLi href="#">Contact</NavLi>
    </NavUl>
  </Navbar>
</header>
