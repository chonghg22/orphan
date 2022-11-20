$(document).ready(function () {

	/* PC Gnb */
    function gnb() {
		var $gnbList = $('.gnb').children();
		var $gnbDep2 = $('.gnb .gnb-dep2');
		var $gnbListLast = $('.gnb > li:last > .gnb-dep2 li:last');
		var $gnbBg = $('.gnb-bg');
		$gnbList.on('mouseenter focusin', function () {
			$gnbDep2.removeClass('on');
			$(this).find('.gnb-dep2').addClass('on');
			$(this).addClass('on').siblings().removeClass('on');
			$gnbBg.addClass('on');
			$('.header').addClass('on');
		});
		$gnbList.on('mouseleave', function () {
			$(this).removeClass('on');
			$gnbDep2.removeClass('on');
			$gnbBg.removeClass('on');
			$('.header').removeClass('on');
		});
		$gnbListLast.on('focusout', function () {
			$gnbList.removeClass('on');
			$gnbDep2.removeClass('on');
			$gnbBg.removeClass('on');
			$('.header').removeClass('on');
		});
	}
	gnb();

	/* mobile Gnb */
	function mobileGnb() {
		var $gnbDep1 = $('.mobile-gnb > ul > li > a');
		var $gnbDep2 = $('.gnb-dep2 > li > a');
		var $gnbOpen = $('.gnb-open');
		var $gnbClose = $('.gnb-close');
        $gnbDep1.on('click', function () {
			if($(this).closest('li').hasClass('on')){
				$(this).closest('li').find('ul').slideUp();
				$(this).closest('li').find('li').removeClass('on');
				$(this).closest('li').removeClass('on');
			} else {
				$(this).closest('li').siblings().removeClass('on');
				$(this).closest('li').siblings().find('ul').slideUp();
				$(this).closest('li').find('.gnb-dep2').slideDown();
				$(this).closest('li').addClass('on');
			}
        });
		$gnbDep2.on('click', function () {
			if($(this).closest('li').hasClass('on')){
				$(this).closest('li').find('.gnb-dep3').slideUp();
				$(this).closest('li').removeClass('on');
			} else {
				$(this).closest('li').siblings().removeClass('on')
				$(this).closest('li').siblings().find('ul').slideUp();
				$(this).closest('li').find('.gnb-dep3').slideDown();
				$(this).closest('li').addClass('on');
			}
        });
		$gnbOpen.on('click',function(){
			$('.mobile-gnb').show();
            $('.left-area').addClass('left-area-mo');
			$gnbClose.show();
		});
		$gnbClose.on('click', function () {
			$gnbClose.hide();
			$('.mobile-gnb').hide();
			$('.mobile-gnb').find('li').removeClass('on');
			$('.gnb-dep2').hide();
			$('.gnb-dep3').hide();
            $('.left-area').removeClass('left-area-mo');
        });
		$('.mobile-gnb ul li').each(function(){
			if($(this).find('> ul').length){
				$(this).find('> a').addClass('on');
			}
		});
    };
	mobileGnb();


	/*상단으로 이동*/
    function goTop() {
        $('.btn-gotop').on('click',function(){
           $('html,body').animate({scrollTop:0},500)
        });
    };
    goTop();

	/* tab */
	$('.tab_wrap ul.tabs li').click(function(){
		return;
		var tab_id = $(this).attr('data-tab');

		$('.tab_wrap ul.tabs li').removeClass('current');
		$('.tab_wrap .tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})


});

/* popup */
function popupOpen(getName) {
	$("."+ getName).css("top",(($(window).height() - $('.layerpop').outerHeight()) / 2) + $(window).scrollTop());
	$("."+ getName).css("left",(($(window).width() - $('.layerpop').outerWidth()) / 2) + $(window).scrollLeft());
	$('.mask').show();
	$("."+ getName).show();
	$('body').css('overflow','hidden');

	if($(".mask").css("display") == "none"){
		$(".mask").show();
	}
}

function popupClose(getName) {
	$("."+ getName).hide();

	if($(".layerpop").css("display") == "none"){
		$('.mask').hide();
		$('body').css('overflow','');
	}
}

function goDetail() {
	popupOpen();
}











