var slider2=document.getElementById("myRange2");
var value2 = document.getElementById("value2");

value2.innerHTML = slider2.value;

slider2.oninput = function() {
    value2.innerHTML=this.value;
}
