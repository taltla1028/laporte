var slider9=document.getElementById("myRange9");
var value9 = document.getElementById("value9");

value9.innerHTML = slider9.value;

slider9.oninput = function() {
    value9.innerHTML=this.value;
}
