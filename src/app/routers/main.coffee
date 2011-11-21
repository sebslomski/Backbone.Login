class exports.MainRouter extends Backbone.Router
    routes :
        '': 'init'
        'secret': 'secret'
        'secret2': 'secret2'
        'login': 'login'


    init: ->
        @navigate('secret', true if Backbone.history.getFragment() is '')


    login: ->
        # implement your login functianality here
        Backbone.Login.loggedIn = true
        Backbone.Login.from = 'secret'
        $button = $('<button>Logged in. continue to secret</button>')
        $button.click((e) =>
            @navigate(Backbone.Login.from, true)
        )
        $('body').html($button)


    secret: ->
        $button = $('<button>continue to secret2</button>')
        $button.click((e) =>
            @navigate('secret2', true)
        )
        $('body').html($button)


    secret2: ->
        $('body').html('secret2')
