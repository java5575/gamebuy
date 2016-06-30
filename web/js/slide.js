$(function(){
	// 先取得 #slide 及寬度
	// 再取得 ul 及其內容
	var $slide = $('#slide'),
		$ul = $slide.find('ul'), 
		_liHtml = $ul.html(), 
		_width = $slide.width() * -1, 
		isComplete = true, 
		_animateSpeed = 400;

	// 宣告輪動用的計時器及輪播速度
	var timer, 
		speed = 4000 + _animateSpeed, 
		isHover = false;
	
	// 把 ul 的內容重覆 2 次
	$ul.html(_liHtml+_liHtml+_liHtml);

	// 取得全部的 li 及計算共有幾個 li 及每組 li 的數量
	var $li = $ul.find('li'), 
		_totalLength = $li.length, 
		_length = _totalLength / 3, 
		_index = _length;
	
	// 先把 $ul 移動到第二組的第一個
	$ul.css('left', _index * _width);
	
	// 當按下 .prev 鈕時
	$('.prev').click(function(event){
		event.preventDefault();

		// 若上一個動畫未完成, 則不做任何動作
		if(isComplete == false) return false;
		
		// 先停止計時器
		clearTimeout(timer);
		isComplete = false;
		// 計算上一張的號碼
		_index = (_index - 1 + _totalLength) % _totalLength;

		// 進行移動
		$ul.animate({
			left: 	_index * _width
		}, _animateSpeed, function(){
			//判斷是否跑到第一組的最後一張
			if(_index < _length){
				// 移回第二組最後一張並把 _index 設為相對應的號碼
				$ul.css('left', (_length  * 2 - 1) * _width);
				_index = _length  * 2 - 1;
			}
			isComplete = true;
			// 若滑鼠不在 $slide上時才啟動計時器
			if(isHover == false){
				timer = setTimeout(auto, speed);
			}
		});
	});
	
	// 當按下 .next 鈕時
	var $next = $('.next').click(function(event){
		event.preventDefault();

		// 若上一個動畫未完成, 則不做任何動作
		if(isComplete == false) return false;
		
		// 先停止計時器
		clearTimeout(timer);
		isComplete = false;
		// 計算下一張的號碼
		_index = (_index + 1) % _totalLength;

		// 進行移動
		$ul.animate({
			left: 	_index * _width
		}, _animateSpeed, function(){
			//判斷是否跑到第三組的第一張
			if(_index >= _length * 2){
				// 移回第二組第一張並把 _index 設為相對應的號碼
				$ul.css('left', _length * _width);
				_index = _length;
			}
			isComplete = true;
			// 若滑鼠不在 $slide上時才啟動計時器
			if(isHover == false){
				timer = setTimeout(auto, speed);
			}
		});
	});
	
	// 當滑鼠移到 $slide 上時, 先停止計時器
	// 移出 $slide 時, 則啟動計時器
	$slide.hover(function(){
		clearTimeout(timer);
		isHover = true;
	}, function(){
		isHover = true;
		timer = setTimeout(auto, speed);
	});
	
	// 自動輪播使用
	function auto(){
		$next.click();
		timer = setTimeout(auto, speed);
	}
	
	// 啟動計時器
	timer = setTimeout(auto, speed);
});