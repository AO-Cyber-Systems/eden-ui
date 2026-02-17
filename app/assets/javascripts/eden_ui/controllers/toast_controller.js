import { Controller } from "@hotwired/stimulus"

/**
 * Toast notification controller with auto-dismiss support.
 * Automatically dismisses after a configurable duration, or can be
 * dismissed manually.
 *
 * @example
 *   <div data-controller="eden-ui--toast"
 *        data-eden-ui--toast-duration-value="5000"
 *        data-eden-ui--toast-auto-dismiss-value="true">
 *     <div data-eden-ui--toast-target="toast">
 *       Notification message
 *       <button data-action="eden-ui--toast#dismiss">×</button>
 *     </div>
 *   </div>
 *
 * @targets toast - The toast notification element
 * @values duration (Number, default: 5000) - Auto-dismiss delay in milliseconds
 * @values autoDismiss (Boolean, default: true) - Whether to auto-dismiss
 */
export default class extends Controller {
  static targets = ["toast"]
  static values = {
    duration: { type: Number, default: 5000 },
    autoDismiss: { type: Boolean, default: true }
  }

  connect() {
    if (this.autoDismissValue) {
      this.startTimer()
    }
  }

  disconnect() {
    this.clearTimer()
  }

  /**
   * Dismiss the toast with a fade-out animation, then remove it.
   */
  dismiss() {
    this.clearTimer()

    const target = this.hasToastTarget ? this.toastTarget : this.element

    target.style.transition = "opacity 300ms ease, transform 300ms ease"
    target.style.opacity = "0"
    target.style.transform = "translateY(-10px)"

    setTimeout(() => target.remove(), 300)
  }

  /**
   * Start the auto-dismiss timer.
   */
  startTimer() {
    this.timer = setTimeout(() => this.dismiss(), this.durationValue)
  }

  /**
   * Clear the auto-dismiss timer.
   */
  clearTimer() {
    if (this.timer) {
      clearTimeout(this.timer)
      this.timer = null
    }
  }
}
