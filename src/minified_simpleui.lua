b
sui={el={},isinrect=function(a,b,c,d,e,f)
	return e>=a and e<=a+c and f>=b and f<=b+d end,create=function(g,a,b,c,d,h,i,j)
	table.insert(sui.el,{type=g,text=i,x=a,y=b,w=c,h=d,act=false,pretouch=false,func=h,oindex=j})end,tglbutton=function(a,b,c,d,j)
	sui.create("tglbtt"
	,a,b,c,d,true,j)end,pshbutton=function(a,b,c,d,j)
	sui.create("pshbtt"
	,a,b,c,d,true,j)end,txttglbutton=function(a,b,c,d,i,j)
	sui.create("tglbtt"
	,a,b,c,d,true,i,j)end,txtpshbutton=function(a,b,c,d,i,j)
	sui.create("pshbtt"
	,a,b,c,d,true,i,j)end,label=function(a,b,c,d,i,j)
	sui.create("lbl"
	,a,b,c,d,false,i,j)end}
	
	
	function onTick()
	-- ontick
	local k=input.getBool(1)
	local l=input.getNumber(3)
	local m=input.getNumber(4)
	for n=1,#sui.el do
	local o=sui.el[n]if o.func then
	if k~=o.pretouch then
	if sui.isinrect(o.x,o.y,o.w,o.h,l,m)then
	if k and o.type=="tglbtt"
	then
	o.act=not
	o.act 
	elseif k and o.type=="pshbtt"
	then
	o.act=true
	end
	elseif o.type=="pshbtt"
	then
	o.act=false
	end
	end
	if o.oindex then
	output.setBool(o.oindex,o.act)
	end
	end
	o.pretouch=k
	end
	--
	end
	
	function onDraw()
	-- ondraw
	for n=1,#sui.el do
	local o=sui.el[n]if o.text then
	screen.drawTextBox(o.x,o.y,o.w,o.h,o.text,0,0)
	end
	if o.act then
	screen.drawRectF(o.x,o.y,o.w,o.h)else screen.drawRect(o.x,o.y,o.w,o.h)
	end
	end
	--
	end
