import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["book"]

  connect() {
    this.currentIndex = 0 // Start with the first book
    this.updateBooksVisibility() // Ensure only the first book is visible initially
  }

  move() {
    console.log("Move to next book")

    // Hide the current book with a fade-out effect
    this.bookTargets[this.currentIndex].classList.remove("visible")
    this.bookTargets[this.currentIndex].classList.add("hidden")

    // Increment the index (loop back to the start if it's the last book)
    this.currentIndex = (this.currentIndex + 1) % this.bookTargets.length

    // Show the next book with a fade-in effect
    this.bookTargets[this.currentIndex].classList.remove("hidden")
    this.bookTargets[this.currentIndex].classList.add("visible")
  }

  updateBooksVisibility() {
    // Set the visibility for all books
    this.bookTargets.forEach((book, index) => {
      if (index === this.currentIndex) {
        book.classList.add("visible")
        book.classList.remove("hidden")
      } else {
        book.classList.add("hidden")
        book.classList.remove("visible")
      }
    })
  }
}
