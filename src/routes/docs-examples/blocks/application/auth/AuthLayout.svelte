<script lang="ts">
  import { Button, Input, Label, Checkbox, Card } from "flowbite-svelte";
  import { EnvelopeOutline, LockClosedOutline } from "flowbite-svelte-icons";
</script>

<div class="space-y-8 p-4">
  <!-- Split Layout -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Split Layout</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Form on one side, image on the other</p>
    </div>

    <div class="overflow-hidden rounded-lg border border-gray-200 dark:border-gray-700">
      <div class="grid lg:grid-cols-2">
        <!-- Form Side -->
        <div class="flex items-center justify-center bg-white p-8 dark:bg-gray-800 lg:p-12">
          <div class="w-full max-w-md">
            <div class="mb-8">
              <div class="mb-4 flex h-10 w-10 items-center justify-center rounded-lg bg-primary-600 text-white">
                <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
                </svg>
              </div>
              <h2 class="text-2xl font-bold text-gray-900 dark:text-white">Welcome back</h2>
              <p class="mt-2 text-gray-500 dark:text-gray-400">Sign in to access your dashboard</p>
            </div>

            <form class="space-y-5">
              <div>
                <Label for="split-email" class="mb-2">Email</Label>
                <Input type="email" id="split-email" placeholder="name@company.com" />
              </div>

              <div>
                <Label for="split-password" class="mb-2">Password</Label>
                <Input type="password" id="split-password" placeholder="••••••••" />
              </div>

              <div class="flex items-center justify-between">
                <Checkbox>Remember me</Checkbox>
                <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Forgot password?</a>
              </div>

              <Button type="submit" class="w-full">Sign in</Button>

              <div class="relative">
                <div class="absolute inset-0 flex items-center">
                  <div class="w-full border-t border-gray-300 dark:border-gray-600"></div>
                </div>
                <div class="relative flex justify-center text-sm">
                  <span class="bg-white px-2 text-gray-500 dark:bg-gray-800 dark:text-gray-400">Or</span>
                </div>
              </div>

              <div class="grid grid-cols-2 gap-3">
                <Button color="light">
                  <svg class="me-2 h-5 w-5" viewBox="0 0 24 24">
                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                  </svg>
                  Google
                </Button>
                <Button color="dark">
                  <svg class="me-2 h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                  </svg>
                  GitHub
                </Button>
              </div>

              <p class="text-center text-sm text-gray-500 dark:text-gray-400">
                Don't have an account?
                <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign up</a>
              </p>
            </form>
          </div>
        </div>

        <!-- Image Side -->
        <div class="hidden bg-gradient-to-br from-primary-500 to-primary-700 p-12 lg:flex lg:flex-col lg:justify-center">
          <div class="mx-auto max-w-md text-white">
            <blockquote class="text-2xl font-medium italic">
              "Flowbite has transformed how we build products. The component library is incredibly comprehensive and saves us countless hours."
            </blockquote>
            <div class="mt-6 flex items-center gap-4">
              <div class="flex h-12 w-12 items-center justify-center rounded-full bg-white/20 text-lg font-bold">
                JD
              </div>
              <div>
                <div class="font-medium">Jane Doe</div>
                <div class="text-primary-200">CTO at TechCorp</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Centered Card Layout -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Centered Card</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Simple centered form with background</p>
    </div>

    <div class="rounded-lg bg-gradient-to-r from-gray-100 to-gray-200 p-8 dark:from-gray-800 dark:to-gray-900">
      <div class="mx-auto max-w-md">
        <Card class="shadow-xl">
          <div class="mb-6 text-center">
            <div class="mx-auto mb-4 flex h-12 w-12 items-center justify-center rounded-lg bg-primary-600 text-white">
              <svg class="h-7 w-7" fill="currentColor" viewBox="0 0 24 24">
                <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
              </svg>
            </div>
            <h2 class="text-xl font-bold text-gray-900 dark:text-white">Sign in to Flowbite</h2>
          </div>

          <form class="space-y-4">
            <div>
              <Label for="center-email" class="mb-2">Email</Label>
              <Input type="email" id="center-email" placeholder="name@company.com">
                {#snippet left()}
                  <EnvelopeOutline class="h-5 w-5 text-gray-500" />
                {/snippet}
              </Input>
            </div>

            <div>
              <Label for="center-password" class="mb-2">Password</Label>
              <Input type="password" id="center-password" placeholder="••••••••">
                {#snippet left()}
                  <LockClosedOutline class="h-5 w-5 text-gray-500" />
                {/snippet}
              </Input>
            </div>

            <div class="flex items-center justify-between">
              <Checkbox>Remember me</Checkbox>
              <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Forgot password?</a>
            </div>

            <Button type="submit" class="w-full">Sign in</Button>
          </form>

          <p class="mt-4 text-center text-sm text-gray-500 dark:text-gray-400">
            Don't have an account?
            <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Create one</a>
          </p>
        </Card>
      </div>
    </div>
  </div>

  <!-- Full Screen with Pattern -->
  <div>
    <div class="mb-4">
      <h3 class="text-lg font-semibold text-gray-900 dark:text-white">Full Screen with Pattern</h3>
      <p class="text-sm text-gray-500 dark:text-gray-400">Background pattern with centered form</p>
    </div>

    <div class="relative overflow-hidden rounded-lg bg-gray-900">
      <!-- Background Pattern -->
      <div class="absolute inset-0 opacity-30">
        <svg class="h-full w-full" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <pattern id="grid" width="40" height="40" patternUnits="userSpaceOnUse">
              <path d="M 40 0 L 0 0 0 40" fill="none" stroke="white" stroke-width="0.5"/>
            </pattern>
          </defs>
          <rect width="100%" height="100%" fill="url(#grid)" />
        </svg>
      </div>

      <!-- Content -->
      <div class="relative flex min-h-[600px] items-center justify-center p-8">
        <div class="w-full max-w-md">
          <div class="rounded-2xl bg-white p-8 shadow-2xl dark:bg-gray-800">
            <div class="mb-8 text-center">
              <div class="mx-auto mb-4 flex h-14 w-14 items-center justify-center rounded-xl bg-gradient-to-br from-primary-500 to-primary-700 text-white shadow-lg">
                <svg class="h-8 w-8" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 2L2 7l10 5 10-5-10-5zM2 17l10 5 10-5M2 12l10 5 10-5" stroke="currentColor" stroke-width="2" fill="none" />
                </svg>
              </div>
              <h1 class="text-2xl font-bold text-gray-900 dark:text-white">Welcome back</h1>
              <p class="mt-2 text-gray-500 dark:text-gray-400">Enter your credentials to continue</p>
            </div>

            <form class="space-y-5">
              <div>
                <Label for="pattern-email" class="mb-2">Email address</Label>
                <Input type="email" id="pattern-email" placeholder="you@company.com" size="lg" />
              </div>

              <div>
                <div class="mb-2 flex items-center justify-between">
                  <Label for="pattern-password">Password</Label>
                  <a href="#" class="text-sm font-medium text-primary-600 hover:underline dark:text-primary-500">Forgot?</a>
                </div>
                <Input type="password" id="pattern-password" placeholder="••••••••" size="lg" />
              </div>

              <Checkbox>Keep me signed in</Checkbox>

              <Button type="submit" class="w-full" size="lg">Sign in</Button>
            </form>

            <div class="relative my-6">
              <div class="absolute inset-0 flex items-center">
                <div class="w-full border-t border-gray-200 dark:border-gray-700"></div>
              </div>
              <div class="relative flex justify-center text-sm">
                <span class="bg-white px-3 text-gray-500 dark:bg-gray-800 dark:text-gray-400">Or continue with</span>
              </div>
            </div>

            <div class="grid grid-cols-3 gap-3">
              <Button color="light" class="w-full">
                <svg class="h-5 w-5" viewBox="0 0 24 24">
                  <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                  <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                  <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                  <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                </svg>
              </Button>
              <Button color="dark" class="w-full">
                <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
                </svg>
              </Button>
              <Button color="light" class="w-full">
                <svg class="h-5 w-5" fill="currentColor" viewBox="0 0 24 24">
                  <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z"/>
                </svg>
              </Button>
            </div>

            <p class="mt-6 text-center text-sm text-gray-500 dark:text-gray-400">
              Don't have an account?
              <a href="#" class="font-medium text-primary-600 hover:underline dark:text-primary-500">Sign up for free</a>
            </p>
          </div>

          <p class="mt-6 text-center text-sm text-gray-400">
            By signing in, you agree to our
            <a href="#" class="text-gray-300 hover:text-white">Terms</a>
            and
            <a href="#" class="text-gray-300 hover:text-white">Privacy Policy</a>
          </p>
        </div>
      </div>
    </div>
  </div>
</div>
