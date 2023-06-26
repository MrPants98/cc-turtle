function GetPackets()

    ws.receive()
    stringPacket = ws.receive()
    packet = textutils.unserialiseJSON(stringPacket)
    HandlePacket(packet)

end

function HandlePacket(packet)
   
    if packet.data == "forward"  then
        turtle.forward()  
    elseif packet.data == "left" then
        turtle.turnLeft()
    elseif packet.data == "right" then
        turtle.turnRight()
    elseif packet.data == "backwards" then
        turtle.back()
    elseif packet.data == "off" then
        ws.close()
        return 
    end
    GetPackets()

end

ws = http.websocket("ws://localhost:5656")
ws.send("Turtle 1 Connected")

GetPackets()
