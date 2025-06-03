import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

import ImageSelectorController from "./image_selector_controller"
application.register("image-selector", ImageSelectorController)
