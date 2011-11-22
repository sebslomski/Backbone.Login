# Backbone Plugin for adding a login functionality

Backbone.Login =
    route: 'login'
    loggedIn: false
    from: ''
    publicRoutes: []


Backbone.History::oldLoadUrl = Backbone.History::loadUrl

Backbone.History::loadUrl = (fragmentOverride) ->
    fragment = @getFragment(fragmentOverride)
    if not _.any(_.filter(Backbone.Login.publicRoutes, (route) -> route.test(fragment)))
        if not Backbone.Login.loggedIn
            if fragment.indexOf(Backbone.Login.route) != 0
                Backbone.Login.from = fragment
                return Backbone.Router::navigate(Backbone.Login.route, true)

    return @oldLoadUrl(fragmentOverride)


class Backbone.PublicRouter extends Backbone.Router
    constructor: (options) ->
        super(options)
        that = @
        Backbone.Login.publicRoutes = Backbone.Login.publicRoutes.concat(
            _.map(_.keys(@routes), (route) -> that._routeToRegExp(route))
        )
