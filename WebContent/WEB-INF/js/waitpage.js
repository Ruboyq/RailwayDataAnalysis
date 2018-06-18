/**
 * 
 */
var load = window.whir || {};      
load.loading =      
{      
    add: function (opacity,pic) {      
        opacity = opacity == undefined ? 0.4 : opacity;      
        var arr = this.getPageSize();      
        var width = parseInt(arr[2]);      
        var height = parseInt(arr[3]);      
      
        //背景遮罩      
        var mask = document.createElement("div");      
        mask.id = 'mask';      
        mask.style.position = 'fixed';      
        mask.style.left = '0';      
        mask.style.top = '0';      
        mask.style.width = '100%';      
        mask.style.height = parseInt(arr[1]) + "px";      
        mask.style.background = "#fff";      
        mask.style.filter = "alpha(opacity=" + opacity * 100 + ")";      
        mask.style.opacity = opacity;  
        mask.style.zIndex = "10000";      
        mask.addEventListener('touchstart', function (e) { e.preventDefault(); }, false);   //触摸事件      
        mask.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);    //滑动事件      
        mask.addEventListener('touchend', function (e) { e.preventDefault(); }, false);         //离开元素事件      
        document.body.appendChild(mask);      
      
        //提示文本      
        var loading = document.createElement("div");      
        loading.id = 'loading';      
        loading.style.position = 'absolute';      
        loading.style.left = ((width / 2) - 75) + "px";      
        loading.style.top = (height / 2 - 70) + "px";      
        loading.style.width = '50px';      
        loading.style.height = "50px";      
        loading.style.display = "inline-block";      
        loading.style.padding = "0px 5px 0 50px";      
        loading.style.zIndex = "100001";      
        loading.style.background = "url("+pic+") no-repeat 20px 20px";
        document.body.appendChild(loading);      
    },   
    remove: function () {      
        var element = document.getElementById("mask");      
        element.parentNode.removeChild(element);      
        element = document.getElementById("loading");      
        element.parentNode.removeChild(element);      
    },      
    getPageSize: function () {      
        var xScroll, yScroll;      
        if (window.innerHeight && window.scrollMaxY) {      
            xScroll = window.innerWidth + window.scrollMaxX;      
            yScroll = window.innerHeight + window.scrollMaxY;      
        } else {      
            if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac          
                xScroll = document.body.scrollWidth;      
                yScroll = document.body.scrollHeight;      
            } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari          
                xScroll = document.body.offsetWidth;      
                yScroll = document.body.offsetHeight;      
            }      
        }      
        var windowWidth = 0;      
        var windowHeight = 0;      
        var pageHeight = 0;      
        var pageWidth = 0;      
      
        if (self.innerHeight) { // all except Explorer          
            if (document.documentElement.clientWidth) {      
                windowWidth = document.documentElement.clientWidth;      
            } else {      
                windowWidth = self.innerWidth;      
            }      
            windowHeight = self.innerHeight;      
        } else {      
            if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode          
                windowWidth = document.documentElement.clientWidth;      
                windowHeight = document.documentElement.clientHeight;      
            } else {      
                if (document.body) { // other Explorers          
                    windowWidth = document.body.clientWidth;      
                    windowHeight = document.body.clientHeight;      
                }      
            }      
        }      
        // for small pages with total height less then height of the viewport          
      
        if (yScroll < windowHeight) {      
            pageHeight = windowHeight;      
        } else {      
            pageHeight = yScroll;      
        }      
        // for small pages with total width less then width of the viewport          
        if (xScroll < windowWidth) {      
            pageWidth = xScroll;      
        } else {      
            pageWidth = windowWidth;      
        }      
        var arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight);      
        return arrayPageSize;      
    }      
}; 