* * design : NAND2X1 / process : typical / id : D0007 (2014/10/29 20:34:36) * *
simulator lang=spectre insensitive=no
* * ***************** * *
* * COMPONENT CIRCUIT * *
* * ***************** * *
include "/home/nathan/5710/elc/foo.ipdb/NAND2X1.design/simulate/subckt"
include "/home/nathan/5710/elc/foo.ipdb/AMI06N.device/simulate/model"
include "/home/nathan/5710/elc/foo.ipdb/AMI06P.device/simulate/model"
* *  ********************  * *
* *  PARAMETER DEFINITION  * *
* *  ********************  * *
parameters param_ts_B=0.1n
* *  *******************  * *
* *  INSTANCE DEFINITION  * *
* *  *******************  * *
X_NAND2X1_D0007
+ A
+ B
+ Y
+ VDD
+ GND
+ NAND2X1
V_A ( A 0 ) vsource dc = 0
V_B B 0 vsource type = pwl wave = [ 0  5  0.1n  5  (0.1n+param_ts_B)  0  80n  0  ]
V_VDD ( VDD 0 ) vsource dc = 5
V_GND ( GND 0 ) vsource dc = 0
* *  ****************  * *
* *  SIMULATION SETUP  * *
* *  ****************  * *
SetTempOptions options temp=25
ic Y=5
save A
save V_A:p
save B
save V_B:p
save Y
save VDD
save V_VDD:p
save GND
save V_GND:p
SetFormat options rawfmt=nutascii
a0 altergroup {
parameters param_ts_B=0.1n
}
analysisTran0 tran stop=80n step=10p
a1 altergroup {
parameters param_ts_B=0.3n
}
analysisTran1 tran stop=80n step=10p
a2 altergroup {
parameters param_ts_B=0.7n
}
analysisTran2 tran stop=80n step=10p
a3 altergroup {
parameters param_ts_B=1n
}
analysisTran3 tran stop=80n step=10p
a4 altergroup {
parameters param_ts_B=2n
}
analysisTran4 tran stop=80n step=10p
