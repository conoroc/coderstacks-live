# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#resource_subcategory_id').parent().hide()
  states = $('#resource_subcategory_id').html()
  $('#resource_category_id').change ->
    country = $('#resource_category_id :selected').text()
    escaped_country = country.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(states).filter("optgroup[label='#{escaped_country}']").html()
    if options
      $('#resource_subcategory_id').html(options)
      $('#resource_subcategory_id').parent().show()
    else
      $('#resource_subcategory_id').empty()
      $('#resource_subcategory_id').parent().hide()
