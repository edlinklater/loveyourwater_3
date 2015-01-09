<div class="panel panel-default">
    <div class="panel-body">
        <form $FormAttributes>
            <% if $Message %>
                <p id="{$FormName}_error" class="message $MessageType">$Message</p>
            <% else %>
                <p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
            <% end_if %>
            <fieldset>
                <div id="FirstName" class="field first_name form-group">
                    <label class="left" for="{$FormName}_FirstName">First Name</label>
                    $Fields.dataFieldByName(FirstName)
                    <% if $Fields.dataFieldByName(FirstName).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(FirstName).MessageType">
                            $Fields.dataFieldByName(FirstName).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="Surname" class="field surname form-group">
                    <label class="left" for="{$formName}_Surname">Surname</label>
                    $Fields.dataFieldByName(Surname)
                    <% if $Fields.dataFieldByName(Surname).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(Surname).MessageType">
                            $Fields.dataFieldByName(Surname).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="Email" class="field email form-group">
                    <label class="left" for="{$FormName}_Email">Email</label>
                    $Fields.dataFieldByName(Email)
                    <% if $Fields.dataFieldByName(Email).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(Email).MessageType">
                            $Fields.dataFieldByName(Email).Message
                        </span>
                    <% end_if %>
                </div>

                <div id="Phone" class="field phone form-group">
                    <label class="left" for="{$FormName}_Phone">Phone</label>
                    $Fields.dataFieldByName(Phone)
                    <% if $Fields.dataFieldByName(Phone).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(Phone).MessageType">
                            $Fields.dataFieldByName(Phone).Message
                        </span>
                    <% end_if %>
                </div>
            

                <div id="setPassword" class="field set_password form-group">
                    <label class="left" for="{$FormName}_setPassword"></label>
                    $Fields.dataFieldByName(setPassword)
                    <% if $Fields.dataFieldByName(setPassword).Message %>
                        <span id="{$FormName}_error" class="message $Fields.dataFieldByName(setPassword).MessageType">
                            $Fields.dataFieldByName(setPassword).Message
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
