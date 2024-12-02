import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="next-book"
export default class extends Controller {

  static targets = ["book"]

  connect() {
    console.log("hi from next_book")
  }

  next(event){
    console.log("next book please")

    const currentBook = this.bookTargets.find(
      book => book.dataset.recommendationId === event.currentTarget.dataset.recommendationId
    );
    console.log(currentBook)

    const nextBook = this.bookTargets.find(
      book => book.dataset.recommendationId === String(Number(event.currentTarget.dataset.recommendationId) + 1)
    );

    console.log(nextBook)

    // currentBook.classList.add("d-none")

    if (nextBook){
      currentBook.classList.add("d-none")
      nextBook.classList.remove("d-none")
    } else {
      currentBook.insertAdjacentHTML("beforeend", "<h1> We ran out of recommendations... Try answering survey again </1>")
    }
  }
}
