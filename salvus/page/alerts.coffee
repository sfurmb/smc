alert_message = null # exported globally

(() ->
    defaults = require("misc").defaults

    types = ['error', 'default', 'success', 'info']

    $("#alert-templates").hide()
    
    alert_message = (opts={}) ->
        opts = defaults opts,
            type    : 'default'
            message : defaults.required
            block   : false

        if opts.type not in types
            alert("Unknown alert_message type #{opts.type}.")
            return
            
        c = $("#alert-templates .alert-#{opts.type}").clone()
        
        if opts.block
            c.addClass('alert-block')
        c.find(".message").html(opts.message)
        c.prependTo("#alert-messages").show()

)()


# for testing/development
# alert_message(type:'error',   message:"This is an error")
# alert_message(type:'default', message:"This is a default alert")
# alert_message(type:'success', message:"This is a success alert")
# alert_message(type:'info',    message:"This is an info alert")
        

