class Blog.Views.Comment extends Marionette.ItemView

  template: JST["backbone/templates/comment"]

  serializeData: ->
    data:
      _.extend @model.attributes, {neat_created_at: @model.get('created_at')}
