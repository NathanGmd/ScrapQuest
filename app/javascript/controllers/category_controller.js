import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="category"
export default class extends Controller {
  static targets = ["otpdisplay", "title", "featitle", "featuredisplay"];

  connect() {
    // const featureTitleElements = this.otpdisplayTargets
    // featureTitleElements.forEach((element) => {
    //   debugger
    //   if (element.innerText !== titleValue) {
    //     const toto = element.closest(".feature-options")
    //     toto.classList.toggle("d-none")
    //   }
    // });
  }

  displayCard(event) {
    const button = event.currentTarget
    const titleValue = button.dataset.categoryTitleValue
    const featureTitleElements = this.otpdisplayTargets
    featureTitleElements.forEach((element) => {
      if (element.innerText === titleValue) {
        const toto = element.closest(".feature-options")
        toto.classList.toggle("d-none")
      }
    });
  }
}
