<script lang="ts">
  import { Button, Card, Toggle, Radio, Select, Badge, Helper } from "flowbite-svelte";
  import { SunOutline, MoonOutline, ComputerDesktopOutline, LanguageOutline, PaletteOutline, AdjustmentsHorizontalOutline, EyeOutline, CheckOutline } from "flowbite-svelte-icons";

  let theme = $state("system");
  let accentColor = $state("blue");
  let fontSize = $state("medium");
  let language = $state("en");
  let reducedMotion = $state(false);
  let highContrast = $state(false);
  let compactMode = $state(false);

  const colors = [
    { id: "blue", name: "Blue", class: "bg-blue-500" },
    { id: "purple", name: "Purple", class: "bg-purple-500" },
    { id: "green", name: "Green", class: "bg-green-500" },
    { id: "red", name: "Red", class: "bg-red-500" },
    { id: "orange", name: "Orange", class: "bg-orange-500" },
    { id: "pink", name: "Pink", class: "bg-pink-500" }
  ];

  const languages = [
    { value: "en", label: "English (US)" },
    { value: "en-gb", label: "English (UK)" },
    { value: "es", label: "Español" },
    { value: "fr", label: "Français" },
    { value: "de", label: "Deutsch" },
    { value: "ja", label: "日本語" },
    { value: "zh", label: "中文" }
  ];

  const fontSizes = [
    { value: "small", label: "Small", preview: "text-sm" },
    { value: "medium", label: "Medium", preview: "text-base" },
    { value: "large", label: "Large", preview: "text-lg" },
    { value: "xlarge", label: "Extra Large", preview: "text-xl" }
  ];
</script>

