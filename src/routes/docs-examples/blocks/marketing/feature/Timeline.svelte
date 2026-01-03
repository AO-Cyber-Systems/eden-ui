<script lang="ts">
  import { Timeline, TimelineItem, Button } from "flowbite-svelte";
  import { ArrowRightOutline } from "flowbite-svelte-icons";
</script>

<section class="bg-white dark:bg-gray-900">
  <div class="mx-auto max-w-screen-xl px-4 py-8 sm:py-16 lg:px-6">
    <div class="mx-auto mb-8 max-w-screen-md text-center lg:mb-12">
      <h2 class="mb-4 text-4xl font-extrabold tracking-tight text-gray-900 dark:text-white">
        How it works
      </h2>
      <p class="mb-5 font-light text-gray-500 sm:text-xl dark:text-gray-400">
        Get started in just a few simple steps
      </p>
    </div>
    <div class="mx-auto max-w-3xl">
      <Timeline order="vertical">
        <TimelineItem title="Step 1: Create an account" date="Get started">
          <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
            Sign up for a free account in less than a minute. No credit card required.
          </p>
        </TimelineItem>
        <TimelineItem title="Step 2: Configure your workspace" date="Set up">
          <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
            Customize your workspace with your branding, team members, and preferences.
          </p>
        </TimelineItem>
        <TimelineItem title="Step 3: Start building" date="Launch">
          <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
            Use our intuitive tools to build and deploy your first project in minutes.
          </p>
        </TimelineItem>
        <TimelineItem title="Step 4: Scale and grow" date="Expand">
          <p class="mb-4 text-base font-normal text-gray-500 dark:text-gray-400">
            As your needs grow, easily scale your infrastructure and team size.
          </p>
          <Button>
            Get started now
            <ArrowRightOutline class="ml-2 h-4 w-4" />
          </Button>
        </TimelineItem>
      </Timeline>
    </div>
  </div>
</section>
