$(document).on("change",".star-input-num", function(e) {
			 	e.preventDefault();
			 	//만약 Range의 갯수가 늘어날 경우, 아래에 추가해주시기 바랍니다.
				var intSlider1 = parseInt(slider1.value);
				var intSlider2 = parseInt(slider2.value);
				var intSlider3 = parseInt(slider3.value);
				var intSlider4 = parseInt(slider4.value);
				var intSlider5 = parseInt(slider5.value);

				//Range Slider 들의 총합
				var sumStar = intSlider1 + intSlider2 + intSlider3 + intSlider4
						+ intSlider5
				//평균별점
				var avgStar = sumStar / 5;

				//평균별점 괄호안에 넣는 값
				$('#starOutput').text('(' + avgStar + ')');

				//평균별점의 반올림한 값을 별에 셋팅한다.
				var roundStar = Math.round(avgStar);
				console.log(roundStar);
				$(
						"input:radio[name='star-input']:input[value='"
								+ roundStar + "']").prop("checked", true);
			});