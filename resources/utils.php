<?php

/*
** Given the name of a network interface, e.g. "eth0", 
** return the corresponding network ip address. 
*/
function getIPAddressFromInterface($network_interface) { 
	$ip=exec("ifconfig | sed -n '/eth0/,/^$/p' | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*'");
        return $ip;  
}

/*
** Return the server ip address by examining the network interfaces.
**
** We'll look only at network interface "eth0", but this function 
** should be easy to extend to examine other interfaces, e.g. "wan0".
*/
function getIPAddress() {
	if (DETERMINE_ADAPTER_IP == 'FALSE') {
		$ip='localhost';
	} else {
		$ip=getIPAddressFromInterface("eth0");
	}
	return $ip;
}

?>
