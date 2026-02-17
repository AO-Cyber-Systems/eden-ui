import { Controller } from "@hotwired/stimulus"

/**
 * Dark mode controller using Tailwind's html.dark convention.
 * Toggles the "dark" class on <html> and sets a data-theme attribute.
 * Persists the user's preference to localStorage.
 *
 * @example
 *   <div data-controller="eden-ui--dark-mode">
 *     <button data-action="eden-ui--dark-mode#toggle">
 *       <span data-eden-ui--dark-mode-target="lightIcon">☀️</span>
 *       <span data-eden-ui--dark-mode-target="darkIcon">🌙</span>
 *     </button>
 *   </div>
 *
 * @targets lightIcon - Icon shown when in light mode (indicates switch to dark)
 * @targets darkIcon - Icon shown when in dark mode (indicates switch to light)
 */
export default class extends Controller {
  static targets = ["lightIcon", "darkIcon"]

  connect() {
    this.applyStoredPreference()
    this.updateIcons()
  }

  /**
   * Toggle between light and dark mode.
   */
  toggle() {
    const html = document.documentElement

    if (html.classList.contains("dark")) {
      html.classList.remove("dark")
      html.setAttribute("data-theme", "light")
      localStorage.setItem("theme", "light")
    } else {
      html.classList.add("dark")
      html.setAttribute("data-theme", "dark")
      localStorage.setItem("theme", "dark")
    }

    this.updateIcons()
  }

  /**
   * Apply the stored theme preference from localStorage, falling back
   * to the system preference if no stored value exists.
   */
  applyStoredPreference() {
    const stored = localStorage.getItem("theme")
    const html = document.documentElement

    if (stored === "dark" || (!stored && window.matchMedia("(prefers-color-scheme: dark)").matches)) {
      html.classList.add("dark")
      html.setAttribute("data-theme", "dark")
    } else {
      html.classList.remove("dark")
      html.setAttribute("data-theme", "light")
    }
  }

  /**
   * Update icon visibility based on current dark mode state.
   */
  updateIcons() {
    const isDark = document.documentElement.classList.contains("dark")

    if (this.hasLightIconTarget) {
      this.lightIconTargets.forEach((icon) => icon.classList.toggle("hidden", isDark))
    }
    if (this.hasDarkIconTarget) {
      this.darkIconTargets.forEach((icon) => icon.classList.toggle("hidden", !isDark))
    }
  }
}
