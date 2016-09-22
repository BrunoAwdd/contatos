# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#sendAll', () ->
    if $('#sendAll:checked').length == 1
      $('.mailerMass').prop('checked',true)
    else
      $('.mailerMass').prop('checked',false)

  $(document).on 'click', '#sendMails', (event) ->
    event.preventDefault();
    emails =  $('.mailerMass:checked')
    for i in [0..(emails.length-1)] by 1
      #Get id and value
      id = emails[i].getAttribute('id').replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&")
      selector = '#' + id
      value = emails[i].value;

      #Get the url
      url = location.href.replace("send_newsletter", "send_mail")

      $.ajax({
        url: url
        method: 'POST'
        data: {'id': value}
        dataType: 'json'
      })
      .done((data) ->
        console.log(data)
      )
      $(selector).closest('tr').find('.status').text('ok')


