    function scroll_to_elem(elem,speed) {
        if(document.getElementById(elem)) {
            var destination = jQuery('#'+elem).offset().top;
            jQuery("html,body").animate({scrollTop: destination}, speed);
        }
    }

    
    function click1() {
       event.preventDefault();
       $('#hide1').closest('div').html('');

    }
    $( document ).ready(function() {

        $(function () {
            $(".comment").slice(0, 2).show();
            $("#loadMore").on('click', function (e) {
                e.preventDefault();
                $(".comment:hidden").slice(0, 2).slideDown();
                if ($(".comment:hidden").length == 0) {
                    $("#load").fadeOut('slow');
                }
                $('html,body').animate({
                    scrollTop: $(this).offset().top
                }, 1500);
            });
        });

        $('#top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 600);
            return false;
        });

        $(window).scroll(function () {
            if ($(this).scrollTop() > 50) {
                $('.totop a').fadeIn();
            } else {
                $('.totop a').fadeOut();
            }
        });






    });

