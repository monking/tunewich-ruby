" not ready to run on its own: copy these as macros and run them. Sorry :(
" reformat for work
:%s/^\(\d\+\.\s\+\)\?\("\)\?\(.*\)\2\t\(\d\+\):\(\d\+\)/\4 * 60 + \5\r\3/ggO0DELETEME€ýaj
" repeat until the end
kkyyjpA + €ýaJV:!bcyy2pkA / 60jA % 60€ýakV:!bcjV:!bckA:Jxjjj
" delete excess
ggdd.:%s/^\(\d\+:\d\+\)$€kb\n\d\+$€kb\n\(.*\)/\1  \2/
