import { Controller } from "@hotwired/stimulus"

/**
 * Carousel/slider controller with optional auto-play.
 * Cycles through slide targets and updates indicator states.
 *
 * @example
 *   <div data-controller="eden-ui--carousel"
 *        data-eden-ui--carousel-interval-value="5000"
 *        data-eden-ui--carousel-auto-play-value="true">
 *     <div data-eden-ui--carousel-target="slide">Slide 1</div>
 *     <div data-eden-ui--carousel-target="slide" class="hidden">Slide 2</div>
 *     <button data-action="eden-ui--carousel#prev">Prev</button>
 *     <button data-action="eden-ui--carousel#next">Next</button>
 *     <button data-eden-ui--carousel-target="indicator" data-action="eden-ui--carousel#goTo" data-index="0">1</button>
 *     <button data-eden-ui--carousel-target="indicator" data-action="eden-ui--carousel#goTo" data-index="1">2</button>
 *   </div>
 *
 * @targets slide - Individual slide elements
 * @targets indicator - Navigation indicator buttons (paired by index with slides)
 * @values interval (Number, default: 3000) - Auto-play interval in milliseconds
 * @values autoPlay (Boolean, default: false) - Whether to auto-advance slides
 */
export default class extends Controller {
  static targets = ["slide", "indicator"]
  static values = {
    interval: { type: Number, default: 3000 },
    autoPlay: { type: Boolean, default: false }
  }

  connect() {
    this.currentIndex = 0
    this.showSlide(this.currentIndex)

    if (this.autoPlayValue) {
      this.startAutoPlay()
    }
  }

  disconnect() {
    this.stopAutoPlay()
  }

  /**
   * Advance to the next slide, wrapping to the first.
   */
  next() {
    const nextIndex = (this.currentIndex + 1) % this.slideTargets.length
    this.showSlide(nextIndex)
  }

  /**
   * Go to the previous slide, wrapping to the last.
   */
  prev() {
    const prevIndex = (this.currentIndex - 1 + this.slideTargets.length) % this.slideTargets.length
    this.showSlide(prevIndex)
  }

  /**
   * Go to a specific slide by index. Reads index from data-index attribute.
   * @param {Event} event - The click event from an indicator
   */
  goTo(event) {
    const index = parseInt(event.currentTarget.dataset.index, 10)
    if (!isNaN(index)) {
      this.showSlide(index)
    }
  }

  /**
   * Show the slide at the given index and hide all others.
   * @param {number} index
   */
  showSlide(index) {
    this.currentIndex = index

    this.slideTargets.forEach((slide, i) => {
      slide.classList.toggle("hidden", i !== index)
    })

    this.indicatorTargets.forEach((indicator, i) => {
      indicator.classList.toggle("active", i === index)
      indicator.setAttribute("aria-current", i === index ? "true" : "false")
    })
  }

  /**
   * Start the auto-play timer.
   */
  startAutoPlay() {
    this.autoPlayTimer = setInterval(() => this.next(), this.intervalValue)
  }

  /**
   * Stop the auto-play timer.
   */
  stopAutoPlay() {
    if (this.autoPlayTimer) {
      clearInterval(this.autoPlayTimer)
      this.autoPlayTimer = null
    }
  }

  /**
   * Restart auto-play when the interval value changes.
   */
  intervalValueChanged() {
    if (this.autoPlayValue) {
      this.stopAutoPlay()
      this.startAutoPlay()
    }
  }

  /**
   * Start or stop auto-play when the value changes.
   */
  autoPlayValueChanged() {
    if (this.autoPlayValue) {
      this.startAutoPlay()
    } else {
      this.stopAutoPlay()
    }
  }
}
