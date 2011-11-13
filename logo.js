 $(document).ready(function() {
    $('#olympic_logo').click(function(event){
      var width = $('#olympic_logo')[0].clientWidth;

      var x = event.pageX - this.offsetLeft;
      var y = event.pageY - this.offsetTop;

      var radius = 80.0/600;

      var blue_center_x = 93.0/600;
      var blue_center_y = 97.0/600;
      var yellow_center_x = 200.0/600;
      var yellow_center_y = 186.0/600;
      var black_center_x = 298.0/600;
      var black_center_y = 92.0/600;
      var green_center_x = 402.0/600;
      var green_center_y = 186.0/600;
      var red_center_x = 506.0/600;
      var red_center_y = 94.0/600;

      if (Math.pow(x-blue_center_x*width, 2) + Math.pow(y-blue_center_y*width, 2) < Math.pow((radius*width), 2)) {
        var image = $('#olympic_logo');
        image.fadeOut('fast', function () {
            window.location = "index.html";

            image.attr('src', 'logo_blue.svg');
            image.fadeIn('fast');
        });
        $('.category')[0].innerHTML = 'Finance';

      }
      else if (Math.pow(x-yellow_center_x*width, 2) + Math.pow(y-yellow_center_y*width, 2) < Math.pow((radius*width), 2)) {
        var image = $('#olympic_logo');
        image.fadeOut('fast', function () {
            window.location = "index_benefits.html";
            image.attr('src', 'logo_yellow.svg');
            image.fadeIn('fast');
        });
        $('.category')[0].innerHTML = 'Benefits';
      }
      else if (Math.pow(x-black_center_x*width, 2) + Math.pow(y-black_center_y*width, 2) < Math.pow((radius*width), 2)) {
        var image = $('#olympic_logo');
        image.fadeOut('fast', function () {
            window.location = "index_state.html";
            image.attr('src', 'logo_black.svg');
            image.fadeIn('fast');
        });
        $('.category')[0].innerHTML = 'State of the Country';
      }
      else if (Math.pow(x-green_center_x*width, 2) + Math.pow(y-green_center_y*width, 2) < Math.pow((radius*width), 2)) {
        var image = $('#olympic_logo');
        image.fadeOut('fast', function () {
            window.location = "index_environment.html";
            image.attr('src', 'logo_green.svg');
            image.fadeIn('fast');
        });
        $('.category')[0].innerHTML = 'Environment';
      }
      else if (Math.pow(x-red_center_x*width, 2) + Math.pow(y-red_center_y*width, 2) < Math.pow((radius*width), 2)) {
        var image = $('#olympic_logo');
        image.fadeOut('fast', function () {
            window.location = "index_emotions.html";
            image.attr('src', 'logo_red.svg');
            image.fadeIn('fast');
        });
        $('.category')[0].innerHTML = 'Emotions';
      }

    });
});
