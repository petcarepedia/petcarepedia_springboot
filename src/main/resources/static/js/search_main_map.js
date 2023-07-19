$(document).ready(function(){
	
	/** 지역구 배열 **/
	var areaArr = new Array();
	areaArr.push(
		{location:'강남구', lat:'37.507323', lng:'127.033903'},
		{location:'강동구', lat:'37.5461969', lng:'127.1300393'},
		{location:'강북구', lat:'37.6319166', lng:'127.0273517'},
		{location:'강서구', lat:'37.551111918342', lng:'126.84930138784'},
		{location:'관악구', lat:'37.4631968', lng:'126.9358124'},
		{location:'광진구', lat:'37.5407625', lng:'127.0793428'},
		{location:'구로구', lat:'	37.4962331', lng:'126.87091'},
		{location:'금천구', lat:'37.463867', lng:'126.8978067'},
		{location:'노원구', lat:'37.648541766142', lng:'127.06075433614'},
		{location:'도봉구', lat:'37.6579694', lng:'127.04359'},
		{location:'동대문구', lat:'37.578772', lng:'127.0421319'},
		{location:'동작구', lat:'37.4886232', lng:'126.9668169'},
		{location:'마포구', lat:'37.5507563', lng:'126.9254901'},
		{location:'서대문구', lat:'37.577430256146', lng:'126.93285393198'},
		{location:'서초구', lat:'37.4852806', lng:'127.0086802'},
		{location:'성동구', lat:'37.554468', lng:'127.020794'},
		{location:'성북구', lat:'37.603245', lng:'127.024959'},
		{location:'송파구', lat:'37.5057138', lng:'127.1070689'},
		{location:'양천구', lat:'37.5364895', lng:'126.8663661'},
		{location:'영등포구', lat:'37.509846', lng:'126.9170788'},
		{location:'용산구', lat:'37.5430372', lng:'126.9842488'},
		{location:'은평구', lat:'37.606123', lng:'126.922791'},
		{location:'종로구', lat:'37.579617', lng:'126.977041'},
		{location:'중구', lat:'37.5620636', lng:'127.0017451'},
		{location:'중랑구', lat:'37.591034', lng:'127.087569'}
	);
	
	/** default **/
	$(function() {
		initGlocMap('강남구');
	});
	
	/** 지역구 선택시 이동 **/
	function initGlocMap(gloc) {
		$.ajax({
			url : "main_map_data/"+gloc,
			success : function(result){
					let jdata = JSON.parse(result);
					
					let markers = new Array();
					let infoWindows = new Array();
					
					for(var i=0; i<areaArr.length; i++){
						if(gloc==areaArr[i].location){
							var map = new naver.maps.Map('map', {
								center: new naver.maps.LatLng(areaArr[i].lat, areaArr[i].lng),
								zoom: 14
							});
							
							i=areaArr.length;
						}
					}
					
					/*db-병원데이터 연결해서 marker 표시하기*/
					for(obj of jdata.jlist){
						var marker = new naver.maps.Marker({
							map: map,
							title: obj.hname,
							position: new naver.maps.LatLng(obj.x, obj.y)
						});
						
						/** 클릭시 병원 정보 **/
						var contentString = [
					        '<div class="iw_inner" style="padding:10px;">',
					        '   <div style="clear:both;margin-bottom:5px;">',
					        '	<img src="http://localhost:9000/petcarepedia/images/foot_98DFFF.png" width="20px" height="20px">',
					        '	<a href="http://localhost:9000/petcarepedia/search_result.do?hid='+obj.hid,
					        '" style="font-size:18px;text-decoration:none;color:#3d3d3d;font-weight:bold;">'+obj.hname+'</a></div>',
					        '   <p style="font-size:12px;color:darkgray;margin-bottom:5px">Time | '+obj.htime+'<br>Tel | '+obj.tel+'</h3>',
					        '   <p style="font-size:13px;color:#636363">'+obj.loc+'</p>',
					        '</div>'
					    ].join('');
			
						var infowindow = new naver.maps.InfoWindow({
						    content: contentString,
						    maxWidth: 250,
						    backgroundColor: "white",
						    borderColor: "#98dfff",
						    borderWidth: 3,
						    pixelOffset: new naver.maps.Point(0, 10)
						});
						
						markers.push(marker);
						infoWindows.push(infowindow);
					};
					
					function getClickHandler(seq){
						return function(e) {
							var marker = markers[seq],
								infowindow = infoWindows[seq];
							
							if (infowindow.getMap()) {
						        infowindow.close();
						    } else {
						        infowindow.open(map, marker);
						    }
						}
					}
					
					for (var i=0, ii=markers.length; i<ii; i++) {
						naver.maps.Event.addListener(markers[i],'click',getClickHandler(i));
					}
				}
		});
	}
	
	$(document).on("click", ".gloc", function() {
		initGlocMap($(this).val());
	});

});