import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["countup"];

  connect() {
    let count = 0;
    const interval = setInterval(() => {
      count += 10;

      if (count >= 8000) {
        count = 8000;
        clearInterval(interval);
      }

      this.countupTarget.textContent = count;
    }, 1);
  }
}