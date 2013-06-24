# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.best_in_place').best_in_place()

  #$(".strike_if_completed").on "ajax:success", ->
  $("#todo_table").on "ajax:success", ".strike_if_completed", ->
    $(this).parent().next().toggleClass('strikethrough')
    $(this).parent().next().toggleClass('muted')
    #alert($(this).parent().next().attr('class'))
    #$(this).parent().next().remove()

  toggle_todo = ->
    $(this).parent().next().toggleClass('strikethrough')
    $(this).parent().next().toggleClass('muted')

$(".best_in_place").bind "ajax:success", ->
  alert "Name updated for " + $(this).data("userName")