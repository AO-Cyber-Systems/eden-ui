import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["preview", "code", "previewTab", "codeTab", "copyButton", "source"]

  showPreview() {
    this.previewTarget.classList.remove("hidden")
    this.codeTarget.classList.add("hidden")
    this.previewTabTarget.classList.add("bg-zinc-200", "dark:bg-zinc-700", "text-zinc-900", "dark:text-white")
    this.previewTabTarget.classList.remove("text-zinc-500", "dark:text-zinc-400", "hover:bg-zinc-100", "dark:hover:bg-zinc-800")
    this.codeTabTarget.classList.remove("bg-zinc-200", "dark:bg-zinc-700", "text-zinc-900", "dark:text-white")
    this.codeTabTarget.classList.add("text-zinc-500", "dark:text-zinc-400", "hover:bg-zinc-100", "dark:hover:bg-zinc-800")
  }

  showCode() {
    this.previewTarget.classList.add("hidden")
    this.codeTarget.classList.remove("hidden")
    this.codeTabTarget.classList.add("bg-zinc-200", "dark:bg-zinc-700", "text-zinc-900", "dark:text-white")
    this.codeTabTarget.classList.remove("text-zinc-500", "dark:text-zinc-400", "hover:bg-zinc-100", "dark:hover:bg-zinc-800")
    this.previewTabTarget.classList.remove("bg-zinc-200", "dark:bg-zinc-700", "text-zinc-900", "dark:text-white")
    this.previewTabTarget.classList.add("text-zinc-500", "dark:text-zinc-400", "hover:bg-zinc-100", "dark:hover:bg-zinc-800")
  }

  async copy() {
    const code = this.sourceTarget.textContent
    try {
      await navigator.clipboard.writeText(code)
      const btn = this.copyButtonTarget
      const original = btn.innerHTML
      btn.innerHTML = `<svg class="w-4 h-4 text-emerald-500" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="m4.5 12.75 6 6 9-13.5"/></svg>`
      setTimeout(() => { btn.innerHTML = original }, 2000)
    } catch (err) {
      // Clipboard API not available
    }
  }
}
