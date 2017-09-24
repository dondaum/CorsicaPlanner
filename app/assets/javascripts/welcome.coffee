# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  setTimeout (->
    $('#flash').fadeOut("slow")
    return
  ), 5000
  return

#$(document).ready ->
#  $('.img-responsive').click ->
#    $(this).css 'width', (_, cur) ->
#      if cur == '100px' then '100%' else '100px'
#    return
#  return

$(document).ready ->
  $('img').on 'click', ->
    $('.enlargeImageModalSource').attr 'src', $(this).attr('src')
    $('#enlargeImageModal').modal 'show'
    return
  return
