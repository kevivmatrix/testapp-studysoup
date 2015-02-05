testapp = { model: {}, collection: {}, view: {} }

$ ->
  testapp.model.product = Backbone.Model.extend()

  testapp.collection.product = Backbone.Collection.extend
    model: testapp.model.product

  testapp.view.product = Backbone.View.extend
    tagNmae: 'div'
    className: 'product_wrapper'
    initialize: ->
      @template = _.template $("#product_template").html()
    render: ->
      $(@el).html @template @model.toJSON()
      @

  testapp.current_query = ""
  testapp.current_filter = []

  fetch_and_render_products = ()->
    $("#loader").show()
    clear_products_view()
    $.ajax "/products.json",
      data:
        query: testapp.current_query
        filter: testapp.current_filter
      success: (response)->
        testapp.collection.product_object.reset(response)
        $("#loader").hide()
        _.each testapp.collection.product_object.models, (model)->
          view = new testapp.view.product
            model: model
          $("#products").append view.render().el

  clear_products_view = ()->
    $("#products").empty()

  testapp.collection.product_object = new testapp.collection.product()
  fetch_and_render_products()

  $("#query_text_field").keyup ->
    testapp.current_query = $("#query_text_field").val()
    fetch_and_render_products()

  $(".filter_checkbox").change ->
    testapp.current_filter = _.map $('input[name="filter"]:checked'), (element)->
      element.value
    fetch_and_render_products()
  