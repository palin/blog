class Blog.Views.Post extends Backbone.View

  el: '#posts'
  events:
    'keyup .content_input': 'countLetters'
    'keyup .author_input': 'countLetters'
    'click #new_comment [type=submit]': 'submit'
  bindings:
    '.author_input': 'author'
    '.content_input': 'content'

  initialize: ->
    hljs.initHighlighting()
    @model = new Blog.Models.Comment(post_id: gon.post_id)
    $("#flash").fadeOut(3000)

  render: ->
    @stickit()

  countLetters: (e)->
    input = $(e.currentTarget)
    span_counter = input[0].classList[input[0].classList.length-1]
    max = parseInt(input.attr('maxlength'), 10)
    now = input.val().length
    if now > max
      input.val(input.val().substr(0, max))
    left = max - now
    span = @$el.find(".#{span_counter}_wrapper .letters_counter span")
    if span?
      span.text(left)
      if left == 0
        span.toggleClass("zero_left")
      else
        span.removeClass("zero_left")

  submit: (e)->
    e.preventDefault()
    if @model.isValid(true)
      @model.save(@$('#new_comment').serialize(), @handleSuccess, @handleErrors)
    else false

  handleSuccess: (response)=>
    @$("#new_comment_link").fadeOut('fast')
    @$("#add_new_comment").fadeOut('slow')
    @$(".no_comments").fadeOut('slow')
    comment_view = new Blog.Views.Comment(model: @model)
    @$("#comments_section").prepend(comment_view.$el)
    window.location = window.location.origin + window.location.pathname + "#comments"
    comment_view.render()
    @showNotice()

  handleErrors: (errors)->
    true

  showNotice: ->
    flash = $("body #flash")
    flash.find("#notice span.text").text("GOWNO")
    flash.show()
