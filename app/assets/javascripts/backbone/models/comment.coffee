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
    @set(response)
    success(response)

  errorsDecorator: (errors)->
    _.each _.keys(errors), (key)->
      messages = errors[key]

  neatCreatedAt: ->
    date = new Date(@get('created_at'))
    time = date.getHours() + ":" + date.getMinutes()
    month = date.getMonth() + 1
    month = if month < 10 then "0#{month}" else month
    fullDate = date.getDate() + "/" + month + "/" + date.getFullYear()
    time + ", " + fullDate

_.extend Blog.Models.Comment.prototype, Backbone.Validation.mixin
