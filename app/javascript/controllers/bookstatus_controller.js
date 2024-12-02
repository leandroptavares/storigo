import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status", "pages","content", "numberpages", "error"]
  static values = {pages: Number}

  connect() {
    this.numberpagesTarget.addEventListener("input", () => this.#showError())
    this.statusTarget.addEventListener("change", () => this.#showPages())
    this.statusTarget.addEventListener("change", () => this.#showContent())
  }

  #showPages() {
    if (this.statusTarget.value === "In progress") {
      this.pagesTarget.classList.remove("d-none")
    } else {
      this.pagesTarget.classList.add("d-none")
    }
  }

  #showContent() {
    if (this.statusTarget.value === "Completed") {
      this.pagesTarget.classList.add("d-none")
      this.contentTarget.classList.remove("d-none")
    } else {
      this.contentTarget.classList.add("d-none")
    }
  }

  #showError() {
    if (this.numberpagesTarget.value > this.pagesValue) {
      this.errorTarget.classList.remove("d-none")
    } else {
      this.errorTarget.classList.add("d-none")
    }
  }
}
