<form $FormAttributes>
    <% if $Message %>
        <p id="{$FormName}_error" class="message $MessageType">$Message</p>
    <% else %>
        <p id="{$FormName}_error" class="message $MessageType" style="display: none"></p>
    <% end_if %>
    <fieldset>
        <div id="FirstName" class="field first_name">
            <label class="left" for"{$FormName}_FirstName">First Name</label>
            $Fields.dataFieldByName(FirstName)
        </div>

        <div id="Surname" class="field surname">
            <label class="left" for{$formName}_Surname">Surname</label>
            $Fields.dataFieldByName(Surname)
        </div>

        <div id="Email" class="field email">
            <label class="left" for="{$FormName}_Email">Email</label>
            $Fields.dataFieldByName(Email)
        </div>

        <div id="Phone" class="field phone">
            <label class="left" for="{$FormName}_Phone">Phone</label>
            $Fields.dataFieldByName(Phone)
        </div>

        <div id="setPassword" class="field set_password">
            <label class="left" for="{$FormName}_setPassword"></label>
            $Fields.dataFieldByName(setPassword)
        </div>
    
        $Fields.dataFieldByName(SecurityID)

    </fieldset>
    <% if $Actions %>
        <div class="Actions">
            <% loop $Actions %>$Field<% end_loop %>
        </div>
    <% end_if %>
</form>
