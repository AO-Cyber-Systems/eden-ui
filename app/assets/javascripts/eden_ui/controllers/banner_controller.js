import { Controller } from "@hotwired/stimulus"

/**
 * Banner notification controller with dismiss support.
 * Dispatches a custom "eden-banner:dismiss" event before hiding,
 * so parent controllers can hook into the dismiss lifecycle.
 *
 * @example
 *   <div data-controller="eden-banner"
 *        data-action="eden-banner:dismiss->my-controller#onDismiss">
 *     Banner content
 *     <button data-action="eden-banner#dismiss">×</button>
 *   </div>
 */
export default class extends Controller {
  dismiss() {
    this.dispatch("dismiss", { bubbles: true })
    this.element.style.display = "none"
  }
}
