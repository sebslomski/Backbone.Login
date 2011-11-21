{MainRouter} = require('routers/main')

# app bootstrapping on document ready
$(document).ready ->
    new MainRouter()
    Backbone.history.start()
