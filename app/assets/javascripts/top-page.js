$(function(){
	
	var sld_wrap = $('#slider'),
	sld_navi = '#sld_nav',
	sld = '.sld',
	sld_max = $(sld).length,
	sld_pre = 'sld',
	sld_time = 1000,
	sld_wait = 5000,
	sld_timer, goaway_left, from_left, sld_direction;
	$.fn.slide_move = function(options){
		var settings = $.extend( {
			'direction': 'next'
		}, options);
		return this.each(function(i, elem) {
			clearTimeout(sld_timer);
			var sldnum = parseInt(sld_wrap.data('sldnum'));
			if(settings.direction === 'prev'){
				goaway_left = '100%';
				from_left = '-100%';
			} else {
				goaway_left = '-100%';
				from_left = '100%';
			}
			$(sld + '.current').stop().animate({'left':goaway_left},sld_time);
			$(sld).not('#' + sld_pre + sldnum).removeClass('current');
			$('#' + sld_pre + sldnum).css({'left':from_left}).addClass('current').stop().animate({'left':0}, sld_time, function(){
				sld_timer = setTimeout(function(){
					sld_wrap.slide_next();
				}, sld_wait);
			});
			$('.sld_navi_circle').not('#sld_navi' + sldnum).removeClass('current');
			$('#sld_navi' + sldnum).addClass('current');
		});
	};
	$.fn.slide_next = function(){
		return this.each(function(i, elem) {
			var sldnum = parseInt(sld_wrap.data('sldnum'));
			sldnum++;
			if(sldnum > sld_max){ sldnum = 1; }
			sld_wrap.data('sldnum', sldnum).slide_move();
		});
	};
	$.fn.slide_prev = function(){
		return this.each(function(i, elem) {
			var sldnum = parseInt(sld_wrap.data('sldnum'));
			sldnum--;
			if(sldnum < 1){ sldnum = sld_max; }
			sld_wrap.data('sldnum', sldnum).slide_move({'direction': 'prev'});
		});
	};
	sld_wrap.on('click', '.sld_navi_circle', function(){
		var sldnum = parseInt(sld_wrap.data('sldnum'));
		var sldnavi_num = parseInt($(this).data('sldnum'));
		if(sldnum > sldnavi_num){
			sld_direction = 'prev';
		} else {
			sld_direction = 'next';
		}
		sld_wrap.data('sldnum', sldnavi_num).slide_move({'direction': sld_direction});
	});
	$('#sld_next').click(function(){
		sld_wrap.slide_next();
	});
	$('#sld_prev').click(function(){
		sld_wrap.slide_prev();
	});
	$(window).load(function() {
		var sld_count = 1;
		var sld_navi_class;
		$(sld).each(function(){
			if(sld_count === 1){ sld_navi_class = 'sld_navi_circle current'; } else { sld_navi_class = 'sld_navi_circle' }
			$(sld_navi).append('<a id="sld_navi' + sld_count + '" class="' + sld_navi_class +'" data-sldnum="' + sld_count + '">&nbsp;</a>');
			sld_count++;
		});
		var sld_timer = setTimeout(function(){
			sld_wrap.data('sldnum', 1).slide_move();
		}, 0);
	});
});
