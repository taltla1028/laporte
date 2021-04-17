/*특정 게이지바를 지정 */
var slider1=document.getElementById("myRange1");
var value1 = document.getElementById("value1");

/* 게이지바 옆에 숫자자체를 표현시키는거 */
value1.innerHTML = slider1.value; 

/* 게이지바 옆에 숫자를 클릭할때마다 숫자를 바꿔주는 역할 */
slider1.oninput = function() {
     value1.innerHTML=this.value;
}
