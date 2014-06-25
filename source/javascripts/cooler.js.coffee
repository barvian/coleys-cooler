$(document).ready ->

  # Initialize sliders
  $('.slider').each (index) ->
    $slider = $(this)
    $pagination = $('.slider__pagination', $slider)
    $paginationPages = $('> li', $pagination)

    opts =
      startSlide: $slider.data('slider-start-slide')
      speed: $slider.data('slider-speed')
      auto: $slider.data('slider-auto')
      continuous: $slider.data('slider-continuous')
      disableScroll: $slider.data('slider-disable-scroll')
      stopPropagation: $slider.data('slider-stop-propagation')
      callback: (index, elem) ->
        if $slider.data('slider-paginated')
          $paginationPages.removeClass('current').eq(index).addClass('current')

    swipe = new Swipe this, opts

    if $slider.data('slider-paginated')
      $paginationPages.eq(swipe.getPos()).addClass('current')
      $pagination.on 'click', 'a', (event) ->
        event.preventDefault()
        swipe.slide $(this).data('target')

  # Expandables
  $('.expandable').each (index) ->
    $expandable = $(this)
    $expandableMore = $('.expandable__more', $expandable)
    $expandableFooter = $('.expandable__footer', $expandable)

    $expandable.expandables '.expandable__expander',
      callback: (element, expanded) ->
        if not expanded
          $expandableMore.slideDown()
          $expandableFooter.fadeOut()
