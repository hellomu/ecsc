/**
 * 重定向 目前只有item/main list/main使用
 */
var Redirect = {
    /**
     * 判断是否移动端
     */
    isMobile : function() {
        //正则表达式
        var regex_match = /(micromessenger|nokia|iphone|android|motorola|^mot-|softbank|foma|docomo|kddi|up.browser|up.link|htc|dopod|blazer|netfront|helio|hosin|huawei|novarra|CoolPad|webos|techfaith|palmsource|blackberry|alcatel|amoi|ktouch|nexian|samsung|^sam-|s[cg]h|^lge|ericsson|philips|sagem|wellcom|bunjalloo|maui|symbian|smartphone|midp|wap|phone|windows ce|iemobile|^spice|^bird|^zte-|longcos|pantech|gionee|^sie-|portalmmm|jigs browser|hiptop|^benq|haier|^lct|operas*mobi|opera*mini|320x320|240x320|176x220)/i;
        var u = navigator.userAgent;
        //null==防笔误
        if (null == u) {
            return true;
        }
        var result = regex_match.exec(u);

        if (null == result) {
            // return false;
        } else {
            return true;
        }
    },
};
