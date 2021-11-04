// Entry point for the build script in your package.json
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "./controllers"
import "@hotwired/turbo-rails"
import * as bootstrap from "bootstrap"
import './channels/**/*_channel.js'
import 'trix'
import '@rails/actiontext'
