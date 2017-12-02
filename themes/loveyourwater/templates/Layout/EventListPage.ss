<div class="jumbotron jumbotron--brand">
  <div class="container">
    <h1>$Title</h1>
    <p>$Summary</p>
  </div>
</div>

<div class="event-list">
  <%--
  <div class="event-list__filters">
    <div class="event-list__search">
      <input type="text" placeholder="Search by title">
    </div>

    <div class="event-list__region">
      <label for="region">Region</label>
      <select name="region">
        <option value="all">All</option>
        <option value="northland">Northland</option>
      </select>
    </div>
  </div>
  --%>

  <% loop $EventsForCurrentSite %>
  <div class="event-list-item">
    <div class="event-list-item__body">
      <h3 class="event-list-item__title"><a href="$Link">$Name</a></h3>
      <h5>$FriendlyDate / $Region</h5>
      <% if $Summary %><p class="event-list-item__description">$Summary</p><% end_if %>
    </div>
    <div class="event-list-item__link"><a href="$Link">Find out more &rarr;</a></div>
  </div>
  <% end_loop %>
</div>

<div class="event-list event-list--secondary">
  <h5 class="event-list__description">You might also be interested in these other events hosted by Sustainable Coastlines:</h5>

  <% loop $EventsForOtherSites %>
  <div class="event-list-item">
    <div class="event-list-item__body">
      <h4 class="event-list-item__title"><a href="$Link">$Name</a></h4>
      <h6>$FriendlyDate / $Region / $SiteName</h6>
      <% if $Summary %><p class="event-list-item__description">$Summary</p><% end_if %>
    </div>
    <div class="event-list-item__link"><a href="$Link">Find out more &rarr;</a></div>
  </div>
  <% end_loop %>
</div>
