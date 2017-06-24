/**
 * Created by lsc on 2017/5/24.
 */

function getMember(id) {
    $.ajax({
        url: '/community/member',
        data: {'id': 'id'},
        type: 'get',
        success: function (data) {
            var d = eval("(" + data + ")");
            console.log(d);
            return d;
        }
    })
}
function switchRank(data) {
    // 武林新丁 ->   10
    // 江湖小虾 ->   60
    // 后起之秀 ->  110
    // 武林高手 ->  160
    // 风尘奇侠 ->  210
    // 无双隐士 ->  260
    // 世外高人 ->  310
    // 江湖侠隐 ->  360
    // 无敌圣者 ->  410
    // 三界贤君 ->  460
    var rank = {};
    switch (Math.ceil((data - 10) / 50) + 1) {
        case 1 :
            rank = {'rank':'1','title':'武林新丁'};
            break;
        case 2 :
            rank = {'rank':'2','title':'江湖小虾'};
            break;
        case 3 :
            rank = {'rank':'3','title':'后起之秀'};
            break;
        case 4 :
            rank = {'rank':'4','title':'武林高手'};
            break;
        case 5 :
            rank = {'rank':'5','title':'风尘奇侠'};
            break;
        case 6 :
            rank = {'rank':'6','title':'无双隐士'};
            break;
        case 7 :
            rank = {'rank':'7','title':'世外高人'};
            break;
        case 8 :
            rank = {'rank':'8','title':'江湖侠隐'};
            break;
        case 9 :
            rank = {'rank':'9','title':'无敌圣者'};
            break;
        case 10 :
            rank = {'rank':'10','title':'三界贤君'};
            break;
    }
    return rank;
}

function getPost(pages) {
    $.ajax({
        url: 'posts',
        data: {
            'tid': $('#tid').val(),
            'pages': pages
        },
        type: 'get',
        success: function (data) {
            $('#main-content').html(data);
        }
    })
}