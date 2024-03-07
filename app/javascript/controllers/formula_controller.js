import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="formula"
export default class extends Controller {
  static targets = ["row"]
  connect() {
    console.log("hello from formula")
  }
}
