# Backbone Plugin for adding a login functionality

Backbone.Login =
    route: 'login'
    loggedIn: false
    from: ''


oldLoadUrl = Backbone.History::loadUrl

Backbone.History::loadUrl = (fragmentOverride) ->
    fragment = @getFragment(fragmentOverride)
    if not Backbone.Login.loggedIn
        if fragment.indexOf(Backbone.Login.route) != 0
            Backbone.Login.from = fragment
            return Backbone.Router::navigate(Backbone.Login.route, true)

    return oldLoadUrl.call(this, fragmentOverride)
