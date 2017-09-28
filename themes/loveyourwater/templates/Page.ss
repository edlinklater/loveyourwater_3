<!DOCTYPE html>
<html lang="en">
<head>
  <% base_tag %>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" href="{$BaseURL}favicon.ico" />
  <link rel="icon" href="{$BaseURL}favicon-64.png">
  <link rel="apple-touch-icon-precomposed" href="{$BaseURL}favicon-180.png">
  <title>$SiteConfig.Title – <% if $URLSegment != 'home' %>$Title<% else %>$SiteConfig.Tagline<% end_if %></title>

	<% base_tag %>

  <!-- Bootstrap -->
  <link href="$ThemeDir/css/styles.css" rel="stylesheet">
</head>
<body class="$ClassName">
  <header>
    <div class="navbar-wrapper">
      <nav class="navbar navbar-default navbar-static-top" role="navigation">
        <% include Nav %>
      </nav>
    </div>
  </header>

  $Layout

  <!-- FOOTER -->
  <footer class="footer">
    <% include Footer %>
  </footer>

  <% if $SiteConfig.GACode %>
    <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', '$SiteConfig.GACode']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    </script>
  <% end_if %>
</body>
</html>
