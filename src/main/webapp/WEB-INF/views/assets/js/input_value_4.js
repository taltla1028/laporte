var slider4=document.getElementById("myRange4");
var value4 = document.getElementById("value4");

value4.innerHTML = slider4.value;

slider4.oninput = function() {
    value4.innerHTML=this.value;
}
