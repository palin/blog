class Blog.Views.Comment extends Marionette.ItemView

  template: JST["backbone/templates/comment"]

  serializeData: ->
    data: @model.attributes
