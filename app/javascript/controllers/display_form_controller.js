import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="display-form"
export default class extends Controller {
  static targets = ["questionaire", "question_1", "question_2", "question_3", "question_4"]; // Corrected typo and syntax

  connect() {
    console.log("Hi from display_form");
  }

  render() {
    console.log("Clicked!");
    this.questionaireTarget.classList.remove("d-none")
  }
}
