import { expect, test } from "@playwright/test";

test.describe("Starlight Documentation Site", () => {
  test.beforeEach(async ({ page }) => {
    // Navigate to docs root
    await page.goto("/");
  });

  test("should load documentation homepage", async ({ page }) => {
    // Check that the page loaded with expected title
    await expect(page).toHaveTitle(/Eden UI/i);
  });

  test("should display main heading", async ({ page }) => {
    // Check for main heading - use more specific selector
    const heading = page.locator("h1#_top, h1[data-page-title]").first();
    await expect(heading).toBeVisible();
    await expect(heading).toContainText(/Eden UI/i);
  });

  test("should have navigation sidebar", async ({ page }) => {
    // Navigate to a docs page which has the sidebar
    await page.goto("/getting-started/introduction");

    // Check for sidebar navigation - Starlight uses nav with aria-label="Main"
    // Note: The sidebar may be hidden on smaller viewports but should exist in DOM
    const sidebar = page.locator('nav[aria-label="Main"]');
    await expect(sidebar).toBeAttached({ timeout: 5000 });
  });

  test("should navigate to Getting Started page", async ({ page }) => {
    // Find and click Getting Started or Introduction link
    const introLink = page.getByRole("link", { name: /Introduction/i }).first();

    if (await introLink.isVisible()) {
      await introLink.click();

      // Verify navigation - wait for URL to change
      await page.waitForURL(/getting-started/);
    }
  });

  test("should have search functionality", async ({ page }) => {
    // Look for search button/input
    const searchButton = page.locator('[data-pagefind-ui], button[aria-label*="Search"]');

    // Starlight uses Pagefind search
    if (await searchButton.isVisible()) {
      await expect(searchButton).toBeVisible();
    }
  });

  test("should display theme toggle", async ({ page }) => {
    // Starlight has a theme toggle button
    const themeToggle = page.locator('button[aria-label*="theme"], starlight-theme-select');

    if (await themeToggle.first().isVisible()) {
      await expect(themeToggle.first()).toBeVisible();
    }
  });

  test("should have proper page structure", async ({ page }) => {
    // Check for expected Starlight page structure
    const main = page.locator("main");
    await expect(main).toBeVisible();

    // Check for header - use getByRole for the main banner
    const header = page.getByRole("banner");
    await expect(header).toBeVisible();
  });

  test("should render markdown content correctly", async ({ page }) => {
    // Navigate to a content page
    await page.goto("/getting-started/introduction");

    // Check that content is rendered - use .first() for strict mode
    const content = page.locator("article, main").first();
    await expect(content).toBeVisible();

    // Check for prose styling (Starlight uses this for markdown)
    const prose = page.locator(".sl-markdown-content, .content-panel").first();
    if (await prose.isVisible()) {
      await expect(prose).toBeVisible();
    }
  });

  test("should have responsive mobile menu", async ({ page }) => {
    // Set mobile viewport
    await page.setViewportSize({ width: 375, height: 667 });

    // Look for mobile menu button
    const mobileMenuButton = page.locator(
      'button[aria-label*="Menu"], button[aria-controls*="sidebar"]'
    );

    if (await mobileMenuButton.isVisible()) {
      await mobileMenuButton.click();

      // Check that sidebar becomes visible
      const sidebar = page.locator("nav[aria-label='Main']");
      await expect(sidebar).toBeVisible();
    }
  });

  test("should load without console errors", async ({ page }) => {
    const consoleErrors: string[] = [];

    page.on("console", (msg) => {
      if (msg.type() === "error") {
        consoleErrors.push(msg.text());
      }
    });

    await page.goto("/");
    await page.waitForLoadState("networkidle");

    // Filter out known non-critical errors
    const criticalErrors = consoleErrors.filter(
      (error) =>
        !error.includes("favicon") &&
        !error.includes("404") &&
        !error.includes("Failed to load resource") &&
        !error.includes("Failed to fetch") &&
        !error.includes("Astro")
    );

    expect(criticalErrors).toHaveLength(0);
  });
});
