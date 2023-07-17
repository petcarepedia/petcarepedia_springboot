$(document).ready(function() {
    var hid = $('input[name="hid"]').val();
    initGlocMap(hid);
    
    function initGlocMap(hid) {
        $.ajax({
            url: "search_result_map.do?hid=" + hid,
            success: function(result) {
                let jobj = JSON.parse(result);
                var position = new naver.maps.LatLng(jobj.x, jobj.y);
                
                var map = new naver.maps.Map('map', {
                    center: position,
                    zoom: 18
                });
                
                var marker = new naver.maps.Marker({
                    map: map,
                    title: jobj.hname,
                    position: position
                });
            }
        });
    }
});
