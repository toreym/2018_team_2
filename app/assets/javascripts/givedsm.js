function set_funding_needs_listeners(){
    toggles = $('.card-container');

    toggles.on('mouseenter' ,function(event){
        $( this ).find('.card').addClass('flipped');
    });

    toggles.on('mouseleave' ,function(event){
        $( this ).find('.card').removeClass('flipped');
    });
}

function set_field_of_interest_listeners(){
    $('[data-interest-id]').on('click' , function(){
        $.ajax({
            type: "POST",
            url: '/update_user_field_of_interest',
            data: {interest_id: $(this).data('interest-id')},
            success: function(data){
                $('#preferenceContainer').html(data);
                set_field_of_interest_listeners();
                $.get('/get_funding_needs', function(data){
                    $('#interestContainer').html(data);
                    set_funding_needs_listeners();
                });
            }
        });
    });
}

$(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
        }
    });

    set_funding_needs_listeners();
    set_field_of_interest_listeners();
    $.get('/get_funding_needs', function(data){
        $('#interestContainer').html(data);
        set_funding_needs_listeners();
    });
    $.get('/get_user_field_of_interests', function(data){
        $('#preferenceContainer').html(data);
        set_field_of_interest_listeners();
    });

    $('.toggle').on('click' ,function(){
        $('.card').toggleClass('flipped');
    });

    $('#front').on('click' ,function(){
        $('.card').addClass('flipped');
    });

    $('#back').on('click' ,function(){
        $('.card').removeClass('flipped');
    });
    $('#interest-search').on('keyup', function(){
        $.debounce(250, false,
            function(){
                $.get('/get_funding_needs?search='+$(this).val(), function(data){
                    $('#interestContainer').html(data);
                    set_funding_needs_listeners();
                });
            })
    });

  $('.list-group.checked-list-box .list-group-item').each(function () {

    // Settings
    var $widget = $(this),
        $checkbox = $('<input type="checkbox" class="hidden" />'),
        color = ($widget.data('color') ? $widget.data('color') : "primary"),
        style = ($widget.data('style') == "button" ? "btn-" : "list-group-item-"),
        settings = {
          on: {
            icon: 'glyphicon glyphicon-check'
          },
          off: {
            icon: 'glyphicon glyphicon-unchecked'
          }
        };

    $widget.css('cursor', 'pointer')
    $widget.append($checkbox);

    // Event Handlers
    $widget.on('click', function () {
      $checkbox.prop('checked', !$checkbox.is(':checked'));
      $checkbox.triggerHandler('change');
      updateDisplay();
    });
    $checkbox.on('change', function () {
      updateDisplay();
    });


    // Actions
    function updateDisplay() {
      var isChecked = $checkbox.is(':checked');

      // Set the button's state
      $widget.data('state', (isChecked) ? "on" : "off");

      // Set the button's icon
      $widget.find('.state-icon')
          .removeClass()
          .addClass('state-icon ' + settings[$widget.data('state')].icon);

      // Update the button's color
      if (isChecked) {
        $widget.addClass(style + color + ' active');
      } else {
        $widget.removeClass(style + color + ' active');
      }
    }

    // Initialization
    function init() {

      if ($widget.data('checked') == true) {
        $checkbox.prop('checked', !$checkbox.is(':checked'));
      }

      updateDisplay();

      // Inject the icon if applicable
      if ($widget.find('.state-icon').length == 0) {
        $widget.prepend('<span class="state-icon ' + settings[$widget.data('state')].icon + '"></span>');
      }
    }
    init();
  });

  $('#get-checked-data').on('click', function(event) {
    event.preventDefault();
    var checkedItems = {}, counter = 0;
    $("#check-list-box li.active").each(function(idx, li) {
      checkedItems[counter] = $(li).text();
      counter++;
    });
    $('#display-json').html(JSON.stringify(checkedItems, null, '\t'));
  });
});
