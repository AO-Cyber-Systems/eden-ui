import { Controller } from "@hotwired/stimulus"

/**
 * Dropdown menu controller with keyboard navigation support.
 * Handles toggle, outside-click close, and arrow key / Enter / Escape navigation.
 *
 * @example
 *   <div data-controller="eden-ui--dropdown">
 *     <button data-action="eden-ui--dropdown#toggle">Menu</button>
 *     <ul data-eden-ui--dropdown-target="menu" class="hidden">
 *       <li><a data-eden-ui--dropdown-target="item" href="#">Option 1</a></li>
 *       <li><a data-eden-ui--dropdown-target="item" href="#">Option 2</a></li>
 *     </ul>
 *   </div>
 *
 * @targets menu - The dropdown menu container
 * @targets item - Focusable items within the menu for keyboard navigation
 */
export default class extends Controller {
  static targets = ["menu", "item"]

  connect() {
    this.closeHandler = this.closeOnOutsideClick.bind(this)
    this.keydownHandler = this.handleKeydown.bind(this)
    document.addEventListener("click", this.closeHandler)
    document.addEventListener("keydown", this.keydownHandler)
    this.activeIndex = -1
  }

  disconnect() {
    document.removeEventListener("click", this.closeHandler)
    document.removeEventListener("keydown", this.keydownHandler)
  }

  /**
   * Toggle the dropdown menu open/closed.
   */
  toggle() {
    const isHidden = this.menuTarget.classList.toggle("hidden")
    if (!isHidden) {
      this.activeIndex = -1
    }
  }

  /**
   * Open the dropdown menu.
   */
  open() {
    this.menuTarget.classList.remove("hidden")
    this.activeIndex = -1
  }

  /**
   * Close the dropdown menu and reset active index.
   */
  close() {
    this.menuTarget.classList.add("hidden")
    this.activeIndex = -1
  }

  /**
   * Close the menu if a click occurs outside the controller element.
   * @param {MouseEvent} event
   */
  closeOnOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.close()
    }
  }

  /**
   * Handle keyboard navigation within the dropdown.
   * - ArrowDown/ArrowUp: move focus between items
   * - Enter: activate the focused item
   * - Escape: close the dropdown
   * @param {KeyboardEvent} event
   */
  handleKeydown(event) {
    if (this.menuTarget.classList.contains("hidden")) return
    if (!this.hasItemTarget) return

    switch (event.key) {
      case "ArrowDown":
        event.preventDefault()
        this.activeIndex = Math.min(this.activeIndex + 1, this.itemTargets.length - 1)
        this.focusActiveItem()
        break
      case "ArrowUp":
        event.preventDefault()
        this.activeIndex = Math.max(this.activeIndex - 1, 0)
        this.focusActiveItem()
        break
      case "Enter":
        if (this.activeIndex >= 0) {
          event.preventDefault()
          this.itemTargets[this.activeIndex].click()
        }
        break
      case "Escape":
        event.preventDefault()
        this.close()
        break
    }
  }

  /**
   * Focus the currently active item based on activeIndex.
   */
  focusActiveItem() {
    if (this.activeIndex >= 0 && this.activeIndex < this.itemTargets.length) {
      this.itemTargets[this.activeIndex].focus()
    }
  }
}
