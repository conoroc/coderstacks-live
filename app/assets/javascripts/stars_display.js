
$(function() {

    $('.raty-stars').raty({
        path: '/assets/',
        readOnly: true,
        number: 10,
        numberMax: 10,
        hints: null,
        space: false,
        score: function() {
            return $(this).attr('data-score');
        }

    });

    $('#star-rating').raty({
        path: '/assets/',
        number: 10,
        numberMax: 10,
        hints: null,
        space: false,
        scoreName: 'review[score]'

    });

});