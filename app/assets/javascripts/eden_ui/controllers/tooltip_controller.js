import { Controller } from "@hotwired/stimulus"

/**
 * Tooltip controller for showing contextual information on hover.
 * Positions the tooltip relative to the trigger element.
 *
 * @example
 *   <div data-controller="eden-ui--tooltip" data-eden-ui--tooltip-placement-value="top"
 *        data-action="mouseenter->eden-ui--tooltip#show mouseleave->eden-ui--tooltip#hide">
 *     Hover me
 *     <div data-eden-ui--tooltip-target="content" class="hidden absolute" role="tooltip">
 *       Tooltip text
 *     </div>
 *   </div>
 *
 * @targets content - The tooltip content element
 * @values placement (String, default: "top") - Position: "top", "bottom", "left", "right"
 */
export default class extends Controller {
  static targets = ["content"]
  static values = {
    placement: { type: String, default: "top" }
  }

  /**
   * Show the tooltip and position it relative to the trigger.
   */
  show() {
    this.contentTarget.classList.remove("hidden")
    this.position()
  }

  /**
   * Hide the tooltip.
   */
  hide() {
    this.contentTarget.classList.add("hidden")
  }

  /**
   * Position the tooltip content relative to the controller element.
   */
  position() {
    const trigger = this.element
    const tooltip = this.contentTarget
    const triggerRect = trigger.getBoundingClientRect()
    const tooltipRect = tooltip.getBoundingClientRect()

    let top = 0
    let left = 0

    switch (this.placementValue) {
      case "top":
        top = triggerRect.top - tooltipRect.height - 8
        left = triggerRect.left + (triggerRect.width - tooltipRect.width) / 2
        break
      case "bottom":
        top = triggerRect.bottom + 8
        left = triggerRect.left + (triggerRect.width - tooltipRect.width) / 2
        break
      case "left":
        top = triggerRect.top + (triggerRect.height - tooltipRect.height) / 2
        left = triggerRect.left - tooltipRect.width - 8
        break
      case "right":
        top = triggerRect.top + (triggerRect.height - tooltipRect.height) / 2
        left = triggerRect.right + 8
        break
    }

    tooltip.style.position = "fixed"
    tooltip.style.top = `${top}px`
    tooltip.style.left = `${left}px`
  }
}
