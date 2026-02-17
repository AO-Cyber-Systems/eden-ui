import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "nav", "group", "item"]

  filter() {
    const query = this.inputTarget.value.toLowerCase().trim()

    if (!query) {
      this.groupTargets.forEach(g => g.classList.remove("hidden"))
      this.itemTargets.forEach(i => i.classList.remove("hidden"))
      return
    }

    this.groupTargets.forEach(group => {
      const category = group.dataset.category || ""
      const categoryMatch = category.includes(query)
      const componentNames = (group.dataset.componentNames || "").split(",")
      const nameMatch = componentNames.some(name => name.includes(query))
      const items = group.querySelectorAll("[data-component-name]")
      let hasVisibleItem = categoryMatch || nameMatch

      items.forEach(item => {
        const name = item.dataset.componentName || ""
        if (name.includes(query) || categoryMatch) {
          item.classList.remove("hidden")
          hasVisibleItem = true
        } else {
          item.classList.add("hidden")
        }
      })

      group.classList.toggle("hidden", !hasVisibleItem)
    })

    // Also filter layout items
    this.itemTargets.forEach(item => {
      if (!item.closest("[data-category]")) {
        const name = item.dataset.componentName || ""
        item.classList.toggle("hidden", !name.includes(query))
      }
    })
  }
}
