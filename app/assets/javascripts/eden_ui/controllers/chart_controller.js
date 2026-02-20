import { Controller } from "@hotwired/stimulus"

/**
 * Chart controller wrapping ApexCharts.
 * Renders a chart when connected and re-renders when config changes.
 *
 * @example
 *   <div data-controller="eden-ui--chart"
 *        data-eden-ui--chart-type-value="line"
 *        data-eden-ui--chart-config-value='{"labels":["Jan","Feb"],"datasets":[{"name":"Revenue","data":[100,200]}]}'>
 *   </div>
 *
 * @values type (String, default: "line") - Chart type: line, bar, donut, area, radialBar
 * @values config (Object) - JSON chart config with labels, datasets, and options
 * @values height (Number, default: 350) - Chart height in pixels
 * @values width (String, default: "100%") - Chart width
 * @values colors (Array) - Custom color palette
 */
export default class extends Controller {
  static values = {
    type: { type: String, default: "line" },
    config: { type: Object, default: {} },
    height: { type: Number, default: 350 },
    width: { type: String, default: "100%" },
    colors: { type: Array, default: [] }
  }

  connect() {
    this.chart = null
    this.loadAndRender()
  }

  disconnect() {
    if (this.chart) {
      this.chart.destroy()
      this.chart = null
    }
  }

  configValueChanged() {
    if (this.chart) {
      this.chart.destroy()
      this.chart = null
    }
    this.loadAndRender()
  }

  async loadAndRender() {
    if (typeof ApexCharts === "undefined") {
      // Wait for ApexCharts to load
      await this.waitForApexCharts()
    }
    this.renderChart()
  }

  waitForApexCharts() {
    return new Promise((resolve) => {
      if (typeof ApexCharts !== "undefined") {
        resolve()
        return
      }
      const check = setInterval(() => {
        if (typeof ApexCharts !== "undefined") {
          clearInterval(check)
          resolve()
        }
      }, 50)
      // Timeout after 10s
      setTimeout(() => { clearInterval(check); resolve() }, 10000)
    })
  }

  renderChart() {
    if (typeof ApexCharts === "undefined") return

    const config = this.configValue
    const type = this.typeValue
    const isDark = document.documentElement.classList.contains("dark")

    const defaultColors = [
      "#4F46E5", "#10B981", "#F59E0B", "#EF4444", "#8B5CF6",
      "#06B6D4", "#EC4899", "#14B8A6", "#F97316", "#6366F1"
    ]
    const colors = this.colorsValue.length ? this.colorsValue : defaultColors

    const baseOptions = {
      chart: {
        type: this.apexType(type),
        height: this.heightValue,
        width: this.widthValue,
        fontFamily: "Inter, system-ui, sans-serif",
        toolbar: { show: false },
        background: "transparent",
        ...(config.sparkline ? { sparkline: { enabled: true } } : {})
      },
      colors: colors,
      theme: {
        mode: isDark ? "dark" : "light"
      },
      grid: {
        borderColor: isDark ? "#374151" : "#E5E7EB",
        strokeDashArray: 4,
        padding: config.sparkline ? { top: 0, right: 0, bottom: 0, left: 0 } : {}
      },
      stroke: {
        curve: "smooth",
        width: type === "area" || type === "line" ? 2 : 0
      },
      dataLabels: { enabled: false },
      tooltip: {
        theme: isDark ? "dark" : "light"
      },
      xaxis: {
        categories: config.labels || [],
        labels: {
          style: { colors: isDark ? "#9CA3AF" : "#6B7280", fontSize: "12px" }
        },
        axisBorder: { show: false },
        axisTicks: { show: false }
      },
      yaxis: {
        labels: {
          style: { colors: isDark ? "#9CA3AF" : "#6B7280", fontSize: "12px" },
          formatter: config.yFormatter ? new Function("val", config.yFormatter) : undefined
        }
      },
      legend: {
        position: "bottom",
        horizontalAlign: "center",
        labels: { colors: isDark ? "#D1D5DB" : "#374151" }
      }
    }

    let series
    let extraOptions = {}

    if (type === "donut" || type === "pie") {
      series = config.data || []
      extraOptions = {
        labels: config.labels || [],
        plotOptions: {
          pie: {
            donut: {
              size: type === "donut" ? "65%" : "0%",
              labels: {
                show: true,
                total: { show: true, label: "Total" }
              }
            }
          }
        }
      }
      delete baseOptions.xaxis
      delete baseOptions.yaxis
    } else {
      series = (config.datasets || []).map(ds => ({
        name: ds.name || "",
        data: ds.data || [],
        type: ds.type || undefined
      }))

      if (config.stacked) {
        extraOptions = {
          chart: { ...baseOptions.chart, stacked: true },
          plotOptions: {
            bar: {
              horizontal: config.horizontal || false,
              columnWidth: "60%",
              borderRadius: 4
            }
          }
        }
      }

      if (type === "bar") {
        extraOptions.plotOptions = {
          bar: {
            horizontal: config.horizontal || false,
            columnWidth: "60%",
            borderRadius: 4,
            ...(extraOptions.plotOptions?.bar || {})
          }
        }
      }

      if (type === "area") {
        extraOptions.fill = {
          type: "gradient",
          gradient: {
            shadeIntensity: 1,
            opacityFrom: 0.4,
            opacityTo: 0.1
          }
        }
      }
    }

    const options = this.deepMerge(baseOptions, extraOptions, config.options || {})
    options.series = series

    this.chart = new ApexCharts(this.element, options)
    this.chart.render()
  }

  apexType(type) {
    const typeMap = { donut: "donut", pie: "pie", line: "line", bar: "bar", area: "area" }
    return typeMap[type] || "line"
  }

  deepMerge(target, ...sources) {
    for (const source of sources) {
      for (const key of Object.keys(source)) {
        if (source[key] && typeof source[key] === "object" && !Array.isArray(source[key])) {
          target[key] = target[key] || {}
          this.deepMerge(target[key], source[key])
        } else {
          target[key] = source[key]
        }
      }
    }
    return target
  }
}
