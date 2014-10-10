# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

boolify = (index, el) ->
        value = $(el).text()
        if value == "false"
                $(el).addClass 'xMark'
        else if value == "true"
                $(el).addClass 'checkmark'

$(document).ready ->
        $('td.boolString').each(boolify)
