import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {

  static targets = ["sendButton", "content"]
  connect() {
    console.log("button is connected")
    this.sendButtonTarget.disabled = true
  }

  checkField() {
    const content = this.contentTarget.value.trim();
    if (content === "") {
      console.log("The field is empty");
      this.sendButtonTarget.disabled = true;
    } else {
      console.log("The field is not empty");
      this.sendButtonTarget.disabled = false;
    }
  }
}
