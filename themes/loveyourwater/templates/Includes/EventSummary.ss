<% loop Events %>
<div class="col-sm-4">
    <a class="panel panel-default event-panel" href="$Top.getEventLink($ID)">
        <span class="event-image" <% if $Top.SiteDefaultEventImage %> style="background-image: url($Top.SiteDefaultEventImage.URL); <% else %>style="background-image: url({$ThemeDir}/images/placeholders/coastline.jpg);<% end_if %>">
        </span>
        <span class="event-body">
            <span class="event-date">
                <span class="event-day">$StartDateTime.Format(d)</span>
                <span class="event-month-year">
                    $StartDateTime.Format(M)<br/>
                    $StartDateTime.Format(Y)
                </span>
            </span>
            <h3 class="panel-title event-title">$Title</h3>
        </span>
        <span class="panel-body event-badge-wrapper">
            <span class="event-badge event-badge-coastlines"></span>
            <span class="event-badge-title">Sustainable Coastlines</span>
        </span>
    </a>
</div>
<% end_loop %>
