import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="display-form"
export default class extends Controller {
  static targets = ["modal", "questionaire", "question_1", "question_2", "question_3", "question_4"];

  connect() {
    console.log("Hi from display_form");
  }

  render() {
    console.log("Clicked!");
    this.questionaireTarget.classList.remove("d-none")
    this.modalTarget.classList.remove("hidden");
    document.querySelector(".custom-container").classList.add("modal-visible");
  }

  close() {
    this.modalTarget.classList.add("hidden");
    document.querySelector(".custom-container").classList.remove("modal-visible");
  }
}
