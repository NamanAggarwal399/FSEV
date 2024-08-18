M=282.6
hcom=233.32
tf=1210
tr=1177
g=9.8
a=887
b=674
a1=1.5*9.8
a2=1.5*9.8
a2
Nf= (M*g*b)/(a+b) 
Nr= (M*g*a)/(a+b ) 
Naf= (M*g*b+M*a1*hcom)/(a+b)
Nar= (M*g*a-M*a1*hcom)/(a+b)
Wf= Naf/g
Wr= Nar/g
Wf1=(Wf*tf-Wf*2*a2/g*hcom)/2/tf
Wf2=(Wf*tf+Wf*2*a2/g*hcom)/2/tf
Wr1=(Wr*tr-Wr*2*a2/g*hcom)/2/tr
Wr2=(Wr*tr+Wr*2*a2/g*hcom)/2/tr
Wc=Wf1+Wf2+Wr1+Wr2

