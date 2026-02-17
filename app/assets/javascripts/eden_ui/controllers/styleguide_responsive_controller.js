import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["iframe", "mobileBtn", "tabletBtn", "desktopBtn"]
  static values = { size: { type: String, default: "desktop" } }

  mobile() {
    this.sizeValue = "mobile"
    this.resize(375)
  }

  tablet() {
    this.sizeValue = "tablet"
    this.resize(768)
  }

  desktop() {
    this.sizeValue = "desktop"
    this.resize("100%")
  }

  resize(width) {
    this.iframeTarget.style.width = typeof width === "number" ? `${width}px` : width
    this.updateButtons()
  }

  updateButtons() {
    const buttons = {
      mobile: this.hasMobileBtnTarget ? this.mobileBtnTarget : null,
      tablet: this.hasTabletBtnTarget ? this.tabletBtnTarget : null,
      desktop: this.hasDesktopBtnTarget ? this.desktopBtnTarget : null,
    }

    Object.entries(buttons).forEach(([size, btn]) => {
      if (!btn) return
      if (size === this.sizeValue) {
        btn.classList.add("bg-zinc-200", "dark:bg-zinc-700", "text-zinc-900", "dark:text-white")
        btn.classList.remove("text-zinc-500", "dark:text-zinc-400")
      } else {
        btn.classList.remove("bg-zinc-200", "dark:bg-zinc-700", "text-zinc-900", "dark:text-white")
        btn.classList.add("text-zinc-500", "dark:text-zinc-400")
      }
    })
  }
}
