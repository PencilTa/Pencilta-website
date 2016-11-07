// Obvervable instance
var app = riot.observable();

(function (riot, app) {
  var url = 'http://0.0.0.0:3000/api/';

  app
  app.login = function(params) {
    var endPoint = url+'Webusers/login';
    $.post(endPoint, params, function() {})
    .done(function(json) {
      app.trigger('login.success', json);
    })
    .fail(function(json) {
      app.trigger('login.fail', json);
    })
    .always(function(){});
  }


  //API??
  riot.util.service = {
    get : function() {
      console.log('get shit');
    },
    auth : function(token, lifetime) {
      localStorage.setItem('token', token);
    }

  };
}(riot, app)); //
