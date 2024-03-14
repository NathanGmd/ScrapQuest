import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["results", "form"]

  connect() {

  }

  find (event) {
    // event.preventDefault()
    // const firstName = this.formTarget["first_name"].value
    // const lastName = this.formTarget["last_name"].value
    // const url = `${this.formTarget.action}/search?first_name=${firstName}&last_name=${lastName}&commit=Search`
    // fetch(url, {
    //   method: "POST", // Could be dynamic with Stimulus values
    //   headers: { "Accept": "application/json" },
    //   body: new FormData(this.formTarget)
    // })
    //   .then(response => response.json())
    //   .then((data) => {
    //     console.log(data)
    //   })
  }
  
  // resetForm(event) {
  //   event.preventDefault();
  //   this.formTarget.reset(); 
  // }
}
