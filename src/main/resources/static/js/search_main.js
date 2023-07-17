$(document).ready(function() {

	/** 검색 필터링 **/
	function applyFilters() {
		var filters = []; // 필터링 배열
		var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked'); // 체크박스 배열
		
		checkboxes.forEach(function(checkbox) { // 체크박스 배열 저장하기
			filters.push(checkbox.value);
		});
		
		var items = document.querySelectorAll('#dataList li'); // 병원 리스트 배열
		
		items.forEach(function(item) {
			var itemFilters = item.getAttribute('data-filter').split(' ');
			
			if (filters.every(function(filter) {
				return itemFilters.includes(filter);
			})) {item.style.display = 'block';
			} else {
				item.style.display = 'none';
			}
		});
	}
	
	var checkboxes = document.querySelectorAll('input[type="checkbox"]');

	checkboxes.forEach(function(checkbox) {
		checkbox.addEventListener('change', applyFilters);
	});
	
	
	/** 지역 하나만 선택 **/
	$('input[type="checkbox"][name="gloc"]').click(function(){
		if($(this).prop('checked')){
			$('input[type="checkbox"][name="gloc"]').prop('checked',false);
			$(this).prop('checked',true);
		}
	});
	
	
	/** 진료 중 표시 **/
	// 시간 변수
	var today = new Date();
	var hours = ('0' + today.getHours()).slice(-2);
	var minutes = ('0' + today.getMinutes()).slice(-2);
	var nowTime = hours + minutes;
	var isWeekend = isSaturdayOrSunday(today);
	
	function isSaturdayOrSunday(date) { // 토요일, 일요일 확인
		var dayOfWeek = date.getDay();
		return {
			isWeekend: dayOfWeek === 6 || dayOfWeek === 0,
			dayOfWeek: dayOfWeek
		};
	}
	
	// 시간 표시
	$('ul#dataList li').each(function() {
		var $this = $(this);
		var startTime = $this.find('input#startTime').val().replace(':', '');
		var endTime = $this.find('input#endTime').val().replace(':', '');
		var holiday = $this.find('input#holiday').val();
			
			if (holiday == '휴일: X') { // 휴일영업X
				if (parseInt(nowTime) > parseInt(endTime) || parseInt(nowTime) < parseInt(startTime) || (isWeekend.isWeekend && (isWeekend.dayOfWeek === 6 || isWeekend.dayOfWeek === 0))) {
					$this.find('span#htime').hide();
					var dataFilter = $this.attr('data-filter');
					dataFilter = dataFilter.replace('time', '');
					$this.attr('data-filter', dataFilter);
				}
			 } else if (holiday == '휴일: O') { // 휴일영업O
			 	if (parseInt(nowTime) > parseInt(endTime) || parseInt(nowTime) < parseInt(startTime)) {
			 		$this.find('span#htime').hide();
			 		var dataFilter = $this.attr('data-filter');
			 		dataFilter = dataFilter.replace('time', '');
			 		$this.attr('data-filter', dataFilter);
		 		 }
	 		 }
 		 });
	
}); //document 