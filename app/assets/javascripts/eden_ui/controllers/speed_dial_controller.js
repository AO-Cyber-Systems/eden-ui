import { Controller } from "@hotwired/stimulus"

/**
 * Speed dial (floating action button with radial menu) controller.
 * Toggles visibility of a menu of action items.
 *
 * @example
 *   <div data-controller="eden-ui--speed-dial" data-eden-ui--speed-dial-open-value="false">
 *     <button data-action="eden-ui--speed-dial#toggle">+</button>
 *     <div data-eden-ui--speed-dial-target="menu" class="hidden">
 *       <button>Action 1</button>
 *       <button>Action 2</button>
 *     </div>
 *   </div>
 *
 * @targets menu - The container for speed dial action items
 * @values open (Boolean, default: false) - Whether the menu is currently open
 */
export default class extends Controller {
  static targets = ["menu"]
  static values = {
    open: { type: Boolean, default: false }
  }

  connect() {
    this.closeOnOutsideClick = this.closeOnOutsideClick.bind(this)
    document.addEventListener("click", this.closeOnOutsideClick)
    this.applyState()
  }

  disconnect() {
    document.removeEventListener("click", this.closeOnOutsideClick)
  }

  /**
   * Toggle the speed dial menu open/closed.
   */
  toggle() {
    this.openValue = !this.openValue
  }

  /**
   * Open the speed dial menu.
   */
  show() {
    this.openValue = true
  }

  /**
   * Close the speed dial menu.
   */
  hide() {
    this.openValue = false
  }

  /**
   * Callback when the open value changes.
   */
  openValueChanged() {
    this.applyState()
  }

  /**
   * Apply current open/closed state to the menu target.
   */
  applyState() {
    if (!this.hasMenuTarget) return

    if (this.openValue) {
      this.menuTarget.classList.remove("hidden")
    } else {
      this.menuTarget.classList.add("hidden")
    }
  }

  /**
   * Close the menu when clicking outside.
   * @param {MouseEvent} event
   */
  closeOnOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.hide()
    }
  }
}
