import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="display-reason"
export default class extends Controller {

  static targets = ["modal"]

  connect() {
    console.log("hi from display reason")
  }

  render() {
    console.log("Clicked!");
    this.modalTarget.classList.remove("hidden");
    document.querySelector(".custom-container").classList.add("modal-visible");
  }

  close() {
    this.modalTarget.classList.add("hidden");
    document.querySelector(".custom-container").classList.remove("modal-visible");
  }
}
