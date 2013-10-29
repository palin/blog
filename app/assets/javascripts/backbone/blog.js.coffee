#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Blog =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {
    Home: {}
  }
  currentView: null

  init: ->
    if @currentView?
      @currentView.undelegateEvents()
      @currentView = null

    viewName = $("body").data("view")
    @currentView = new Blog.Views[viewName]() if Blog.Views[viewName]?
    @currentView.render() if @currentView

  apiRoot: (version=1)->
    window.location.protocol + "//" + window.location.host + "/api/v#{version}"

$ ->
  Blog.init()
