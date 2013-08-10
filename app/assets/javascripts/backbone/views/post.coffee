class Blog.Views.Post extends Backbone.View

  el: '#posts'
  events:
    'keyup #comment_author': 'countLetters'
    'keyup #comment_content': 'countLetters'

  countLetters: (e)->
    input = $(e.currentTarget)
    span_counter = input[0].classList[input[0].classList.length-1]
    max = parseInt(input.attr('maxlength'), 10)
    now = input.val().length
    left = max - now
    span = @$el.find(".#{span_counter} .letters_counter span")
    if span?
      span.text(left)
      if left == 0
        span.addClass("zero_left")
      else
        span.removeClass("zero_left")
