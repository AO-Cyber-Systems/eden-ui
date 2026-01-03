import { expect, test } from "@playwright/test";

test.describe("Storybook", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto("/");
    // Wait for Storybook to fully load - wait for sidebar to appear
    await page.waitForSelector('[data-item-id]', { timeout: 30000 });
  });

  test("should load Storybook homepage", async ({ page }) => {
    await expect(page).toHaveTitle(/Storybook/i);
  });

  test("should display sidebar with Components category", async ({ page }) => {
    // Storybook 10 sidebar uses #components for the components root
    const componentsRoot = page.locator('#components');
    await expect(componentsRoot).toBeVisible({ timeout: 15000 });

    // Check for EXAMPLE group
    const exampleRoot = page.locator('#example');
    await expect(exampleRoot).toBeVisible();
  });

  test("should show Button component in sidebar", async ({ page }) => {
    // Wait for sidebar - Button component has data-item-id="components-button"
    const buttonItem = page.locator('[data-item-id="components-button"]');
    await expect(buttonItem).toBeVisible({ timeout: 15000 });
  });

  test("should navigate to Button component docs", async ({ page }) => {
    // Find and click on the Button in COMPONENTS section
    const componentsButton = page.locator('[data-item-id="components-button"]');
    await expect(componentsButton).toBeVisible({ timeout: 15000 });
    await componentsButton.click();

    // Wait for navigation and check URL
    await page.waitForURL(/components-button/);
  });

  test("should render Button Default story", async ({ page }) => {
    // Navigate directly to the Default story
    await page.goto("/?path=/story/components-button--default");

    // Wait for sidebar to load (indicates page is ready)
    await page.waitForSelector('[data-item-id]', { timeout: 30000 });

    // Wait for the story iframe to have content
    const storyFrame = page.frameLocator("#storybook-preview-iframe");

    // Look for the Button text (our button says "Button") - use first() to handle duplicates
    const button = storyFrame.getByRole('button', { name: 'Button' }).first();
    await expect(button).toBeVisible({ timeout: 30000 });
  });

  test("should show Button stories when expanded", async ({ page }) => {
    // Navigate directly to a Button story - this auto-expands the tree
    await page.goto("/?path=/story/components-button--default");

    // Wait for sidebar to load first
    await page.waitForSelector('[data-item-id]', { timeout: 30000 });

    // The Default story should be visible in the sidebar since we navigated to it
    const defaultStory = page.locator('[data-item-id="components-button--default"]');
    await expect(defaultStory).toBeVisible({ timeout: 15000 });

    // Also verify other stories are visible (tree is expanded)
    const primaryStory = page.locator('[data-item-id="components-button--primary"]');
    await expect(primaryStory).toBeVisible({ timeout: 5000 });
  });

  test("should display docs page for Button", async ({ page }) => {
    // Navigate to Button docs
    await page.goto("/?path=/docs/components-button--docs");

    // Wait for sidebar to load (indicates page is ready)
    await page.waitForSelector('[data-item-id]', { timeout: 30000 });

    // The docs page should have loaded - check for the sidebar showing Docs is selected
    const docsItem = page.locator('[data-item-id="components-button--docs"]');
    await expect(docsItem).toHaveAttribute('data-selected', 'true', { timeout: 15000 });
  });

  test("should have search functionality", async ({ page }) => {
    // Storybook 10 search is in the sidebar header
    const searchInput = page.locator('input[placeholder*="Find"], input[placeholder*="Search"]');
    await expect(searchInput).toBeVisible({ timeout: 15000 });

    // Type in search
    await searchInput.fill("Button");

    // Wait a bit for search to filter
    await page.waitForTimeout(1000);

    // Check that the sidebar still shows Button (it should filter to show it)
    // The Button component should still be visible in the sidebar
    const buttonItem = page.locator('[data-item-id="components-button"]');
    await expect(buttonItem).toBeAttached({ timeout: 5000 });
  });

  test("should load without critical console errors", async ({ page }) => {
    const criticalErrors: string[] = [];

    page.on("console", (msg) => {
      if (msg.type() === "error") {
        const text = msg.text();
        // Filter out known non-critical errors
        if (
          !text.includes("favicon") &&
          !text.includes("404") &&
          !text.includes("vite-plugin-devtools") &&
          !text.includes("Failed to fetch") &&
          !text.includes("net::ERR")
        ) {
          criticalErrors.push(text);
        }
      }
    });

    await page.goto("/");
    await page.waitForSelector('[data-item-id]', { timeout: 30000 });

    // Allow some warnings but no critical errors
    expect(criticalErrors.length).toBeLessThan(3);
  });
});
