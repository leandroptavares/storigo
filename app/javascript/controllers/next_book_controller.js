import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="next-book"
export default class extends Controller {

  static targets = ["test"]

  connect() {
  }
}
