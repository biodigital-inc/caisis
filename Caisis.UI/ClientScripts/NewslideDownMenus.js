/*****************************************************
* ypSlideOutMenu
* Code used with permission from  www.youngpup.net
* --youngpup--  3/04/2001
*****************************************************/

ypSlideOutMenu.Registry = []
ypSlideOutMenu.aniLen = 250
ypSlideOutMenu.hideDelay = 100
ypSlideOutMenu.minCPUResolution = 10

ypSlideOutMenu.styleMod = '';

function ypSlideOutMenu(id, dir, left, top, width, height, parentid, degrade, debug)
{
	this.ie = document.all ? 1 : 0
	this.ns4 = document.layers ? 1 : 0
	this.dom = document.getElementById ? 1 : 0
	if (this.ie || this.ns4 || this.dom) {
		this.degrade = degrade;
		this.debug = debug;
		this.sliding = false;
		this.id = id
		this.parentid = parentid
		this.dir = dir
		this.orientation = dir == "left" || dir == "right" ? "h" : "v"
		this.dirType = dir == "right" || dir == "down" ? "-" : "+"
		this.dim = this.orientation == "h" ? width : height
		this.hideTimer = false
		this.aniTimer = false
		this.open = false
		this.over = false
		this.startTime = 0
		this.gRef = "ypSlideOutMenu_"+id
		eval(this.gRef+"=this")
		ypSlideOutMenu.Registry[id] = this
		
		this.initleft = left
		this.inittop = top
		this.initwidth = width
		this.initheight = height
		this.showcount = 0;


// The following code originally invoked "document.write" but it caused
// a crash in IE (but not NS) when there were
// more than 31 menus total.  What crashed is that the styles that were
// declared in the css disappeared with 31 menus, where 32 menus caused
// the d.write call to fail entirely.  When I changed
// it so that the style changes were accumulated into one string
// (then at the end that string was written into the document,
// so that document.write was only called once) this solved the problem.

		ypSlideOutMenu.styleMod += '#' + this.id + 'Container { visibility:hidden; ';
		ypSlideOutMenu.styleMod += 'left:' + left + 'px; ';
		ypSlideOutMenu.styleMod += 'z-index:50; ';
		ypSlideOutMenu.styleMod += 'top:' + top + 'px; ';
		ypSlideOutMenu.styleMod += 'overflow:hidden; }';
		ypSlideOutMenu.styleMod += '#' + this.id + 'Container, #' + this.id + 'Content { position:absolute; ';
		ypSlideOutMenu.styleMod += 'height:' + height + 'px; ';
		ypSlideOutMenu.styleMod += 'width:' + width + 'px; ';
		ypSlideOutMenu.styleMod += 'z-index:50; ';
		ypSlideOutMenu.styleMod += 'clip:rect(0 ' + width + ' ' + height + ' 0); ';
		ypSlideOutMenu.styleMod += '}  ';
		//ypSlideOutMenu.styleMod += '#menubar a.active { ';
		//ypSlideOutMenu.styleMod += 'background-color:#ffffff; ';
		//ypSlideOutMenu.styleMod += 'color:#8d2a2c; ';
		//ypSlideOutMenu.styleMod += 'z-index: 52; ';
		//ypSlideOutMenu.styleMod += '} ';
		this.load()
	}
}

ypSlideOutMenu.prototype.load = function() {
	var d = document
	var lyrId1 = this.id + "Container"
	var lyrId2 = this.id + "Content"
	var obj1 = this.dom ? d.getElementById(lyrId1) : this.ie ? d.all[lyrId1] : d.layers[lyrId1]
	if (obj1) var obj2 = this.ns4 ? obj1.layers[lyrId2] : this.ie ? d.all[lyrId2] : d.getElementById(lyrId2)
	if (!obj1 || !obj2) {
		window.setTimeout(this.gRef + ".load()", 1000);
	} else {
		this.container = obj1
		this.menu = obj2
		this.style = this.ns4 ? this.menu : this.menu.style
		// SEE NOTE ABOVE.  The following function call for the 31 menus bug.
		//this.setStyle()
		this.homePos = eval("0" + this.dirType + this.dim)
		this.outPos = 0
		this.accelConst = (this.outPos - this.homePos) / ypSlideOutMenu.aniLen / ypSlideOutMenu.aniLen 
		if (this.ns4) this.menu.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT);
		this.menu.onmouseover = new Function("ypSlideOutMenu.showMenu('" + this.id + "')")
		this.menu.onmouseout = new Function("ypSlideOutMenu.hideMenu('" + this.id + "')")
		this.endSlide()
	}
}

