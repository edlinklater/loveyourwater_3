<div class="container">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#">
            <img src="$ThemeDir/assets/images/logo.png" class="navbar-logo" alt="Love Your Water logo">
        </a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav">
            <li><a href="#">Learn</a></li> <!-- class=active for selected state -->
            <li><a href="#about">Find</a></li>
            <li><a href="#contact">Create</a></li>
            <li><a href="#enter">Enter</a></li>
            <% loop $Menu(1) %>
                <li><a href="$Link">$MenuTitle</a></li>
            <% end_loop %>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Login</a></li>
            <li><a href="#">Sign-up</a></li>
        </ul>
    </div>
</div>