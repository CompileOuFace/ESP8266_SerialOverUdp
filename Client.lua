wifi.setmode(wifi.STATION)  
 wifi.sta.config("NodeNCU_Udp","")  
 wifi.sta.connect()  
 LED_PIN1 = 4  
 gpio.mode(LED_PIN1, gpio.OUTPUT)  
 print (wifi.sta.getip())  
 
 clientNb=1
 x=1  

 serial=""

 print("The serial is sent over udp")
 
 uart.on("data", "\r",
    function(serial)
    --print("receive from uart:", serial)
    print(serial)
    connec = net.createConnection(net.UDP, 0)  
    connec:connect(8888,"192.168.4.1")  
    connec:send(serial)
   
    if data=="quit\r" then
        print("quit received")
      uart.on("serial") -- unregister callback function
    end
 end, 0)
 
 function Send()  
   conn = net.createConnection(net.UDP, 0)  
   conn:connect(8888,"192.168.4.1")  
   conn:send(clientNb.."\t"..x.."\t"..serial)
   print (serial)  
   serial=""  
   conn:close()  
   conn = nil  
   x=x+1  
   print (x)  
   if x>1000 then x=1 end  
   p=tonumber(wifi.sta.status())  
   print (p)  
   if p == 5  
     then  
     gpio.write(LED_PIN1, gpio.LOW)  
     --print ("LED ON")  
     else  
     gpio.write(LED_PIN1, gpio.HIGH)  
     --print ("LED OFF")  
     end  
 end  

 
-- tmr.alarm(2, 100, 1, Send)
