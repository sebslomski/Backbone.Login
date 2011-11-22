class exports.MainRouter extends Backbone.Router
    routes :
        '': 'init'
        'secret': 'secret'
        'secret2': 'secret2'
        'login': 'login'
        'sec/:id': 'secretId'


    init: ->
        @navigate('secret', true if Backbone.history.getFragment() is '')


    login: ->
        # implement your login functianality here
        Backbone.Login.from = 'secret'
        $button = $('<button>Logged in. continue to secret</button>')
        $button.click((e) =>
            Backbone.Login.loggedIn = true
            @navigate(Backbone.Login.from, true)
        )
        $('#content').html($button)


    secret: ->
        $button = $('<button>continue to secret2</button>')
        $button.click((e) =>
            @navigate('secret2', true)
        )
        $('#content').html($button)


    secret2: ->
        $('#content').html('secret2')


    secretId: (id) ->
        $('#content').html('secret with id: ' + id)
