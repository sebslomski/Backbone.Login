(function() {
  var oldLoadUrl;

  Backbone.Login = {
    route: 'login',
    loggedIn: false,
    from: ''
  };

  oldLoadUrl = Backbone.History.prototype.loadUrl;

  Backbone.History.prototype.loadUrl = function(fragmentOverride) {
    var fragment;
    fragment = this.getFragment(fragmentOverride);
    if (!Backbone.Login.loggedIn) {
      if (fragment.indexOf(Backbone.Login.route) !== 0) {
        Backbone.Login.from = fragment;
        return Backbone.Router.prototype.navigate(Backbone.Login.route, true);
      }
    }
    return oldLoadUrl.call(this, fragmentOverride);
  };

}).call(this);
