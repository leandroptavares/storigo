import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["menu_icon"]

  highlight(event) {

    this.menu_iconTargets.forEach(icon => icon.classList.add("d-none"))

    const clickedItem = event.currentTarget
    const iconToShow = clickedItem.querySelector('[data-navbar-target="menu_icon"]')
    iconToShow.classList.remove("d-none")
  }
}
