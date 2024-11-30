import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "button"];

  connect() {
    // console.log("modal is here")
  }

  show() {
    console.log("clicked")
    this.modalTarget.classList.remove("hidden");
    this.buttonTarget.innerText = "Added to Bookshelf";
    this.buttonTarget.disabled = true;
    document.querySelector(".book-container").classList.add("modal-visible");
  }

  close() {
    this.modalTarget.classList.add("hidden");
    document.querySelector(".book-container").classList.remove("modal-visible");
  }
}
