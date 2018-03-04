$(()=>{//加载楼层1猫咪主粮&实现楼层切换
    ajax({
        type:'get',
        url:'data/index/getFloor1.php',
        dataType:'json'
    }).then(data=>{
        let html='';
        let p=data.cover;
            html+=`<div class="cover">
            <img src="${p.pic}">
            <ul class='text_cover'>
            <li>—————
								最热HOT ————</li>`
        for(let i in data.generalize){
            let p=data.generalize[i];
            html+=`<li>
            <div></div>
            <div></div>
            <div>${p.kw}</div>
        </li>`
        }
        html+=`</ul></div><div class='browse_tab'><div class="tab1"><div>`;
        for(let i in data.hot){
            let p=data.hot[i];
            if(i==0){
                html+=`<div class='big'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
           else if(i<=2){
                html+=`<div class='middle'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
           }
        html+=` </div><div>`
        for(let i in data.hot){
            let p=data.hot[i];
            if(i>2&&i<=5){
                html+=`<div class='small'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
        }
        html+=`</div></div><div class='tabMore' style="display:none">`;
        for(let p of data.import){
            html+=`<div>
                <img src="${p.pic}">
                <p>${p.title}</p>
                <p class='price'>¥${p.price}</p>
            </div>`;
        }
        html+=`</div><div class='tabMore' style="display:none">`;
        for(let p of data.domestic){
            html+=`<div>
                <img src="${p.pic}">
                <p>${p.title}</p>
                <p class='price'>¥${p.price}</p>
            </div>`;
        }
        html+=`</div>`;
        $('.firstFloor>div.browse').html(html);
        let html2='';
        for(let p of data.icons){
            html2+=`<li>
            <img src="${p.pic}">
        </li>`
        }
        $('.firstFloor>ul.backCover').html(html2);
    });
    //实现tab切换
    $('.firstFloor>.title>[data-target=title_tab]').on('mouseover','li',function(e){
        let $tar=$(e.target);
        let i=$tar.index();
        if(!$tar.is('hover')){
            $tar.addClass('hover').siblings().removeClass('hover');
            $(`.firstFloor>.browse>.browse_tab>div:eq(${i})`).show().siblings().hide();
        }
    })
})
$(()=>{//加载楼层2猫咪零食&实现楼层切换
    ajax({
        type:'get',
        url:'data/index/getFloor2.php',
        dataType:'json'
    }).then(data=>{
        let html='';
        let p=data.cover;
            html+=`<div class="cover">
            <img src="${p.pic}">
            <ul class='text_cover'>
            <li>—————
								最热HOT ————</li>`
        for(let i in data.generalize){
            let p=data.generalize[i];
            html+=`<li>
            <div></div>
            <div></div>
            <div>${p.kw}</div>
        </li>`
        }
        html+=`</ul></div><div class='browse_tab'><div class="tab1"><div>`;
        for(let i in data.hot){
            let p=data.hot[i];
            if(i==0){
                html+=`<div class='big'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
           else if(i<=2){
                html+=`<div class='middle'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
           }
        html+=` </div><div>`
        for(let i in data.hot){
            let p=data.hot[i];
            if(i>2&&i<=5){
                html+=`<div class='small'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
        }
        html+=`</div></div><div class='tabMore' style="display:none">`;
        for(let p of data.import){
            html+=`<div>
                <img src="${p.pic}">
                <p>${p.title}</p>
                <p class='price'>¥${p.price}</p>
            </div>`;
        }
        html+=`</div><div class='tabMore' style="display:none">`;
        for(let p of data.domestic){
            html+=`<div>
                <img src="${p.pic}">
                <p>${p.title}</p>
                <p class='price'>¥${p.price}</p>
            </div>`;
        }
        html+=`</div>`;
        $('.secondFloor>div.browse').html(html);
        let html2='';
        for(let p of data.icons){
            html2+=`<li>
            <img src="${p.pic}">
        </li>`
        }
        $('.secondFloor>ul.backCover').html(html2);
    });
    //实现楼层2tab切换
    $('.secondFloor>.title>[data-target=title_tab]').on('mouseover','li',function(e){
        let $tar=$(e.target);
        let i=$tar.index();
        if(!$tar.is('hover')){
            $tar.addClass('hover').siblings().removeClass('hover');
            $(`.secondFloor>.browse>.browse_tab>div:eq(${i})`).show().siblings().hide();
        }
    })
})
$(()=>{//加载楼层3猫咪保健&实现楼层切换
    ajax({
        type:'get',
        url:'data/index/getFloor3.php',
        dataType:'json'
    }).then(data=>{
        let html='';
        let p=data.cover;
            html+=`<div class="cover">
            <img src="${p.pic}">
            <ul class='text_cover'>
            <li>—————
								最热HOT ————</li>`
        for(let i in data.generalize){
            let p=data.generalize[i];
            html+=`<li>
            <div></div>
            <div></div>
            <div>${p.kw}</div>
        </li>`
        }
        html+=`</ul></div><div class='browse_tab'><div class="tab1"><div>`;
        for(let i in data.hot){
            let p=data.hot[i];
            if(i==0){
                html+=`<div class='big'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
           else if(i<=2){
                html+=`<div class='middle'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
           }
        html+=` </div><div>`
        for(let i in data.hot){
            let p=data.hot[i];
            if(i>2&&i<=5){
                html+=`<div class='small'>
                <img src="${p.pic}">
                <div>
                    <p>${p.kw}</p>
                    <span>${p.remark}</span>
                </div>
            </div>`}
        }
        html+=`</div></div><div class='tabMore' style="display:none">`;
        for(let p of data.import){
            html+=`<div>
                <img src="${p.pic}">
                <p>${p.title}</p>
                <p class='price'>¥${p.price}</p>
            </div>`;
        }
        html+=`</div><div class='tabMore' style="display:none">`;
        for(let p of data.domestic){
            html+=`<div>
                <img src="${p.pic}">
                <p>${p.title}</p>
                <p class='price'>¥${p.price}</p>
            </div>`;
        }
        html+=`</div>`;
        $('.thirdFloor>div.browse').html(html);
        let html2='';
        for(let p of data.icons){
            html2+=`<li>
            <img src="${p.pic}">
        </li>`
        }
        $('.thirdFloor>ul.backCover').html(html2);
    });
    //实现楼层3tab切换
    $('.thirdFloor>.title>[data-target=title_tab]').on('mouseover','li',function(e){
        let $tar=$(e.target);
        let i=$tar.index();
        if(!$tar.is('hover')){
            $tar.addClass('hover').siblings().removeClass('hover');
            $(`.thirdFloor>.browse>.browse_tab>div:eq(${i})`).show().siblings().hide();
        }
    })
})