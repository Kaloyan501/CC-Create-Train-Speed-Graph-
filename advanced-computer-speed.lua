print("---Create Mod Train Speed script---")
shell.run("wget https://github.com/9551-Dev/apis/raw/main/graphir.lua")
shell.run("wget https://github.com/9551-Dev/apis/raw/main/pixelbox_lite.lua")
local graphir  = require("graphir")
local pixelbox = require("pixelbox_lite")
local monitor = peripheral.find("monitor")
local box = pixelbox.new(monitor)
local graph = graphir.new(box,colors.lightGray,colors.black,true,"normal")
 
while true==true do
    local a_x, a_y, a_z = gps.locate(5)
    print("---FIRST COORD---")
    print(a_x)
    print(a_y)
    print(a_z)
    os.sleep(5)
    local b_x, b_y, b_z = gps.locate(5)
    print("---SECOND COORD---")
    print(b_x)
    print(b_y)
    print(b_z)
    local delta_x = a_x - b_x
    local delta_z = a_z - b_z
    print("---DELTA---")
    print(delta_x)
    print(delta_z)
    
    local distance = math.sqrt(delta_x^2 + delta_z^2)
    local a_x = nil
    local b_x = nil
    local b_y = nil
    local a_y = nil
    local a_z = nil
    local b_z = nil
    print(distance)
    os.sleep(0.5)
    
    print("Speed")
    local speed = distance/5.5
    print(speed)
    monitor.setBackgroundColor(colors.black)
    monitor.setBackgroundColor(colors.black)
    monitor.setTextColor(colors.white)
    
    graph:add(speed)
    graph:push()
    box:render()
    term.setCursorPos(1, 1)
    term.setBackgroundColor(colors.white)
    term.setTextColor(colors.black)
    monitor.write("Current speed:"..speed.. " a second")
end
