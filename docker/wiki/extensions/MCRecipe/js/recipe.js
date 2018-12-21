
(function($){

	var animlist = [];
	var popup = $("<div class=\"recipe-popup\"><div class=\"recipe-popup-inner\"></div></div>");

	function create_elem(item, data, index, posx, posy) {
		var r;
		if(data.data[index]) {
			r = $("<a style='position:absolute;left:"+posx+"px;top:"+posy+"px' hovertext='" + data.data[index][0] +
				"' href='"+data.data[index][2]+"'>" + "<img src='"+data.data[index][1]+"' style='width:32px;height:32px;' /></a>");
			r.mousemove(function(e) {
				popup.children(".recipe-popup-inner").text(r.attr("hovertext"));
				popup.css("left", (e.pageX + 16) + "px");
				popup.css("top", (e.pageY + 16) + "px");
				$("body").append(popup);
			});
			r.mouseleave(function() {
				popup.remove();
			});
		} else {
			r = $("<a style='position:absolute;left:"+posx+"px;top:"+posy+"px;display:none'>" + 
				"<img style='width:32px;height:32px;' /></a>");
		}
		return r;
	}

	function isArray(obj) {   
		return Object.prototype.toString.call(obj) === '[object Array]';
	}

	function tohex(i) {
		return "0123456789abcdef"[i];
	}

	function add_num(elem, number) {
		elem.children(".number").remove();
		elem.children(".progress").remove();
		if(number > 1) {
			elem.append("<span class='number'>"+number+"</span>");
		} else if(number < 1) {
			var c = "#" + tohex(parseInt(15 - number * 16)) + tohex(parseInt(number * 16)) + "0";
			elem.append("<div class='progress'><div class='progress-in' style='background:"+c+";width:"+parseInt(27*number)+"px'></div></div>");
		}
	}

	function fill_in(item, data, index, posx, posy) {
		var elem;
		if(typeof index == "number") {
			if(index < 0)
				return;
			elem = create_elem(item, data, index, posx, posy);
		} else if(isArray(index)) {
			if(typeof index[0] == "object") {
				elem = create_elem(item, data, index[0].index, posx, posy);
				add_num(elem, index.number);
			} else {
				elem = create_elem(item, data, index[0], posx, posy);
			}
			animlist.push({elem:elem, data:data, index:index, now:0});
		} else if(typeof index == "object") {
			elem = create_elem(item, data, index.index, posx, posy);
			add_num(elem, index.number);
		}
		item.append(elem);
		return elem;
	}

	$(document).ready(function() {

		$(".craft").each(function() {
			var item = $(this);
			var data = $.parseJSON(item.attr("data").replace(/'/g, '"'));
			item.removeAttr("data");
			for(var i=0; i<9; i++) {
				var col = i % 3;
				var row = parseInt(i / 3);
				var index = data.from[i];
				var r = fill_in(item, data, index, (col*36+16), (row*36+16));
			}
			var result = fill_in(item, data, data.to, 204, 52);
		});
		
		$(".smelt").each(function() {
			var item = $(this);
			var data = $.parseJSON(item.attr("data").replace(/'/g, '"'));
			item.removeAttr("data");
			fill_in(item, data, data.from[0], 50, 16);
			var result = fill_in(item, data, data.to, 170, 52);
		});
		
		$(".excraft").each(function() {
			var item = $(this);
			var data = $.parseJSON(item.attr("data").replace(/'/g, '"'));
			item.removeAttr("data");
			for(var i=0; i<9; i++) {
				var col = i % 3;
				var row = parseInt(i / 3);
				var index = data.from[i];
				var r = fill_in(item, data, index, (col*36+16), (row*36+16));
			}
			var r = fill_in(item, data, data.from[9], 148, 42);
			var r = fill_in(item, data, data.from[10], 184, 42);
			var result = fill_in(item, data, data.to, 252, 52);
		});
		
		$(".fudrawing").each(function() {
			var item = $(this);
			var data = $.parseJSON(item.attr("data").replace(/'/g, '"'));
			item.removeAttr("data");
			for(var i=0; i<3; i++) {
				var index = data.from[i];
				var r = fill_in(item, data, index, 16, (i*50+20));
			}
			var needCount = 0;
			for(var i=0; i<64; i++) {
				var col = i % 8;
				var row = parseInt(i / 8);
				var index = data.from[i+3];
				item.append("<div class='box " + (index==-1?"yellow":"red") + "' style='left:" +
					(104+18*col) + "px;top:" + (16+18*row) + "px'>&nbsp;</div>");
				if(index != -1) {
					needCount++;
				}
			}
			needCount = parseInt((needCount + 7) / 8);
			item.append("<div class='need-count'>" + needCount + "</div>");
			var result = fill_in(item, data, data.to, 294, 70);
		});
		
		setInterval(function() {
			for(var i=0; i<animlist.length; i++) {
				var item = animlist[i];
				item.now = (item.now + 1) % item.index.length;
				var elem = item.elem;
				var index = item.index[item.now];
				var data = item.data;
				
				if(typeof index != 'number') {
					add_num(elem, index.number);
					index = index.index;
				} else {
					add_num(elem, 1);
				}
				
				if(index < 0) {
					elem.hide();
					continue;
				} else {
					elem.show();
				}
		
				elem.attr("hovertext", data.data[index][0]);				
				elem.attr("href", data.data[index][2]);
				elem.children("img").attr("src", data.data[index][1]);
			}
		}, 1500);

	});

})(jQuery);