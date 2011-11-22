{MainRouter} = require('routers/main')
{PublicRouter} = require('routers/public')

# app bootstrapping on document ready
$(document).ready ->
    new MainRouter()
    new PublicRouter()
    Backbone.history.start()
