sui = { -- simple ui extension
	el = {},
	
    isinrect = function(x, y, w, h, inx, iny)
        return (
            inx >= x and inx <= x + w and
            iny >= y and iny <= y + h
        )
    end,

    create = function(type, x, y, w, h, func, text)
        table.insert(sui.el, {
            type = type,
            text = text,
            x = x,
            y = y,
            w = w,
            h = h,
            act = false,       -- is active
            pretouch = false, -- previous touch state
            func = func        -- is functional
        })
    end,

    tglbutton = function(x, y, w, h)
        sui.create("tglbtt", x, y, w, h, true)
    end,
    
    pshbutton = function(x, y, w, h)
        sui.create("pshbtt", x, y, w, h, true)
    end,
    
    txttglbutton = function(x, y, w, h, text)
        sui.create("tglbtt", x, y, w, h, true, text)
    end,
    
    txtpshbutton = function(x, y, w, h, text)
        sui.create("pshbtt", x, y, w, h, true, text)
    end,
    
    label = function(x, y, w, h, text)
    	sui.create("lbl", x, y, w, h, false, text)
    end
}


function onTick()
    local touch = input.getBool(1)
    
    local touchx = input.getNumber(3)
    local touchy = input.getNumber(4)

    for i = 1, #sui.el do
        local e = sui.el[i]

        if e.func then
            if touch ~= e.pretouch then
                if sui.isinrect(e.x, e.y, e.w, e.h, touchx, touchy) then
                    if touch and e.type == "tglbtt" then
                        e.act = not e.act
                    elseif touch and e.type == "pshbtt" then
                        e.act = true
                    end
                elseif e.type == "pshbtt" then
                    e.act = false
                end
            end
        end
        e.pretouch = touch
    end
end

function onDraw()
    for i = 1, #sui.el do
        local e = sui.el[i]
		
		if e.text then
			screen.drawTextBox(e.x, e.y, e.w, e.h, e.text, 0, 0)
		end
		
        if e.act then
            screen.drawRectF(e.x, e.y, e.w, e.h)
        else
            screen.drawRect(e.x, e.y, e.w, e.h)
        end
    end
end
