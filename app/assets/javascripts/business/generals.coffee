# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  add = (argument) ->
    $(document).on 'click', '#btn_'+argument, (event) ->
#Define regex
      re = new RegExp("new_"+argument, "g")

      #Previne que envie o formulário
      event.preventDefault()

      #Encontra o fieldset desejado
      fieldset = $(this).closest('fieldset')

      #Conta quanto itens estão disponíveis para encontrar um indice
      index = parseInt(fieldset.find('.form-item').length)

      #Copia o template e injeta o indice correto
      template = $(this).children('a').attr('data-association-insertion-template').replace(re, index)

      #Adiciona um campo novo ao fieldset
      fieldset.children('.fields').append(template)

  add("notes")
  add("histories")


