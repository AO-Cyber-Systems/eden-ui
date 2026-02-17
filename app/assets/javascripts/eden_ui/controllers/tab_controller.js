import { Controller } from "@hotwired/stimulus"

/**
 * Tab controller for switching between tab panels.
 * Activates tab headers and shows the corresponding panel.
 *
 * @example
 *   <div data-controller="eden-ui--tab" data-eden-ui--tab-active-tab-value="0">
 *     <div role="tablist">
 *       <button data-eden-ui--tab-target="tab" data-action="eden-ui--tab#select" role="tab">Tab 1</button>
 *       <button data-eden-ui--tab-target="tab" data-action="eden-ui--tab#select" role="tab">Tab 2</button>
 *     </div>
 *     <div data-eden-ui--tab-target="panel" role="tabpanel">Panel 1</div>
 *     <div data-eden-ui--tab-target="panel" role="tabpanel" class="hidden">Panel 2</div>
 *   </div>
 *
 * @targets tab - Tab header/button elements
 * @targets panel - Tab content panel elements (paired by index with tabs)
 * @values activeTab (Number, default: 0) - Index of the currently active tab
 */
export default class extends Controller {
  static targets = ["tab", "panel"]
  static values = {
    activeTab: { type: Number, default: 0 }
  }

  connect() {
    this.showTab(this.activeTabValue)
  }

  /**
   * Select a tab based on a click event.
   * @param {Event} event - The click event from a tab target
   */
  select(event) {
    const index = this.tabTargets.indexOf(event.currentTarget)
    if (index !== -1) {
      this.activeTabValue = index
    }
  }

  /**
   * Callback when activeTab value changes.
   */
  activeTabValueChanged() {
    this.showTab(this.activeTabValue)
  }

  /**
   * Show the tab and panel at the given index, hiding all others.
   * @param {number} index
   */
  showTab(index) {
    this.tabTargets.forEach((tab, i) => {
      const isActive = i === index
      tab.classList.toggle("active", isActive)
      tab.setAttribute("aria-selected", isActive ? "true" : "false")
      tab.setAttribute("tabindex", isActive ? "0" : "-1")
    })

    this.panelTargets.forEach((panel, i) => {
      panel.classList.toggle("hidden", i !== index)
    })
  }
}
