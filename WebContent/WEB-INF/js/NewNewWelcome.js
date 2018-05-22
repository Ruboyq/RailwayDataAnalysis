/**
 * 
 */

/*$(document).ready(function(){
	$.ajax({
		type:'POST',
		url: 'ShowWelcome',
		dataType:'json',
		async:false,
		cache:false,
		success:function(data){
			var res = data.status;
			if(res == 'n'){
				alert("实时道路信息显示异常!请刷新页面重试!");
			}
			if(res == 'y'){
				var n = 0;
				var colors = ["green","yellow","red","blue","light-blue","orange"];
				$.each(data.charts,function(i,item){
					var num = item.num*3;
					document.getElementById("roadsInfo").getElementsByTagName("li")[n].innerHTML = item.road_name+"<span class=\"pull-right\">"
						+num+"%</span><div class=\"progress progress-striped active progress-right\"><div class=\"bar "+colors[n]+"\" style=\"width:"+num+"%;\"></div></div>";
					n++;	
				});
			    }
			}
		});
});  */

var menuLeft = document.getElementById( 'cbp-spmenu-s1' ),
showLeftPush = document.getElementById( 'showLeftPush' ),
body = document.body;

showLeftPush.onclick = function() {
classie.toggle( this, 'active' );
classie.toggle( body, 'cbp-spmenu-push-toright' );
classie.toggle( menuLeft, 'cbp-spmenu-open' );
disableOther( 'showLeftPush' );
};

function disableOther( button ) {
if( button !== 'showLeftPush' ) {
	classie.toggle( showLeftPush, 'disabled' );
}
}