ypSlideOutMenu.showMenu = function(id, e)
{
	var reg = ypSlideOutMenu.Registry
	var obj = ypSlideOutMenu.Registry[id]
	if (obj.container) {
//		if (obj.ie) alert('showing: ' + id);
		obj.over = true
		if (obj.hideTimer) { reg[id].hideTimer = window.clearTimeout(reg[id].hideTimer) }
		obj.showcount++;
		if (!obj.open && !obj.aniTimer) reg[id].startSlide(true)
	}
	if (obj.ns4) obj.menu.routeEvent(Event.MOUSEOVER);
}

ypSlideOutMenu.hideMenu = function(id, e)
{
	var obj = ypSlideOutMenu.Registry[id]
	if (obj.container) {
//		if (obj.ie) alert('hiding: ' + id);
		if (obj.hideTimer) window.clearTimeout(obj.hideTimer)
		obj.showcount--;
		obj.hideTimer = window.setTimeout("ypSlideOutMenu.hide('" + id + "')", ypSlideOutMenu.hideDelay);
	}
	if (obj.ns4) obj.menu.routeEvent(Event.MOUSEOUT);
}

/*
ypSlideOutMenu.prototype.isOverMenu = function(evnt) {
	if (evnt) {
		return ((this.initleft < evnt.pageX && evnt.pageX < (this.initleft + this.initwidth)) && (this.inittop < evnt.pageY && evnt.pageY < (this.inittop + this.initheight)))?true:false;
	} else {
		return true;
	}
}
*/

ypSlideOutMenu.hide = function(id) {
	var obj = ypSlideOutMenu.Registry[id]
	var reg = ypSlideOutMenu.Registry
	obj.over = false
	if (obj.hideTimer) window.clearTimeout(obj.hideTimer)
	obj.hideTimer = 0
	var close = true;
	for (menu in reg) {
		// for each child, if either
		//  1. the child is open or
		//  2. the child is closing (but hasn't closed yet)
		// then we don't close this menu.
		var pid = ypSlideOutMenu.Registry[menu].parentid
		if (pid == id) {
			if (ypSlideOutMenu.Registry[menu].open) close = false;
			if (!ypSlideOutMenu.Registry[menu].open && ypSlideOutMenu.Registry[menu].sliding) close = false;
		}
	}
	if (obj.open && !obj.aniTimer && close && !obj.showcount) obj.startSlide(false);
}


ypSlideOutMenu.prototype.startSlide = function(open) {
	this.open = open
	if (open) this.setVisibility(true)
	this.startTime = (new Date()).getTime() 
	this.sliding = true;
	this.aniTimer = window.setInterval(this.gRef + ".slide()", ypSlideOutMenu.minCPUResolution)
}

ypSlideOutMenu.prototype.slide = function() {
	var elapsed = (new Date()).getTime() - this.startTime
	if (elapsed > ypSlideOutMenu.aniLen) this.endSlide()
	else {
		var d = Math.round(Math.pow(ypSlideOutMenu.aniLen-elapsed, 2) * this.accelConst)
		if (this.open && this.dirType == "-") d = -d
		else if (this.open && this.dirType == "+") d = -d
		else if (!this.open && this.dirType == "-") d = -this.dim + d
		else d = this.dim + d
		this.moveTo(d)
	}
}

ypSlideOutMenu.prototype.endSlide = function() {
	this.aniTimer = window.clearTimeout(this.aniTimer)
	this.moveTo(this.open ? this.outPos : this.homePos)
	if (!this.open) this.setVisibility(false)
	this.sliding = false;
	if (((this.open && !this.over) || (!this.open && this.over)) && (!this.parent || this.parent.open)) {
		this.startSlide(this.over)
	} else {
		var overchild = false;
		var reg = ypSlideOutMenu.Registry
		for (menu in reg) {
			var pid = ypSlideOutMenu.Registry[menu].parentid
			if (pid == this.id) overchild = ypSlideOutMenu.Registry[menu].over ? true : overchild		
		}
//		if (!overchild && this.parentid && !ypSlideOutMenu.Registry[this.parentid].over) ypSlideOutMenu.hideMenu(this.parentid);
		if (!overchild && this.parentid && !ypSlideOutMenu.Registry[this.parentid].over) ypSlideOutMenu.hide(this.parentid);
	}
}

ypSlideOutMenu.prototype.setVisibility = function(bShow) { 
	var s = this.ns4 ? this.container : this.container.style
	s.visibility = bShow ? "visible" : "hidden"
}

ypSlideOutMenu.prototype.moveTo = function(p) { 
	this.style[this.orientation == "h" ? "left" : "top"] = p
}

ypSlideOutMenu.prototype.getPos = function(c) {
	return parseInt(this.style[c])
}
