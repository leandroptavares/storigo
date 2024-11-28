import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="survey"
export default class extends Controller {
  static targets = ["answer", "input", "survey", "question_1", "question_2", "question_3", "question_4", "question_5"]

  connect() {
    this.currentQuestionIndex = 0; // Start from the first question
    this.questionTargets = [this.question_1Target, this.question_2Target, this.question_3Target, this.question_4Target, this.question_5Target];
  }

  createAnswer(event) {
    event.preventDefault();
    console.log(event.currentTarget.dataset.answer);

    this.inputTarget.value = event.currentTarget.dataset.answer;

    fetch(this.surveyTarget.action, {
      method: "POST",
      body: new FormData(this.surveyTarget)
    })
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      this.showNextQuestion();
    });
  }

  showNextQuestion() {
    this.questionTargets[this.currentQuestionIndex].classList.add("d-none");

    this.currentQuestionIndex += 1;

    if (this.currentQuestionIndex < this.questionTargets.length) {
      this.questionTargets[this.currentQuestionIndex].classList.remove("d-none");
    } else {
      console.log("Survey completed. Generate recommendation");
    }
  }
}
