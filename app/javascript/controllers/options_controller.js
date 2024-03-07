import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="options"
// data-options-target
// data-action="click->options#displaybutton"
export default class extends Controller {
  static targets = ["btn"];
  connect() {
  }

  toggleBtn() {
    // event.preventDefault()
    this.btnTarget.classList.toggle("btn-info")
    this.btnTarget.classList.toggle("btn-secondary")
  }
}
