class Blog.Views.Post extends Backbone.View

  el: '#posts'
  events:
    'keyup .content_input': 'countLetters'
    'keyup .author_input': 'countLetters'

  countLetters: (e)->
    input = $(e.currentTarget)
    span_counter = input[0].classList[input[0].classList.length-1]
    max = parseInt(input.attr('maxlength'), 10)
    now = input.val().length
    left = max - now
    span = @$el.find(".#{span_counter}_wrapper .letters_counter span")
    if span?
      span.text(left)
      if left == 0
        span.toggleClass("zero_left")
      else
        span.removeClass("zero_left")
