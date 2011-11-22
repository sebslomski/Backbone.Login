(function() {
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  Backbone.Login = {
    route: 'login',
    loggedIn: false,
    from: '',
    publicRoutes: []
  };

  Backbone.History.prototype.oldLoadUrl = Backbone.History.prototype.loadUrl;

  Backbone.History.prototype.loadUrl = function(fragmentOverride) {
    var fragment;
    fragment = this.getFragment(fragmentOverride);
    if (!_.any(_.filter(Backbone.Login.publicRoutes, function(route) {
      return route.test(fragment);
    }))) {
      console.log('Not a public route');
      if (!Backbone.Login.loggedIn) {
        if (fragment.indexOf(Backbone.Login.route) !== 0) {
          Backbone.Login.from = fragment;
          return Backbone.Router.prototype.navigate(Backbone.Login.route, true);
        }
      }
    }
    return this.oldLoadUrl(fragmentOverride);
  };

  Backbone.PublicRouter = (function() {

    __extends(PublicRouter, Backbone.Router);

    function PublicRouter(options) {
      var that;
      PublicRouter.__super__.constructor.call(this, options);
      that = this;
      Backbone.Login.publicRoutes = Backbone.Login.publicRoutes.concat(_.map(_.keys(this.routes), function(route) {
        return that._routeToRegExp(route);
      }));
    }

    return PublicRouter;

  })();

}).call(this);
