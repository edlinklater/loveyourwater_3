<div class="panel panel-default">
    <div class="panel-body">
        <form $FormAttributes>
            <% if $Message %>
                <p id="{$FormName}_error" class="message $MessageType">$Message</p>
            <% else %>
                <p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
            <% end_if %>
            <fieldset>
                <div id="Title" class="field title form-group">
                    <label class="left" for"{$FormName}_Title">Title</label>
                    $Fields.dataFieldByName(Title)
                    <% if $Fields.dataFieldByName(Title).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(Title).MessageType">
                            $Fields.dataFieldByName(Title).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="StartDateTime" class="field start_date_time form-group">
                    <label class="left" for="{$formName}_StartDateTime">Start</label>
                    $Fields.dataFieldByName(StartDateTime)
                    <p id="startTimeHelpBlock" class="help-block"><small>Please format the start time as <code>00:00</code>.</small></p>
                    <% if $Fields.dataFieldByName(StartDateTime).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(StartDateTime).MessageType">
                            $Fields.dataFieldByName(StartDateTime).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="EndDateTime" class="field end_date_time form-group">
                    <label class="left" for="{$FormName}_EndDateTime">End</label>
                    $Fields.dataFieldByName(EndDateTime)
                    <p id="endTimeHelpBlock" class="help-block"><small>Please format the end time as <code>00:00</code>.</small></p>
                    <% if $Fields.dataFieldByName(EndDateTime).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(EndDateTime).MessageType">
                            $Fields.dataFieldByName(EndDateTime).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="Region" class="field region form-group">
                    <label class="left" for="{$FormName}_Region">Region</label>
                    $Fields.dataFieldByName(Region)
                    <% if $Fields.dataFieldByName(Region).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(Region).MessageType">
                            $Fields.dataFieldByName(Region).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="Details" class="field details form-group">
                    <label class="left" for="{$FormName}_Details">Details</label>
                    $Fields.dataFieldByName(Details)
                    <% if $Fields.dataFieldByName(Details).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(Details).MessageType">
                            $Fields.dataFieldByName(Details).Message
                        </span>
                    <% end_if %>
                </div>

                $Fields.dataFieldByName(SecurityID)
                
            </fieldset>

            <p>By registering you agree to the <a href="$TermsPageLink" target="_blank">terms and conditions</a>.</p>

            <% if $Actions %>
                <div class="Actions">
                    <% loop $Actions %>$Field<% end_loop %>
                </div>
            <% end_if %>
        </form>
    </div>
</div>