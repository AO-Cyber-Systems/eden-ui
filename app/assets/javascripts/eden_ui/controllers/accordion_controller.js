import { Controller } from "@hotwired/stimulus"

/**
 * Accordion controller for expandable/collapsible content sections.
 * Supports single-open or multi-open modes.
 *
 * @example
 *   <div data-controller="eden-ui--accordion" data-eden-ui--accordion-multi-open-value="false">
 *     <div>
 *       <button data-eden-ui--accordion-target="item" data-action="eden-ui--accordion#toggle">
 *         Section 1
 *         <span data-eden-ui--accordion-target="icon">▼</span>
 *       </button>
 *       <div data-eden-ui--accordion-target="content" class="hidden">
 *         Content for section 1
 *       </div>
 *     </div>
 *   </div>
 *
 * @targets item - Clickable header elements that toggle their associated content
 * @targets content - Collapsible content panels (paired by index with items)
 * @targets icon - Optional rotation icons (paired by index with items)
 * @values multiOpen (Boolean, default: false) - Allow multiple sections open simultaneously
 */
export default class extends Controller {
  static targets = ["item", "content", "icon"]
  static values = {
    multiOpen: { type: Boolean, default: false }
  }

  /**
   * Toggle the content panel associated with the clicked item.
   * When multiOpen is false, closes all other panels first.
   * @param {Event} event - The click event from an item target
   */
  toggle(event) {
    const item = event.currentTarget
    const index = this.itemTargets.indexOf(item)
    if (index === -1) return

    const content = this.contentTargets[index]
    const isOpen = !content.classList.contains("hidden")

    if (!this.multiOpenValue) {
      this.closeAll()
    }

    if (isOpen) {
      this.closePanel(index)
    } else {
      this.openPanel(index)
    }
  }

  /**
   * Open a specific panel by index.
   * @param {number} index
   */
  openPanel(index) {
    const content = this.contentTargets[index]
    if (!content) return

    content.classList.remove("hidden")

    if (this.iconTargets[index]) {
      this.iconTargets[index].classList.add("rotate-180")
    }

    this.itemTargets[index].setAttribute("aria-expanded", "true")
  }

  /**
   * Close a specific panel by index.
   * @param {number} index
   */
  closePanel(index) {
    const content = this.contentTargets[index]
    if (!content) return

    content.classList.add("hidden")

    if (this.iconTargets[index]) {
      this.iconTargets[index].classList.remove("rotate-180")
    }

    this.itemTargets[index].setAttribute("aria-expanded", "false")
  }

  /**
   * Close all accordion panels.
   */
  closeAll() {
    this.contentTargets.forEach((_, index) => this.closePanel(index))
  }
}
