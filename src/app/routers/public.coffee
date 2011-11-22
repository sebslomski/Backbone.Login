class exports.PublicRouter extends Backbone.PublicRouter
    routes :
        'public': 'public'
        'pub/:id': 'pubId'


    public: ->
        $('#content').html('public')


    pubId: (id) ->
        $('#content').html('public with id: ' + id)
