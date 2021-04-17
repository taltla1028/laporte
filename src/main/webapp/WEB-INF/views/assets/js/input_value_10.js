var slider10=document.getElementById("myRange10");
var value10 = document.getElementById("value10");

value10.innerHTML = slider10.value;

slider10.oninput = function() {
    value10.innerHTML=this.value;
}
