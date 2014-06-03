/**
 * Created with JetBrains RubyMine.
 * User: conor
 * Date: 10/30/13
 * Time: 10:13 PM
 * To change this template use File | Settings | File Templates.
 */
$(function() {
    $('#slides').slidesjs({
        effect: {
            slide: {
                // Slide effect settings.
                speed: 1900
                // [number] Speed in milliseconds of the slide animation.
            },
            fade: {
                speed: 300,
                // [number] Speed in milliseconds of the fade animation.
                crossfade: true
                // [boolean] Cross-fade the transition.
            }
        },

        navigation: {
            effect: "fade"
        },
        pagination: {
            active: true,
            effect: "fade"
        },
        play: {
            active: true,
            auto: true,
            interval: 6000,
            swap: true,
            effect: "fade"
        }
    });

});