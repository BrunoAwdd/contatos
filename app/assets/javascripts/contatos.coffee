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
      console.log(index)

      #Copia o template e injeta o indice correto
      template = $(this).children('a').attr('data-association-insertion-template').replace(re, index)

      #Adiciona um campo novo ao fieldset
      fieldset.children('.fields').append(template)

  addSub = (argument) ->
    $(document).on 'click', '#btn_'+argument, (event) ->
      #Define regex
      re = new RegExp(argument + "_attributes\]\[0\]", "g")

      #Previne que envie o formulário
      event.preventDefault()

      #Encontra o fieldset desejado
      fieldset = $(this).closest('fieldset')
      html = fieldset.find('.form-item').first().html()


      #Conta quanto itens estão disponíveis para encontrar um indice
      index = parseInt(fieldset.find('.form-item').length)

      new_html = argument + "_attributess]["+ index + "]"
      console.log(index)
      console.log(re)
      console.log(argument+"_attributes][0]", new_html)
      console.log(argument + "_attributes][" + index + "]".replace(re,new_html))


      #Copia o template e injeta o indice correto
      template = html.replace(re, new_html)

      #Adiciona um campo novo ao fieldset
      child = fieldset.children('.fields').append('<div class="row form-item">' + template + '</div>')
      child.find('input').val('')


  add("addresses")
  add("documents")
  add("emails")
  add("enderecos")
  add("legals")
  add("lines")
  add("notes")
  add("partners")
  add("warrantys")
  add("phones")
  add("telefones")






