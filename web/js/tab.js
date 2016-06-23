window.onload = function(){
	
	var NOW = 1; //宣告變數，用來記錄一開始是開著的第一個。

	document.getElementById("TAB1").onclick=showIt;
	document.getElementById("TAB2").onclick=showIt;
	document.getElementById("TAB3").onclick=showIt;
	document.getElementById("TAB4").onclick=showIt;
        document.getElementById("TAB5").onclick=showIt;
        document.getElementById("TAB6").onclick=showIt;
	
	document.getElementById("TAB1").className="NOWTAB";
	
	function showIt(){
		
		//先把目前被開著的內容 BOX 關掉
		document.getElementById("BOX"+NOW).style.display="none";
		
		//宣告變數，截取使用者用滑鼠摸到的按鈕
		var N = this.id.substr(3);
		
		//把指定的內容 BOX 打開
		document.getElementById("BOX"+N).style.display="block";
		
		//把目前被開著的按鈕的白色背景樣式去掉
		document.getElementById("TAB"+NOW).className="";
		
		//把指定的按鈕套用上白色的背景樣式
		document.getElementById("TAB"+N).className="NOWTAB";
		
		//當以上的動作全部做完之後，改變 NOW 變數為目前被打開的 N 數字。
		NOW = N;

	}
	
}
