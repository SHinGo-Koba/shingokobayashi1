// $(function() {
  
// $(document).on('turbolinks:load',function() {

//   var header = $('header');
//   var main = $('.main');
//   var flash = $('#flash');

//   $(window).on('load resize',function() {
//     var headerHeight = header.outerHeight(true);
//     main.css('padding-top', headerHeight-1);
//     flash.css('top', headerHeight-1);
//   });
  
// //actions//
//   flash.slideDown('slow', upFunc);
//       function upFunc() {
//         setTimeout(function() {
//           flash.slideUp('slow');
//         }, 1000);
//       }

//   $('.about-contents-guide-each a').click(function(){
//     var id = $(this).attr('href');
//     var position = $(id).offset().top;
//     $('html, body').animate({
//       'scrollTop': position
//     }, 1000);
//   });

//   $('#menu-bar').click(function() {
//     if ($('.header-fixed-contents').hasClass('showup-menu-bar')) {
//       $('.header-fixed-contents').slideUp('slow', remClass);
//         function remClass() {
//           $('.header-fixed-contents').removeClass('showup-menu-bar');
//         }
//     } else {
//       $('.header-fixed-contents').slideDown('slow', addClass);
//         function addClass() {
//         $('.header-fixed-contents').addClass('showup-menu-bar');
//         }
//     }
//   });
  
  
//   $(window).scroll(function() {
//     var headerPc = $('.header-pc');
//     var headerFixed = $('.header-fixed');
//     var displayBlock = 'display-block';
//     var displayNone = 'display-none';
//     var winTop = $(this).scrollTop();
//     var headerHeight = header.outerHeight(true);

//     if (winTop >= headerHeight) {
//         header.addClass('menu-bar-position');
//       if (!headerPc.hasClass(displayBlock)) {
//         headerPc.addClass(displayNone);
//         headerFixed.addClass(displayBlock);
//       } else {
//         remAddClass(headerPc, displayBlock, displayNone);
//         remAddClass(headerFixed, displayNone, displayBlock);
//       }
//     } else {
//         header.removeClass('menu-bar-position');
//         remAddClass(headerFixed, displayBlock, displayNone);
//         remAddClass(headerPc, displayNone, displayBlock);
//     }
//     function remAddClass(headerPart, rClass, aClass) {
//       headerPart.removeClass(rClass);
//       headerPart.addClass(aClass);
//     }
//   });

// });

// });