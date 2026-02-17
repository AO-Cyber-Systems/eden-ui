import { Controller } from "@hotwired/stimulus"

/**
 * Tag input controller. Allows users to add and remove tags in a form field.
 *
 * @targets hidden - Hidden input storing comma-separated tag values
 * @targets tags - Container for tag pill elements
 * @targets input - Text input for typing new tags
 * @values delimiter (String, default: ",") - Character used to join tags in hidden input
 * @values maxTags (Number, default: 0) - Maximum number of tags allowed (0 = unlimited)
 */
export default class extends Controller {
  static targets = ["hidden", "tags", "input"]
  static values = {
    delimiter: { type: String, default: "," },
    maxTags: { type: Number, default: 0 }
  }

  handleKeydown(event) {
    if (event.key === "Enter" || event.key === this.delimiterValue) {
      event.preventDefault()
      this.addTag()
    } else if (event.key === "Backspace" && this.inputTarget.value === "") {
      this.removeLastTag()
    }
  }

  addTag() {
    const text = this.inputTarget.value.trim()
    if (!text) return

    // Prevent duplicates
    const existing = this.getTags()
    if (existing.includes(text)) {
      this.inputTarget.value = ""
      return
    }

    // Enforce max tags
    if (this.maxTagsValue > 0 && existing.length >= this.maxTagsValue) {
      return
    }

    this.createTagElement(text)
    this.inputTarget.value = ""
    this.syncHidden()
  }

  removeTag(event) {
    const pill = event.currentTarget.closest("[data-tag-pill]")
    if (pill) {
      pill.remove()
      this.syncHidden()
    }
  }

  removeLastTag() {
    const pills = this.tagsTarget.querySelectorAll("[data-tag-pill]")
    if (pills.length > 0) {
      pills[pills.length - 1].remove()
      this.syncHidden()
    }
  }

  createTagElement(text) {
    const pill = document.createElement("span")
    pill.setAttribute("data-tag-pill", "")
    pill.className = "inline-flex items-center gap-1 px-2.5 py-1 text-sm font-medium bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300 rounded-full"

    const escaped = this.escapeHtml(text)
    pill.innerHTML = `${escaped}<button type="button" data-action="eden-tag-input#removeTag" class="inline-flex items-center p-0.5 text-blue-400 hover:text-blue-900 hover:bg-blue-200 dark:hover:bg-blue-800 dark:hover:text-blue-300 rounded-full" aria-label="Remove tag"><svg class="w-3 h-3" fill="currentColor" viewBox="0 0 20 20"><path d="M14.348 14.849a1.2 1.2 0 01-1.697 0L10 11.819l-2.651 3.029a1.2 1.2 0 11-1.697-1.697l2.758-3.15-2.759-3.152a1.2 1.2 0 111.697-1.697L10 8.183l2.651-3.031a1.2 1.2 0 111.697 1.697l-2.758 3.152 2.758 3.15a1.2 1.2 0 010 1.698z"/></svg></button>`

    this.tagsTarget.appendChild(pill)
  }

  getTags() {
    const pills = this.tagsTarget.querySelectorAll("[data-tag-pill]")
    return Array.from(pills).map(pill => {
      // Get text content excluding the button
      const clone = pill.cloneNode(true)
      const btn = clone.querySelector("button")
      if (btn) btn.remove()
      return clone.textContent.trim()
    })
  }

  syncHidden() {
    this.hiddenTarget.value = this.getTags().join(this.delimiterValue)
  }

  escapeHtml(text) {
    const div = document.createElement("div")
    div.textContent = text
    return div.innerHTML
  }
}
