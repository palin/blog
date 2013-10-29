class Blog.Models.Comment extends Backbone.Model

  urlRoot: ->
    Blog.apiRoot() + "/comments"

  save: (data, success, error)->
    $.ajax
      type: 'POST'
      url: @urlRoot()
      data: data
      success: (response)=> @parseSuccess(response, success)
      error: (response)=> @parseErrors(response, error)

  parseErrors: (response, error)->
    errors = JSON.parse(response.responseText).errors
    error(errors)

  parseSuccess: (response, success)->
    success(response)

  errorsDecorator: (errors)->
    _.each _.keys(errors), (key)->
      messages = errors[key]



_.extend Blog.Models.Comment.prototype, Backbone.Validation.mixin