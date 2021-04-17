var slider6=document.getElementById("myRange6");
var value6 = document.getElementById("value6");

value6.innerHTML = slider6.value;

slider6.oninput = function() {
    value6.innerHTML=this.value;
}
