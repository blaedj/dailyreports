# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

boolify = (index, el) ->
        value = $(el).text()
        span = $('<span>')
        if value == "true"
                span.addClass 'checkmark fa fa-lg fa-check-square'
        else if value == "false"
                span.addClass 'xMark fa fa-lg fa-ban'
        $(el).html(span)

$(document).ready ->
        $('.boolString').each(boolify)
