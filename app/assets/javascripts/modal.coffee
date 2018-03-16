# app/assets/javascripts/modals.js.coffee

$ ->
  modal_holder_selector = '#modal-holder'
  modal_selector = '.modal'
  modal_template =
    '<div class="modal" id="mainModal" tabindex="-1" role="dialog" aria-labelledby="mainModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <h4 class="modal-title" id="mainModalLabel"></h4>
          </div>
        </div>
      </div>
    </div>'

  $(document).on 'click', 'a[data-modal]', ->
    context = $(this).closest('#contatos')
    fieldset = $(this).closest('fieldset')
    location = $(this).attr('href')
    waitingDialog.show 'Carregando...'
    #Load modal dialog from server
    $.ajax
      url: location,
      success: (data, textStatus, jqXHR) ->
        waitingDialog.hide()
        $('.modal-backdrop').remove()
        $(modal_holder_selector).html data
        $(modal_selector).modal()
        $(modal_selector).find('form').submit ->
          formData =   toJson $(this).serializeArray()
          postUrl = $(this).attr('action')
          console.log formData
          preventSend
          $.ajax
            url: postUrl,
            method: 'POST',
            data: formData,
            dataType: 'json'
            error: (errorJqXHR, textStatus, errorThrown) ->
              console.log errorJqXHR, textStatus, errorThrown, typeof(errorJqXHR.responseJSON)
              response = errorJqXHR.responseJSON
              responseKeys = Object.keys(response)
              responseLength = Object.keys(response).length
              for i in [0...responseLength]
                field = $(modal_selector).find('form').find( "input[name*='" + responseKeys[i] + "']" )
                field.parent().find('.help-block').remove()
                fieldText = '<span class="help-block">' + response[responseKeys[i]][0] + '</span>'
                field.parent().addClass('has-error').append(fieldText)
                field.focus()
            success: (postData, postStatus, postJqXHR) ->
              $(modal_selector).modal('hide')
              target = fieldset.find('.contato_menu').find('select')
              if target.find('option[value="' + postData['id'] + '"]').length
                target.find('option[value="' + postData['id'] + '"]').text(postData['full_name'] )
              else
                text = '<option value="' + postData['id']  + '" selected="selected">' + postData['full_name'] + '</option>'
                target.append(text)
              target.trigger "chosen:updated"
              getContatos(context)
              false
            false
          false
        false
    ###
    $(document).on 'ajax:success',
      'form[data-modal]', (event, data, status, xhr)->
      console.log 'Sucesso Porra'
      url = xhr.getResponseHeader('Location')
      if url
      # Redirect to url
        window.location = url
      else
        # Remove old modal backdrop
        $('.modal-backdrop').remove()
        # Replace old modal with new one
        $(modal_holder_selector).html(data).
        find(modal_selector).modal()
      false
    ###
    false

  preventSend = () ->
    $('#modal-holder').on 'click', '.btn', (event) ->
      event.preventDefault

  toJson = (unidexed_array) ->
    indexed_array = {};
    $.map unidexed_array, (n, i) ->
      indexed_array[n['name']] = n['value'];
    return indexed_array


  ###
  # Module for displaying "Waiting for..." dialog using Bootstrap
  #
  # @author Eugene Maslovich <ehpc@em42.ru>
  ###

  waitingDialog = waitingDialog or (($) ->
    'use strict'
    # Creating modal dialog's DOM
    $dialog = $('<div class="modal fade" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" ' +
      'aria-hidden="true" style="padding-top:15%; overflow-y:visible;">' + '<div class="modal-dialog modal-m">' + '' +
      '<div class="modal-content">' + '<div class="modal-header"><h3 style="margin:0;"></h3></div>' +
      '<div class="modal-body">' + '<div class="progress progress-striped active" style="margin-bottom:0;">' +
      '<div class="progress-bar" style="width: 100%"></div></div>' + '</div>' + '</div></div></div>')
    {
      show: (message, options) ->
        # Assigning defaults
        if typeof options == 'undefined'
          options = {}
        if typeof message == 'undefined'
          message = 'Loading'
        settings = $.extend({
          dialogSize: 'm'
          progressType: ''
          onHide: null
        }, options)
        # Configuring dialog
        $dialog.find('.modal-dialog').attr('class', 'modal-dialog').addClass 'modal-' + settings.dialogSize
        $dialog.find('.progress-bar').attr 'class', 'progress-bar'
        if settings.progressType
          $dialog.find('.progress-bar').addClass 'progress-bar-' + settings.progressType
        $dialog.find('h3').text message
        # Adding callbacks
        if typeof settings.onHide == 'function'
          $dialog.off('hidden.bs.modal').on 'hidden.bs.modal', (e) ->
            settings.onHide.call $dialog
            return
        # Opening dialog
        $(modal_holder_selector).empty().append($dialog)
        $dialog.modal()
        return
      hide: ->
        console.log('Esconder')
        $dialog.modal 'hide'
        return

    }
  )(jQuery)




