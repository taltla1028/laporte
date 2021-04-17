var slider5=document.getElementById("myRange5");
var value5 = document.getElementById("value5");

value5.innerHTML = slider5.value;

slider5.oninput = function() {
    value5.innerHTML=this.value;
}
