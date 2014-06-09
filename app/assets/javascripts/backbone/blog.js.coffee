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
    @handleGoToTop()

  apiRoot: (version=1)->
    window.location.protocol + "//" + window.location.host + "/api/v#{version}"

  includeFB: (d, s, id)->
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    return  if d.getElementById(id)
    js = d.createElement(s)
    js.id = id
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1"
    fjs.parentNode.insertBefore js, fjs

  handleGoToTop: ->
    $('#go_to_top').click ->
      $('html, body').animate({ scrollTop: 0 }, 200)

$ ->
  Blog.includeFB(document, "script", "facebook-jssdk")
  Blog.init()
  FB?.init
    appId: "322533301218677"
    status: true
    xfbml: true
