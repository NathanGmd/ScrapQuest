import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="age"
export default class extends Controller {
  static targets = ["form"]

  connect() {
  }

  ageSelect(event) {
    event.preventDefault()
    console.log("coucou from age controller")
    console.log(this.formTarget)
    const url = this.formTarget.action
    debugger
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
