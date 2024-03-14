import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["countup"];

  connect() {
    let count = 0;
    const interval = setInterval(() => {
      count += 50;

      if (count >= 30_000) {
        count = 30_000;
        clearInterval(interval);
      }

      this.countupTarget.textContent = count;
    }, 1);
  }
}
