import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="quotes"
export default class extends Controller {
  static targets = ["quote"];


  // This method is called when the controller is initialized
  connect() {
  }


}
