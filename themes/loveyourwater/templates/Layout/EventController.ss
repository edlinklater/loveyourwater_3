<% with $Event %>
<div class="jumbotron jumbotron--brand" <% if $Banner %>style="background-image: url($Banner.URL);"<% end_if %>>
  <div class="container">
    <h1>$Name</h1>
    <p>$FriendlyDate / $Region</p>
  </div>
</div>

<div class="container event-details">
  <div class="row">
    <div class="col-sm-8 col-lg-9">
      <% if $Summary %><div class="event-details__summary">$Summary</div><% end_if %>

      <% if $Content %><div class="event-details__content">$Content</div><% end_if %>
    </div>

    <div class="col-sm-4 col-lg-3">
      <a href="$ShortLink/register" class="btn btn-primary btn-block">Register</a>

      <% if $Location %>
        <div id="eventLocationMap" data-geometry="$Location" style="height: 400px"></div>
        <% require css('http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css') %>
        <% require javascript('http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js') %>
        <% require javascript('themes/loveyourwater/js/event-detail.js') %>
      <% end_if %>
    </div>
  </div>
</div>
<% end_with %>
