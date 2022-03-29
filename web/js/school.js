function school() {
    function School(site, phone, info) {
        this.site = site;
        this.phone = phone;
        this.info = info
    }
    ste = new School('http://ste.xidian.edu.cn/', '029-81891675', 'http://mp\.weixin\.qq\.com/s\?__biz=MjM5MTAxMTUyMA==&amp;mid=2654973730&amp;idx=1&amp;sn=be8fc8f2bf7d88c80f0efdbe6856e21f&amp;')
    see = new School('http://see.xidian.edu.cn/', '029-81891663', 'http://mp\.weixin\.qq\.com/s\?__biz=MjM5MTAxMTUyMA==&amp;mid=2654973730&amp;idx=1&amp;sn=be8fc8f2bf7d88c80f0efdbe6856e21f&amp;')

    var x = document.getElementById("school").value;
    var y = document.getElementById("result");
    switch (x) {
        case "ste": y.innerHTML = "学院网站：<a href='"+ste.site+"' target=_blank>http://ste.xidian.edu.cn/</a><br>\
                        电话："+ste.phone+"<br><a href='"+ste.info+"' target=_blank>更多信息</a>"; break;
        case "see": y.innerHTML = "学院网站：<a href='"+see.site+"' target=_blank>http://see.xidian.edu.cn/</a><br>\
                        电话："+see.phone+"<br><a href='"+see.info+"' target=_blank>更多信息</a>"; break;
        case "cs": y.innerHTML = "学院网站：<a href='http://cs.xidian.edu.cn/' target=_blank>http://cs.xidian.edu.cn/</a><br>\
                        电话：029-81891336<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654973899&amp;idx=1&amp;sn=6dfeece0931c89ef9ed3c80cd909dc4c&amp;' target=_blank>更多信息</a>"; break;
        case "eme": y.innerHTML = "学院网站：<a href='http://eme.xidian.edu.cn/' target=_blank>http://eme.xidian.edu.cn/</a><br>\
                        电话：029-81891656<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654973958&amp;idx=1&amp;sn=fb710d8ac15b16c15b5049634efdeefd&amp;' target=_blank>更多信息</a>"; break;
        case "spoe": y.innerHTML = "学院网站：<a href='http://spoe.xidian.edu.cn/' target=_blank>http://spoe.xidian.edu.cn/</a><br>\
                        电话：029-81891619<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974205&amp;idx=1&amp;sn=da10484da2d99dd3932beef42e01e34b&amp;' target=_blank>更多信息</a>"; break;
        case "ems": y.innerHTML = "学院网站：<a href='http://ems.xidian.edu.cn/' target=_blank>http://ems.xidian.edu.cn/</a><br>\
                        电话：029-81891360<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974239&amp;idx=1&amp;sn=2325a385b4a685ff5f6a62cd5c2273ee&amp;' target=_blank>更多信息</a>"; break;
        case "math": y.innerHTML = "学院网站：<a href='http://math.xidian.edu.cn/' target=_blank>http://math.xidian.edu.cn/</a><br>\
                        电话：029-81891379<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974352&amp;idx=1&amp;sn=f0a15feb4541dc7e1c9cd251b3078752&amp;' target=_blank>更多信息</a>"; break;
        case "rwxy": y.innerHTML = "学院网站：<a href='http://rwxy.xidian.edu.cn/' target=_blank>http://rwxy.xidian.edu.cn/</a><br>\
                        电话：029-81891388<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974387&amp;idx=1&amp;sn=51b51f77f466124332a1be992cc75d61&amp;' target=_blank>更多信息</a>"; break;
        case "sfl": y.innerHTML = "学院网站：<a href='http://sfl.xidian.edu.cn/' target=_blank>http://sfl.xidian.edu.cn/</a><br>\
                        电话：029-81891656<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974433&amp;idx=1&amp;sn=e7777bf3e25516e121647d659f3e2a64&amp;' target=_blank>更多信息</a>"; break;
        case "sme": y.innerHTML = "学院网站：<a href='http://sme.xidian.edu.cn/' target=_blank>http://sme.xidian.edu.cn/</a><br>\
                        电话：029-81891300<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974463&amp;idx=1&amp;sn=55d43cc869fc40c3b73b970a9a3ee784&amp;' target=_blank>更多信息</a>"; break;
        case "life": y.innerHTML = "学院网站：<a href='http://life.xidian.edu.cn/' target=_blank>http://life.xidian.edu.cn/</a><br>\
                        电话：029-81891070/029-81891060<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974510&amp;idx=1&amp;sn=d40d25c61ab27615794712b1483a3232&amp;' target=_blank>更多信息</a>"; break;
        case "sast": y.innerHTML = "学院网站：<a href='http://sast.xidian.edu.cn/' target=_blank>http://sast.xidian.edu.cn/</a><br>\
                        电话：029-81891034<br><a href='http://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974606&amp;idx=1&amp;sn=f31c17a7f8363758162f6978f8822dd5&amp;' target=_blank>更多信息</a>"; break;
        case "amn": y.innerHTML = "学院网站：<a href='http://amn.xidian.edu.cn/' target=_blank>http://amn.xidian.edu.cn/</a><br>\
                        电话：029-81891417<br><a href='https://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974720&amp;idx=1&amp;sn=9ce6541180c3774dce247274413b85c5&amp;' target=_blank>更多信息</a>"; break;
        case "ce": y.innerHTML = "学院网站：<a href='http://ce.xidian.edu.cn/' target=_blank>http://ce.xidian.edu.cn/</a><br>\
                        电话：029-81891650<br><a href='https://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&amp;mid=2654974752&amp;idx=1&amp;sn=d4f4236db7f155dc40864f6ff8a69886&amp;' target=_blank>更多信息</a>"; break;
        case "sai": y.innerHTML = "学院网站：<a href='http://sai.xidian.edu.cn/' target=_blank>http://sai.xidian.edu.cn/</a><br>\
                        电话：029-81891373<br><a href='https://mp.weixin.qq.com/s?__biz=MjM5MTAxMTUyMA==&mid=2654974939&idx=1&sn=77548e35385cdc8db24fd0bfbc45b641&' target=_blank>更多信息</a>"; break;
        default: y.innerHTML = "页面出现错误，正在刷新……", alert('网站出现错误，请刷新重试。'); location.reload();
    }
}
