# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.best_in_place').best_in_place()

  $(".strike_if_necessary").bind "ajax:success", ->
    alert($(this).data('completed'))
    #$(this).parent().next().remove()

$(".best_in_place").bind "ajax:success", ->
  alert "Name updated for " + $(this).data("userName")