import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  remove() {
    console.log({ Removals: this.element });
    this.element.remove();
  }
}
