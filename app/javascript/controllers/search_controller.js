import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["results", "form"]

  connect() {

  }

  find (event) {
    event.preventDefault()
    const firstName = this.formTarget["first_name"].value
    const lastName = this.formTarget["last_name"].value
    const url = `${this.formTarget.action}?first_name=${firstName}&last_name=${lastName}&commit=Search`
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "text/plain" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.text())
      .then((data) => {
        this.resultsTarget.outerHTML = data
      })
  }
  
  // resetForm(event) {
  //   event.preventDefault();
  //   this.formTarget.reset(); 
  // }
}
