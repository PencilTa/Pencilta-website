(function() {
  if(!localStorage.getItem('token')) {
    //history.pushState({}, "login", "login");
  }
  console.log('app');
  riot.compile(function() {
    riot.route.base('/frontend/')
    var r = riot.route.create()
    r('/', dashboard)
    r('login', login)
    r('dashboard', dashboard)

    function dashboard() {
      console.log('dash');
      riot.mount('dashboard');
    }
    function login() {
      riot.mount('login', app);
    }
    riot.route.start(true)
  })
  riot.mount('app');
})(this, riot);
