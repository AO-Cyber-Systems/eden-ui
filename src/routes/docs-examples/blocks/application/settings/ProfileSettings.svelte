<script lang="ts">
  import { Button, Input, Label, Card, Textarea, Helper, Toggle, Avatar } from "flowbite-svelte";
  import { UserCircleOutline, CameraOutline, LinkOutline, MapPinOutline, BriefcaseOutline, CalendarOutline, CheckOutline, TrashBinOutline } from "flowbite-svelte-icons";

  let firstName = $state("Neil");
  let lastName = $state("Sims");
  let username = $state("neilsims");
  let bio = $state("Product designer and developer. Building digital experiences that matter.");
  let website = $state("https://neilsims.com");
  let location = $state("San Francisco, CA");
  let company = $state("Flowbite");
  let showEmail = $state(true);
  let showLocation = $state(true);
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Basic Profile Form -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Profile Information</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Update your profile details</p>
    </div>

    <Card class="max-w-lg">
      <form class="space-y-6">
        <!-- Avatar Upload -->
        <div class="flex items-center gap-4">
          <div class="relative">
            <div class="flex h-20 w-20 items-center justify-center rounded-full bg-primary-100 text-2xl font-bold text-primary-800 dark:bg-primary-900 dark:text-primary-200">
              NS
            </div>
            <button
              type="button"
              class="absolute -bottom-1 -right-1 flex h-8 w-8 items-center justify-center rounded-full border-2 border-white bg-primary-600 text-white hover:bg-primary-700 dark:border-gray-800"
            >
              <CameraOutline class="h-4 w-4" />
            </button>
          </div>
          <div>
            <h4 class="font-medium text-gray-900 dark:text-white">Profile photo</h4>
            <p class="text-sm text-gray-500 dark:text-gray-400">JPG, PNG or GIF. Max 2MB.</p>
            <div class="mt-2 flex gap-2">
              <Button size="xs" color="light">Upload</Button>
              <Button size="xs" color="light" class="text-red-600 hover:text-red-700">Remove</Button>
            </div>
          </div>
        </div>

        <div class="grid gap-4 sm:grid-cols-2">
          <div>
            <Label for="first-name" class="mb-2">First name</Label>
            <Input type="text" id="first-name" bind:value={firstName} />
          </div>
          <div>
            <Label for="last-name" class="mb-2">Last name</Label>
            <Input type="text" id="last-name" bind:value={lastName} />
          </div>
        </div>

        <div>
          <Label for="username" class="mb-2">Username</Label>
          <Input type="text" id="username" bind:value={username}>
            {#snippet left()}
              <span class="text-gray-500">@</span>
            {/snippet}
          </Input>
          <Helper class="mt-2">Your unique username on the platform</Helper>
        </div>

        <div>
          <Label for="bio" class="mb-2">Bio</Label>
          <Textarea id="bio" rows={3} bind:value={bio} placeholder="Tell us about yourself..." />
          <Helper class="mt-2">{bio.length}/160 characters</Helper>
        </div>

        <div class="flex justify-end gap-3">
          <Button color="light">Cancel</Button>
          <Button type="submit">Save changes</Button>
        </div>
      </form>
    </Card>
  </div>

  <!-- Extended Profile -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Additional Details</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Add more information to your profile</p>
    </div>

    <Card class="max-w-lg">
      <form class="space-y-6">
        <div>
          <Label for="website" class="mb-2">Website</Label>
          <Input type="url" id="website" bind:value={website} placeholder="https://example.com">
            {#snippet left()}
              <LinkOutline class="h-4 w-4 text-gray-500" />
            {/snippet}
          </Input>
        </div>

        <div>
          <Label for="location" class="mb-2">Location</Label>
          <Input type="text" id="location" bind:value={location} placeholder="City, Country">
            {#snippet left()}
              <MapPinOutline class="h-4 w-4 text-gray-500" />
            {/snippet}
          </Input>
        </div>

        <div>
          <Label for="company" class="mb-2">Company</Label>
          <Input type="text" id="company" bind:value={company} placeholder="Where do you work?">
            {#snippet left()}
              <BriefcaseOutline class="h-4 w-4 text-gray-500" />
            {/snippet}
          </Input>
        </div>

        <div class="border-t border-gray-200 pt-6 dark:border-gray-700">
          <h4 class="mb-4 font-medium text-gray-900 dark:text-white">Privacy settings</h4>

          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Show email on profile</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Let others see your email address</p>
              </div>
              <Toggle bind:checked={showEmail} />
            </div>

            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Show location</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Display your location on your profile</p>
              </div>
              <Toggle bind:checked={showLocation} />
            </div>
          </div>
        </div>

        <div class="flex justify-end gap-3">
          <Button color="light">Cancel</Button>
          <Button type="submit">Save changes</Button>
        </div>
      </form>
    </Card>
  </div>

  <!-- Profile Preview Card -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Profile Preview</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">How others see your profile</p>
    </div>

    <Card class="max-w-lg">
      <div class="text-center">
        <!-- Cover Image -->
        <div class="-mx-5 -mt-5 mb-4 h-32 rounded-t-lg bg-gradient-to-r from-primary-500 to-purple-600"></div>

        <!-- Avatar -->
        <div class="-mt-16 mb-4">
          <div class="mx-auto flex h-24 w-24 items-center justify-center rounded-full border-4 border-white bg-primary-100 text-3xl font-bold text-primary-800 dark:border-gray-800 dark:bg-primary-900 dark:text-primary-200">
            NS
          </div>
        </div>

        <h3 class="text-xl font-bold text-gray-900 dark:text-white">{firstName} {lastName}</h3>
        <p class="text-gray-500 dark:text-gray-400">@{username}</p>

        <p class="mx-auto mt-4 max-w-sm text-gray-600 dark:text-gray-300">{bio}</p>

        <div class="mt-4 flex flex-wrap justify-center gap-4 text-sm text-gray-500 dark:text-gray-400">
          {#if showLocation && location}
            <span class="flex items-center gap-1">
              <MapPinOutline class="h-4 w-4" />
              {location}
            </span>
          {/if}
          {#if company}
            <span class="flex items-center gap-1">
              <BriefcaseOutline class="h-4 w-4" />
              {company}
            </span>
          {/if}
          {#if website}
            <a href={website} class="flex items-center gap-1 text-primary-600 hover:underline dark:text-primary-500">
              <LinkOutline class="h-4 w-4" />
              Website
            </a>
          {/if}
        </div>

        <div class="mt-6 flex justify-center gap-8 border-t border-gray-200 pt-6 dark:border-gray-700">
          <div>
            <p class="text-2xl font-bold text-gray-900 dark:text-white">248</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Followers</p>
          </div>
          <div>
            <p class="text-2xl font-bold text-gray-900 dark:text-white">124</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Following</p>
          </div>
          <div>
            <p class="text-2xl font-bold text-gray-900 dark:text-white">56</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Posts</p>
          </div>
        </div>
      </div>
    </Card>
  </div>

  <!-- Social Links -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Social Links</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Connect your social accounts</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-4">
        <!-- Twitter/X -->
        <div class="flex items-center justify-between rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-gray-900 dark:bg-gray-700">
              <svg class="h-5 w-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">X (Twitter)</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">@neilsims</p>
            </div>
          </div>
          <Button size="xs" color="light">Disconnect</Button>
        </div>

        <!-- GitHub -->
        <div class="flex items-center justify-between rounded-lg border border-gray-200 p-4 dark:border-gray-700">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-gray-900 dark:bg-gray-700">
              <svg class="h-5 w-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z"/>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">GitHub</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Connected</p>
            </div>
          </div>
          <Button size="xs" color="light">Disconnect</Button>
        </div>

        <!-- LinkedIn - Not connected -->
        <div class="flex items-center justify-between rounded-lg border border-dashed border-gray-300 p-4 dark:border-gray-600">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-blue-600">
              <svg class="h-5 w-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">LinkedIn</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Not connected</p>
            </div>
          </div>
          <Button size="xs">Connect</Button>
        </div>

        <!-- Dribbble - Not connected -->
        <div class="flex items-center justify-between rounded-lg border border-dashed border-gray-300 p-4 dark:border-gray-600">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-pink-500">
              <svg class="h-5 w-5 text-white" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 24C5.385 24 0 18.615 0 12S5.385 0 12 0s12 5.385 12 12-5.385 12-12 12zm10.12-10.358c-.35-.11-3.17-.953-6.384-.438 1.34 3.684 1.887 6.684 1.992 7.308 2.3-1.555 3.936-4.02 4.395-6.87zm-6.115 7.808c-.153-.9-.75-4.032-2.19-7.77l-.066.02c-5.79 2.015-7.86 6.025-8.04 6.4 1.73 1.358 3.92 2.166 6.29 2.166 1.42 0 2.77-.29 4-.816zm-11.62-2.58c.232-.4 3.045-5.055 8.332-6.765.135-.045.27-.084.405-.12-.26-.585-.54-1.167-.832-1.74C7.17 11.775 2.206 11.71 1.756 11.7l-.004.312c0 2.633.998 5.037 2.634 6.855zm-2.42-8.955c.46.008 4.683.026 9.477-1.248-1.698-3.018-3.53-5.558-3.8-5.928-2.868 1.35-5.01 3.99-5.676 7.17zM9.6 2.052c.282.38 2.145 2.914 3.822 6 3.645-1.365 5.19-3.44 5.373-3.702-1.81-1.61-4.19-2.586-6.795-2.586-.825 0-1.63.1-2.4.285zm10.335 3.483c-.218.29-1.935 2.493-5.724 4.04.24.49.47.985.68 1.486.08.18.15.36.22.53 3.41-.43 6.8.26 7.14.33-.02-2.42-.88-4.64-2.31-6.38z"/>
              </svg>
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Dribbble</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Not connected</p>
            </div>
          </div>
          <Button size="xs">Connect</Button>
        </div>
      </div>
    </Card>
  </div>
</div>
