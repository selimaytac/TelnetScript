# Telnet Script


## Excel Format

```
Site	Port
www.facebook.com	443
www.jetbrains.com	80
www.github.com	443
dsm	443
dsm	80
www.google.com	443
```

## Example Results Txt

```
------------------------------------------
Script Started Date => 09/21/2022 09:35:31 
------------------------------------------
www.facebook.com - 443 => Success
www.jetbrains.com - 80 => Success
www.github.com - 443 => Success
dsm - 80 => Success
dsm - 443 => Success
www.google.com - 443 => Success
------------------------------------------ 
```

## Example Error Txt

```
------------------------------------------
Script Started Date => 09/08/2022 11:40:06 
------------------------------------------
xxxxxxx - 443 => System.Management.Automation.MethodInvocationException | Exception calling ".ctor" with "2" argument(s): "A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond xxxxxxx:443" 
xxxxxxx - 443 => System.Management.Automation.MethodInvocationException | Exception calling ".ctor" with "2" argument(s): "A connection attempt failed because the connected party did not properly respond after a period of time, or established connection failed because connected host has failed to respond xxxxxxx:443"  
------------------------------------------ 
```