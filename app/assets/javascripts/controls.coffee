# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


 
$(document).ready ->
  $('.modal').modal ready: (modal, trigger) ->
    modal.find('#data-device_name').text trigger.data('device_name')
    modal.find('#data-type').text trigger.data('type')
    return
  return
