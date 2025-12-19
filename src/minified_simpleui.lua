
sui={el={},isinrect=function(a,b,c,d,e,f)
return e>=a and e<=a+c and f>=b and f<=b+d end,create=function(g,a,b,c,d,h,i)
table.insert(sui.el,{type=g,text=i,x=a,y=b,w=c,h=d,act=false,pretouch=false,func=h})end,tglbutton=function(a,b,c,d)
sui.create("tglbtt"
,a,b,c,d,true)end,pshbutton=function(a,b,c,d)
sui.create("pshbtt"
,a,b,c,d,true)end,txttglbutton=function(a,b,c,d,i)
sui.create("tglbtt"
,a,b,c,d,true,i)end,txtpshbutton=function(a,b,c,d,i)
sui.create("pshbtt"
,a,b,c,d,true,i)end,label=function(a,b,c,d,i)
sui.create("lbl"
,a,b,c,d,false,i)end}

function onTick()
local j=input.getBool(1)
local k=input.getNumber(3)
local l=input.getNumber(4)
for m=1,#sui.el do
local n=sui.el[m]if n.func then
if j~=n.pretouch then
if sui.isinrect(n.x,n.y,n.w,n.h,k,l)then
if j and n.type=="tglbtt"
then
n.act=not
n.act 
elseif j and n.type=="pshbtt"
then
n.act=true
end
elseif n.type=="pshbtt"
then
n.act=false
end
end
end
n.pretouch=j
end
end

function onDraw()
for m=1,#sui.el do
local n=sui.el[m]if n.text then
screen.drawTextBox(n.x,n.y,n.w,n.h,n.text,0,0)
end
if n.act then
screen.drawRectF(n.x,n.y,n.w,n.h)else screen.drawRect(n.x,n.y,n.w,n.h)
end
end
end
