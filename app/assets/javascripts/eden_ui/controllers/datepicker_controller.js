import { Controller } from "@hotwired/stimulus"

/**
 * Datepicker controller. Provides a calendar dropdown for date selection.
 *
 * @targets input - Text input displaying the selected date
 * @targets calendar - Calendar dropdown container
 * @targets monthYear - Element displaying the current month and year
 * @targets days - Grid container for day buttons
 * @values format (String, default: "%Y-%m-%d") - Date format string
 * @values min (String, default: "") - Minimum selectable date (YYYY-MM-DD)
 * @values max (String, default: "") - Maximum selectable date (YYYY-MM-DD)
 */
export default class extends Controller {
  static targets = ["input", "calendar", "monthYear", "days"]
  static values = {
    format: { type: String, default: "%Y-%m-%d" },
    min: { type: String, default: "" },
    max: { type: String, default: "" }
  }

  connect() {
    this.selectedDate = this.inputTarget.value ? this.parseDate(this.inputTarget.value) : null
    const initial = this.selectedDate || new Date()
    this.currentMonth = initial.getMonth()
    this.currentYear = initial.getFullYear()
    this.render()

    this.outsideClickHandler = (event) => {
      if (!this.element.contains(event.target)) {
        this.close()
      }
    }
    document.addEventListener("click", this.outsideClickHandler)
  }

  disconnect() {
    document.removeEventListener("click", this.outsideClickHandler)
  }

  toggle() {
    this.calendarTarget.classList.toggle("hidden")
  }

  open() {
    this.calendarTarget.classList.remove("hidden")
  }

  close() {
    this.calendarTarget.classList.add("hidden")
  }

  prevMonth() {
    this.currentMonth--
    if (this.currentMonth < 0) {
      this.currentMonth = 11
      this.currentYear--
    }
    this.render()
  }

  nextMonth() {
    this.currentMonth++
    if (this.currentMonth > 11) {
      this.currentMonth = 0
      this.currentYear++
    }
    this.render()
  }

  selectDay(event) {
    const day = parseInt(event.currentTarget.dataset.day)
    this.selectedDate = new Date(this.currentYear, this.currentMonth, day)
    this.inputTarget.value = this.formatDate(this.selectedDate)
    this.inputTarget.dispatchEvent(new Event("change", { bubbles: true }))
    this.close()
    this.render()
  }

  render() {
    const monthNames = ["January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"]
    this.monthYearTarget.textContent = `${monthNames[this.currentMonth]} ${this.currentYear}`

    const firstDay = new Date(this.currentYear, this.currentMonth, 1).getDay()
    const daysInMonth = new Date(this.currentYear, this.currentMonth + 1, 0).getDate()
    const today = new Date()

    let html = ""

    // Empty cells for days before the first day
    for (let i = 0; i < firstDay; i++) {
      html += '<div class="p-1"></div>'
    }

    const minDate = this.minValue ? this.parseDate(this.minValue) : null
    const maxDate = this.maxValue ? this.parseDate(this.maxValue) : null

    for (let day = 1; day <= daysInMonth; day++) {
      const date = new Date(this.currentYear, this.currentMonth, day)
      const isToday = date.toDateString() === today.toDateString()
      const isSelected = this.selectedDate && date.toDateString() === this.selectedDate.toDateString()
      const isDisabled = (minDate && date < minDate) || (maxDate && date > maxDate)

      let btnClasses = "w-8 h-8 text-sm rounded-lg flex items-center justify-center"

      if (isSelected) {
        btnClasses += " bg-blue-700 text-white"
      } else if (isToday) {
        btnClasses += " bg-blue-100 text-blue-700 dark:bg-blue-900 dark:text-blue-300 font-semibold"
      } else if (isDisabled) {
        btnClasses += " text-gray-300 dark:text-gray-600 cursor-not-allowed"
      } else {
        btnClasses += " text-gray-900 dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700"
      }

      if (isDisabled) {
        html += `<div class="flex justify-center p-0.5"><span class="${btnClasses}">${day}</span></div>`
      } else {
        html += `<div class="flex justify-center p-0.5"><button type="button" class="${btnClasses}" data-action="eden-datepicker#selectDay" data-day="${day}">${day}</button></div>`
      }
    }

    this.daysTarget.innerHTML = html
  }

  formatDate(date) {
    const y = date.getFullYear()
    const m = String(date.getMonth() + 1).padStart(2, "0")
    const d = String(date.getDate()).padStart(2, "0")

    return this.formatValue
      .replace("%Y", y)
      .replace("%m", m)
      .replace("%d", d)
  }

  parseDate(str) {
    // Parse YYYY-MM-DD or the configured format
    const parts = str.match(/(\d{4})-(\d{1,2})-(\d{1,2})/)
    if (parts) {
      return new Date(parseInt(parts[1]), parseInt(parts[2]) - 1, parseInt(parts[3]))
    }
    return new Date(str)
  }
}
