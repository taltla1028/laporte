var slider7=document.getElementById("myRange7");
var value7 = document.getElementById("value7");

value7.innerHTML = slider7.value;

slider7.oninput = function() {
    value7.innerHTML=this.value;
}
