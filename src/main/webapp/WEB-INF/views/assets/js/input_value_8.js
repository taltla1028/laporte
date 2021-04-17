var slider8=document.getElementById("myRange8");
var value8 = document.getElementById("value8");

value8.innerHTML = slider8.value;

slider8.oninput = function() {
    value8.innerHTML=this.value;
}
