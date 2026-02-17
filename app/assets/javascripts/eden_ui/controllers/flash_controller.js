import { Controller } from "@hotwired/stimulus"

/**
 * Flash message controller for auto-dismissing and manually dismissing
 * flash/alert notifications.
 *
 * @example
 *   <div data-controller="eden-ui--flash" data-eden-ui--flash-timeout-value="5000">
 *     <div data-eden-ui--flash-target="message" class="flash-message">
 *       Success!
 *       <button data-action="eden-ui--flash#dismiss">×</button>
 *     </div>
 *   </div>
 *
 * @targets message - Individual flash message elements to auto-dismiss
 * @values timeout (Number, default: 5000) - Milliseconds before auto-dismiss
 */
export default class extends Controller {
  static targets = ["message"]
  static values = {
    timeout: { type: Number, default: 5000 }
  }

  connect() {
    this.timers = []
    this.messageTargets.forEach((msg) => {
      const timer = setTimeout(() => this.dismissMessage(msg), this.timeoutValue)
      this.timers.push(timer)
    })
  }

  disconnect() {
    this.timers.forEach((timer) => clearTimeout(timer))
    this.timers = []
  }

  /**
   * Dismiss a flash message triggered by a click event.
   * @param {Event} event - The click event from the dismiss button
   */
  dismiss(event) {
    const message = event.target.closest("[data-eden-ui--flash-target='message']")
    this.dismissMessage(message)
  }

  /**
   * Animate out and remove a flash message element.
   * @param {HTMLElement} element - The flash message element to dismiss
   */
  dismissMessage(element) {
    if (!element) return

    element.style.transition = "opacity 300ms ease, transform 300ms ease"
    element.style.opacity = "0"
    element.style.transform = "translateX(100%)"

    setTimeout(() => element.remove(), 300)
  }
}
