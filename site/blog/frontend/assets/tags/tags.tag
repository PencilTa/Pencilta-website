<account>

</account>

<dashboard>
  <header>
    <nav class="top-nav">
      <div class="container">
        <div class="nav-wrapper"><span>your balance is:</span></div>
      </div>
    </nav>
    <feeds></feeds>
  </header>
  <div class="containter layout-1 animated fadeIn">
    <div class="row">
      <div class="col s12">
        <history></history>
      </div>
    </div>
  </div>
  <script>
    var self = this
  </script>
</dashboard>

<feeds>
  <div id="nav-mobile" class="side-nav fixed animated fadeIn">
    <nav class="top-nav">
      <div class="container">
        <div class="nav-wrapper">
        </div>
      </div>
    </nav>
    <tabs></tabs>
    <ol class="list">
      <li name="feed" class="hvr-shutter-out-horizontal" each={ feed in feeds }>
        {feed}
      </li>
    </ol>
  </div>
  <script>
    // some private random variables
    var amount = 50,
      // this flag variable will be toggle on any update
      mustAnimate = false,
      names = [
        'Good morning Mr. Robertson, It seems like your account was accessed from a computer we have not registered.',
        'Good morning Mr. Robertson, It seems like your account was accessed from a computer we have not registered.',
        'Good morning Mr. Robertson, It seems like your account was accessed from a computer we have not registered.',
        'Good morning Mr. Robertson, It seems like your account was accessed from a computer we have not registered.'
      ],
      // cache the flip instance
      flip

    // people collection
    this.feeds = []

    // prepare the items only once
    this.feeds = names;

    // helper function to shuffle the items in the array
    function shuffle(o) {
      var j, x, i
      for (i = o.length; i; i -= 1) {
        j = Math.floor(Math.random() * i)
        x = o[i-1]
        o[i-1] = o[j]
        o[j] = x
      }

      return o
    }

    // create the flip instance
    // pay attention that if your collection
    // will add new items you must update
    // the flip instance
    this.one('mount', function() {
      // create the flip group
      flip = new FLIP.group(
        this.feed.map(function(feed) {
          return {
            element: feed,
            duration: 550,
            // easeInOutCubic
            easing: function (t) {
              return t<.5 ? 4*t*t*t : (t-1)*(2*t-2)*(2*t-2)+1
            }
          }
        })
      );
    })

    // cache the elements position
    // before the DOM gets updated
    this.on('update', function() {
      if (!flip) return // make sure the flip instance got created
      mustAnimate = true
      flip.first()
    })

    // run the animation when the DOM
    // is updated
    this.on('updated', function() {
      if (!mustAnimate) return
      flip.last()
      flip.invert()
      flip.play()
      mustAnimate = false
    })

    // Ui public methods



    /**
     * Sort the people array by a single property
     */
    sortBy(prop) {
      this.feeds.sort(function(a, b) {
        if (a[prop] < b[prop])
            return -1
          else if (a[prop] > b[prop])
            return 1
          else
            return 0
      })
    }

  </script>
</feeds>

<login>
  <div class="animated fadeIn">
    <form class="col s12" onsubmit="{ login }">
      <div class="row">
        <div class="input-field col s12">
          <input id="username" type="text" class="validate">
          <label for="username">Email</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
      <div class="row">
        <div class="col s12">
          <submit class="waves-effect waves-light btn" onclick={ login }>Log in</submit>
          <a href="#">forgot password?</a>
        </div>
      </div>
    </form>
  </div>
  <script>
    var self = this;
    console.log(this.root.childNodes)
    opts.on('login.success', function(e) {
      self.unmount(true);
      self.update();
    });
    opts.on('login.fail', function(e) {
      console.log(self, riot.tags);
      self.update();
    });

    login() {
      opts.login({
        username: this.username.value,
        password: this.password.value
      })
    }
  </script>
</login>

<history>
<h5>History</h5>
<ul class="fadeIn">
  <li>
    <div class="title-xs up-case">Wednesday, 31, August</div>
      <ul class="">
        <li class="bg-light row">
          <div class="col s9">GO daddy limited europe</div><div class="col s3"><span class="right"><strong>-23,33e</strong></span></div>
        </li>
      </ul>
    </div>
    </div>
  </li>
  <li>
    <div class="title-xs up-case">Wednesday, 31, August</div>
    <ul class="">
      <li class="bg-light row">
        <div class="col s9">GO daddy limited europe</div><div class="col s3"><span class="right"><strong>-23,33e</strong></span></div>
      </li>
    </ul>
  </li>
</ul>
<script>
  feeds() {

  }
</script>
</history>

<app>
  <user></user>
  <script>
    var self = this
    self.title = 'Penta'
    self.body = ''
    self.data = []
  </script>
</app>

<user>
  <script>
    this.auth = true;
    app.trigger('user', {'auth':this.auth});
  </script>
</user>

<tabs>
  <ul class="tab">
    <li><a href="feed" class=tablinks { active: parent.selectedId === url }>Feed</a></li>
    <li><a href="payment" class=tablinks { active: parent.selectedId === url }>Payment</a></li>
  </ul>
  <style>
    .tabs .active {background-color: #ccc;}
  </style>
  <script>
    var self = this
    var r = riot.route.create()
    r(highlightCurrent)

    function highlightCurrent(id) {

      self.selectedId = id
      self.update()
    }
    openCity(evt, cityName) {
      console.log(evt.currentTarget);

      console.log(this);
      return;
      // Declare all variables
      var i, tabcontent, tablinks;

      // Get all elements with class="tabcontent" and hide them
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
          tabcontent[i].style.display = "none";
      }

      // Get all elements with class="tablinks" and remove the class "active"
      tablinks = document.getElementsByClassName("tablinks");
      for (i = 0; i < tablinks.length; i++) {
          tablinks[i].className = tablinks[i].className.replace(" active", "");
      }

      // Show the current tab, and add an "active" class to the link that opened the tab
      document.getElementById(cityName).style.display = "block";
    //  evt.currentTarget.className += " active";
  }
  </script>
</tabs>

<navi>
  <a each={ links } href="/{ url }" class={ selected: parent.selectedId === url }>
    { name }
  </a>

  <script>
    var self = this

    this.links = [
      { name: "H", url: "" },
      { name: "F", url: "first" },
      { name: "S", url: "second" }
    ]

    var r = riot.route.create()
    r(highlightCurrent)

    var plunkrRandomUrl = location.pathname.replace(new RegExp('/', 'g'), '')

    function highlightCurrent(id) {
      alert('aler');
      // Plunker confuses routing initially
      if ( plunkrRandomUrl == id ) { id = '' }

      self.selectedId = id
      self.update()
    }
  </script>

  <style scoped>
    :scope {
      position: fixed;
      top: 0;
      left: 0;
      height: 100%;
      box-sizing: border-box;
      font-family: sans-serif;
      text-align: center;
      color: #666;
      background: #333;
      width: 50px;
      transition: width .2s;
    }
    :scope:hover {
      width: 60px;
    }
    a {
      display: block;
      box-sizing: border-box;
      width: 100%;
      height: 50px;
      line-height: 50px;
      padding: 0 .8em;
      color: white;
      text-decoration: none;
      background: #444;
    }
    a:hover {
      background: #666;
    }
    a.selected {
      background: teal;
    }
  </style>
</navi>
