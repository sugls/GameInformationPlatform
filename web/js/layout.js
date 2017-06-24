/**
 *
 * Created by lsc on 2017/5/16.
 */


$.Common = {
    UI : {
        refreshTooltip: function(parentElement){
            var targetEls;
            if (parentElement) {
                targetEls = $(parentElement).find(".tip:not(.__tipped__)[title]");
            } else {
                targetEls = $(".tip:not(.__tipped__)[title]");
            }

            targetEls.each(function(i, o){
                var title = $(o).attr('title'),
                    position = $(o).data('position');
                $(o).removeAttr('title');

                $(o).addClass('__tipped__');
                Tipped.create(o, title, {
                    radius: false,
                    behavior: 'hide',
                    maxWidth: 320,
                    fadeIn: 0,
                    fadeOut: 0,
                    position: (position ? position : 'top')
                });
            });
        },
        clippable: function(parentElement){
            function inputCopy(input){
                input.select();
                document.execCommand("copy");
                var selection = getSelection();
                null !== selection && selection.removeAllRanges();
            }

            function elementCopy(element){
                var selection = getSelection();
                if (null !== selection) {
                    selection.removeAllRanges();
                    var range = document.createRange();
                    range.selectNodeContents(element);
                    selection.addRange(range);
                    document.execCommand("copy");
                    selection.removeAllRanges();
                }
            }

            function plainTextCopy(text){
                var pre = document.createElement("pre"),
                    body = document.body;

                pre.style.width = '1px';
                pre.style.height = '1px';
                pre.style.position = 'fixed';
                pre.style.top = 'fixed';
                pre.textContent = text;

                body.appendChild(pre);
                elementCopy(pre);
                body.removeChild(pre);
            }

            var targetEls = parentElement ? $(parentElement).find(".clippable:not(.__clipped__)") : $(".clippable:not(.__clipped__)");

            targetEls.each(function(i, o){
                $(o).addClass('__clipped__')
                    .on('click', function(){
                        var clipBoardText = $(o).data("clipboard-text");
                        if (clipBoardText) {
                            plainTextCopy(clipBoardText);
                        } else {
                            var clipBoardTarget = $($(o).data('clipboard-target')).get(0);
                            if (clipBoardTarget.nodeName === 'INPUT' || clipBoardTarget.nodeName === 'TEXTAREA') {
                                inputCopy(clipBoardTarget);
                            } else {
                                elementCopy(clipBoardTarget);
                            }
                        }

                        var copiedText = $(o).data('copied-text');
                        if (copiedText) {
                            alert(copiedText);
                        }
                    });
            })
        }
    }
};

$(function () {
    /*$.tablesorter.addParser({
        // set a unique id
        id: 'value',
        is: function(s, table, cell){
            return false;
        },
        format: function(s, table, cell, cellIndex){
            return $(cell).data('value');
        },
        type: 'numeric'
    });
    var refreshTableSorter = function(){
        $(".sortable").tablesorter({
            sortInitialOrder: "desc",
            headers: {
                0: {sortInitialOrder: 'asc'},
            },
            widgets: ["columns"],
            widgetOptions: {
                columns: ["sorted", "sorted", "sorted", "sorted", "sorted"]
            },
            /!**
             * tablesorter에서 data-value를 이용한 열에 대해서는 정렬 데이터로 사용 되지 않음.
             * 별도로 textExtraction 옵션을 이용하여 data-value도 정렬 데이터로 참고하도록 수정
             *!/
            textExtraction: function(node){
                var text = $(node).text();
                var value = $(node).data('value');
                return (value != undefined) ? value : text;
            }
        });
    };
    refreshTableSorter();*/
    $.Common.UI.refreshTooltip();
    $.Common.UI.clippable();


    $("#tabMenu").find('a').each(function () {
        $(this).click(function () {
            tab($(this));
            $(this).parent().parent().find('.active').removeClass('active');
            $(this).parent().addClass('active');
            $(this).tab('show');
            return false;
        });
    })


});

function tab(a) {
    var url = a.parent().data('ajax-url');
    console.log(url);
    var s = a.attr('href');
    console.log("s  "+s);
    var wrap = $(s);
    if (!$(wrap).html()){

        $.get(url,null,function(html) {

            console.log(wrap);
            //    console.log(html);
            wrap.html(html);
        });
    }




}

/*
$(document).on('tabRecognize', '.tabWrap:not(._recognized)', function(){
    var tab = $(this),
        tabHeaders = tab.find('.tabHeaders').first(),
        tabItems = tab.find('.tabItems').first();

    var doHideAllItems = function(){
        $(">.tabItem", tabItems).hide();
    };

    var doDeactiveAllItems = function(){
        $(">.tabHeader", tabHeaders).removeClass('active');
    };

    var clickCurrentActiveMenu = function(isForce){
        $(">.tabHeader.active", tabHeaders).trigger('click', isForce); // active 항목을 클릭해주는 효과.
    };

    $(this).on('refresh', function(){
        clickCurrentActiveMenu(true);
    });

    tab.addClass('_recognized');

    $(">.tabHeader", tabHeaders).on('click', function(a, isForce){
        var self = this;
        $.OP.GG.util.keepScroll(function(keepScroll){
            doHideAllItems();
            doDeactiveAllItems();

            var showClass = $(self).data('tab-show-class'),
                showClassElement = $(".tabItem." + showClass, tab),
                showClassElementDataUrl = showClassElement.data("tab-data-url"),
                isLoadedAlready = (showClassElement.data('tab-is-loaded-already') == true),
                isAlwaysForceLoad = ($(self).data('tab-always-force-load') == true),
                spinnerClass = (showClassElement.data('tab-spinner-class') || 'black'),
                spinnerHeight = (showClassElement.data('tab-spinner-height') || 300);

            console.log(showClassElementDataUrl);

            if (isForce || isAlwaysForceLoad)
                isLoadedAlready = false;

            if (showClassElementDataUrl && !isLoadedAlready) {

                var setHTML = function(html){
                    showClassElement.html(html);
                };

                setHTML($.OP.GG.common.makeCenteredTableLoader(spinnerClass, spinnerHeight));

                $.ajax({
                    url: showClassElementDataUrl,
                    callback: {
                        onHTML: function(html){
                            setHTML(html);
                            keepScroll();
                            showClassElement.data('tab-is-loaded-already', true);
                        },
                        onError: function(error){
                            setHTML("<div style='padding: 5px; font-size: 11px; line-height: 140%; color: #777;'>" + error + "</div>");
                            showClassElement.data('tab-is-loaded-already', null);
                        }
                    }
                });
            }

            showClassElement.show();
            $(window).resize();

            $(self).addClass('active');
        });

        return false;
    });

    doHideAllItems();
    clickCurrentActiveMenu();
});

$(".tabWrap").trigger('tabRecognize');*/
