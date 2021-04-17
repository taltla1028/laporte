var slider3=document.getElementById("myRange3");
var value3 = document.getElementById("value3");

value3.innerHTML = slider3.value;

slider3.oninput = function() {
    value3.innerHTML=this.value;
}