<div class="grid gap-8 p-4 lg:grid-cols-2">
  <!-- Theme Selection -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Theme</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Choose your preferred color mode</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-4">
        <label class="flex cursor-pointer items-center justify-between rounded-lg border p-4 {theme === 'light' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-800'}">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-yellow-100 dark:bg-yellow-900">
              <SunOutline class="h-5 w-5 text-yellow-600 dark:text-yellow-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Light</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Always use light mode</p>
            </div>
          </div>
          <input type="radio" name="theme" value="light" bind:group={theme} class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
        </label>

        <label class="flex cursor-pointer items-center justify-between rounded-lg border p-4 {theme === 'dark' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-800'}">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-indigo-100 dark:bg-indigo-900">
              <MoonOutline class="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Dark</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Always use dark mode</p>
            </div>
          </div>
          <input type="radio" name="theme" value="dark" bind:group={theme} class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
        </label>

        <label class="flex cursor-pointer items-center justify-between rounded-lg border p-4 {theme === 'system' ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-800'}">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-gray-100 dark:bg-gray-700">
              <ComputerDesktopOutline class="h-5 w-5 text-gray-600 dark:text-gray-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">System</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Follow system preferences</p>
            </div>
          </div>
          <input type="radio" name="theme" value="system" bind:group={theme} class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
        </label>
      </div>
    </Card>
  </div>

  <!-- Accent Color -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Accent Color</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Choose your primary color</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-primary-100 dark:bg-primary-900">
            <PaletteOutline class="h-5 w-5 text-primary-600 dark:text-primary-400" />
          </div>
          <div>
            <p class="font-medium text-gray-900 dark:text-white">Primary color</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Used for buttons, links, and highlights</p>
          </div>
        </div>

        <div class="grid grid-cols-6 gap-3">
          {#each colors as color}
            <button
              class="relative flex h-12 w-12 items-center justify-center rounded-lg {color.class} transition-transform hover:scale-110"
              onclick={() => accentColor = color.id}
            >
              {#if accentColor === color.id}
                <CheckOutline class="h-6 w-6 text-white" />
              {/if}
            </button>
          {/each}
        </div>

        <div class="rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
          <p class="mb-2 text-sm font-medium text-gray-900 dark:text-white">Preview</p>
          <div class="flex items-center gap-3">
            <Button size="sm">Primary Button</Button>
            <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Link text</a>
            <Badge color="primary">Badge</Badge>
          </div>
        </div>
      </div>
    </Card>
  </div>

  <!-- Font Size -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Font Size</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Adjust the base text size</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-4">
        {#each fontSizes as size}
          <label class="flex cursor-pointer items-center justify-between rounded-lg border p-4 {fontSize === size.value ? 'border-primary-500 bg-primary-50 dark:border-primary-400 dark:bg-primary-900/30' : 'border-gray-200 hover:bg-gray-50 dark:border-gray-700 dark:hover:bg-gray-800'}">
            <div class="flex items-center gap-3">
              <span class="{size.preview} font-medium text-gray-900 dark:text-white">Aa</span>
              <div>
                <p class="font-medium text-gray-900 dark:text-white">{size.label}</p>
              </div>
            </div>
            <input type="radio" name="fontSize" value={size.value} bind:group={fontSize} class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
          </label>
        {/each}
      </div>
    </Card>
  </div>

  <!-- Language -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Language & Region</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Set your preferred language</p>
    </div>

    <Card class="max-w-lg">
      <div class="space-y-6">
        <div class="flex items-center gap-3">
          <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-green-100 dark:bg-green-900">
            <LanguageOutline class="h-5 w-5 text-green-600 dark:text-green-400" />
          </div>
          <div>
            <p class="font-medium text-gray-900 dark:text-white">Display language</p>
            <p class="text-sm text-gray-500 dark:text-gray-400">Choose the language for the interface</p>
          </div>
        </div>

        <Select bind:value={language}>
          {#each languages as lang}
            <option value={lang.value}>{lang.label}</option>
          {/each}
        </Select>

        <div class="border-t border-gray-200 pt-4 dark:border-gray-700">
          <div class="grid grid-cols-2 gap-4">
            <div>
              <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white">Date format</label>
              <Select>
                <option value="mdy">MM/DD/YYYY</option>
                <option value="dmy">DD/MM/YYYY</option>
                <option value="ymd">YYYY-MM-DD</option>
              </Select>
            </div>
            <div>
              <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white">Time format</label>
              <Select>
                <option value="12">12-hour (1:30 PM)</option>
                <option value="24">24-hour (13:30)</option>
              </Select>
            </div>
          </div>
        </div>

        <div>
          <label class="mb-2 block text-sm font-medium text-gray-900 dark:text-white">Timezone</label>
          <Select>
            <option value="utc-8">(UTC-8:00) Pacific Time</option>
            <option value="utc-5">(UTC-5:00) Eastern Time</option>
            <option value="utc">(UTC) Coordinated Universal Time</option>
            <option value="utc+1">(UTC+1:00) Central European Time</option>
            <option value="utc+9">(UTC+9:00) Japan Standard Time</option>
          </Select>
        </div>
      </div>
    </Card>
  </div>

  <!-- Accessibility -->
  <div class="lg:col-span-2">
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Accessibility</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Customize your experience for better accessibility</p>
    </div>

    <Card>
      <div class="grid gap-6 md:grid-cols-2">
        <div class="space-y-6">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-purple-100 dark:bg-purple-900">
              <EyeOutline class="h-5 w-5 text-purple-600 dark:text-purple-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Visual settings</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Adjust visual preferences</p>
            </div>
          </div>

          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Reduce motion</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Minimize animations and transitions</p>
              </div>
              <Toggle bind:checked={reducedMotion} />
            </div>

            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">High contrast</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Increase color contrast for better visibility</p>
              </div>
              <Toggle bind:checked={highContrast} />
            </div>
          </div>
        </div>

        <div class="space-y-6">
          <div class="flex items-center gap-3">
            <div class="flex h-10 w-10 items-center justify-center rounded-lg bg-orange-100 dark:bg-orange-900">
              <AdjustmentsHorizontalOutline class="h-5 w-5 text-orange-600 dark:text-orange-400" />
            </div>
            <div>
              <p class="font-medium text-gray-900 dark:text-white">Display settings</p>
              <p class="text-sm text-gray-500 dark:text-gray-400">Customize layout and display</p>
            </div>
          </div>

          <div class="space-y-4">
            <div class="flex items-center justify-between">
              <div>
                <p class="font-medium text-gray-900 dark:text-white">Compact mode</p>
                <p class="text-sm text-gray-500 dark:text-gray-400">Reduce padding and spacing</p>
              </div>
              <Toggle bind:checked={compactMode} />
            </div>

            <div>
              <p class="mb-2 font-medium text-gray-900 dark:text-white">Sidebar position</p>
              <div class="flex gap-3">
                <label class="flex items-center gap-2">
                  <input type="radio" name="sidebar" value="left" checked class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
                  <span class="text-gray-600 dark:text-gray-300">Left</span>
                </label>
                <label class="flex items-center gap-2">
                  <input type="radio" name="sidebar" value="right" class="h-4 w-4 border-gray-300 text-primary-600 focus:ring-primary-500" />
                  <span class="text-gray-600 dark:text-gray-300">Right</span>
                </label>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="mt-6 rounded-lg bg-gray-50 p-4 dark:bg-gray-800">
        <h4 class="mb-3 font-medium text-gray-900 dark:text-white">Keyboard shortcuts</h4>
        <div class="grid gap-3 sm:grid-cols-2 md:grid-cols-3">
          <div class="flex items-center justify-between">
            <span class="text-sm text-gray-600 dark:text-gray-300">Search</span>
            <kbd class="rounded bg-gray-200 px-2 py-1 text-xs font-semibold text-gray-800 dark:bg-gray-700 dark:text-gray-200">⌘ K</kbd>
          </div>
          <div class="flex items-center justify-between">
            <span class="text-sm text-gray-600 dark:text-gray-300">Toggle sidebar</span>
            <kbd class="rounded bg-gray-200 px-2 py-1 text-xs font-semibold text-gray-800 dark:bg-gray-700 dark:text-gray-200">⌘ B</kbd>
          </div>
          <div class="flex items-center justify-between">
            <span class="text-sm text-gray-600 dark:text-gray-300">Toggle theme</span>
            <kbd class="rounded bg-gray-200 px-2 py-1 text-xs font-semibold text-gray-800 dark:bg-gray-700 dark:text-gray-200">⌘ D</kbd>
          </div>
          <div class="flex items-center justify-between">
            <span class="text-sm text-gray-600 dark:text-gray-300">New item</span>
            <kbd class="rounded bg-gray-200 px-2 py-1 text-xs font-semibold text-gray-800 dark:bg-gray-700 dark:text-gray-200">⌘ N</kbd>
          </div>
          <div class="flex items-center justify-between">
            <span class="text-sm text-gray-600 dark:text-gray-300">Save</span>
            <kbd class="rounded bg-gray-200 px-2 py-1 text-xs font-semibold text-gray-800 dark:bg-gray-700 dark:text-gray-200">⌘ S</kbd>
          </div>
          <div class="flex items-center justify-between">
            <span class="text-sm text-gray-600 dark:text-gray-300">Help</span>
            <kbd class="rounded bg-gray-200 px-2 py-1 text-xs font-semibold text-gray-800 dark:bg-gray-700 dark:text-gray-200">?</kbd>
          </div>
        </div>
      </div>

      <div class="mt-6 flex justify-end gap-3 border-t border-gray-200 pt-6 dark:border-gray-700">
        <Button color="light">Reset to defaults</Button>
        <Button>Save preferences</Button>
      </div>
    </Card>
  </div>
</div>
