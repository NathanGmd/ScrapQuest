import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="age"
export default class extends Controller {
  static targets = ["form", "result"]

  connect() {
  }

  ageSelect(event) {
    const btn = event.target
    event.preventDefault()
    const form = this.formTarget
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
