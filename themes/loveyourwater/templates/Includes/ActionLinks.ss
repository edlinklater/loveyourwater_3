<% loop LimitActionLinks %>
    <div class="col-sm-3">
        <div class="heading-block heading-block--circle heading--brand">
            <span class="glyphicon <% if Icon %>$Icon<% else %>glyphicon-heart<% end_if %>" aria-hidden="true"></span>
        </div>
        <% if Title %><h3>$Title</h3><% end_if %>
        <% if Content %><p>$Content</p><% end_if %>
        <% if LinkID %>
            <p><a class="btn btn-primary" href="$Link.Link" role="button">View details &raquo;</a></p>
        <% end_if %>
    </div>
<% end_loop %>