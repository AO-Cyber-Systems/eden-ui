import { Controller } from "@hotwired/stimulus"

/**
 * Drawer (off-canvas panel) controller. Slides a panel in from the
 * specified position and optionally shows an overlay backdrop.
 *
 * @example
 *   <div data-controller="eden-ui--drawer" data-eden-ui--drawer-position-value="left">
 *     <button data-action="eden-ui--drawer#open">Open Drawer</button>
 *     <div data-eden-ui--drawer-target="overlay" class="hidden fixed inset-0 bg-black/50"
 *          data-action="click->eden-ui--drawer#close"></div>
 *     <div data-eden-ui--drawer-target="panel" class="fixed -translate-x-full transition-transform">
 *       <button data-action="eden-ui--drawer#close">Close</button>
 *       <p>Drawer content</p>
 *     </div>
 *   </div>
 *
 * @targets panel - The sliding drawer panel
 * @targets overlay - Optional backdrop overlay
 * @values position (String, default: "left") - Slide direction: "left", "right", "top", "bottom"
 */
export default class extends Controller {
  static targets = ["panel", "overlay"]
  static values = {
    position: { type: String, default: "left" }
  }

  connect() {
    this.handleKeydown = this.handleKeydown.bind(this)
  }

  /**
   * Open the drawer panel and show overlay.
   */
  open() {
    this.panelTarget.classList.remove(this.hiddenTransformClass())
    this.panelTarget.classList.add(this.visibleTransformClass())

    if (this.hasOverlayTarget) {
      this.overlayTarget.classList.remove("hidden")
    }

    document.body.style.overflow = "hidden"
    document.addEventListener("keydown", this.handleKeydown)
  }

  /**
   * Close the drawer panel and hide overlay.
   */
  close() {
    this.panelTarget.classList.remove(this.visibleTransformClass())
    this.panelTarget.classList.add(this.hiddenTransformClass())

    if (this.hasOverlayTarget) {
      this.overlayTarget.classList.add("hidden")
    }

    document.body.style.overflow = ""
    document.removeEventListener("keydown", this.handleKeydown)
  }

  /**
   * Toggle the drawer open/closed.
   */
  toggle() {
    if (this.isOpen()) {
      this.close()
    } else {
      this.open()
    }
  }

  /**
   * Handle Escape key to close the drawer.
   * @param {KeyboardEvent} event
   */
  handleKeydown(event) {
    if (event.key === "Escape") {
      this.close()
    }
  }

  /**
   * Check if the drawer is currently open.
   * @returns {boolean}
   */
  isOpen() {
    return this.panelTarget.classList.contains(this.visibleTransformClass())
  }

  /**
   * Get the CSS transform class for the hidden state based on position.
   * @returns {string}
   */
  hiddenTransformClass() {
    const transforms = {
      left: "-translate-x-full",
      right: "translate-x-full",
      top: "-translate-y-full",
      bottom: "translate-y-full"
    }
    return transforms[this.positionValue] || "-translate-x-full"
  }

  /**
   * Get the CSS transform class for the visible state.
   * @returns {string}
   */
  visibleTransformClass() {
    return "translate-x-0"
  }

  disconnect() {
    document.removeEventListener("keydown", this.handleKeydown)
    document.body.style.overflow = ""
  }
}
