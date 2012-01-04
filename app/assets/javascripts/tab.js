// JavaScript Document

$(function() {
	$("ul.tabNavi li a").focus(function() {
		$(this).blur()
	});
})
$(function() {
	$("a.selected img").attr("src", $("a.selected img").attr("src").replace(/^(.+)(\.[a-z]+)$/, "$1_on$2"));
	$("#tabContainer p:not("+$("ul.tabNavi li a.selected").attr("href")+")").hide();
	$("ul.tabNavi li a").click(function() {
		var name1 = $("ul.tabNavi li a.selected").attr("href");
		$("a.selected img").attr("src", $("a.selected img").attr("src").replace(/^(.+)_on(\.[a-z]+)$/, "$1$2"));
		$("ul.tabNavi li a").removeClass("selected");
		$(this).addClass("selected");
		$("img",this).attr("src", $("img",this).attr("src").replace(/^(.+)_on(\.[a-z]+)$/, "$1$2"));
		$("img",this).attr("src", $("img",this).attr("src").replace(/^(.+)(\.[a-z]+)$/, "$1_on$2"));
		$(name1).hide();
		var name2 = $("ul.tabNavi li a.selected").attr("href");
		$(name2).show();
		return false;
	})
})
$(function() {
	$("ul.tabNavi a").mouseover(function(){
	var className = $(this).attr('class');
	if(className!='selected'){
	$("img",this).attr("src",$("img",this).attr("src").replace(/^(.+)(\.[a-z]+)$/, "$1_on$2"))
	}
	}).mouseout(function() {
		var className2 = $(this).attr('class');
		if(className2 != 'selected') {
			$("img",this).attr("src", $("img",this).attr("src").replace(/^(.+)_on(\.[a-z]+)$/, "$1$2"))
		}
	})
})