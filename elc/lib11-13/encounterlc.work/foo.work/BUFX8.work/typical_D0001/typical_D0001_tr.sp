* * design : BUFX8 / process : typical / id : D0001 (2014/11/13 17:56:36) * *
simulator lang=spectre insensitive=no
* * ***************** * *
* * COMPONENT CIRCUIT * *
* * ***************** * *
include "/home/nathan/5710/elc/lib11-13/foo.ipdb/BUFX8.design/simulate/subckt"
include "/home/nathan/5710/elc/lib11-13/foo.ipdb/AMI06N.device/simulate/model"
include "/home/nathan/5710/elc/lib11-13/foo.ipdb/AMI06P.device/simulate/model"
* *  ********************  * *
* *  PARAMETER DEFINITION  * *
* *  ********************  * *
parameters param_ts_A=0.1n
parameters param_cl_Y=0.2p
* *  *******************  * *
* *  INSTANCE DEFINITION  * *
* *  *******************  * *
X_BUFX8_D0001
+ A
+ Y
+ VDD
+ GND
+ BUFX8
V_A A 0 vsource type = pwl wave = [ 0  5  0.1n  5  (0.1n+param_ts_A)  0  80n  0  ]
V_Y ( Y Y_ ) vsource dc = 0
C_Y ( Y_ 0 ) capacitor c = param_cl_Y
V_VDD ( VDD 0 ) vsource dc = 5
V_GND ( GND 0 ) vsource dc = 0
* *  ****************  * *
* *  SIMULATION SETUP  * *
* *  ****************  * *
SetTempOptions options temp=25
ic Y=5
save A
save V_A:p
save Y
save V_Y:p
save VDD
save V_VDD:p
save GND
save V_GND:p
SetFormat options rawfmt=nutascii
simulator lang=spice
.measure tran delay_D0001 trig v(A) val=3.500000 cross=1 targ v(Y) val=1.500000 cross=1
.measure tran slew_D0001 trig v(Y) val=1.000000 cross=1 targ v(Y) val=4.000000 cross=1
simulator lang=spectre insensitive=no
a0 altergroup {
parameters param_ts_A=0.1n
parameters param_cl_Y=0.2p
}
analysisTran0 tran stop=80n step=10p
a1 altergroup {
parameters param_ts_A=0.1n
parameters param_cl_Y=0.4p
}
analysisTran1 tran stop=80n step=10p
a2 altergroup {
parameters param_ts_A=0.1n
parameters param_cl_Y=0.8p
}
analysisTran2 tran stop=80n step=10p
a3 altergroup {
parameters param_ts_A=0.1n
parameters param_cl_Y=2.4p
}
analysisTran3 tran stop=80n step=10p
a4 altergroup {
parameters param_ts_A=0.1n
parameters param_cl_Y=4.8p
}
analysisTran4 tran stop=80n step=10p
a5 altergroup {
parameters param_ts_A=0.3n
parameters param_cl_Y=0.2p
}
analysisTran5 tran stop=80n step=10p
a6 altergroup {
parameters param_ts_A=0.3n
parameters param_cl_Y=0.4p
}
analysisTran6 tran stop=80n step=10p
a7 altergroup {
parameters param_ts_A=0.3n
parameters param_cl_Y=0.8p
}
analysisTran7 tran stop=80n step=10p
a8 altergroup {
parameters param_ts_A=0.3n
parameters param_cl_Y=2.4p
}
analysisTran8 tran stop=80n step=10p
a9 altergroup {
parameters param_ts_A=0.3n
parameters param_cl_Y=4.8p
}
analysisTran9 tran stop=80n step=10p
a10 altergroup {
parameters param_ts_A=0.7n
parameters param_cl_Y=0.2p
}
analysisTran10 tran stop=80n step=10p
a11 altergroup {
parameters param_ts_A=0.7n
parameters param_cl_Y=0.4p
}
analysisTran11 tran stop=80n step=10p
a12 altergroup {
parameters param_ts_A=0.7n
parameters param_cl_Y=0.8p
}
analysisTran12 tran stop=80n step=10p
a13 altergroup {
parameters param_ts_A=0.7n
parameters param_cl_Y=2.4p
}
analysisTran13 tran stop=80n step=10p
a14 altergroup {
parameters param_ts_A=0.7n
parameters param_cl_Y=4.8p
}
analysisTran14 tran stop=80n step=10p
a15 altergroup {
parameters param_ts_A=1n
parameters param_cl_Y=0.2p
}
analysisTran15 tran stop=80n step=10p
a16 altergroup {
parameters param_ts_A=1n
parameters param_cl_Y=0.4p
}
analysisTran16 tran stop=80n step=10p
a17 altergroup {
parameters param_ts_A=1n
parameters param_cl_Y=0.8p
}
analysisTran17 tran stop=80n step=10p
a18 altergroup {
parameters param_ts_A=1n
parameters param_cl_Y=2.4p
}
analysisTran18 tran stop=80n step=10p
a19 altergroup {
parameters param_ts_A=1n
parameters param_cl_Y=4.8p
}
analysisTran19 tran stop=80n step=10p
a20 altergroup {
parameters param_ts_A=2n
parameters param_cl_Y=0.2p
}
analysisTran20 tran stop=80n step=10p
a21 altergroup {
parameters param_ts_A=2n
parameters param_cl_Y=0.4p
}
analysisTran21 tran stop=80n step=10p
a22 altergroup {
parameters param_ts_A=2n
parameters param_cl_Y=0.8p
}
analysisTran22 tran stop=80n step=10p
a23 altergroup {
parameters param_ts_A=2n
parameters param_cl_Y=2.4p
}
analysisTran23 tran stop=80n step=10p
a24 altergroup {
parameters param_ts_A=2n
parameters param_cl_Y=4.8p
}
analysisTran24 tran stop=80n step=10p
