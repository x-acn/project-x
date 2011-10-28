/* Full screen fixed position backround image:
  Usage:
    - insert image tag after body: <%= image_tag "ios-linen.jpg", :id => "bg" %>
    - create css styles:
      #bg { position: fixed; top: 0; left: 0; z-index: 500;}
      .bgwidth { width: 100%; }
      .bgheight { height: 100%; }
*/
$(window).load(function() {    

        var theWindow        = $(window),
            $bg              = $("#bg"),
            aspectRatio      = $bg.width() / $bg.height();

        function resizeBg() {

                if ( (theWindow.width() / theWindow.height()) < aspectRatio ) {
                    $bg
                        .removeClass()
                        .addClass('bgheight');
                } else {
                    $bg
                        .removeClass()
                        .addClass('bgwidth');
                }

        }

        theWindow.resize(function() {
                resizeBg();
        }).trigger("resize");

});