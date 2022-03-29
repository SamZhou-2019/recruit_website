function startTime() {
    var today = new Date();
    var y = today.getFullYear();
    var mo = today.getMonth() + 1;
    var d = today.getDate();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();// 在小于10的数字前加一个‘0’
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML = y + "/" + mo + "/" + d + " " + h + ":" + m + ":" + s;
    t = setTimeout(function () {
        startTime()
    }, 500);
}

function checkTime(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}