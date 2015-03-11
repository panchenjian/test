
var linkH = $("#cat-articles").height();//文章标题导航高度；为了点击文章时，能够正好显示文章正文头部在视野中，而记录的高度
var saveScl ;//记录滚动的位置
//文章锚点点击事件
function articleClick(obj) {
    var self = $(obj);
    $("#cat-articles a.active").removeClass("active");
    self.addClass("active");
    var artId = self.attr('data-value');
    var artContent = $(self.attr('href-Id'));
    saveScl = artContent.offset().top - linkH;
    if (!artContent.html()) {
        getArticle(artId);
    }
    /*
    *如果跳转加载内容，没有滚动到文章的话，继续滚动，直到滚动到
    */
    function goOnScl() {
        if (saveScl != $(window).scrollTop()) {
            $("html,body").animate({
                scrollTop: artContent.offset().top - linkH
            }, 100, goOnScl);
        }
        saveScl = artContent.offset().top - linkH;
    }
    $("html,body").animate({
        scrollTop: artContent.offset().top - linkH
    }, 300, goOnScl);
   
}

//根据id取得文章内容
function getArticle(artId) {
    //var loadii = layer.load(0,1);
    $.get('wenzhang.php', { ids: artId}, function (data) {
        console.log('articel :', data);
        if (data && data.length) {
           
            var artHref = $('#a-' + artId);
            var artContent = $(artHref.attr('href-Id'));
            artContent.html(data);
        }
        //layer.close(loadii);
    });
}

//文章滚动获取内容
function ArticleScroll() {
    var screenH = $(window).height();//屏幕高
    var herolink=$("#cat-articles a.stickylink");

    $(window).scroll(function () {
        var scTop = $(window).scrollTop() + linkH;
        var heroAct = $("#cat-articles a.active").parent().index();//当前是第几个文章
        var heroNow = herolink.eq(heroAct);//当前文章（标题）元素
        var heroNext = herolink.eq(heroAct + 1);//下一个文章（标题）元素
        var num=heroAct-1;
        if(num<0){
            num=0;
        }
        var heroPrev =herolink.eq(num);//上一个文章（标题）元素
        var hero = $(heroNow.attr('href-Id'));//当前文章（内容）元素
        var heroP = $(heroPrev.attr('href-Id'));//上一个文章（内容）元素
        var heroOffsetTop=hero.offset().top;
        var heroPOffsetTop=heroP.offset().top;
        var heroN, heroNOffsetTop;

        if (heroNext.length == 0) {//如果没有下一个，说明当前已经是最后一个了
            if (scTop <= heroPOffsetTop) { //上一个露了头
                $("#cat-articles a.active").removeClass("active");
                heroPrev.addClass("active");
            }
            return false;
        } else {
            heroN = $(heroNext.attr('href-Id'));//下一个文章（内容）元素
            heroNOffsetTop = heroN.offset().top;
            if (heroNOffsetTop <= screenH + scTop + 50) {//如果再滚动50像素就到下一个文章
                if (!heroN.html()) {//下一个还未加载，就加载内容
                    getArticle(heroNext.attr('data-value'));
                }
            }
        }
       
        
        if ((heroAct)&&(heroNOffsetTop > scTop) && (scTop>heroPOffsetTop)) {//如果滚动介于 上一个没露头 ，下一个头没过 之间
            return false;
        }else if(scTop<=heroPOffsetTop){ //上一个露了头
            $("#cat-articles a.active").removeClass("active");
            heroPrev.addClass("active");
        } else if (scTop >= heroNOffsetTop) {
            $("#cat-articles a.active").removeClass("active");
            heroNext.addClass("active");
        } else {
            return false;
        }
        
    })
}

ArticleScroll();
