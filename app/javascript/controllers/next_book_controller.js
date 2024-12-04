import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="next-book"
export default class extends Controller {

  static targets = ["book", "container", "likeButton"]
  static values = { bookid: Number,
                    userid: Number,
                    firstBookId: Number,
                  }

  connect() {
    console.log("hi from next_book")
    console.log("This book:", this.bookidValue)
    console.log("This book:", this.useridValue)
  }

  next(event){
    // console.log("next book please")

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
      currentBook.innerHTML = "<div class='custom-container' data-next-book-target='container'><h1>We ran out of recommendations :(</h1><p>Try answering the survey again</p><h2><a href='/'>Go to homepage</a></h2></div>"
    }
  }

  liked(){
    // console.log("I like this book")

    const newBookId = this.element.querySelector('[data-next-book-bookid-value]').dataset.nextBookBookidValue
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const params = { user_reaction: {like: true, book_id: newBookId }}

    fetch(`/books/${newBookId}/user_reactions`, {
      method: "POST",
      headers: { "Accept": "application/json", "Content-Type": "application/json", "X-CSRF-Token": csrfToken },
      body: JSON.stringify(params)
      // body: new FormData(params)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }

  likedFirst(){
    // console.log("I like this book")

    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    const params = { user_reaction: {like: true, book_id: this.firstBookIdValue }}

    fetch(`/books/${this.firstBookIdValue}/user_reactions`, {
      method: "POST",
      headers: { "Accept": "application/json", "Content-Type": "application/json", "X-CSRF-Token": csrfToken },
      body: JSON.stringify(params)
      // body: new FormData(params)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data)
    })
  }
}
