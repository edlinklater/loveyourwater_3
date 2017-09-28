<div class="container">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="$BaseURL">
              <% if $SiteConfig.Logo %>
                <img src="$SiteConfig.Logo.URL" class="navbar-logo" alt="">
              <% else %>
                <img src="$ThemeDir/assets/images/logo.png" class="navbar-logo" alt="$SiteConfig.Title">
              <% end_if %>

            </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <% loop $Menu(1) %>
                    <li><a href="$Link">$MenuTitle</a></li>
                <% end_loop %>
            </ul>

          <% if $SiteConfig.AllowLogin %>
            <ul class="nav navbar-nav navbar-right">
                <% include Member %>
            </ul>
          <% end_if %>
        </div>
    </div>
</div>
