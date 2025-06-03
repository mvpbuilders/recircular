import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["main", "thumb"]

  change(event) {
    const selectedImage = event.currentTarget
    const largeUrl = selectedImage.dataset.largeUrl

    if (largeUrl && this.hasMainTarget) {
      this.mainTarget.src = largeUrl
    }
  }
}
