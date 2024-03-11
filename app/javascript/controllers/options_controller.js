import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="options"
// data-options-target
// data-action="click->options#displaybutton"
export default class extends Controller {
  static targets = ["btn", "form", "result"];
  connect() {
  }

  displayOpt(event) {
    const btn = event.target
    event.preventDefault()
    btn.classList.toggle("btn-background-available")
    btn.classList.toggle("btn-background-unavailable")
    const form = btn.closest('form')
    const url = btn.closest('form').action
    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(form)
  })
      .then(response => response.text())
      .then((data) => {
        this.resultTarget.outerHTML = data
    })

  }

}
