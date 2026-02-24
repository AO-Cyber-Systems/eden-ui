import { Controller } from "@hotwired/stimulus"

/**
 * Sidebar controller for collapsible navigation with mobile overlay support.
 * Toggles between expanded and collapsed states, with overlay for mobile.
 *
 * @example
 *   <div data-controller="eden-ui--sidebar" data-eden-ui--sidebar-collapsed-value="false">
 *     <button data-action="eden-ui--sidebar#toggle">
 *       <span data-eden-ui--sidebar-target="toggleIcon">☰</span>
 *     </button>
 *     <aside data-eden-ui--sidebar-target="sidebar">
 *       Navigation items
 *     </aside>
 *     <div data-eden-ui--sidebar-target="overlay" class="hidden"
 *          data-action="click->eden-ui--sidebar#close"></div>
 *   </div>
 *
 * @targets sidebar - The sidebar navigation element
 * @targets overlay - Mobile overlay backdrop
 * @targets toggleIcon - Icon element that rotates when toggled
 * @values collapsed (Boolean, default: false) - Current collapsed state
 */
export default class extends Controller {
  static targets = ["sidebar", "overlay", "toggleIcon"]
  static values = {
    collapsed: { type: Boolean, default: false }
  }

  connect() {
    this.applyState()
  }

  /**
   * Toggle the sidebar between collapsed and expanded states.
   */
  toggle() {
    this.collapsedValue = !this.collapsedValue
  }

  /**
   * Expand the sidebar.
   */
  open() {
    this.collapsedValue = false
  }

  /**
   * Collapse the sidebar.
   */
  close() {
    this.collapsedValue = true
  }

  /**
   * Callback when the collapsed value changes. Updates the visual state.
   */
  collapsedValueChanged() {
    this.applyState()
  }

  /**
   * The sidebar element — uses the sidebar target if present,
   * otherwise falls back to the controller element itself.
   */
  get sidebarEl() {
    return this.hasSidebarTarget ? this.sidebarTarget : this.element
  }

  /**
   * Apply the current collapsed/expanded state to the DOM.
   */
  applyState() {
    if (this.collapsedValue) {
      this.sidebarEl.classList.add("sidebar-collapsed")
      this.sidebarEl.classList.remove("sidebar-expanded")

      if (this.hasOverlayTarget) {
        this.overlayTarget.classList.add("hidden")
      }

      if (this.hasToggleIconTarget) {
        this.toggleIconTarget.classList.remove("rotate-180")
      }
    } else {
      this.sidebarEl.classList.remove("sidebar-collapsed")
      this.sidebarEl.classList.add("sidebar-expanded")

      if (this.hasOverlayTarget) {
        this.overlayTarget.classList.remove("hidden")
      }

      if (this.hasToggleIconTarget) {
        this.toggleIconTarget.classList.add("rotate-180")
      }
    }
  }
}
