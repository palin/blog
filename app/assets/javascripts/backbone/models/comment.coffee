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
    hour = @addZero(date.getHours())
    minutes = @addZero(date.getMinutes())
    time = hour + ":" + minutes

    day = @addZero(date.getDate())
    month = @addZero(date.getMonth() + 1)
    fullDate = day + "/" + month + "/" + date.getFullYear()

    time + ", " + fullDate

  addZero: (number)->
    if number < 10 then "0#{number}" else number

_.extend Blog.Models.Comment.prototype, Backbone.Validation.mixin
