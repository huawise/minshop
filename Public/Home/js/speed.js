function scollDown(slides,time){
	var speed=time;
	var slide=document.getElementById(slides);
	var slide2=document.getElementById(slides+"2");
	var slide1=document.getElementById(slides+"1");
	slide2.innerHTML=slide1.innerHTML;
	function Marquee(){
		if(slide2.offsetTop-slide.scrollTop<=0)
			slide.scrollTop-=slide1.offsetHeight;
		else{
			slide.scrollTop++
		}
	}
	var MyMar=setInterval(Marquee,speed);
	slide.onmouseover=function(){clearInterval(MyMar)}
	slide.onmouseout=function(){MyMar=setInterval(Marquee,speed)}
	
}
