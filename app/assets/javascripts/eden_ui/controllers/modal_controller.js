import { Controller } from "@hotwired/stimulus"

/**
 * Modal dialog controller with focus trapping and scroll lock.
 * Traps focus within the modal when open, restores focus to the trigger on close.
 *
 * @example
 *   <div data-controller="eden-ui--modal" data-eden-ui--modal-closeable-value="true">
 *     <div data-eden-ui--modal-target="overlay" data-action="click->eden-ui--modal#closeOnOverlay" class="modal-overlay">
 *       <div data-eden-ui--modal-target="dialog" role="dialog" aria-modal="true">
 *         <button data-action="eden-ui--modal#close">×</button>
 *         <p>Modal content</p>
 *       </div>
 *     </div>
 *   </div>
 *
 * @targets overlay - The full-screen overlay backdrop
 * @targets dialog - The modal dialog container (used for focus trapping)
 * @values closeable (Boolean, default: true) - Whether the modal can be closed by user
 */
export default class extends Controller {
  static targets = ["overlay", "dialog"]
  static values = {
    closeable: { type: Boolean, default: true }
  }

  connect() {
    this.handleKeydown = this.handleKeydown.bind(this)
    document.addEventListener("keydown", this.handleKeydown)
    this.previouslyFocusedElement = null
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown)
    this.enableScroll()
  }

  /**
   * Handle Escape key to close and Tab key for focus trapping.
   * @param {KeyboardEvent} event
   */
  handleKeydown(event) {
    if (!this.isOpen()) return

    if (event.key === "Escape" && this.closeableValue) {
      this.close()
      return
    }

    if (event.key === "Tab") {
      this.trapFocus(event)
    }
  }

  /**
   * Open the modal, lock scroll, and move focus into the dialog.
   */
  open() {
    this.previouslyFocusedElement = document.activeElement
    this.overlayTarget.classList.add("active")
    this.disableScroll()

    requestAnimationFrame(() => {
      const target = this.hasDialogTarget ? this.dialogTarget : this.element
      const focusable = this.getFocusableElements(target)
      if (focusable.length > 0) {
        focusable[0].focus()
      }
    })
  }

  /**
   * Close the modal, restore scroll, and return focus to the trigger.
   */
  close() {
    if (!this.closeableValue) return

    this.overlayTarget.classList.remove("active")
    this.enableScroll()

    if (this.previouslyFocusedElement) {
      this.previouslyFocusedElement.focus()
      this.previouslyFocusedElement = null
    }
  }

  /**
   * Close the modal when clicking on the overlay backdrop.
   * @param {MouseEvent} event
   */
  closeOnOverlay(event) {
    if (event.target === this.overlayTarget && this.closeableValue) {
      this.close()
    }
  }

  /**
   * Trap Tab/Shift+Tab focus within the modal dialog.
   * @param {KeyboardEvent} event
   */
  trapFocus(event) {
    const target = this.hasDialogTarget ? this.dialogTarget : this.element
    const focusable = this.getFocusableElements(target)
    if (focusable.length === 0) return

    const first = focusable[0]
    const last = focusable[focusable.length - 1]

    if (event.shiftKey) {
      if (document.activeElement === first) {
        event.preventDefault()
        last.focus()
      }
    } else {
      if (document.activeElement === last) {
        event.preventDefault()
        first.focus()
      }
    }
  }

  /**
   * Check if the modal is currently open.
   * @returns {boolean}
   */
  isOpen() {
    return this.overlayTarget.classList.contains("active")
  }

  /**
   * Get all focusable elements within a container.
   * @param {HTMLElement} container
   * @returns {HTMLElement[]}
   */
  getFocusableElements(container) {
    const selector = 'a[href], button:not([disabled]), input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])'
    return Array.from(container.querySelectorAll(selector))
  }

  disableScroll() {
    document.body.style.overflow = "hidden"
  }

  enableScroll() {
    document.body.style.overflow = ""
  }
}
