import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="survey"
export default class extends Controller {
  static targets = ["answer", "input", "survey"]

  connect() {
  }

  createAnswer(event){
    event.preventDefault()
    console.log(event.currentTarget.dataset.answer)

    this.inputTarget.value = event.currentTarget.dataset.answer

    fetch(this.surveyTarget.action, {
      method: "POST",
      // headers: {"Content-Type": "application/json"},
      body: new FormData(this.surveyTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
    })


    // proximos passos:
    // 1. colocar classe d-none do formulario atual
    // 2. tirar classe d-none do proximo formulario 
  }
}
