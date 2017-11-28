var bwgdaa = 0;
var bwgdbb = 1;
function marqueeL(){
	if(bwgdaa>(marquee.length-1))
	bwgdaa = 0;
	if(bwgdbb>(marquee.length-1))
	bwgdaa = 0;
	bwgdbb = bwgdaa +1;
	var marHTML = marquee[bwgdaa]+marquee[bwgdbb];
	document.getElementById("bwfahuo").innerHTML = marHTML;
	bwgdaa +=1;
	bwgdbb +=1;
}
window.setInterval("marqueeL()", 3000);