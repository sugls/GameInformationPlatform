$(function(){

	var dynamicDateTimeout = null;
	var refreshDynamicDate = function(){
		if (dynamicDateTimeout == null) {
			clearTimeout(dynamicDateTimeout);
		}
		dynamicDateTimeout = setTimeout(function(){
			//$.OP.GG.UI.dynamicDate.refreshDocumentDate();
			$.OP.GG.UI.dynamicDate.assignNewCountTime();
			dynamicDateTimeout = null;
		}, 100);
	};

	$.tablesorter.addParser({
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
			/**
			 * tablesorter에서 data-value를 이용한 열에 대해서는 정렬 데이터로 사용 되지 않음.
			 * 별도로 textExtraction 옵션을 이용하여 data-value도 정렬 데이터로 참고하도록 수정
			 */
			textExtraction: function(node){
				var text = $(node).text();
				var value = $(node).data('value');
				return (value != undefined) ? value : text;
			}
		});
	};

	// run init
	/*jcf.replaceAll();*/
	refreshDynamicDate();
	refreshTableSorter();
	$.OP.GG.util.refreshTooltip();
	$.OP.GG.util.clippable();

	// run ajax
	$(document).ajaxComplete(function(){
		$('.tabWrap:not(._recognized)').trigger('tabRecognize');
		/*jcf.replaceAll();*/
		refreshDynamicDate();
		refreshTableSorter();
		$.OP.GG.util.refreshTooltip();
		$.OP.GG.util.clippable();
		$(".tpd-tooltip").remove();
	});

	// 부하 위험.
	setInterval(function(){
		refreshDynamicDate();
	}, 60000);

	// 소환사 히스토리 및 즐겨찾기 발동
	/*$.OP.GG.common.SummonerHistory.History.loadList();
	$.OP.GG.common.SummonerHistory.Favorite.loadList();*/
	// $.OP.GG.sidebar.load();

	// 탭로딩하는거 구현
	$(document).on('tabRecognize', '.tabWrap:not(._recognized)', function(){
		var tab = $(this),
			tabHeaders = tab.find('.tabHeaders').first(),
			tabItems = tab.find('.tabItems').first();

		// 미리 준비된 탭 갯수와 동일한 컨텐츠 레이어들을 모두 가려줌.
		var doHideAllItems = function(){
			$(">.tabItem", tabItems).hide();
		};

		// 현재 활성화되지 않은 모든 메뉴들에서 active 클래스를 제거함.
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

				// isForce 가 있으면 이미 컨텐츠가 로드 됐음에도 불구하고 다시 로그함.
				if (isForce || isAlwaysForceLoad)
					isLoadedAlready = false;

				if (showClassElementDataUrl && !isLoadedAlready) {
					// 데이터 로딩 후 표현하는 코드
					var setHTML = function(html){
						showClassElement.html(html);
					};

					setHTML($.OP.GG.common.makeCenteredTableLoader(spinnerClass, spinnerHeight));

					$.OP.GG.ajax.getHTML({
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

		doHideAllItems(); // 먼저 모두 가려줌
		clickCurrentActiveMenu();
	});

	$(".tabWrap").trigger('tabRecognize');

});