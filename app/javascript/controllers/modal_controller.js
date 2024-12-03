import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ["modal", "button", "bookDetails"];

  connect() {
    // console.log("modal is here")
    console.log(this.modalTarget)
  }

  show() {
    console.log("clicked");

    setTimeout(() => {
      this.modalTarget.classList.remove("hidden");
      this.buttonTarget.innerText = "Added to Bookshelf";
      this.buttonTarget.disabled = true;
      document.querySelector(".book-container").classList.add("modal-visible");
    }, 500);
  }

  close() {
    this.modalTarget.classList.add("hidden");
    document.querySelector(".book-container").classList.remove("modal-visible");
  }

  details(){
    // console.log("show book details")
    this.bookDetailsTarget.classList.remove("hidden")
    document.querySelector(".book-container").classList.add("modal-visible")
  }

  closeDetails() {
    this.bookDetailsTarget.classList.add("hidden");
    document.querySelector(".book-container").classList.remove("modal-visible");
  }
}
