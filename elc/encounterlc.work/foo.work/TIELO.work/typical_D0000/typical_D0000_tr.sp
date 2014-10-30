* * design : TIELO / process : typical / id : D0000 (2014/10/29 20:34:38) * *
simulator lang=spectre insensitive=no
* * ***************** * *
* * COMPONENT CIRCUIT * *
* * ***************** * *
include "/home/nathan/5710/elc/foo.ipdb/TIELO.design/simulate/subckt"
include "/home/nathan/5710/elc/foo.ipdb/AMI06N.device/simulate/model"
include "/home/nathan/5710/elc/foo.ipdb/AMI06P.device/simulate/model"
* *  ********************  * *
* *  PARAMETER DEFINITION  * *
* *  ********************  * *
* *  *******************  * *
* *  INSTANCE DEFINITION  * *
* *  *******************  * *
X_TIELO_D0000
+ Y
+ VDD
+ GND
+ TIELO
V_Y ( Y 0 ) vsource dc = 0
V_VDD ( VDD 0 ) vsource dc = 5
V_GND ( GND 0 ) vsource dc = 0
* *  ****************  * *
* *  SIMULATION SETUP  * *
* *  ****************  * *
SetTempOptions options temp=25
save Y
save VDD
save V_VDD:p
save GND
save V_GND:p
SetFormat options rawfmt=nutascii
a0 altergroup {
}
analysisTran0 tran stop=80n step=10p
