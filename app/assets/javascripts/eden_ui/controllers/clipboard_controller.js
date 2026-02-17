import { Controller } from "@hotwired/stimulus"

/**
 * Clipboard copy controller. Copies text from a source element to the
 * clipboard and briefly shows feedback to the user.
 *
 * @example
 *   <div data-controller="eden-ui--clipboard">
 *     <input data-eden-ui--clipboard-target="source" value="Text to copy" />
 *     <button data-eden-ui--clipboard-target="trigger" data-action="eden-ui--clipboard#copy">
 *       Copy
 *     </button>
 *     <span data-eden-ui--clipboard-target="feedback" class="hidden">Copied!</span>
 *   </div>
 *
 * @targets source - Element whose textContent or value will be copied
 * @targets trigger - Button that triggers the copy action
 * @targets feedback - Element shown briefly after a successful copy
 * @values feedbackDuration (Number, default: 2000) - How long to show feedback in ms
 */
export default class extends Controller {
  static targets = ["source", "trigger", "feedback"]
  static values = {
    feedbackDuration: { type: Number, default: 2000 }
  }

  /**
   * Copy text from the source target to the clipboard.
   * Shows the feedback target briefly on success.
   */
  async copy() {
    const text = this.sourceTarget.value || this.sourceTarget.textContent

    try {
      await navigator.clipboard.writeText(text.trim())
      this.showFeedback()
    } catch {
      // Fallback for older browsers or insecure contexts
      this.fallbackCopy(text.trim())
    }
  }

  /**
   * Fallback copy method using a temporary textarea.
   * @param {string} text - The text to copy
   */
  fallbackCopy(text) {
    const textarea = document.createElement("textarea")
    textarea.value = text
    textarea.style.position = "fixed"
    textarea.style.opacity = "0"
    document.body.appendChild(textarea)
    textarea.select()

    try {
      document.execCommand("copy")
      this.showFeedback()
    } finally {
      document.body.removeChild(textarea)
    }
  }

  /**
   * Show the feedback element briefly, then hide it.
   */
  showFeedback() {
    if (!this.hasFeedbackTarget) return

    this.feedbackTarget.classList.remove("hidden")

    clearTimeout(this.feedbackTimer)
    this.feedbackTimer = setTimeout(() => {
      this.feedbackTarget.classList.add("hidden")
    }, this.feedbackDurationValue)
  }

  disconnect() {
    clearTimeout(this.feedbackTimer)
  }
}
