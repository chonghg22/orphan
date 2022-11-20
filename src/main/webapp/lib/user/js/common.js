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
		var $gnbDep2 = $('.mobile-gnb .gnb-dep2 > li > a');
		var $gnbOpen = $('.mobile-btn');
		var $gnbClose = $('.gnb-close');
        $gnbDep1.on('click', function () {
			if($(this).closest('li').hasClass('on')){
				$(this).closest('li').find('ul').slideUp();
				$(this).closest('li').find('li').removeClass('on');
				$(this).closest('li').removeClass('on');		
			} else {
				$(this).closest('li').addClass('on');
				$(this).closest('li').siblings().removeClass('on');
				$(this).closest('li').siblings().find('ul').slideUp();
				$(this).closest('li').find('.gnb-dep2').slideDown();
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
			$gnbClose.show();
		});
		$gnbClose.on('click', function () {
			$gnbClose.hide();
			$('.mobile-gnb').hide();
			$('.mobile-gnb').find('li').removeClass('on');
			$('.mobile-gnb .gnb-dep2').hide();
			$('.mobile-gnb .gnb-dep3').hide();
			$('body').removeClass('fixed');
        });	
        $('.mobile-gnb .gnb-dep2 li').each(function(){
			if($(this).find('> ul').length){
				$(this).find('> a').addClass('on');
			}
		});
    };
	
	
	$(window).resize(function() {
		$('.gnb-drop > ul > li a').off('click');
		if($(window).width() > 1000) {
			$('.gnb-open').removeClass('mobile-btn');
			$('.gnb-open').addClass('pc-btn');
			$('.gnb-drop').removeClass('mobile-gnb');
			$('.gnb-drop').addClass('all-nav');
			$('.pc-btn.gnb-open').removeClass('on');
			$('.gnb-close').hide();
			$('.gnb-dep2').css('display','');
		} else {
			$('.gnb-open').removeClass('pc-btn');
			$('.gnb-open').addClass('mobile-btn');
			$('.gnb-drop').removeClass('all-nav');
			$('.gnb-drop').addClass('mobile-gnb');
			$('.gnb-drop').hide();
			$('.gnb-close').hide();
			mobileGnb();
		}
	});
	$(window).on('load',function(){
		if($(window).width() > 1000) {
			$('.gnb-open').removeClass('mobile-open');
			$('.gnb-open').addClass('pc-btn');
			$('.gnb-drop').removeClass('mobile-gnb');
			$('.gnb-drop').addClass('all-nav');
			$('.gnb-drop > ul > li > a').off('click');
		} else {
			$('.gnb-open').removeClass('pc-btn');
			$('.gnb-open').addClass('mobile-btn');
			$('.gnb-drop').removeClass('all-nav');
			$('.gnb-drop').addClass('mobile-gnb');
			mobileGnb();
		}
		var popLength = $('.layerpopup_con').length;
		if(popLength == '2'){
			$('.layerpopup_con').eq(0).addClass('pop2_01');
			$('.layerpopup_con').eq(1).addClass('pop2_02');
		} else if(popLength == '3'){
			$('.layerpopup_con').eq(0).addClass('pop3_01');
			$('.layerpopup_con').eq(1).addClass('pop3_02');
			$('.layerpopup_con').eq(2).addClass('pop3_03');;
		}
	});

	/*all nav*/
	$('.gnb-open.pc-btn').on('click',function(){
		$(this).toggleClass('on');
		$('body').toggleClass('fixed');
		$('.all-nav').fadeToggle();
		$('.header .gnb-open').css('z-index','4')
		$('.top-search-btn').removeClass('on');
		$('.top-search').hide();
	});


	/*header sticky*/
	$(window).on('scroll',function(){ 
        var windowH = $(window).height();
		if ($(document).scrollTop() > 100) {
			$('.header-wrap').addClass('on');
		} else {
			$('.header-wrap').removeClass('on');
		}
        
        if ($(document).scrollTop() > windowH) {
			$('.btn-gotop').css('position','fixed');
		} else {
			$('.btn-gotop').css('position','absolute');
		}
	});
	
	/*top search*/
	$('.top-search-btn').on('click',function(e){
		e.preventDefault();
		$(this).toggleClass('on');
		$('.top-search').toggle();
		$(this).text($(this).text() === "검색열기" ? "검색닫기" : "검색열기");
		$('.all-nav-btn').removeClass('on');
		$('.all-nav').fadeOut();
	});
	
	/*relation site*/	
	var relateSiteBtn = $('.relate-site button');
	relateSiteBtn.on('click',function(){
		var relateSite = $(this).closest('.relate-site');
		if(!relateSite.hasClass('on')){
			relateSite.addClass('on');
			relateSite.find('ul').slideDown();
		} else {
			relateSite.removeClass('on');
			relateSite.find('ul').slideUp();
		}
	});
	
	/*drop toggle*/
	function dropToggle() {
		var dropBtn = $('.drop .drop-btn');
		dropBtn.on('click',function(){
			$(this).toggleClass('on');
			$(this).closest('.drop').siblings().find('.drop-btn').removeClass('on');
			$(this).closest('.drop').siblings().find('.drop-list').slideUp();
			$(this).closest('.drop').find('.drop-list').slideToggle('fast');
		});
	}
	dropToggle();
	

	
    /*popup*/
	function layerPopup() {
		var $this;
		$('.pop-open-btn').on('click', function () {
			var modal = $(this).data('modal');
			$('body').css('overflow', 'hidden');
			$(modal).attr('tabindex',0).show().focus();
			$this = $(this);
		});
		$('.popup-wrap .close').on('click', function () {
			$(this).closest('.popup-wrap').hide();
			$('body').css('overflow', 'auto');
			$this.focus();
		});
		$('.popup-wrap .focus-return').on('focus', function () {
			$(this).closest('.popup-wrap').attr('tabindex',0).focus();
		});
    }
	layerPopup();


	/*상단으로 이동*/
    function goTop() {
        $('.btn-gotop').on('click',function(){
           $('html,body').animate({scrollTop:0},500) 
        });
    };
    goTop();
    

	/*tabInpage*/
	function tabInpage() {
		var tabBtn = $('.tabInpage ul li a');
		tabBtn.on('click',function(e){
			e.preventDefault();
			var thisTxt = $(this).text();
			var tabCon = $(this).attr('href');
			$(this).parent().addClass('on');
			$(this).parent().siblings().removeClass('on');
			$(tabCon).closest('.tabInpage-con').find('> div').removeClass('on');
			$(tabCon).addClass('on');
			//$(this).closest('.tabInpage').find('.mo-drop-tit').text(thisTxt);
			//$(this).closest('.tabInpage').find('.mo-drop-tit').removeClass('on');
			//if($(window).width() <= 1000) {
				//$(this).closest('ul').hide();
				//$(this).closest('.tabInpage-con').find('.mo-drop-tit').removeClass('on');
			//}
		});
	}
	tabInpage()
	

	/*help toggle*/
	$('.help-wrap .help-btn').on('click',function(){
		$(this).toggleClass('on');
		$(this).parent('.help-wrap').find('.help-txt').fadeToggle();
	});
});












