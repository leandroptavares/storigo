import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["status", "pages","content"]

  connect() {
    // console.log("dsjfklasjdfksd")
    this.#showPages()
    this.statusTarget.addEventListener("change", () => this.#showPages())
    this.#showContent()
    this.statusTarget.addEventListener("change", () => this.#showContent())
  }

  #showPages() {
    // if (this.statusTarget.value === "No") {
    //   this.pagesTarget.classList.remove("d-none")
    // } else {
    //   this.pagesTarget.classList.add("d-none")
    // }

    if (this.statusTarget.value === "No") {
      this.pagesTarget.classList.remove("d-none");

      const pagesInput = this.pagesTarget.querySelector("input[type='number']");
      const maxPages = parseInt(pagesInput.getAttribute("max"), 10);

      pagesInput.addEventListener("input", () => {
        const value = parseInt(pagesInput.value, 10);
        if (value > maxPages) {
          pagesInput.setCustomValidity(`The number must be less than or equal to ${maxPages}.`);
        } else {
          pagesInput.setCustomValidity("");
        }
      });
    } else {
      this.pagesTarget.classList.add("d-none");
    }
  }

  #showContent() {
    if (this.statusTarget.value === "Yes") {
      this.pagesTarget.classList.add("d-none")
      this.contentTarget.classList.remove("d-none")
    } else {
      this.contentTarget.classList.add("d-none")
    }
  }
}


