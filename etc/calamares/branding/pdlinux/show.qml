import QtQuick 2.0  // Basic QML
import calamares.slideshow 1.0  // Calamares slideshow: Presentation
import io.calamares.ui 1.0  // Calamares internals: Branding

/* *Presentation* comes from the pre-installed calamares.slideshow
 * that comes with Calamares itself. See `Presentation.qml` in the
 * Calamares repository for details and documentation.
 *
 * The important parts of presentation are:
 *  - it has a property *activatedInCalamares* which is set to *true*
 *    when the slideshow becomes visible, *false* afterwards.
 *  - it expects one or more children with a property *isSlide*
 *    set to *true*.
 *  - it has a function *goToNextSlide()* to do just that (where
 *    "slides" is the sequence of children that have property
 *    *isSlide* set to *true*.
 *
 */
Presentation
{
    id: presentation

    /* This timer ticks once per second (1000ms, set in *interval*)
     * and calls *goToNextSlide()* each time. Note that it needs
     * to know the *id* of the presentation, so keep *id* (above)
     * matched with the function call.
     *
     * The timer starts when the presentation is activated; you could
     * also set *running* to true, but that might cost extra resources.
     */
    Timer {
        interval: 10000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.goToNextSlide()
        id: advanceTimer
    }

    /* These functions are called when the presentation starts and
     * ends, respectively. They could be used to start the timer,
     * but that is done automatically through *activatedInCalamares*,
     * so there's nothing **to** do.
     *
     * Leaving these functions out is fine, although Calamares will
     * complain that they are missing, then.
     */
    function onActivate() { }
    function onLeave() { }


    /* A presentation is an Item: it has no visual appearance at all.
     * Give it a background, which fills the whole area of the presentation.
     * Setting *z* to a low value places this rectangle **behind** other
     * things in the presentation -- which is correct for a background.
     *
     * This uses the background set in the styles section of `branding.desc`.
     */
    Rectangle {
        id: mybackground
        anchors.fill: parent
        color: Branding.styleString(Branding.SidebarBackground)
        z: -1
    }

    /* The *ImageSlide* is a component unique to this branding directory.
     * The QML file `ImageSlide.qml` can be stored alongside `show.qml`
     * and it will be loaded on-demand. See the documentation in that
     * file for details, but it comes down to this: for each *ImageSlide*,
     * set *src* to a suitable value (an image path in this directory)
     * and that will be displayed.
     */
    ImageSlide {
        src: "slide1.png"
    }

    ImageSlide {
        src: "slide2.png"
    }

    ImageSlide {
        src: "slide3.png"
    }

    ImageSlide {
        src: "slide4.png"
    }
    ImageSlide {
        src: "slide5.png"
    }
    ImageSlide {
        src: "slide6.png"
    }
    ImageSlide {
        src: "slide7.png"
    }
    ImageSlide {
        src: "slide8.png"
    }
    ImageSlide {
        src: "slide9.png"
    }
}
