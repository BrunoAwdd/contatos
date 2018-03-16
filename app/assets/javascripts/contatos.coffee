# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  #CONSTANTS
  getUrl = window.location;
  baseUrl = getUrl.protocol + "//" + getUrl.host + "/" ;
  dataAjax = null

  #FUNCTION TO ADD FIELD
  add = (argument, chosen = false) ->
    $(document).on 'click', '#btn_'+argument, (event) ->
      addField($(this),argument, chosen)

  #ADD FIELDS
  addField = (element, argument, chosen = false) ->
    #Define regex
    re = new RegExp("new_"+argument, "g")
    #Previne que envie o formulário
    event.preventDefault()
    #Encontra o fieldset desejado
    fieldset = element.closest('fieldset')
    #Conta quanto itens estão disponíveis para encontrar um indice
    index = parseInt(fieldset.children('.fields').children('.form-item').length)
    #Copia o template e injeta o indice correto
    template = element.children('a').attr('data-association-insertion-template').replace(re, index)
    #Adiciona um campo novo ao fieldset
    fieldset.children('.fields').append template
    if (chose)
      chose()
  #UPDATE FORM VIA AJAX
  updateForm = (field, item) ->
    #ENCONTRA O CAMPO COM O NOME INDICADO
    fn = getField(field, item)
    #MUDA O VALOR PARA O AJAX CORRESPONDENTE
    fn.val(dataAjax[field])

  #PREPARA OS DADOS EM AJAX PARA A FUNÇÃO DE ATUALIZAR FORMULARIO
  updateFormFromAjax = (item) ->
    #CALL UPDATE FORM
    updateForm(item[0], item[1])

  #UPDATE NESTED FIELDS
  updateNestedForm = (field, item)->
    #GET DATA OF PROPERTY FROM GLOBAL DATAAJAX
    data = dataAjax[field]
    #GET LENGTH OF PROPERTY
    sizeAjax = data.length
    #CLEAN THE PARENT DOM
    item.children('.fields').empty()
    #EACH LOOP FOR PROPERTY ARRAY
    $.each data, (index, element)->
      #FIND BUTTON TO CALL FUNCTION ADD. ADD THE NUMBER OF FIELDS RELATIVE OF SIZEAJAX
      addField(item.find('.btn'), field, false)
      #GET THE LAST CHILD ADDED
      subItem = (item.children('.fields').children().last())
      #GET KEYS OF ELEMENT OF ARRAY
      keys = Object.keys(element)
      #EACH HAVE KEYS, GET ID AND KEY NAME
      $.each keys, (id, el) ->
        #FIND THE FIELD
        localField = getFieldExact(el + ']', subItem)
        #SET TE NEW VAL
        localField.val(element[el])

  updateNestedFormFromAjax = (item) ->
    updateNestedForm(item[0], item[1])

  #PEGA O CAMPO INDICADO
  getFieldExact = (label, item) ->
    return item.closest('.form-item').find( "input[name$='" + label + "']" )

  getField = (label, item) ->
    return item.closest('.form-item').find( "input[name*='" + label + "']" )

  #COMPARE FILEDS IN FORM AND FIELDS BY AJAX
  countFields = (field) ->
    #ENCONTRA O CAMPO INDICADO
    fields = $('#contatos').find('fieldset#' + field[0] ).children('.fields').children('.form-item')
    #CONTA A QUANTIDADE DE CAMPOS
    sizeFields = fields.length
    #CONTA A QUANTIDADE DE CAMPOS JSON
    sizeJson = field[1].length;
    return ([sizeFields, sizeJson])

  $(document).on 'click', '#addcontatos', (event) ->
    event.preventDefault()

  $(document).on 'change', '.credit_client_general_contato_id', (event) ->
    #DEFINE ID PARA A BUSCA
    id = $(this).val()
    #ARMAZENA THIS EM UMA VARIAVEL
    item = $(this)
    #APLICA NO CONTATO PAI
    $(this).closest('fieldset#contatos').find( "input[name*='contato_id']" ).val(id)
    #VEREFICA SE ID É VÁLIDO
    if id
      #URL PARA ACESSAR JSON
      url = baseUrl + "contatos/" + id + ".json"
      $.ajax
        url: url
        dataType: 'json'
        error: (jqXHR, textStatus, errorThrown) ->
          $('body').append "AJAX Error: #{textStatus}"
        success: (data, textStatus, jqXHR) ->
          dataAjax = data
          console.log(data)
          updateFormFromAjax(['first_name',item])
          updateFormFromAjax(['last_name',item])
          updateFormFromAjax(['web_page',item])
          updateNestedFormFromAjax(['telefones', item.closest('.form-item').children('#telefones')])
          updateNestedFormFromAjax(['emails', item.closest('.form-item').children('#emails')])
    else
      console.log('indefinido')

  $(document).on 'change', '#credit_client_general_contato_ids', () ->
    console.log $(this).val()
    $(this).trigger "chosen:updated"
    getContatos($(this).closest('#contatos'))

  $(document).on 'change', '#credit_client_general_intermediary_attributes_contato_id', () ->
    console.log $(this).val()
    $(this).trigger "chosen:updated"
    getContatos($(this).closest('#contatos'))

  $(document).on 'change', '.credit_client_general_partners_contato', () ->
    console.log $(this).val()
    $(this).trigger "chosen:updated"
    getContatos($(this).closest('#contatos'))

  $(document).on 'change', '.contato', () ->
    console.log $(this).val()
    $(this).trigger "chosen:updated"
    getContatos($(this).closest('#contatos'))

  window.getContatos = (context = null) ->
    if !context
      context = $('#contatos')
      console.log(context)

    parent = context.children('.fields').empty()
    obj = context.find('.contato_menu')
    arr = obj.find('select').val()
    if typeof arr == 'string'
      arrLength = 1
      childText = obj.find('select option[value="'+ arr + '"]').text()
      link = '<tr> ' +
        '<td>' + childText + '<td>' +
        '<td><a data-modal="true" data-remote="true" href="/ajaxcontatos/' + arr + '/edit"> Editar</a></td>' +
        '</tr>'
      parent.append(link)
    else
      arrLength = if arr then arr.length else 0
      for i in [0...arrLength]
        childValue = arr[i];
        childText = obj.find('select option[value="'+ arr[i] + '"]').text()
        link = '<tr> ' +
          '<td>' + childText + '<td>' +
          '<td><a data-modal="true" data-remote="true" href="/ajaxcontatos/' + childValue + '/edit"> Editar</a></td>' +
          '</tr>';
        parent.append(link)

    console.log arr, arrLength




  #CALL ADD FUNCTION
  startAdd = ()->
    fields = [['addresses', false], ['andamentos', false], ['contacts', false], ['contatos', true], ['documents', false], ['emails', false],
      ['enderecos', false], ['histories', false], ['legals', false], ['lines', false], ['notes', false], ['partners', false], ['warranties', false],
      ['phones', false], ['telefones', false]]
    $.each fields, (index, element)->
      add(element[0], element[1])

  #JQUERY 3RD PARTY CONFIG
  #VALIDATE CONFIG
  validate = () =>
    $('.date').mask '00/00/0000'
    $('.time').mask '00:00:00'
    $('.date_time').mask '00/00/0000 00:00:00'
    $('.cep').mask '00000-000'
    $('.phone').mask '0000-0000'
    $('.phone_with_ddd').mask '(00) 0000-0000'
    $('.phone_us').mask '(000) 000-0000'
    $('.mixed').mask 'AAA 000-S0S'
    $('.cpf').mask '000.000.000-00', reverse: true
    $('.cnpj').mask '00.000.000/0000-00', reverse: true
    $('.money').mask '000.000.000.000.000,00', reverse: true
    $('.money2').mask "#.##0,00", reverse: true
    $('.ip_address').mask '0ZZ.0ZZ.0ZZ.0ZZ', translation: 'Z': pattern: /[0-9]/, optional: true
    $('.ip_address').mask '099.099.099.099'
    $('.percent').mask '##0,00%', reverse: true
    $('.clear-if-not-match').mask "00/00/0000", clearIfNotMatch: true
    $('.placeholder').mask "00/00/0000", placeholder: "__/__/____"
    $('.fallback').mask "00r00r0000", translation:
        'r': pattern: /[\/]/
        fallback: '/'
      placeholder: "__/__/____"
    $('.selectonfocus').mask "00/00/0000", selectOnFocus: true

  #CHOSEN
  chose = () ->
    $('.chosen-select').chosen
      allow_single_deselect: true
  startAdd()
  chose()




