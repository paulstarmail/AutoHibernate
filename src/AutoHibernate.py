#!/usr/bin/python3

#Needs "acpi" ubuntu package to work.

import os
import time

while 1:

	threshold = 8

	stream = os.popen("acpi -a | cut -d ' ' -f3")
	adapter_state = str(stream.read())
	stream.close()

	stream = os.popen("acpi | cut -d ',' -f2 | cut -d ' ' -f2 | cut -d '%' -f1")
	power_percent = float(stream.read())
	stream.close()
	
	print(adapter_state)
		
	if adapter_state == "off-line\n" and power_percent <= threshold:
		print("Hibernating...")
		os.system("sudo systemctl hibernate")
	else:
		print("Battery charge not reached lower threshold of "+ str(threshold) + " or presently charging")
	
	time.sleep(15)
	
