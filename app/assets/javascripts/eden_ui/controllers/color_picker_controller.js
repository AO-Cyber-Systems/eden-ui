import { Controller } from "@hotwired/stimulus"

/**
 * Color picker controller. Syncs a native color swatch input with a hex text
 * input and optional preset swatches.
 *
 * @example
 *   <div data-controller="color-picker">
 *     <input type="color" data-color-picker-target="swatch"
 *            data-action="input->color-picker#syncFromSwatch">
 *     <input type="text" data-color-picker-target="text"
 *            data-action="input->color-picker#syncFromText">
 *   </div>
 *
 * @targets swatch - Native color input element
 * @targets text - Hex text input element
 */
export default class extends Controller {
  static targets = ["swatch", "text"]

  syncFromSwatch() {
    this.textTarget.value = this.swatchTarget.value
  }

  syncFromText() {
    const hex = this.textTarget.value
    if (/^#[0-9a-fA-F]{6}$/.test(hex)) {
      this.swatchTarget.value = hex
    }
  }

  selectSwatch(event) {
    const color = event.currentTarget.dataset.color
    this.swatchTarget.value = color
    this.textTarget.value = color
  }
}
