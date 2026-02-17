import { Controller } from "@hotwired/stimulus"

/**
 * Popover controller for showing/hiding floating content on hover or click.
 * Positions content relative to the trigger element.
 *
 * @example
 *   <div data-controller="eden-ui--popover"
 *        data-eden-ui--popover-placement-value="top"
 *        data-eden-ui--popover-trigger-type-value="hover">
 *     <button data-eden-ui--popover-target="trigger"
 *             data-action="mouseenter->eden-ui--popover#show mouseleave->eden-ui--popover#hide">
 *       Hover me
 *     </button>
 *     <div data-eden-ui--popover-target="content" class="hidden absolute">
 *       Popover content
 *     </div>
 *   </div>
 *
 * @targets trigger - The element that activates the popover
 * @targets content - The popover content panel
 * @values placement (String, default: "top") - Position: "top", "bottom", "left", "right"
 * @values triggerType (String, default: "hover") - Activation: "hover" or "click"
 */
export default class extends Controller {
  static targets = ["trigger", "content"]
  static values = {
    placement: { type: String, default: "top" },
    triggerType: { type: String, default: "hover" }
  }

  connect() {
    this.closeOnOutsideClick = this.closeOnOutsideClick.bind(this)

    if (this.triggerTypeValue === "click") {
      document.addEventListener("click", this.closeOnOutsideClick)
    }
  }

  disconnect() {
    document.removeEventListener("click", this.closeOnOutsideClick)
  }

  /**
   * Show the popover content and position it.
   */
  show() {
    this.contentTarget.classList.remove("hidden")
    this.position()
  }

  /**
   * Hide the popover content.
   */
  hide() {
    this.contentTarget.classList.add("hidden")
  }

  /**
   * Toggle the popover visibility (for click trigger type).
   */
  toggle() {
    if (this.contentTarget.classList.contains("hidden")) {
      this.show()
    } else {
      this.hide()
    }
  }

  /**
   * Close the popover when clicking outside (click trigger mode).
   * @param {MouseEvent} event
   */
  closeOnOutsideClick(event) {
    if (!this.element.contains(event.target)) {
      this.hide()
    }
  }

  /**
   * Position the content element relative to the trigger based on placement value.
   */
  position() {
    const trigger = this.triggerTarget
    const content = this.contentTarget
    const triggerRect = trigger.getBoundingClientRect()
    const contentRect = content.getBoundingClientRect()

    let top = 0
    let left = 0

    switch (this.placementValue) {
      case "top":
        top = triggerRect.top - contentRect.height - 8
        left = triggerRect.left + (triggerRect.width - contentRect.width) / 2
        break
      case "bottom":
        top = triggerRect.bottom + 8
        left = triggerRect.left + (triggerRect.width - contentRect.width) / 2
        break
      case "left":
        top = triggerRect.top + (triggerRect.height - contentRect.height) / 2
        left = triggerRect.left - contentRect.width - 8
        break
      case "right":
        top = triggerRect.top + (triggerRect.height - contentRect.height) / 2
        left = triggerRect.right + 8
        break
    }

    content.style.position = "fixed"
    content.style.top = `${top}px`
    content.style.left = `${left}px`
  }
}
