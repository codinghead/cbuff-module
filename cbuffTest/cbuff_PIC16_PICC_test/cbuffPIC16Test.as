opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 5239"

opt pagewidth 120

	opt pm

	processor	16F887
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
;BANK0:	_main->_cbuffGetSpace
;BANK1:	_main->_cbuffGetFill
;COMMON:	_cbuffGetFill->_cbuffGetSpace
;BANK0:	_cbuffGetFill->_cbuffGetSpace
;BANK1:	_cbuffGetFill->_cbuffGetSpace
;COMMON:	_main->_cbuffPeekHead
	FNCALL	_main,_cbuffInit
	FNCALL	_main,_cbuffCreate
	FNCALL	_main,_cbuffDestroy
	FNCALL	_main,_cbuffOpen
	FNCALL	_main,_cbuffClose
	FNCALL	_main,_cbuffGetSpace
	FNCALL	_main,_cbuffGetFill
	FNCALL	_main,_cbuffPutByte
	FNCALL	_main,_cbuffGetByte
	FNCALL	_main,_cbuffClearBuffer
	FNCALL	_main,_cbuffPeekHead
	FNCALL	_main,_cbuffPeekTail
	FNCALL	_main,_cbuffUnputByte
	FNCALL	_main,_cbuffPutArray
	FNCALL	_main,_cbuffGetArray
	FNCALL	_cbuffGetFill,_cbuffGetSpace
	FNROOT	_main
	global	_startOfCbuffObjs
	global	_testBuffer2
	global	_testBuffer1
	global	_inBufferObj
	global	_outBufferObj
	global	_testBuffer1Obj
	global	_testBuffer2Obj
	global	_inBuffer
	global	_outBuffer
	global	_ADCON0
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:
_ADCON0  equ     31
	global	_ADRESH
_ADRESH  equ     30
	global	_CCP1CON
_CCP1CON  equ     23
	global	_CCP2CON
_CCP2CON  equ     29
	global	_CCPR1H
_CCPR1H  equ     22
	global	_CCPR1L
_CCPR1L  equ     21
	global	_CCPR2H
_CCPR2H  equ     28
	global	_CCPR2L
_CCPR2L  equ     27
	global	_FSR
_FSR  equ     4
	global	_INDF
_INDF  equ     0
	global	_INTCON
_INTCON  equ     11
	global	_PCL
_PCL  equ     2
	global	_PCLATH
_PCLATH  equ     10
	global	_PIR1
_PIR1  equ     12
	global	_PIR2
_PIR2  equ     13
	global	_PORTA
_PORTA  equ     5
	global	_PORTB
_PORTB  equ     6
	global	_PORTC
_PORTC  equ     7
	global	_PORTD
_PORTD  equ     8
	global	_PORTE
_PORTE  equ     9
	global	_RCREG
_RCREG  equ     26
	global	_RCSTA
_RCSTA  equ     24
	global	_SSPBUF
_SSPBUF  equ     19
	global	_SSPCON
_SSPCON  equ     20
	global	_STATUS
_STATUS  equ     3
	global	_T1CON
_T1CON  equ     16
	global	_T2CON
_T2CON  equ     18
	global	_TMR0
_TMR0  equ     1
	global	_TMR1H
_TMR1H  equ     15
	global	_TMR1L
_TMR1L  equ     14
	global	_TMR2
_TMR2  equ     17
	global	_TXREG
_TXREG  equ     25
	global	_ADCS0
_ADCS0  equ     254
	global	_ADCS1
_ADCS1  equ     255
	global	_ADDEN
_ADDEN  equ     195
	global	_ADIF
_ADIF  equ     102
	global	_ADON
_ADON  equ     248
	global	_BCLIF
_BCLIF  equ     107
	global	_C1IF
_C1IF  equ     109
	global	_C2IF
_C2IF  equ     110
	global	_CARRY
_CARRY  equ     24
	global	_CCP1IF
_CCP1IF  equ     98
	global	_CCP1M0
_CCP1M0  equ     184
	global	_CCP1M1
_CCP1M1  equ     185
	global	_CCP1M2
_CCP1M2  equ     186
	global	_CCP1M3
_CCP1M3  equ     187
	global	_CCP2IF
_CCP2IF  equ     104
	global	_CCP2M0
_CCP2M0  equ     232
	global	_CCP2M1
_CCP2M1  equ     233
	global	_CCP2M2
_CCP2M2  equ     234
	global	_CCP2M3
_CCP2M3  equ     235
	global	_CCP2X
_CCP2X  equ     237
	global	_CCP2Y
_CCP2Y  equ     236
	global	_CHS0
_CHS0  equ     250
	global	_CHS1
_CHS1  equ     251
	global	_CHS2
_CHS2  equ     252
	global	_CHS3
_CHS3  equ     253
	global	_CKP
_CKP  equ     164
	global	_CREN
_CREN  equ     196
	global	_DC
_DC  equ     25
	global	_DC1B0
_DC1B0  equ     188
	global	_DC1B1
_DC1B1  equ     189
	global	_EEIF
_EEIF  equ     108
	global	_FERR
_FERR  equ     194
	global	_GIE
_GIE  equ     95
	global	_GODONE
_GODONE  equ     249
	global	_INTE
_INTE  equ     92
	global	_INTF
_INTF  equ     89
	global	_IRP
_IRP  equ     31
	global	_OERR
_OERR  equ     193
	global	_OSFIF
_OSFIF  equ     111
	global	_P1M0
_P1M0  equ     190
	global	_P1M1
_P1M1  equ     191
	global	_PD
_PD  equ     27
	global	_PEIE
_PEIE  equ     94
	global	_RA0
_RA0  equ     40
	global	_RA1
_RA1  equ     41
	global	_RA2
_RA2  equ     42
	global	_RA3
_RA3  equ     43
	global	_RA4
_RA4  equ     44
	global	_RA5
_RA5  equ     45
	global	_RA6
_RA6  equ     46
	global	_RA7
_RA7  equ     47
	global	_RABIE
_RABIE  equ     91
	global	_RABIF
_RABIF  equ     88
	global	_RB0
_RB0  equ     48
	global	_RB1
_RB1  equ     49
	global	_RB2
_RB2  equ     50
	global	_RB3
_RB3  equ     51
	global	_RB4
_RB4  equ     52
	global	_RB5
_RB5  equ     53
	global	_RB6
_RB6  equ     54
	global	_RB7
_RB7  equ     55
	global	_RBIE
_RBIE  equ     91
	global	_RBIF
_RBIF  equ     88
	global	_RC0
_RC0  equ     56
	global	_RC1
_RC1  equ     57
	global	_RC2
_RC2  equ     58
	global	_RC3
_RC3  equ     59
	global	_RC4
_RC4  equ     60
	global	_RC5
_RC5  equ     61
	global	_RC6
_RC6  equ     62
	global	_RC7
_RC7  equ     63
	global	_RCIF
_RCIF  equ     101
	global	_RD0
_RD0  equ     64
	global	_RD1
_RD1  equ     65
	global	_RD2
_RD2  equ     66
	global	_RD3
_RD3  equ     67
	global	_RD4
_RD4  equ     68
	global	_RD5
_RD5  equ     69
	global	_RD6
_RD6  equ     70
	global	_RD7
_RD7  equ     71
	global	_RE0
_RE0  equ     72
	global	_RE1
_RE1  equ     73
	global	_RE2
_RE2  equ     74
	global	_RE3
_RE3  equ     75
	global	_RP0
_RP0  equ     29
	global	_RP1
_RP1  equ     30
	global	_RX9
_RX9  equ     198
	global	_RX9D
_RX9D  equ     192
	global	_SPEN
_SPEN  equ     199
	global	_SREN
_SREN  equ     197
	global	_SSPEN
_SSPEN  equ     165
	global	_SSPIF
_SSPIF  equ     99
	global	_SSPM0
_SSPM0  equ     160
	global	_SSPM1
_SSPM1  equ     161
	global	_SSPM2
_SSPM2  equ     162
	global	_SSPM3
_SSPM3  equ     163
	global	_SSPOV
_SSPOV  equ     166
	global	_T0IE
_T0IE  equ     93
	global	_T0IF
_T0IF  equ     90
	global	_T1CKPS0
_T1CKPS0  equ     132
	global	_T1CKPS1
_T1CKPS1  equ     133
	global	_T1GINV
_T1GINV  equ     135
	global	_T1OSCEN
_T1OSCEN  equ     131
	global	_T1SYNC
_T1SYNC  equ     130
	global	_T2CKPS0
_T2CKPS0  equ     144
	global	_T2CKPS1
_T2CKPS1  equ     145
	global	_TMR1CS
_TMR1CS  equ     129
	global	_TMR1GE
_TMR1GE  equ     134
	global	_TMR1IF
_TMR1IF  equ     96
	global	_TMR1ON
_TMR1ON  equ     128
	global	_TMR2IF
_TMR2IF  equ     97
	global	_TMR2ON
_TMR2ON  equ     146
	global	_TO
_TO  equ     28
	global	_TOUTPS0
_TOUTPS0  equ     147
	global	_TOUTPS1
_TOUTPS1  equ     148
	global	_TOUTPS2
_TOUTPS2  equ     149
	global	_TOUTPS3
_TOUTPS3  equ     150
	global	_TXIF
_TXIF  equ     100
	global	_ULPWUIF
_ULPWUIF  equ     106
	global	_WCOL
_WCOL  equ     167
	global	_ZERO
_ZERO  equ     26
	global	_ADCON1
_ADCON1  equ     159
	global	_ADRESL
_ADRESL  equ     158
	global	_ECCPAS
_ECCPAS  equ     156
	global	_IOCB
_IOCB  equ     150
	global	_OPTION
_OPTION  equ     129
	global	_OSCCON
_OSCCON  equ     143
	global	_OSCTUNE
_OSCTUNE  equ     144
	global	_PCON
_PCON  equ     142
	global	_PIE1
_PIE1  equ     140
	global	_PIE2
_PIE2  equ     141
	global	_PR2
_PR2  equ     146
	global	_PSTRCON
_PSTRCON  equ     157
	global	_PWM1CON
_PWM1CON  equ     155
	global	_SPBRG
_SPBRG  equ     153
	global	_SPBRGH
_SPBRGH  equ     154
	global	_SSPADD
_SSPADD  equ     147
	global	_SSPCON2
_SSPCON2  equ     145
	global	_SSPMSK
_SSPMSK  equ     147
	global	_SSPSTAT
_SSPSTAT  equ     148
	global	_TRISA
_TRISA  equ     133
	global	_TRISB
_TRISB  equ     134
	global	_TRISC
_TRISC  equ     135
	global	_TRISD
_TRISD  equ     136
	global	_TRISE
_TRISE  equ     137
	global	_TXSTA
_TXSTA  equ     152
	global	_VRCON
_VRCON  equ     151
	global	_WPUB
_WPUB  equ     149
	global	_ACKDT
_ACKDT  equ     1165
	global	_ACKEN
_ACKEN  equ     1164
	global	_ACKSTAT
_ACKSTAT  equ     1166
	global	_ADFM
_ADFM  equ     1279
	global	_ADIE
_ADIE  equ     1126
	global	_BCLIE
_BCLIE  equ     1131
	global	_BF
_BF  equ     1184
	global	_BOR
_BOR  equ     1136
	global	_BRG0
_BRG0  equ     1224
	global	_BRG1
_BRG1  equ     1225
	global	_BRG10
_BRG10  equ     1234
	global	_BRG11
_BRG11  equ     1235
	global	_BRG12
_BRG12  equ     1236
	global	_BRG13
_BRG13  equ     1237
	global	_BRG14
_BRG14  equ     1238
	global	_BRG15
_BRG15  equ     1239
	global	_BRG2
_BRG2  equ     1226
	global	_BRG3
_BRG3  equ     1227
	global	_BRG4
_BRG4  equ     1228
	global	_BRG5
_BRG5  equ     1229
	global	_BRG6
_BRG6  equ     1230
	global	_BRG7
_BRG7  equ     1231
	global	_BRG8
_BRG8  equ     1232
	global	_BRG9
_BRG9  equ     1233
	global	_BRGH
_BRGH  equ     1218
	global	_C1IE
_C1IE  equ     1133
	global	_C2IE
_C2IE  equ     1134
	global	_CCP1IE
_CCP1IE  equ     1122
	global	_CCP2IE
_CCP2IE  equ     1128
	global	_CKE
_CKE  equ     1190
	global	_CSRC
_CSRC  equ     1223
	global	_DA
_DA  equ     1189
	global	_ECCPAS0
_ECCPAS0  equ     1252
	global	_ECCPAS1
_ECCPAS1  equ     1253
	global	_ECCPAS2
_ECCPAS2  equ     1254
	global	_ECCPASE
_ECCPASE  equ     1255
	global	_EEIE
_EEIE  equ     1132
	global	_GCEN
_GCEN  equ     1167
	global	_HTS
_HTS  equ     1146
	global	_INTEDG
_INTEDG  equ     1038
	global	_IOCB0
_IOCB0  equ     1200
	global	_IOCB1
_IOCB1  equ     1201
	global	_IOCB2
_IOCB2  equ     1202
	global	_IOCB3
_IOCB3  equ     1203
	global	_IOCB4
_IOCB4  equ     1204
	global	_IOCB5
_IOCB5  equ     1205
	global	_IOCB6
_IOCB6  equ     1206
	global	_IOCB7
_IOCB7  equ     1207
	global	_IRCF0
_IRCF0  equ     1148
	global	_IRCF1
_IRCF1  equ     1149
	global	_IRCF2
_IRCF2  equ     1150
	global	_LTS
_LTS  equ     1145
	global	_OSFIE
_OSFIE  equ     1135
	global	_OSTS
_OSTS  equ     1147
	global	_PDC0
_PDC0  equ     1240
	global	_PDC1
_PDC1  equ     1241
	global	_PDC2
_PDC2  equ     1242
	global	_PDC3
_PDC3  equ     1243
	global	_PDC4
_PDC4  equ     1244
	global	_PDC5
_PDC5  equ     1245
	global	_PDC6
_PDC6  equ     1246
	global	_PEN
_PEN  equ     1162
	global	_POR
_POR  equ     1137
	global	_PRSEN
_PRSEN  equ     1247
	global	_PS0
_PS0  equ     1032
	global	_PS1
_PS1  equ     1033
	global	_PS2
_PS2  equ     1034
	global	_PSA
_PSA  equ     1035
	global	_PSSAC0
_PSSAC0  equ     1250
	global	_PSSAC1
_PSSAC1  equ     1251
	global	_PSSBD0
_PSSBD0  equ     1248
	global	_PSSBD1
_PSSBD1  equ     1249
	global	_RABPU
_RABPU  equ     1039
	global	_RBPU
_RBPU  equ     1039
	global	_RCEN
_RCEN  equ     1163
	global	_RCIE
_RCIE  equ     1125
	global	_RSEN
_RSEN  equ     1161
	global	_RW
_RW  equ     1186
	global	_SBOREN
_SBOREN  equ     1140
	global	_SCS
_SCS  equ     1144
	global	_SEN
_SEN  equ     1160
	global	_SENDB
_SENDB  equ     1219
	global	_SMP
_SMP  equ     1191
	global	_SSPIE
_SSPIE  equ     1123
	global	_START
_START  equ     1187
	global	_STOP
_STOP  equ     1188
	global	_STRA
_STRA  equ     1256
	global	_STRB
_STRB  equ     1257
	global	_STRC
_STRC  equ     1258
	global	_STRD
_STRD  equ     1259
	global	_STRSYNC
_STRSYNC  equ     1260
	global	_SYNC
_SYNC  equ     1220
	global	_T0CS
_T0CS  equ     1037
	global	_T0SE
_T0SE  equ     1036
	global	_TMR1IE
_TMR1IE  equ     1120
	global	_TMR2IE
_TMR2IE  equ     1121
	global	_TRISA0
_TRISA0  equ     1064
	global	_TRISA1
_TRISA1  equ     1065
	global	_TRISA2
_TRISA2  equ     1066
	global	_TRISA3
_TRISA3  equ     1067
	global	_TRISA4
_TRISA4  equ     1068
	global	_TRISA5
_TRISA5  equ     1069
	global	_TRISA6
_TRISA6  equ     1070
	global	_TRISA7
_TRISA7  equ     1071
	global	_TRISB0
_TRISB0  equ     1072
	global	_TRISB1
_TRISB1  equ     1073
	global	_TRISB2
_TRISB2  equ     1074
	global	_TRISB3
_TRISB3  equ     1075
	global	_TRISB4
_TRISB4  equ     1076
	global	_TRISB5
_TRISB5  equ     1077
	global	_TRISB6
_TRISB6  equ     1078
	global	_TRISB7
_TRISB7  equ     1079
	global	_TRISC0
_TRISC0  equ     1080
	global	_TRISC1
_TRISC1  equ     1081
	global	_TRISC2
_TRISC2  equ     1082
	global	_TRISC3
_TRISC3  equ     1083
	global	_TRISC4
_TRISC4  equ     1084
	global	_TRISC5
_TRISC5  equ     1085
	global	_TRISC6
_TRISC6  equ     1086
	global	_TRISC7
_TRISC7  equ     1087
	global	_TRISD0
_TRISD0  equ     1088
	global	_TRISD1
_TRISD1  equ     1089
	global	_TRISD2
_TRISD2  equ     1090
	global	_TRISD3
_TRISD3  equ     1091
	global	_TRISD4
_TRISD4  equ     1092
	global	_TRISD5
_TRISD5  equ     1093
	global	_TRISD6
_TRISD6  equ     1094
	global	_TRISD7
_TRISD7  equ     1095
	global	_TRISE0
_TRISE0  equ     1096
	global	_TRISE1
_TRISE1  equ     1097
	global	_TRISE2
_TRISE2  equ     1098
	global	_TRISE3
_TRISE3  equ     1099
	global	_TRMT
_TRMT  equ     1217
	global	_TUN0
_TUN0  equ     1152
	global	_TUN1
_TUN1  equ     1153
	global	_TUN2
_TUN2  equ     1154
	global	_TUN3
_TUN3  equ     1155
	global	_TUN4
_TUN4  equ     1156
	global	_TX9
_TX9  equ     1222
	global	_TX9D
_TX9D  equ     1216
	global	_TXEN
_TXEN  equ     1221
	global	_TXIE
_TXIE  equ     1124
	global	_UA
_UA  equ     1185
	global	_ULPWUE
_ULPWUE  equ     1141
	global	_ULPWUIE
_ULPWUIE  equ     1130
	global	_VCFG0
_VCFG0  equ     1276
	global	_VCFG1
_VCFG1  equ     1277
	global	_VR0
_VR0  equ     1208
	global	_VR1
_VR1  equ     1209
	global	_VR2
_VR2  equ     1210
	global	_VR3
_VR3  equ     1211
	global	_VREN
_VREN  equ     1215
	global	_VROE
_VROE  equ     1214
	global	_VRR
_VRR  equ     1213
	global	_VRSS
_VRSS  equ     1212
	global	_WPUB0
_WPUB0  equ     1192
	global	_WPUB1
_WPUB1  equ     1193
	global	_WPUB2
_WPUB2  equ     1194
	global	_WPUB3
_WPUB3  equ     1195
	global	_WPUB4
_WPUB4  equ     1196
	global	_WPUB5
_WPUB5  equ     1197
	global	_WPUB6
_WPUB6  equ     1198
	global	_WPUB7
_WPUB7  equ     1199
	global	_CM1CON0
_CM1CON0  equ     263
	global	_CM2CON0
_CM2CON0  equ     264
	global	_CM2CON1
_CM2CON1  equ     265
	global	_EEADR
_EEADR  equ     269
	global	_EEADRH
_EEADRH  equ     271
	global	_EEADRL
_EEADRL  equ     269
	global	_EEDAT
_EEDAT  equ     268
	global	_EEDATA
_EEDATA  equ     268
	global	_EEDATH
_EEDATH  equ     270
	global	_WDTCON
_WDTCON  equ     261
	global	_C1CH0
_C1CH0  equ     2104
	global	_C1CH1
_C1CH1  equ     2105
	global	_C1OE
_C1OE  equ     2109
	global	_C1ON
_C1ON  equ     2111
	global	_C1OUT
_C1OUT  equ     2110
	global	_C1POL
_C1POL  equ     2108
	global	_C1R
_C1R  equ     2106
	global	_C1RSEL
_C1RSEL  equ     2125
	global	_C2CH0
_C2CH0  equ     2112
	global	_C2CH1
_C2CH1  equ     2113
	global	_C2OE
_C2OE  equ     2117
	global	_C2ON
_C2ON  equ     2119
	global	_C2OUT
_C2OUT  equ     2118
	global	_C2POL
_C2POL  equ     2116
	global	_C2R
_C2R  equ     2114
	global	_C2RSEL
_C2RSEL  equ     2124
	global	_C2SYNC
_C2SYNC  equ     2120
	global	_MC1OUT
_MC1OUT  equ     2127
	global	_MC2OUT
_MC2OUT  equ     2126
	global	_SWDTEN
_SWDTEN  equ     2088
	global	_T1GSS
_T1GSS  equ     2121
	global	_WDTPS0
_WDTPS0  equ     2089
	global	_WDTPS1
_WDTPS1  equ     2090
	global	_WDTPS2
_WDTPS2  equ     2091
	global	_WDTPS3
_WDTPS3  equ     2092
	global	_ANSEL
_ANSEL  equ     392
	global	_ANSELH
_ANSELH  equ     393
	global	_BAUDCTL
_BAUDCTL  equ     391
	global	_EECON1
_EECON1  equ     396
	global	_EECON2
_EECON2  equ     397
	global	_SRCON
_SRCON  equ     389
	global	_ABDEN
_ABDEN  equ     3128
	global	_ABDOVF
_ABDOVF  equ     3135
	global	_ANS0
_ANS0  equ     3136
	global	_ANS1
_ANS1  equ     3137
	global	_ANS10
_ANS10  equ     3146
	global	_ANS11
_ANS11  equ     3147
	global	_ANS12
_ANS12  equ     3148
	global	_ANS13
_ANS13  equ     3149
	global	_ANS2
_ANS2  equ     3138
	global	_ANS3
_ANS3  equ     3139
	global	_ANS4
_ANS4  equ     3140
	global	_ANS5
_ANS5  equ     3141
	global	_ANS6
_ANS6  equ     3142
	global	_ANS7
_ANS7  equ     3143
	global	_ANS8
_ANS8  equ     3144
	global	_ANS9
_ANS9  equ     3145
	global	_BRG16
_BRG16  equ     3131
	global	_C1SEN
_C1SEN  equ     3117
	global	_C2REN
_C2REN  equ     3116
	global	_EEPGD
_EEPGD  equ     3175
	global	_FVREN
_FVREN  equ     3112
	global	_PULSR
_PULSR  equ     3114
	global	_PULSS
_PULSS  equ     3115
	global	_RCIDL
_RCIDL  equ     3134
	global	_RD
_RD  equ     3168
	global	_SCKP
_SCKP  equ     3132
	global	_SR0
_SR0  equ     3118
	global	_SR1
_SR1  equ     3119
	global	_WR
_WR  equ     3169
	global	_WREN
_WREN  equ     3170
	global	_WRERR
_WRERR  equ     3171
	global	_WUE
_WUE  equ     3129
	file	"cbuffPIC16Test.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_startOfCbuffObjs:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_testBuffer2:
       ds      16

_testBuffer1:
       ds      8

_inBufferObj:
       ds      7

_outBufferObj:
       ds      7

_testBuffer1Obj:
       ds      7

_testBuffer2Obj:
       ds      7

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_outBuffer:
       ds      32

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_inBuffer:
       ds      64

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+034h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+020h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+040h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initationation code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	?_cbuffGetSpace
?_cbuffGetSpace: ;@ 0x0
	ds	2
	global	??_cbuffGetFill
??_cbuffGetFill: ;@ 0x2
	ds	10
	global	?_cbuffGetFill
?_cbuffGetFill: ;@ 0xC
	ds	2
	global	main@hDummyHandle
main@hDummyHandle:	; 1 bytes @ 0xE
	ds	1
	global	main@testBuffer2Num
main@testBuffer2Num:	; 1 bytes @ 0xF
	ds	1
	global	main@testBuffer1Num
main@testBuffer1Num:	; 1 bytes @ 0x10
	ds	1
	global	main@outBufferNum
main@outBufferNum:	; 1 bytes @ 0x11
	ds	1
	global	main@hInBuffer
main@hInBuffer:	; 1 bytes @ 0x12
	ds	1
	global	main@inBufferNum
main@inBufferNum:	; 1 bytes @ 0x13
	ds	1
	global	main@spaceRemainingInBuffer
main@spaceRemainingInBuffer:	; 2 bytes @ 0x14
	ds	2
	global	main@writeData
main@writeData:	; 1 bytes @ 0x16
	ds	1
	global	main@readData
main@readData:	; 1 bytes @ 0x17
	ds	1
	global	main@dataInBuffer
main@dataInBuffer:	; 2 bytes @ 0x18
	ds	2
	global	main@hOutBuffer
main@hOutBuffer:	; 1 bytes @ 0x1A
	ds	1
	global	main@x
main@x:	; 1 bytes @ 0x1B
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_cbuffGetByte
??_cbuffGetByte: ;@ 0x0
	global	??_cbuffPutByte
??_cbuffPutByte: ;@ 0x0
	global	??_cbuffUnputByte
??_cbuffUnputByte: ;@ 0x0
	global	??_cbuffGetArray
??_cbuffGetArray: ;@ 0x0
	global	??_cbuffPeekTail
??_cbuffPeekTail: ;@ 0x0
	global	??_cbuffPutArray
??_cbuffPutArray: ;@ 0x0
	global	??_cbuffClose
??_cbuffClose: ;@ 0x0
	global	?_cbuffInit
?_cbuffInit: ;@ 0x0
	global	??_cbuffCreate
??_cbuffCreate: ;@ 0x0
	global	??_cbuffOpen
??_cbuffOpen: ;@ 0x0
	global	??_cbuffInit
??_cbuffInit: ;@ 0x0
	global	??_cbuffClearBuffer
??_cbuffClearBuffer: ;@ 0x0
	global	??_cbuffDestroy
??_cbuffDestroy: ;@ 0x0
	global	??_cbuffPeekHead
??_cbuffPeekHead: ;@ 0x0
	global	cbuffGetSpace@hCircBuffer
cbuffGetSpace@hCircBuffer:	; 1 bytes @ 0x0
	global	cbuffClose@hCircBuffer
cbuffClose@hCircBuffer:	; 1 bytes @ 0x0
	global	cbuffOpen@bufferNumber
cbuffOpen@bufferNumber:	; 1 bytes @ 0x0
	ds	1
	global	?_cbuffClose
?_cbuffClose: ;@ 0x1
	global	cbuffDestroy@tempCircBufferObj
cbuffDestroy@tempCircBufferObj:	; 1 bytes @ 0x1
	global	cbuffGetFill@hCircBuffer
cbuffGetFill@hCircBuffer:	; 1 bytes @ 0x1
	global	cbuffOpen@localCircBufferObj
cbuffOpen@localCircBufferObj:	; 1 bytes @ 0x1
	ds	1
	global	?_cbuffOpen
?_cbuffOpen: ;@ 0x2
	global	cbuffClearBuffer@hCircBuffer
cbuffClearBuffer@hCircBuffer:	; 1 bytes @ 0x2
	global	cbuffDestroy@bufferNumber
cbuffDestroy@bufferNumber:	; 1 bytes @ 0x2
	ds	1
	global	?_cbuffClearBuffer
?_cbuffClearBuffer: ;@ 0x3
	global	cbuffDestroy@localCircBufferObj
cbuffDestroy@localCircBufferObj:	; 1 bytes @ 0x3
	global	cbuffPeekTail@hCircBuffer
cbuffPeekTail@hCircBuffer:	; 1 bytes @ 0x3
	ds	1
	global	?_cbuffDestroy
?_cbuffDestroy: ;@ 0x4
	global	?_cbuffUnputByte
?_cbuffUnputByte: ;@ 0x4
	ds	1
	global	??_main
??_main: ;@ 0x5
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_cbuffGetSpace
??_cbuffGetSpace: ;@ 0x0
	global	?_cbuffPeekTail
?_cbuffPeekTail: ;@ 0x0
	global	cbuffPeekHead@hCircBuffer
cbuffPeekHead@hCircBuffer:	; 1 bytes @ 0x0
	global	cbuffCreate@circBuffNum
cbuffCreate@circBuffNum:	; 1 bytes @ 0x0
	global	cbuffGetByte@hCircBuffer
cbuffGetByte@hCircBuffer:	; 1 bytes @ 0x0
	global	cbuffPutByte@hCircBuffer
cbuffPutByte@hCircBuffer:	; 1 bytes @ 0x0
	global	cbuffUnputByte@hCircBuffer
cbuffUnputByte@hCircBuffer:	; 1 bytes @ 0x0
	global	cbuffPeekTail@data
cbuffPeekTail@data:	; 1 bytes @ 0x0
	global	cbuffPutArray@bytesWritten
cbuffPutArray@bytesWritten:	; 2 bytes @ 0x0
	global	cbuffGetArray@bytesRead
cbuffGetArray@bytesRead:	; 2 bytes @ 0x0
	ds	1
	global	?_cbuffPeekHead
?_cbuffPeekHead: ;@ 0x1
	global	?_cbuffGetByte
?_cbuffGetByte: ;@ 0x1
	global	?_cbuffPutByte
?_cbuffPutByte: ;@ 0x1
	global	cbuffPeekHead@data
cbuffPeekHead@data:	; 1 bytes @ 0x1
	global	cbuffCreate@localCircBufferObj
cbuffCreate@localCircBufferObj:	; 1 bytes @ 0x1
	global	cbuffGetByte@data
cbuffGetByte@data:	; 1 bytes @ 0x1
	global	cbuffPutByte@data
cbuffPutByte@data:	; 1 bytes @ 0x1
	ds	1
	global	?_cbuffCreate
?_cbuffCreate: ;@ 0x2
	global	cbuffPutArray@hCircBuffer
cbuffPutArray@hCircBuffer:	; 1 bytes @ 0x2
	global	cbuffGetArray@hCircBuffer
cbuffGetArray@hCircBuffer:	; 1 bytes @ 0x2
	global	cbuffCreate@buffer
cbuffCreate@buffer:	; 2 bytes @ 0x2
	ds	1
	global	?_cbuffGetArray
?_cbuffGetArray: ;@ 0x3
	global	?_cbuffPutArray
?_cbuffPutArray: ;@ 0x3
	global	cbuffPutArray@data
cbuffPutArray@data:	; 1 bytes @ 0x3
	global	cbuffGetArray@data
cbuffGetArray@data:	; 1 bytes @ 0x3
	ds	1
	global	cbuffGetArray@noOfBytes
cbuffGetArray@noOfBytes:	; 2 bytes @ 0x4
	global	cbuffCreate@sizeOfBuffer
cbuffCreate@sizeOfBuffer:	; 2 bytes @ 0x4
	global	cbuffPutArray@noOfBytes
cbuffPutArray@noOfBytes:	; 2 bytes @ 0x4
	ds	2
	global	cbuffCreate@newCircBufferObj
cbuffCreate@newCircBufferObj:	; 1 bytes @ 0x6
	ds	8
	global	?_main
?_main: ;@ 0xE
;Data sizes: Strings 0, constant 0, data 0, bss 149, persistent 0 stack 0
;Auto spaces:   Size  Autos    Used
; COMMON          14      7       8
; BANK0           80     14      66
; BANK1           80     28      60
; BANK3           96      0      64
; BANK2           96      0       0


;Pointer list with targets:

;startOfCbuffObjs	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffCreate@buffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@newCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffCreate@newCircBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;S19CBUFFTYPE$startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@newCircBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;S19CBUFFTYPE$endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@newCircBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;S19CBUFFTYPE$inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@newCircBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;S19CBUFFTYPE$outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@newCircBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;S19CBUFFTYPE$nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffCreate@localCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffCreate@localCircBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@localCircBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@localCircBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffCreate@localCircBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffCreate@localCircBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@localCircBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@localCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffDestroy@localCircBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@localCircBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@localCircBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@localCircBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffDestroy@tempCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffDestroy@tempCircBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@tempCircBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@tempCircBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@tempCircBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffDestroy@tempCircBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffOpen@localCircBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffOpen@localCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffOpen@localCircBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffOpen@localCircBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffOpen@localCircBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffOpen@localCircBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;sp__cbuffOpen	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffClose@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffClose@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClose@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClose@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffClose@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClose@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutByte@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPutByte@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutByte@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPutByte@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutByte@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutByte@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetSpace@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetSpace@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetSpace@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetSpace@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetSpace@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetSpace@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetFill@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetFill@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetFill@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetFill@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetFill@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetFill@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClearBuffer@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffClearBuffer@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClearBuffer@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffClearBuffer@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClearBuffer@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffClearBuffer@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetByte@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetByte@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetByte@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetByte@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetByte@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetByte@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetByte@data	PTR unsigned char  size(1); Largest target is 1
;		 -> main@readData(BANK1[1]), 
;cbuffPeekTail@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekTail@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekTail@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPeekTail@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekTail@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekTail@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPeekTail@data	PTR unsigned char  size(1); Largest target is 1
;		 -> main@readData(BANK1[1]), 
;cbuffPeekHead@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekHead@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPeekHead@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekHead@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekHead@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPeekHead@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPeekHead@data	PTR unsigned char  size(1); Largest target is 1
;		 -> main@readData(BANK1[1]), 
;cbuffUnputByte@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffUnputByte@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUnputByte@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUnputByte@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUnputByte@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUnputByte@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffUngetByte@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUngetByte@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffUngetByte@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUngetByte@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffUngetByte@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutArray@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPutArray@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutArray@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutArray@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutArray@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffPutArray@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffPutArray@data	PTR const unsigned char  size(1); Largest target is 16
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetArray@hCircBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetArray@hCircBuffer.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetArray@hCircBuffer.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;cbuffGetArray@hCircBuffer.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetArray@hCircBuffer.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetArray@hCircBuffer.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;cbuffGetArray@data	PTR unsigned char  size(1); Largest target is 16
;		 -> testBuffer2(BANK0[16]), 
;inBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;inBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;inBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;inBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;inBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;outBufferObj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;testBuffer1Obj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer1Obj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer1Obj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;outBufferObj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;outBufferObj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;outBufferObj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;outBufferObj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer2Obj.startOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer2Obj.endOfBuffer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer2Obj.inPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer2Obj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer1Obj.outPointer	PTR unsigned char  size(2); Largest target is 128
;		 -> RAM(NULL[128]), outBuffer(BANK1[32]), testBuffer1(BANK0[8]), inBuffer(BANK3[64]), 
;		 -> testBuffer2(BANK0[16]), 
;testBuffer1Obj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;testBuffer2Obj.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;main@hInBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;main@hOutBuffer	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;main@hDummyHandle	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;?_cbuffGetArray	unsigned int  size(1); Largest target is 0
;?_cbuffPutArray	unsigned int  size(1); Largest target is 0
;?_cbuffGetFill	unsigned int  size(1); Largest target is 0
;?_cbuffGetSpace	unsigned int  size(1); Largest target is 0
;?_cbuffOpen	PTR struct CBUFFTYPE size(1); Largest target is 128
;		 -> RAM(NULL[128]), inBufferObj(BANK0[7]), outBufferObj(BANK0[7]), testBuffer1Obj(BANK0[7]), 
;		 -> testBuffer2Obj(BANK0[7]), 
;RAM.startOfBuffer	PTR unsigned char  size(1); Largest target is 0
;RAM.endOfBuffer	PTR unsigned char  size(1); Largest target is 0
;RAM.inPointer	PTR unsigned char  size(1); Largest target is 0
;RAM.outPointer	PTR unsigned char  size(1); Largest target is 0
;RAM.nextCircBufferObj	PTR struct CBUFFTYPE size(1); Largest target is 0


;Main: autosize = 0, tempsize = 2, incstack = 0, save=0


;Call graph:                      Base Space Used Autos Args Refs Density
;_main                                               16    0 9786   0.00
;                                    5 COMMO    2
;                                   14 BANK1   14
;          _cbuffInit
;        _cbuffCreate
;       _cbuffDestroy
;          _cbuffOpen
;         _cbuffClose
;      _cbuffGetSpace
;       _cbuffGetFill
;       _cbuffPutByte
;       _cbuffGetByte
;   _cbuffClearBuffer
;      _cbuffPeekHead
;      _cbuffPeekTail
;     _cbuffUnputByte
;      _cbuffPutArray
;      _cbuffGetArray
;  _cbuffPeekHead                                     6    1  168   0.00
;                                    0 COMMO    5
;                                    0 BANK0    2
;  _cbuffClearBuffer                                  3    0  144   0.00
;                                    0 COMMO    3
;  _cbuffGetByte                                      5    1  288   0.00
;                                    0 COMMO    4
;                                    0 BANK0    2
;  _cbuffPeekTail                                     4    1   72   0.00
;                                    0 COMMO    4
;                                    0 BANK0    1
;  _cbuffGetArray                                     7    3  417   0.00
;                                    0 COMMO    4
;                                    0 BANK0    6
;  _cbuffPutArray                                     7    3  417   0.00
;                                    0 COMMO    4
;                                    0 BANK0    6
;  _cbuffUnputByte                                    5    0  240   0.00
;                                    0 COMMO    4
;                                    0 BANK0    1
;  _cbuffPutByte                                      5    1  288   0.00
;                                    0 COMMO    4
;                                    0 BANK0    2
;  _cbuffDestroy                                      4    0  273   0.00
;                                    0 COMMO    4
;  _cbuffCreate                                       6    5  663   0.00
;                                    0 COMMO    4
;                                    0 BANK0    7
;  _cbuffInit                                         0    0    0   0.00
;  _cbuffOpen                                         2    0  174   0.00
;                                    0 COMMO    2
;  _cbuffGetFill                                     11    2  360   0.00
;                                    1 COMMO    1
;                                    2 BANK1   12
;      _cbuffGetSpace
;  _cbuffClose                                        1    0   72   0.00
;                                    0 COMMO    1
;    _cbuffGetSpace                                  15    2  288   0.00
;                                    0 COMMO    1
;                                    0 BANK0   14
;                                    0 BANK1    2
; Estimated maximum call depth 2
; Address spaces:

;Name               Size   Autos  Total    Cost      Usage
;BITCOMMON            E      0       0       0        0.0%
;CODE                 0      0       0       0        0.0%
;NULL                 0      0       0       0        0.0%
;COMMON               E      7       8       1       57.1%
;SFR0                 0      0       0       1        0.0%
;BITSFR0              0      0       0       1        0.0%
;BITSFR1              0      0       0       2        0.0%
;SFR1                 0      0       0       2        0.0%
;ABS                  0      0      C6       2        0.0%
;STACK                0      0       0       3        0.0%
;BITBANK0            50      0       0       4        0.0%
;SFR3                 0      0       0       4        0.0%
;BITSFR3              0      0       0       4        0.0%
;BANK0               50      E      42       5       82.5%
;BITSFR2              0      0       0       5        0.0%
;SFR2                 0      0       0       5        0.0%
;BITBANK1            50      0       0       6        0.0%
;BANK1               50     1C      3C       7       75.0%
;BITBANK3            60      0       0       8        0.0%
;BANK3               60      0      40       9       66.7%
;BITBANK2            60      0       0      10        0.0%
;BANK2               60      0       0      11        0.0%
;DATA                 0      0      C6      12        0.0%
;EEDATA             100      0       0    1000        0.0%

	global	_main
psect	maintext,local,class=CODE,delta=2
global __pmaintext
__pmaintext:

; *************** function _main *****************
; Defined at:
;		line 172 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuffTest\circBufferTest.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;  dataInBuffer    2   24[BANK1 ] unsigned int 
;  spaceRemaini    2   20[BANK1 ] unsigned int 
;  x               1   27[BANK1 ] unsigned char 
;  hOutBuffer      1   26[BANK1 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  readData        1   23[BANK1 ] unsigned char 
;  writeData       1   22[BANK1 ] unsigned char 
;  outBufferNum    1   17[BANK1 ] unsigned char 
;  inBufferNum     1   19[BANK1 ] unsigned char 
;  hInBuffer       1   18[BANK1 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  testBuffer1N    1   16[BANK1 ] unsigned char 
;  testBuffer2N    1   15[BANK1 ] unsigned char 
;  hDummyHandle    1   14[BANK1 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  2   14[BANK0 ] int 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 17F/0
;		On exit  : 160/20
;		Unchanged: FFE80/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0      14       0       0
;      Temp:     2
;      Total:   16
; This function calls:
;		_cbuffInit
;		_cbuffCreate
;		_cbuffDestroy
;		_cbuffOpen
;		_cbuffClose
;		_cbuffGetSpace
;		_cbuffGetFill
;		_cbuffPutByte
;		_cbuffGetByte
;		_cbuffClearBuffer
;		_cbuffPeekHead
;		_cbuffPeekTail
;		_cbuffUnputByte
;		_cbuffPutArray
;		_cbuffGetArray
; This function is called by:
;		Startup code after reset
; This function uses a non-reentrant model
; 
psect	maintext
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuffTest\circBufferTest.c"
	line	172
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
;circBufferTest.c: 170: int main(void)
;circBufferTest.c: 172: {
	
_main:	
	opt stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	174
	
l30001429:	
;circBufferTest.c: 174: CBUFF readData = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@readData)^080h
	line	176
;circBufferTest.c: 175: unsigned char x;
;circBufferTest.c: 176: unsigned int spaceRemainingInBuffer = 0;
	clrf	(main@spaceRemainingInBuffer)^080h
	clrf	(main@spaceRemainingInBuffer+1)^080h
	line	177
;circBufferTest.c: 177: unsigned int dataInBuffer = 0;
	clrf	(main@dataInBuffer)^080h
	clrf	(main@dataInBuffer+1)^080h
	
l30001430:	
	line	190
;circBufferTest.c: 178: CBUFFNUM inBufferNum;
;circBufferTest.c: 179: CBUFFNUM outBufferNum;
;circBufferTest.c: 180: CBUFFNUM testBuffer1Num;
;circBufferTest.c: 181: CBUFFNUM testBuffer2Num;
;circBufferTest.c: 182: HCBUFF hInBuffer;
;circBufferTest.c: 183: HCBUFF hOutBuffer;
;circBufferTest.c: 184: HCBUFF hDummyHandle;
;circBufferTest.c: 190: cbuffInit();
	fcall	_cbuffInit
	
l30001431:	
	line	196
;circBufferTest.c: 196: inBufferNum = cbuffCreate((CBUFF *) 0, 64, &inBufferObj);
	bcf	status, 5	;RP0=0, select bank0
	clrf	(?_cbuffCreate)
	clrf	(?_cbuffCreate+1)
	movlw	040h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_inBufferObj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@inBufferNum)^080h
	
l30001432:	
	line	198
;circBufferTest.c: 198: outBufferNum = cbuffCreate(outBuffer, 0, &outBufferObj);
	movlw	((_outBuffer)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x1/2)
	movwf	(?_cbuffCreate+1)
	clrf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_outBufferObj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@outBufferNum)^080h
	
l30001433:	
	line	201
;circBufferTest.c: 200: testBuffer1Num = cbuffCreate(testBuffer1, 8,
;circBufferTest.c: 201: (CBUFFOBJ *) 0);
	movlw	((_testBuffer1)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x0/2)
	movwf	(?_cbuffCreate+1)
	movlw	08h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	clrf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@testBuffer1Num)^080h
	
l30001434:	
	line	203
;circBufferTest.c: 203: if (inBufferNum != 0)
	movf	(main@inBufferNum)^080h,w
	skipz
	goto	u2880
	goto	l30001435
u2880:
	
l85:	
	goto	l85
	
l30001435:	
	line	212
;circBufferTest.c: 211: }
;circBufferTest.c: 212: if (outBufferNum != 0)
	movf	(main@outBufferNum)^080h,w
	skipz
	goto	u2890
	goto	l30001436
u2890:
	
l89:	
	goto	l89
	
l30001436:	
	line	221
;circBufferTest.c: 220: }
;circBufferTest.c: 221: if (testBuffer1Num != 0)
	movf	(main@testBuffer1Num)^080h,w
	skipz
	goto	u2900
	goto	l30001437
u2900:
	
l93:	
	goto	l93
	
l30001437:	
	line	235
;circBufferTest.c: 229: }
;circBufferTest.c: 235: inBufferNum = cbuffCreate(inBuffer, 64, &inBufferObj);
	movlw	((_inBuffer)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x3/2)
	movwf	(?_cbuffCreate+1)
	movlw	040h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_inBufferObj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@inBufferNum)^080h
	line	236
;circBufferTest.c: 236: outBufferNum = cbuffCreate(outBuffer, 32, &outBufferObj);
	movlw	((_outBuffer)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x1/2)
	movwf	(?_cbuffCreate+1)
	movlw	020h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_outBufferObj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@outBufferNum)^080h
	line	238
;circBufferTest.c: 237: testBuffer1Num = cbuffCreate(testBuffer1, 8,
;circBufferTest.c: 238: &testBuffer1Obj);
	movlw	((_testBuffer1)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x0/2)
	movwf	(?_cbuffCreate+1)
	movlw	08h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_testBuffer1Obj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@testBuffer1Num)^080h
	line	240
;circBufferTest.c: 239: testBuffer2Num = cbuffCreate(testBuffer2, 16,
;circBufferTest.c: 240: &testBuffer2Obj);
	movlw	((_testBuffer2)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x0/2)
	movwf	(?_cbuffCreate+1)
	movlw	010h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_testBuffer2Obj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@testBuffer2Num)^080h
	
l30001438:	
	line	249
;circBufferTest.c: 249: if (inBufferNum != 1)
	decf	(main@inBufferNum)^080h,w
	skipnz
	goto	u2911
	goto	u2910
u2911:
	goto	l30001439
u2910:
	
l97:	
	goto	l97
	
l30001439:	
	line	258
;circBufferTest.c: 257: }
;circBufferTest.c: 258: if (outBufferNum != 2)
	movf	(main@outBufferNum)^080h,w
	xorlw	02h
	skipnz
	goto	u2921
	goto	u2920
u2921:
	goto	l30001440
u2920:
	
l101:	
	goto	l101
	
l30001440:	
	line	267
;circBufferTest.c: 266: }
;circBufferTest.c: 267: if (testBuffer1Num != 3)
	movf	(main@testBuffer1Num)^080h,w
	xorlw	03h
	skipnz
	goto	u2931
	goto	u2930
u2931:
	goto	l30001441
u2930:
	
l105:	
	goto	l105
	
l30001441:	
	line	276
;circBufferTest.c: 275: }
;circBufferTest.c: 276: if (testBuffer2Num != 4)
	movf	(main@testBuffer2Num)^080h,w
	xorlw	04h
	skipnz
	goto	u2941
	goto	u2940
u2941:
	goto	l30001442
u2940:
	
l109:	
	goto	l109
	
l30001442:	
	line	290
;circBufferTest.c: 284: }
;circBufferTest.c: 290: x = cbuffDestroy(16);
	movlw	(010h)
	fcall	_cbuffDestroy
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@x)^080h
	
l30001443:	
	line	292
;circBufferTest.c: 292: if (x == 0x01)
	decf	(main@x)^080h,w
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l30001444
u2950:
	
l113:	
	goto	l113
	
l30001444:	
	line	306
;circBufferTest.c: 300: }
;circBufferTest.c: 306: x = cbuffDestroy(testBuffer1Num);
	movf	(main@testBuffer1Num)^080h,w
	fcall	_cbuffDestroy
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@x)^080h
	
l30001445:	
	line	308
;circBufferTest.c: 308: if (x == 0x00)
	movf	(main@x)^080h,f
	skipz
	goto	u2961
	goto	u2960
u2961:
	goto	l30001446
u2960:
	
l117:	
	goto	l117
	
l30001446:	
	line	318
;circBufferTest.c: 316: }
;circBufferTest.c: 318: x = cbuffDestroy(testBuffer2Num);
	movf	(main@testBuffer2Num)^080h,w
	fcall	_cbuffDestroy
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@x)^080h
	
l30001447:	
	line	320
;circBufferTest.c: 320: if (x == 0x00)
	movf	(main@x)^080h,f
	skipz
	goto	u2971
	goto	u2970
u2971:
	goto	l30001448
u2970:
	
l121:	
	goto	l121
	
l30001448:	
	line	335
;circBufferTest.c: 328: }
;circBufferTest.c: 334: testBuffer2Num = cbuffCreate(testBuffer2, 16,
;circBufferTest.c: 335: &testBuffer2Obj);
	movlw	((_testBuffer2)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x0/2)
	movwf	(?_cbuffCreate+1)
	movlw	010h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_testBuffer2Obj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@testBuffer2Num)^080h
	line	337
;circBufferTest.c: 336: testBuffer1Num = cbuffCreate(testBuffer1, 8,
;circBufferTest.c: 337: &testBuffer1Obj);
	movlw	((_testBuffer1)&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffCreate)
	movlw	80h|(0x0/2)
	movwf	(?_cbuffCreate+1)
	movlw	08h
	movwf	0+(?_cbuffCreate)+02h
	clrf	1+(?_cbuffCreate)+02h
	movlw	((_testBuffer1Obj))&0ffh
	movwf	(0+(?_cbuffCreate)+04h)
	fcall	_cbuffCreate
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@testBuffer1Num)^080h
	
l30001449:	
	line	339
;circBufferTest.c: 339: if (testBuffer1Num != 4)
	movf	(main@testBuffer1Num)^080h,w
	xorlw	04h
	skipnz
	goto	u2981
	goto	u2980
u2981:
	goto	l30001450
u2980:
	
l125:	
	goto	l125
	
l30001450:	
	line	348
;circBufferTest.c: 347: }
;circBufferTest.c: 348: if (testBuffer2Num != 3)
	movf	(main@testBuffer2Num)^080h,w
	xorlw	03h
	skipnz
	goto	u2991
	goto	u2990
u2991:
	goto	l30001451
u2990:
	
l129:	
	goto	l129
	
l30001451:	
	line	361
;circBufferTest.c: 356: }
;circBufferTest.c: 361: hInBuffer = cbuffOpen(16);
	movlw	(010h)
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hInBuffer)^080h
	
l30001452:	
	line	363
;circBufferTest.c: 363: if (hInBuffer != (CBUFFOBJ *) 0)
	movf	(main@hInBuffer)^080h,w
	skipz
	goto	u3000
	goto	l30001453
u3000:
	
l133:	
	goto	l133
	
l30001453:	
	line	376
;circBufferTest.c: 371: }
;circBufferTest.c: 376: hInBuffer = cbuffOpen(inBufferNum);
	movf	(main@inBufferNum)^080h,w
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hInBuffer)^080h
	line	378
;circBufferTest.c: 378: hOutBuffer = cbuffOpen(outBufferNum);
	movf	(main@outBufferNum)^080h,w
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hOutBuffer)^080h
	
l30001454:	
	line	380
;circBufferTest.c: 380: if (hInBuffer == (CBUFFOBJ *) 0)
	movf	(main@hInBuffer)^080h,f
	skipz
	goto	u3011
	goto	u3010
u3011:
	goto	l30001455
u3010:
	
l137:	
	goto	l137
	
l30001455:	
	line	389
;circBufferTest.c: 388: }
;circBufferTest.c: 389: if (hOutBuffer == (CBUFFOBJ *) 0)
	movf	(main@hOutBuffer)^080h,f
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l30001456
u3020:
	
l141:	
	goto	l141
	
l30001456:	
	line	402
;circBufferTest.c: 397: }
;circBufferTest.c: 402: hDummyHandle = cbuffOpen(inBufferNum);
	movf	(main@inBufferNum)^080h,w
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hDummyHandle)^080h
	
l30001457:	
	line	404
;circBufferTest.c: 404: if (hDummyHandle != (CBUFFOBJ *) 0)
	movf	(main@hDummyHandle)^080h,w
	skipz
	goto	u3030
	goto	l30001458
u3030:
	
l145:	
	goto	l145
	
l30001458:	
	line	414
;circBufferTest.c: 412: }
;circBufferTest.c: 414: hDummyHandle = cbuffOpen(outBufferNum);
	movf	(main@outBufferNum)^080h,w
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hDummyHandle)^080h
	
l30001459:	
	line	416
;circBufferTest.c: 416: if (hDummyHandle != (CBUFFOBJ *) 0)
	movf	(main@hDummyHandle)^080h,w
	skipz
	goto	u3040
	goto	l30001460
u3040:
	
l149:	
	goto	l149
	
l30001460:	
	line	430
;circBufferTest.c: 424: }
;circBufferTest.c: 430: inBufferNum = cbuffClose(hInBuffer);
	movf	(main@hInBuffer)^080h,w
	fcall	_cbuffClose
	movwf	(main@inBufferNum)^080h
	line	432
;circBufferTest.c: 432: outBufferNum = cbuffClose(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClose
	movwf	(main@outBufferNum)^080h
	
l30001461:	
	line	434
;circBufferTest.c: 434: if (inBufferNum != 1)
	decf	(main@inBufferNum)^080h,w
	skipnz
	goto	u3051
	goto	u3050
u3051:
	goto	l30001462
u3050:
	
l153:	
	goto	l153
	
l30001462:	
	line	443
;circBufferTest.c: 442: }
;circBufferTest.c: 443: if (outBufferNum != 2)
	movf	(main@outBufferNum)^080h,w
	xorlw	02h
	skipnz
	goto	u3061
	goto	u3060
u3061:
	goto	l30001463
u3060:
	
l157:	
	goto	l157
	
l30001463:	
	line	457
;circBufferTest.c: 451: }
;circBufferTest.c: 457: testBuffer1Num = cbuffClose(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClose
	movwf	(main@testBuffer1Num)^080h
	
l30001464:	
	line	459
;circBufferTest.c: 459: if (testBuffer1Num != 0)
	movf	(main@testBuffer1Num)^080h,w
	skipz
	goto	u3070
	goto	l30001465
u3070:
	
l161:	
	goto	l161
	
l30001465:	
	line	473
;circBufferTest.c: 467: }
;circBufferTest.c: 473: hInBuffer = cbuffOpen(inBufferNum);
	movf	(main@inBufferNum)^080h,w
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hInBuffer)^080h
	line	475
;circBufferTest.c: 475: hOutBuffer = cbuffOpen(outBufferNum);
	movf	(main@outBufferNum)^080h,w
	fcall	_cbuffOpen
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(main@hOutBuffer)^080h
	line	481
;circBufferTest.c: 481: spaceRemainingInBuffer = cbuffGetSpace(hInBuffer);
	movf	(main@hInBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001466:	
	line	482
;circBufferTest.c: 482: if (spaceRemainingInBuffer != 64)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	64
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3081
	goto	u3080
u3081:
	goto	l30001467
u3080:
	
l165:	
	goto	l165
	
l30001467:	
	line	491
;circBufferTest.c: 490: }
;circBufferTest.c: 491: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001468:	
	line	492
;circBufferTest.c: 492: if (spaceRemainingInBuffer != 32)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	32
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3091
	goto	u3090
u3091:
	goto	l30001469
u3090:
	
l169:	
	goto	l169
	
l30001469:	
	line	501
;circBufferTest.c: 500: }
;circBufferTest.c: 501: dataInBuffer = cbuffGetFill(hInBuffer);
	movf	(main@hInBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001470:	
	line	502
;circBufferTest.c: 502: if (dataInBuffer != 0)
	movf	(main@dataInBuffer+1)^080h,w
	iorwf	(main@dataInBuffer)^080h,w
	skipnz
	goto	u3101
	goto	u3100
u3101:
	goto	l30001471
u3100:
	
l173:	
	goto	l173
	
l30001471:	
	line	511
;circBufferTest.c: 510: }
;circBufferTest.c: 511: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001472:	
	line	512
;circBufferTest.c: 512: if (dataInBuffer != 0)
	movf	(main@dataInBuffer+1)^080h,w
	iorwf	(main@dataInBuffer)^080h,w
	skipnz
	goto	u3111
	goto	u3110
u3111:
	goto	l30001473
u3110:
	
l177:	
	goto	l177
	
l30001473:	
	line	525
;circBufferTest.c: 520: }
;circBufferTest.c: 525: writeData = 'A';
	movlw	(041h)
	movwf	(main@writeData)^080h
	
l30001474:	
	line	526
;circBufferTest.c: 526: x = 0;
	clrf	(main@x)^080h
	goto	l30001477
	
l30001475:	
	line	530
;circBufferTest.c: 529: {
;circBufferTest.c: 530: if ((cbuffPutByte(hOutBuffer, writeData)) == 0x01)
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	xorlw	01h
	skipz
	goto	u3121
	goto	u3120
u3121:
	goto	l30001478
u3120:
	
l30001476:	
	line	532
;circBufferTest.c: 531: {
;circBufferTest.c: 532: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	line	533
;circBufferTest.c: 533: x++;
	incf	(main@x)^080h,f
	
l30001477:	
	line	528
	movf	(main@x)^080h,w
	xorlw	0FFh
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l30001475
u3130:
	
l30001478:	
	line	540
;circBufferTest.c: 538: }
;circBufferTest.c: 539: }
;circBufferTest.c: 540: if (x == 0xFF)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@x)^080h,w
	xorlw	0FFh
	skipz
	goto	u3141
	goto	u3140
u3141:
	goto	l30001479
u3140:
	
l186:	
	goto	l186
	
l30001479:	
	line	549
;circBufferTest.c: 548: }
;circBufferTest.c: 549: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001480:	
	line	550
;circBufferTest.c: 550: if (spaceRemainingInBuffer != 0)
	movf	(main@spaceRemainingInBuffer+1)^080h,w
	iorwf	(main@spaceRemainingInBuffer)^080h,w
	skipnz
	goto	u3151
	goto	u3150
u3151:
	goto	l30001481
u3150:
	
l190:	
	goto	l190
	
l30001481:	
	line	559
;circBufferTest.c: 558: }
;circBufferTest.c: 559: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001482:	
	line	560
;circBufferTest.c: 560: if (dataInBuffer != 32)
		movf	(main@dataInBuffer)^080h,w
	xorlw	32
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3161
	goto	u3160
u3161:
	goto	l30001483
u3160:
	
l194:	
	goto	l194
	
l30001483:	
	line	574
;circBufferTest.c: 568: }
;circBufferTest.c: 574: readData = '\0';
	clrf	(main@readData)^080h
	
l30001484:	
	line	575
;circBufferTest.c: 575: writeData = 'A';
	movlw	(041h)
	movwf	(main@writeData)^080h
	
l30001485:	
	line	576
;circBufferTest.c: 576: x = 0;
	clrf	(main@x)^080h
	goto	l30001489
	
l30001486:	
	line	580
;circBufferTest.c: 579: {
;circBufferTest.c: 580: if ((cbuffGetByte(hOutBuffer, &readData)) == 0x01)
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	xorlw	01h
	skipz
	goto	u3171
	goto	u3170
u3171:
	goto	l30001490
u3170:
	
l30001487:	
	line	582
;circBufferTest.c: 581: {
;circBufferTest.c: 582: if (readData != writeData)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@readData)^080h,w
	xorwf	(main@writeData)^080h,w
	skipnz
	goto	u3181
	goto	u3180
u3181:
	goto	l30001488
u3180:
	
l202:	
	goto	l202
	
l30001488:	
	line	593
;circBufferTest.c: 591: else
;circBufferTest.c: 592: {
;circBufferTest.c: 593: writeData++;
	incf	(main@writeData)^080h,f
	line	594
;circBufferTest.c: 594: x++;
	incf	(main@x)^080h,f
	
l30001489:	
	line	578
	movf	(main@x)^080h,w
	xorlw	0FFh
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l30001486
u3190:
	
l30001490:	
	line	602
;circBufferTest.c: 600: }
;circBufferTest.c: 601: }
;circBufferTest.c: 602: if (x == 0xFF)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@x)^080h,w
	xorlw	0FFh
	skipz
	goto	u3201
	goto	u3200
u3201:
	goto	l30001491
u3200:
	
l208:	
	goto	l208
	
l30001491:	
	line	611
;circBufferTest.c: 610: }
;circBufferTest.c: 611: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001492:	
	line	612
;circBufferTest.c: 612: if (spaceRemainingInBuffer != 32)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	32
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3211
	goto	u3210
u3211:
	goto	l30001493
u3210:
	
l212:	
	goto	l212
	
l30001493:	
	line	621
;circBufferTest.c: 620: }
;circBufferTest.c: 621: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001494:	
	line	622
;circBufferTest.c: 622: if (dataInBuffer != 0)
	movf	(main@dataInBuffer+1)^080h,w
	iorwf	(main@dataInBuffer)^080h,w
	skipnz
	goto	u3221
	goto	u3220
u3221:
	goto	l30001495
u3220:
	
l216:	
	goto	l216
	
l30001495:	
	line	637
;circBufferTest.c: 630: }
;circBufferTest.c: 637: writeData = 'a';
	movlw	(061h)
	movwf	(main@writeData)^080h
	
l30001496:	
	line	638
;circBufferTest.c: 638: x = 0;
	clrf	(main@x)^080h
	goto	l30001499
	
l30001497:	
	line	642
;circBufferTest.c: 641: {
;circBufferTest.c: 642: if ((cbuffPutByte(hOutBuffer, writeData)) == 0x01)
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	xorlw	01h
	skipz
	goto	u3231
	goto	u3230
u3231:
	goto	l222
u3230:
	
l30001498:	
	line	644
;circBufferTest.c: 643: {
;circBufferTest.c: 644: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	line	645
;circBufferTest.c: 645: x++;
	incf	(main@x)^080h,f
	goto	l30001499
	
l222:	
	goto	l222
	
l30001499:	
	line	640
	movlw	(016h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3241
	goto	u3240
u3241:
	goto	l30001497
u3240:
	
l30001500:	
	line	658
;circBufferTest.c: 655: }
;circBufferTest.c: 656: }
;circBufferTest.c: 658: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001501:	
	line	659
;circBufferTest.c: 659: if (spaceRemainingInBuffer != 10 )
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	10
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3251
	goto	u3250
u3251:
	goto	l30001502
u3250:
	
l228:	
	goto	l228
	
l30001502:	
	line	668
;circBufferTest.c: 667: }
;circBufferTest.c: 668: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001503:	
	line	669
;circBufferTest.c: 669: if (dataInBuffer != (32 - 10))
		movf	(main@dataInBuffer)^080h,w
	xorlw	22
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3261
	goto	u3260
u3261:
	goto	l30001504
u3260:
	
l232:	
	goto	l232
	
l30001504:	
	line	679
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	xorlw	01h
	skipnz
	goto	u3271
	goto	u3270
u3271:
	goto	l30001504
u3270:
	
l30001505:	
	line	681
;circBufferTest.c: 681: writeData = 'A';
	movlw	(041h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@writeData)^080h
	
l30001506:	
	line	682
;circBufferTest.c: 682: x = 0;
	clrf	(main@x)^080h
	goto	l30001509
	
l30001507:	
	line	686
;circBufferTest.c: 685: {
;circBufferTest.c: 686: if ((cbuffPutByte(hOutBuffer, writeData)) == 0x01)
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	xorlw	01h
	skipz
	goto	u3281
	goto	u3280
u3281:
	goto	l241
u3280:
	
l30001508:	
	line	688
;circBufferTest.c: 687: {
;circBufferTest.c: 688: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	line	689
;circBufferTest.c: 689: x++;
	incf	(main@x)^080h,f
	goto	l30001509
	
l241:	
	goto	l241
	
l30001509:	
	line	684
	movlw	(016h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3291
	goto	u3290
u3291:
	goto	l30001507
u3290:
	
l30001510:	
	line	702
;circBufferTest.c: 699: }
;circBufferTest.c: 700: }
;circBufferTest.c: 702: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001511:	
	line	703
;circBufferTest.c: 703: if (spaceRemainingInBuffer != 10 )
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	10
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3301
	goto	u3300
u3301:
	goto	l30001512
u3300:
	
l247:	
	goto	l247
	
l30001512:	
	line	712
;circBufferTest.c: 711: }
;circBufferTest.c: 712: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001513:	
	line	713
;circBufferTest.c: 713: if (dataInBuffer != (32 - 10))
		movf	(main@dataInBuffer)^080h,w
	xorlw	22
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3311
	goto	u3310
u3311:
	goto	l30001514
u3310:
	
l251:	
	goto	l251
	
l30001514:	
	line	728
;circBufferTest.c: 721: }
;circBufferTest.c: 728: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	line	730
;circBufferTest.c: 730: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001515:	
	line	731
;circBufferTest.c: 731: if (spaceRemainingInBuffer != 32)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	32
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3321
	goto	u3320
u3321:
	goto	l30001516
u3320:
	
l255:	
	goto	l255
	
l30001516:	
	line	740
;circBufferTest.c: 739: }
;circBufferTest.c: 740: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	
l30001517:	
	line	741
;circBufferTest.c: 741: if (dataInBuffer != 0)
	movf	(main@dataInBuffer+1)^080h,w
	iorwf	(main@dataInBuffer)^080h,w
	skipnz
	goto	u3331
	goto	u3330
u3331:
	goto	l30001518
u3330:
	
l259:	
	goto	l259
	
l30001518:	
	line	755
;circBufferTest.c: 749: }
;circBufferTest.c: 755: if ((cbuffPeekHead(hOutBuffer, &readData)) == 0x01)
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPeekHead)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekHead
	xorlw	01h
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l30001519
u3340:
	
l263:	
	goto	l263
	
l30001519:	
	line	764
;circBufferTest.c: 763: }
;circBufferTest.c: 764: if ((cbuffPeekTail(hOutBuffer, &readData)) == 0x01)
	movlw	((main@readData))&0ffh
	movwf	(?_cbuffPeekTail)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekTail
	xorlw	01h
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l30001520
u3350:
	
l267:	
	goto	l267
	
l30001520:	
	line	777
;circBufferTest.c: 772: }
;circBufferTest.c: 777: writeData = 'a';
	movlw	(061h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@writeData)^080h
	
l30001521:	
	line	778
;circBufferTest.c: 778: for (x = 0; x < 10; x++)
	clrf	(main@x)^080h
	
l30001524:	
	line	780
;circBufferTest.c: 779: {
;circBufferTest.c: 780: cbuffPutByte(hOutBuffer, writeData);
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	
l30001525:	
	line	781
;circBufferTest.c: 781: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	
l30001526:	
	line	778
	incf	(main@x)^080h,f
	
l30001527:	
	movlw	(0Ah)
	subwf	(main@x)^080h,w
	skipc
	goto	u3361
	goto	u3360
u3361:
	goto	l30001524
u3360:
	
l30001528:	
	line	783
;circBufferTest.c: 782: }
;circBufferTest.c: 783: if ((cbuffPeekHead(hOutBuffer, &readData)) != 0x01)
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPeekHead)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekHead
	xorlw	01h
	skipnz
	goto	u3371
	goto	u3370
u3371:
	goto	l30001529
u3370:
	
l274:	
	goto	l274
	
l30001529:	
	line	792
;circBufferTest.c: 791: }
;circBufferTest.c: 792: if (readData != (writeData-1))
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@writeData)^080h,w
	addlw	low(-1)
	movwf	(??_main+0+0)
	movlw	high(-1)
	skipnc
	movlw	high(-1)+1
	movwf	((??_main+0+0))+1
	movf	(main@readData)^080h,w
	xorwf	0+(??_main+0+0),w
	iorwf	1+(??_main+0+0),w
	skipnz
	goto	u3381
	goto	u3380
u3381:
	goto	l30001530
u3380:
	
l278:	
	goto	l278
	
l30001530:	
	line	801
;circBufferTest.c: 800: }
;circBufferTest.c: 801: if ((cbuffPeekTail(hOutBuffer, &readData)) != 0x01)
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPeekTail)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekTail
	xorlw	01h
	skipnz
	goto	u3391
	goto	u3390
u3391:
	goto	l30001531
u3390:
	
l282:	
	goto	l282
	
l30001531:	
	line	810
;circBufferTest.c: 809: }
;circBufferTest.c: 810: if (readData != 'a')
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@readData)^080h,w
	xorlw	061h
	skipnz
	goto	u3401
	goto	u3400
u3401:
	goto	l30001532
u3400:
	
l286:	
	goto	l286
	
l30001532:	
	line	824
;circBufferTest.c: 818: }
;circBufferTest.c: 824: for (x = 0; x < 6; x++)
	clrf	(main@x)^080h
	
l30001535:	
	line	826
;circBufferTest.c: 825: {
;circBufferTest.c: 826: cbuffGetByte(hOutBuffer, &readData);
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	
l30001536:	
	line	824
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@x)^080h,f
	
l30001537:	
	movlw	(06h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3411
	goto	u3410
u3411:
	goto	l30001535
u3410:
	
l30001538:	
	line	829
;circBufferTest.c: 827: }
;circBufferTest.c: 829: writeData = 'a';
	movlw	(061h)
	movwf	(main@writeData)^080h
	
l30001539:	
	line	830
;circBufferTest.c: 830: for (x = 0; x < 22; x++)
	clrf	(main@x)^080h
	
l30001542:	
	line	832
;circBufferTest.c: 831: {
;circBufferTest.c: 832: cbuffPutByte(hOutBuffer, writeData);
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	
l30001543:	
	line	833
;circBufferTest.c: 833: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	
l30001544:	
	line	830
	incf	(main@x)^080h,f
	
l30001545:	
	movlw	(016h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3421
	goto	u3420
u3421:
	goto	l30001542
u3420:
	
l30001546:	
	line	835
;circBufferTest.c: 834: }
;circBufferTest.c: 835: if ((cbuffPeekHead(hOutBuffer, &readData)) != 0x01)
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPeekHead)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekHead
	xorlw	01h
	skipnz
	goto	u3431
	goto	u3430
u3431:
	goto	l30001547
u3430:
	
l296:	
	goto	l296
	
l30001547:	
	line	844
;circBufferTest.c: 843: }
;circBufferTest.c: 844: if (readData != (writeData-1))
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@writeData)^080h,w
	addlw	low(-1)
	movwf	(??_main+0+0)
	movlw	high(-1)
	skipnc
	movlw	high(-1)+1
	movwf	((??_main+0+0))+1
	movf	(main@readData)^080h,w
	xorwf	0+(??_main+0+0),w
	iorwf	1+(??_main+0+0),w
	skipnz
	goto	u3441
	goto	u3440
u3441:
	goto	l30001548
u3440:
	
l300:	
	goto	l300
	
l30001548:	
	line	858
;circBufferTest.c: 852: }
;circBufferTest.c: 858: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	
l30001549:	
	line	859
;circBufferTest.c: 859: writeData = '1';
	movlw	(031h)
	movwf	(main@writeData)^080h
	
l30001550:	
	line	860
;circBufferTest.c: 860: for (x = 0; x < 8; x++)
	clrf	(main@x)^080h
	
l30001553:	
	line	862
;circBufferTest.c: 861: {
;circBufferTest.c: 862: if (cbuffPutByte(hOutBuffer, writeData) == 0x01)
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	xorlw	01h
	skipz
	goto	u3451
	goto	u3450
u3451:
	goto	l306
u3450:
	
l30001554:	
	line	864
;circBufferTest.c: 863: {
;circBufferTest.c: 864: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	goto	l30001555
	
l306:	
	goto	l306
	
l30001555:	
	line	860
	incf	(main@x)^080h,f
	
l30001556:	
	movlw	(08h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3461
	goto	u3460
u3461:
	goto	l30001553
u3460:
	
l30001557:	
	line	876
;circBufferTest.c: 874: }
;circBufferTest.c: 875: }
;circBufferTest.c: 876: writeData-=2;
	decf	(main@writeData)^080h,f
	decf	(main@writeData)^080h,f
	
l30001558:	
	line	879
;circBufferTest.c: 879: x = 0;
	clrf	(main@x)^080h
	
l30001559:	
	line	882
;circBufferTest.c: 881: {
;circBufferTest.c: 882: if(!cbuffUnputByte(hOutBuffer))
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffUnputByte
	iorlw	0
	skipz
	goto	u3471
	goto	u3470
u3471:
	goto	l30001564
u3470:
	
l30001560:	
	line	884
;circBufferTest.c: 883: {
;circBufferTest.c: 884: if (cbuffPeekHead(hOutBuffer, &readData) != 0x00)
	movlw	((main@readData))&0ffh
	movwf	(?_cbuffPeekHead)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekHead
	xorlw	0
	skipnz
	goto	u3481
	goto	u3480
u3481:
	goto	l30001563
u3480:
	
l30001561:	
	line	886
;circBufferTest.c: 885: {
;circBufferTest.c: 886: if (readData != writeData)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@readData)^080h,w
	xorwf	(main@writeData)^080h,w
	skipnz
	goto	u3491
	goto	u3490
u3491:
	goto	l30001562
u3490:
	
l317:	
	goto	l317
	
l30001562:	
	line	895
;circBufferTest.c: 894: }
;circBufferTest.c: 895: writeData--;
	decf	(main@writeData)^080h,f
	line	896
;circBufferTest.c: 896: x++;
	incf	(main@x)^080h,f
	
l30001563:	
	line	904
;circBufferTest.c: 903: }
;circBufferTest.c: 904: } while(x < 0xFF);
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@x)^080h,w
	xorlw	0FFh
	skipz
	goto	u3501
	goto	u3500
u3501:
	goto	l30001559
u3500:
	
l30001564:	
	line	906
;circBufferTest.c: 906: if (x >= 8)
	movlw	(08h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@x)^080h,w
	skipc
	goto	u3511
	goto	u3510
u3511:
	goto	l30001565
u3510:
	
l322:	
	goto	l322
	
l30001565:	
	line	916
;circBufferTest.c: 914: }
;circBufferTest.c: 916: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001566:	
	line	917
;circBufferTest.c: 917: if (spaceRemainingInBuffer != 32)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	32
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3521
	goto	u3520
u3521:
	goto	l30001567
u3520:
	
l326:	
	goto	l326
	
l30001567:	
	line	930
;circBufferTest.c: 925: }
;circBufferTest.c: 930: writeData = 'A';
	movlw	(041h)
	movwf	(main@writeData)^080h
	
l30001568:	
	line	931
;circBufferTest.c: 931: for (x = 0; x < 10; x++)
	clrf	(main@x)^080h
	
l30001571:	
	line	933
;circBufferTest.c: 932: {
;circBufferTest.c: 933: cbuffPutByte(hOutBuffer, writeData);
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	
l30001572:	
	line	934
;circBufferTest.c: 934: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	
l30001573:	
	line	931
	incf	(main@x)^080h,f
	
l30001574:	
	movlw	(0Ah)
	subwf	(main@x)^080h,w
	skipc
	goto	u3531
	goto	u3530
u3531:
	goto	l30001571
u3530:
	
l30001575:	
	line	937
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	xorlw	01h
	skipnz
	goto	u3541
	goto	u3540
u3541:
	goto	l30001575
u3540:
	
l30001576:	
	line	939
;circBufferTest.c: 939: writeData = 'A';
	movlw	(041h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@writeData)^080h
	goto	l30001578
	
l30001577:	
	line	942
;circBufferTest.c: 941: {
;circBufferTest.c: 942: writeData++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@writeData)^080h,f
	
l30001578:	
	line	940
	movf	(main@writeData)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutByte
	xorlw	01h
	skipnz
	goto	u3551
	goto	u3550
u3551:
	goto	l30001577
u3550:
	
l30001579:	
	line	944
;circBufferTest.c: 943: }
;circBufferTest.c: 944: writeData-=2;
	bsf	status, 5	;RP0=1, select bank1
	decf	(main@writeData)^080h,f
	decf	(main@writeData)^080h,f
	
l30001580:	
	line	947
;circBufferTest.c: 947: x = 0;
	clrf	(main@x)^080h
	
l30001581:	
	line	950
;circBufferTest.c: 949: {
;circBufferTest.c: 950: if(!cbuffUnputByte(hOutBuffer))
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffUnputByte
	iorlw	0
	skipz
	goto	u3561
	goto	u3560
u3561:
	goto	l30001586
u3560:
	
l30001582:	
	line	952
;circBufferTest.c: 951: {
;circBufferTest.c: 952: if (cbuffPeekHead(hOutBuffer, &readData) != 0x00)
	movlw	((main@readData))&0ffh
	movwf	(?_cbuffPeekHead)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPeekHead
	xorlw	0
	skipnz
	goto	u3571
	goto	u3570
u3571:
	goto	l30001585
u3570:
	
l30001583:	
	line	954
;circBufferTest.c: 953: {
;circBufferTest.c: 954: if (readData != writeData)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@readData)^080h,w
	xorwf	(main@writeData)^080h,w
	skipnz
	goto	u3581
	goto	u3580
u3581:
	goto	l30001584
u3580:
	
l344:	
	goto	l344
	
l30001584:	
	line	963
;circBufferTest.c: 962: }
;circBufferTest.c: 963: writeData--;
	decf	(main@writeData)^080h,f
	line	964
;circBufferTest.c: 964: x++;
	incf	(main@x)^080h,f
	
l30001585:	
	line	972
;circBufferTest.c: 971: }
;circBufferTest.c: 972: } while(x < 0xFF);
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@x)^080h,w
	xorlw	0FFh
	skipz
	goto	u3591
	goto	u3590
u3591:
	goto	l30001581
u3590:
	
l30001586:	
	line	974
;circBufferTest.c: 974: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001587:	
	line	975
;circBufferTest.c: 975: if (spaceRemainingInBuffer != 32)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	32
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3601
	goto	u3600
u3601:
	goto	l30001588
u3600:
	
l349:	
	goto	l349
	
l30001588:	
	line	988
;circBufferTest.c: 983: }
;circBufferTest.c: 988: cbuffClearBuffer(hInBuffer);
	movf	(main@hInBuffer)^080h,w
	fcall	_cbuffClearBuffer
	line	989
;circBufferTest.c: 989: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	
l30001589:	
	line	992
;circBufferTest.c: 992: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001592:	
	line	994
;circBufferTest.c: 993: {
;circBufferTest.c: 994: testBuffer2[x] = x + 'A';
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	(main@x)^080h,w
	addlw	041h
	movwf	indf
	
l30001593:	
	line	992
	incf	(main@x)^080h,f
	
l30001594:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3611
	goto	u3610
u3611:
	goto	l30001592
u3610:
	
l30001595:	
	line	997
;circBufferTest.c: 995: }
;circBufferTest.c: 997: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001596:	
	line	999
;circBufferTest.c: 999: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3621
	goto	u3620
u3621:
	goto	l30001597
u3620:
	
l356:	
	goto	l356
	
l30001597:	
	line	1009
;circBufferTest.c: 1007: }
;circBufferTest.c: 1009: dataInBuffer = cbuffGetFill(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetFill
	movf	(1+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer+1)^080h
	movf	(0+(?_cbuffGetFill))^080h,w
	movwf	(main@dataInBuffer)^080h
	line	1010
;circBufferTest.c: 1010: spaceRemainingInBuffer = cbuffGetSpace(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetSpace
	movf	(1+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer+1)^080h
	movf	(0+(?_cbuffGetSpace))^080h,w
	movwf	(main@spaceRemainingInBuffer)^080h
	
l30001598:	
	line	1012
;circBufferTest.c: 1012: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3631
	goto	u3630
u3631:
	goto	l30001599
u3630:
	
l360:	
	goto	l360
	
l30001599:	
	line	1022
;circBufferTest.c: 1020: }
;circBufferTest.c: 1022: if (spaceRemainingInBuffer != 16)
		movf	(main@spaceRemainingInBuffer)^080h,w
	xorlw	16
	iorwf	(main@spaceRemainingInBuffer+1)^080h,w

	skipnz
	goto	u3641
	goto	u3640
u3641:
	goto	l30001600
u3640:
	
l364:	
	goto	l364
	
l30001600:	
	line	1032
;circBufferTest.c: 1030: }
;circBufferTest.c: 1032: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001603:	
	line	1034
;circBufferTest.c: 1033: {
;circBufferTest.c: 1034: cbuffGetByte(hOutBuffer, &readData);
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	
l30001604:	
	line	1035
;circBufferTest.c: 1035: if (testBuffer2[x] != readData)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(main@readData)^080h,w
	skipnz
	goto	u3651
	goto	u3650
u3651:
	goto	l30001605
u3650:
	
l371:	
	goto	l371
	
l30001605:	
	line	1032
	incf	(main@x)^080h,f
	
l30001606:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3661
	goto	u3660
u3661:
	goto	l30001603
u3660:
	
l30001607:	
	line	1050
;circBufferTest.c: 1044: }
;circBufferTest.c: 1045: }
;circBufferTest.c: 1050: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	
l30001608:	
	line	1053
;circBufferTest.c: 1053: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001611:	
	line	1055
;circBufferTest.c: 1054: {
;circBufferTest.c: 1055: testBuffer2[x] = x + 'a';
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	(main@x)^080h,w
	addlw	061h
	movwf	indf
	
l30001612:	
	line	1053
	incf	(main@x)^080h,f
	
l30001613:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3671
	goto	u3670
u3671:
	goto	l30001611
u3670:
	
l30001614:	
	line	1058
;circBufferTest.c: 1056: }
;circBufferTest.c: 1058: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001615:	
	line	1059
;circBufferTest.c: 1059: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3681
	goto	u3680
u3681:
	goto	l30001616
u3680:
	
l378:	
	goto	l378
	
l30001616:	
	line	1069
;circBufferTest.c: 1068: }
;circBufferTest.c: 1069: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001617:	
	line	1070
;circBufferTest.c: 1070: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3691
	goto	u3690
u3691:
	goto	l30001618
u3690:
	
l382:	
	goto	l382
	
l30001618:	
	line	1080
;circBufferTest.c: 1079: }
;circBufferTest.c: 1080: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001619:	
	line	1082
;circBufferTest.c: 1082: if (dataInBuffer != 0)
	movf	(main@dataInBuffer+1)^080h,w
	iorwf	(main@dataInBuffer)^080h,w
	skipnz
	goto	u3701
	goto	u3700
u3701:
	goto	l30001620
u3700:
	
l386:	
	goto	l386
	
l30001620:	
	line	1097
;circBufferTest.c: 1090: }
;circBufferTest.c: 1097: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001623:	
	line	1099
;circBufferTest.c: 1098: {
;circBufferTest.c: 1099: testBuffer2[x] = x + '0';
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	(main@x)^080h,w
	addlw	030h
	movwf	indf
	
l30001624:	
	line	1097
	incf	(main@x)^080h,f
	
l30001625:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3711
	goto	u3710
u3711:
	goto	l30001623
u3710:
	
l30001626:	
	line	1102
;circBufferTest.c: 1100: }
;circBufferTest.c: 1102: for (x = 0; x < 8; x++)
	clrf	(main@x)^080h
	
l30001629:	
	line	1104
;circBufferTest.c: 1103: {
;circBufferTest.c: 1104: cbuffUnputByte(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffUnputByte
	line	1105
;circBufferTest.c: 1105: cbuffGetByte(hOutBuffer, &readData);
	movlw	((main@readData))&0ffh
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	
l30001630:	
	line	1102
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@x)^080h,f
	
l30001631:	
	movlw	(08h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3721
	goto	u3720
u3721:
	goto	l30001629
u3720:
	
l30001632:	
	line	1108
;circBufferTest.c: 1106: }
;circBufferTest.c: 1108: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001633:	
	line	1109
;circBufferTest.c: 1109: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3731
	goto	u3730
u3731:
	goto	l30001634
u3730:
	
l396:	
	goto	l396
	
l30001634:	
	line	1120
;circBufferTest.c: 1117: }
;circBufferTest.c: 1120: for (x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001637:	
	line	1122
;circBufferTest.c: 1121: {
;circBufferTest.c: 1122: cbuffGetByte(hOutBuffer, &readData);
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	
l30001638:	
	line	1120
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@x)^080h,f
	
l30001639:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3741
	goto	u3740
u3741:
	goto	l30001637
u3740:
	
l30001640:	
	line	1125
;circBufferTest.c: 1123: }
;circBufferTest.c: 1125: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001643:	
	line	1127
;circBufferTest.c: 1126: {
;circBufferTest.c: 1127: cbuffGetByte(hOutBuffer, &readData);
	movlw	((main@readData))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetByte)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetByte
	
l30001644:	
	line	1128
;circBufferTest.c: 1128: if (testBuffer2[x] != readData)
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(main@readData)^080h,w
	skipnz
	goto	u3751
	goto	u3750
u3751:
	goto	l30001645
u3750:
	
l406:	
	goto	l406
	
l30001645:	
	line	1125
	incf	(main@x)^080h,f
	
l30001646:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3761
	goto	u3760
u3761:
	goto	l30001643
u3760:
	
l30001647:	
	line	1144
;circBufferTest.c: 1137: }
;circBufferTest.c: 1138: }
;circBufferTest.c: 1144: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	
l30001648:	
	line	1147
;circBufferTest.c: 1147: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001651:	
	line	1149
;circBufferTest.c: 1148: {
;circBufferTest.c: 1149: testBuffer2[x] = x + 'a';
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	(main@x)^080h,w
	addlw	061h
	movwf	indf
	
l30001652:	
	line	1147
	incf	(main@x)^080h,f
	
l30001653:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3771
	goto	u3770
u3771:
	goto	l30001651
u3770:
	
l30001654:	
	line	1152
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	
l30001655:	
	line	1154
;circBufferTest.c: 1154: for(x = 0; x < 16; x++)
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@x)^080h
	
l30001658:	
	line	1156
;circBufferTest.c: 1155: {
;circBufferTest.c: 1156: testBuffer2[x] = 0;
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	clrf	indf
	
l30001659:	
	line	1154
	incf	(main@x)^080h,f
	
l30001660:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3781
	goto	u3780
u3781:
	goto	l30001658
u3780:
	
l30001661:	
	line	1159
;circBufferTest.c: 1157: }
;circBufferTest.c: 1159: dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetArray)
	movlw	010h
	movwf	0+(?_cbuffGetArray)+01h
	clrf	1+(?_cbuffGetArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetArray
	movf	(1+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001662:	
	line	1160
;circBufferTest.c: 1160: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3791
	goto	u3790
u3791:
	goto	l30001663
u3790:
	
l416:	
	goto	l416
	
l30001663:	
	line	1170
;circBufferTest.c: 1168: }
;circBufferTest.c: 1170: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001666:	
	line	1172
;circBufferTest.c: 1171: {
;circBufferTest.c: 1172: if (testBuffer2[x] != x + 'a')
	movf	(main@x)^080h,w
	addlw	low(061h)
	movwf	(??_main+0+0)
	movlw	high(061h)
	skipnc
	movlw	high(061h)+1
	movwf	((??_main+0+0))+1
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	0+(??_main+0+0),w
	iorwf	1+(??_main+0+0),w
	skipnz
	goto	u3801
	goto	u3800
u3801:
	goto	l30001667
u3800:
	
l423:	
	goto	l423
	
l30001667:	
	line	1170
	incf	(main@x)^080h,f
	
l30001668:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3811
	goto	u3810
u3811:
	goto	l30001666
u3810:
	
l30001669:	
	line	1187
;circBufferTest.c: 1180: }
;circBufferTest.c: 1181: }
;circBufferTest.c: 1187: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	
l30001670:	
	line	1190
;circBufferTest.c: 1190: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001673:	
	line	1192
;circBufferTest.c: 1191: {
;circBufferTest.c: 1192: testBuffer2[x] = x + 'A';
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	(main@x)^080h,w
	addlw	041h
	movwf	indf
	
l30001674:	
	line	1190
	incf	(main@x)^080h,f
	
l30001675:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3821
	goto	u3820
u3821:
	goto	l30001673
u3820:
	
l30001676:	
	line	1195
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	08h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	
l30001677:	
	line	1197
;circBufferTest.c: 1197: for(x = 0; x < 16; x++)
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@x)^080h
	
l30001680:	
	line	1199
;circBufferTest.c: 1198: {
;circBufferTest.c: 1199: testBuffer2[x] = 0;
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	clrf	indf
	
l30001681:	
	line	1197
	incf	(main@x)^080h,f
	
l30001682:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3831
	goto	u3830
u3831:
	goto	l30001680
u3830:
	
l30001683:	
	line	1202
;circBufferTest.c: 1200: }
;circBufferTest.c: 1202: dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetArray)
	movlw	010h
	movwf	0+(?_cbuffGetArray)+01h
	clrf	1+(?_cbuffGetArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetArray
	movf	(1+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001684:	
	line	1203
;circBufferTest.c: 1203: if (dataInBuffer != 8)
		movf	(main@dataInBuffer)^080h,w
	xorlw	8
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3841
	goto	u3840
u3841:
	goto	l30001685
u3840:
	
l433:	
	goto	l433
	
l30001685:	
	line	1218
;circBufferTest.c: 1212: }
;circBufferTest.c: 1218: cbuffClearBuffer(hOutBuffer);
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffClearBuffer
	
l30001686:	
	line	1221
;circBufferTest.c: 1221: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001689:	
	line	1223
;circBufferTest.c: 1222: {
;circBufferTest.c: 1223: testBuffer2[x] = x + '0';
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	(main@x)^080h,w
	addlw	030h
	movwf	indf
	
l30001690:	
	line	1221
	incf	(main@x)^080h,f
	
l30001691:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3851
	goto	u3850
u3851:
	goto	l30001689
u3850:
	
l30001692:	
	line	1226
;circBufferTest.c: 1224: }
;circBufferTest.c: 1226: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	line	1227
;circBufferTest.c: 1227: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 8);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	08h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	line	1229
;circBufferTest.c: 1229: dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetArray)
	movlw	010h
	movwf	0+(?_cbuffGetArray)+01h
	clrf	1+(?_cbuffGetArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetArray
	movf	(1+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	line	1230
;circBufferTest.c: 1230: dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 8);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetArray)
	movlw	08h
	movwf	0+(?_cbuffGetArray)+01h
	clrf	1+(?_cbuffGetArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetArray
	movf	(1+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	line	1232
;circBufferTest.c: 1232: dataInBuffer = cbuffPutArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffPutArray)
	movlw	010h
	movwf	0+(?_cbuffPutArray)+01h
	clrf	1+(?_cbuffPutArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffPutArray
	movf	(1+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffPutArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001693:	
	line	1234
;circBufferTest.c: 1234: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001696:	
	line	1236
;circBufferTest.c: 1235: {
;circBufferTest.c: 1236: testBuffer2[x] = 0;
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	clrf	indf
	
l30001697:	
	line	1234
	incf	(main@x)^080h,f
	
l30001698:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3861
	goto	u3860
u3861:
	goto	l30001696
u3860:
	
l30001699:	
	line	1239
;circBufferTest.c: 1237: }
;circBufferTest.c: 1239: dataInBuffer = cbuffGetArray(hOutBuffer, testBuffer2, 16);
	movlw	((_testBuffer2))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_cbuffGetArray)
	movlw	010h
	movwf	0+(?_cbuffGetArray)+01h
	clrf	1+(?_cbuffGetArray)+01h
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@hOutBuffer)^080h,w
	fcall	_cbuffGetArray
	movf	(1+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_cbuffGetArray)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@dataInBuffer)^080h
	
l30001700:	
	line	1240
;circBufferTest.c: 1240: if (dataInBuffer != 16)
		movf	(main@dataInBuffer)^080h,w
	xorlw	16
	iorwf	(main@dataInBuffer+1)^080h,w

	skipnz
	goto	u3871
	goto	u3870
u3871:
	goto	l30001701
u3870:
	
l443:	
	goto	l443
	
l30001701:	
	line	1250
;circBufferTest.c: 1248: }
;circBufferTest.c: 1250: for(x = 0; x < 16; x++)
	clrf	(main@x)^080h
	
l30001704:	
	line	1252
;circBufferTest.c: 1251: {
;circBufferTest.c: 1252: if (testBuffer2[x] != x + '0')
	movf	(main@x)^080h,w
	addlw	low(030h)
	movwf	(??_main+0+0)
	movlw	high(030h)
	skipnc
	movlw	high(030h)+1
	movwf	((??_main+0+0))+1
	movf	(main@x)^080h,w
	addlw	(_testBuffer2)&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	0+(??_main+0+0),w
	iorwf	1+(??_main+0+0),w
	skipnz
	goto	u3881
	goto	u3880
u3881:
	goto	l30001705
u3880:
	
l450:	
	goto	l450
	
l30001705:	
	line	1250
	incf	(main@x)^080h,f
	
l30001706:	
	movlw	(010h)
	subwf	(main@x)^080h,w
	skipc
	goto	u3891
	goto	u3890
u3891:
	goto	l30001704
u3890:
	
l447:	
	goto	l447
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
; =============== function _main ends ============

psect	maintext
	line	1273
	signat	_main,90
	global	_cbuffPeekHead
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

; *************** function _cbuffPeekHead *****************
; Defined at:
;		line 831 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  data            1    1[BANK0 ] PTR unsigned char 
;		 -> main@readData(1), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    0[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         5       2       0       0       0
;      Temp:     5
;      Total:    7
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text398
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	831
	global	__size_of_cbuffPeekHead
	__size_of_cbuffPeekHead	equ	__end_of_cbuffPeekHead-_cbuffPeekHead
;cbuff.c: 829: unsigned char cbuffPeekHead(HCBUFF hCircBuffer,
;cbuff.c: 830: CBUFF * data)
;cbuff.c: 831: {
	
_cbuffPeekHead:	
	opt stack 7
; Regs used in _cbuffPeekHead: [wreg-fsr0h+status,2+status,0]
;cbuffPeekHead@hCircBuffer stored from wreg
	line	833
	bcf	status, 5	;RP0=0, select bank0
	movwf	(cbuffPeekHead@hCircBuffer)
	
l30001707:	
;cbuff.c: 833: if (!(hCircBuffer->localFlag & (0x01 << 6)))
	movf	(cbuffPeekHead@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfsc	indf,(6)&7
	goto	u3901
	goto	u3900
u3901:
	goto	l30001714
u3900:
	
l30001708:	
	line	838
;cbuff.c: 834: {
;cbuff.c: 838: if (hCircBuffer->inPointer != hCircBuffer->startOfBuffer)
	movf	(cbuffPeekHead@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPeekHead+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPeekHead+0+0+1)
	movf	(cbuffPeekHead@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPeekHead+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPeekHead+2+0+1)
	movf	1+(??_cbuffPeekHead+0+0),w
	xorwf	1+(??_cbuffPeekHead+2+0),w
	skipz
	goto	u3915
	movf	0+(??_cbuffPeekHead+0+0),w
	xorwf	0+(??_cbuffPeekHead+2+0),w
u3915:

	skipnz
	goto	u3911
	goto	u3910
u3911:
	goto	l30001710
u3910:
	
l30001709:	
	line	840
;cbuff.c: 839: {
;cbuff.c: 840: *data = *(hCircBuffer->inPointer - sizeof(CBUFF));
	movf	(cbuffPeekHead@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPeekHead+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPeekHead+0+0+1)
	movf	0+(??_cbuffPeekHead+0+0),w
	addlw	low(0FFFFh)
	movwf	(??_cbuffPeekHead+2+0)
	movf	1+(??_cbuffPeekHead+0+0),w
	skipnc
	addlw	1
	addlw	high(0FFFFh)
	movwf	1+(??_cbuffPeekHead+2+0)
	movf	0+(??_cbuffPeekHead+2+0),w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_cbuffPeekHead+2+0),0
	bcf	status,7
	movf	indf,w
	movwf	(??_cbuffPeekHead+4+0)
	movf	(cbuffPeekHead@data),w
	movwf	fsr0
	movf	(??_cbuffPeekHead+4+0),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	goto	l30001711
	
l30001710:	
	line	846
;cbuff.c: 844: else
;cbuff.c: 845: {
;cbuff.c: 846: *data = *hCircBuffer->endOfBuffer;
	movf	(cbuffPeekHead@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPeekHead+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPeekHead+0+0+1)
	movf	0+(??_cbuffPeekHead+0+0),w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_cbuffPeekHead+0+0),0
	bcf	status,7
	movf	indf,w
	movwf	(??_cbuffPeekHead+2+0)
	movf	(cbuffPeekHead@data),w
	movwf	fsr0
	movf	(??_cbuffPeekHead+2+0),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l30001711:	
	line	848
;cbuff.c: 847: }
;cbuff.c: 848: return 0x01;
	movlw	(01h)
	goto	l52
	
l30001714:	
	line	852
;cbuff.c: 850: else
;cbuff.c: 851: {
;cbuff.c: 852: return 0x00;
	movlw	(0)
	
l52:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffPeekHead
	__end_of_cbuffPeekHead:
; =============== function _cbuffPeekHead ends ============

psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:
	line	854
	signat	_cbuffPeekHead,8313
	global	_cbuffClearBuffer

; *************** function _cbuffClearBuffer *****************
; Defined at:
;		line 693 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    2[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		wreg, fsr0l, fsr0h, status,2
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/20
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         3       0       0       0       0
;      Temp:     2
;      Total:    3
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text399
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	693
	global	__size_of_cbuffClearBuffer
	__size_of_cbuffClearBuffer	equ	__end_of_cbuffClearBuffer-_cbuffClearBuffer
;cbuff.c: 692: void cbuffClearBuffer(HCBUFF hCircBuffer)
;cbuff.c: 693: {
	
_cbuffClearBuffer:	
	opt stack 7
; Regs used in _cbuffClearBuffer: [wreg-fsr0h+status,2]
;cbuffClearBuffer@hCircBuffer stored from wreg
	line	695
	movwf	(cbuffClearBuffer@hCircBuffer)
	
l30001813:	
;cbuff.c: 695: hCircBuffer->inPointer = hCircBuffer->startOfBuffer;
	movf	(cbuffClearBuffer@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffClearBuffer+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffClearBuffer+0+0+1)
	movf	(cbuffClearBuffer@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	0+(??_cbuffClearBuffer+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffClearBuffer+0+0),w
	movwf	indf
	line	696
;cbuff.c: 696: hCircBuffer->outPointer = hCircBuffer->startOfBuffer;
	movf	(cbuffClearBuffer@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffClearBuffer+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffClearBuffer+0+0+1)
	movf	(cbuffClearBuffer@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	0+(??_cbuffClearBuffer+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffClearBuffer+0+0),w
	movwf	indf
	
l30001814:	
	line	698
;cbuff.c: 698: hCircBuffer->localFlag = 0x00;
	movf	(cbuffClearBuffer@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	
l30001815:	
	line	700
;cbuff.c: 700: hCircBuffer->localFlag |= (0x01 << 6);
	movf	(cbuffClearBuffer@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(6/8),(6)&7
	
l44:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffClearBuffer
	__end_of_cbuffClearBuffer:
; =============== function _cbuffClearBuffer ends ============

psect	text400,local,class=CODE,delta=2
global __ptext400
__ptext400:
	line	701
	signat	_cbuffClearBuffer,4216
	global	_cbuffGetByte

; *************** function _cbuffGetByte *****************
; Defined at:
;		line 730 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  data            1    1[BANK0 ] PTR unsigned char 
;		 -> main@readData(1), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    0[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       2       0       0       0
;      Temp:     4
;      Total:    6
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text400
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	730
	global	__size_of_cbuffGetByte
	__size_of_cbuffGetByte	equ	__end_of_cbuffGetByte-_cbuffGetByte
;cbuff.c: 728: unsigned char cbuffGetByte(HCBUFF hCircBuffer,
;cbuff.c: 729: CBUFF * data)
;cbuff.c: 730: {
	
_cbuffGetByte:	
	opt stack 7
; Regs used in _cbuffGetByte: [wreg-fsr0h+status,2+status,0]
;cbuffGetByte@hCircBuffer stored from wreg
	line	733
	bcf	status, 5	;RP0=0, select bank0
	movwf	(cbuffGetByte@hCircBuffer)
	
l30001716:	
;cbuff.c: 733: if (hCircBuffer->localFlag & (0x01 << 6))
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(6)&7
	goto	u3921
	goto	u3920
u3921:
	goto	l30001719
u3920:
	
l30001717:	
	line	735
;cbuff.c: 734: {
;cbuff.c: 735: return 0x00;
	movlw	(0)
	goto	l45
	
l30001719:	
	line	738
;cbuff.c: 736: }
;cbuff.c: 738: *data = *hCircBuffer->outPointer;
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0+1)
	movf	0+(??_cbuffGetByte+0+0),w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_cbuffGetByte+0+0),0
	bcf	status,7
	movf	indf,w
	movwf	(??_cbuffGetByte+2+0)
	movf	(cbuffGetByte@data),w
	movwf	fsr0
	movf	(??_cbuffGetByte+2+0),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l30001720:	
	line	741
;cbuff.c: 741: hCircBuffer->outPointer++;
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	
l30001721:	
	line	744
;cbuff.c: 744: if (hCircBuffer->outPointer > hCircBuffer->endOfBuffer)
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0+1)
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetByte+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetByte+2+0+1)
	movf	1+(??_cbuffGetByte+0+0),w
	subwf	1+(??_cbuffGetByte+2+0),w
	skipz
	goto	u3935
	movf	0+(??_cbuffGetByte+0+0),w
	subwf	0+(??_cbuffGetByte+2+0),w
u3935:
	skipnc
	goto	u3931
	goto	u3930
u3931:
	goto	l47
u3930:
	
l30001722:	
	line	746
;cbuff.c: 745: {
;cbuff.c: 746: hCircBuffer->outPointer = hCircBuffer->startOfBuffer;
	movf	(cbuffGetByte@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0+1)
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	0+(??_cbuffGetByte+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffGetByte+0+0),w
	movwf	indf
	
l47:	
	line	751
;cbuff.c: 747: }
;cbuff.c: 751: if (hCircBuffer->outPointer == hCircBuffer->inPointer)
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetByte+0+0+1)
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetByte+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetByte+2+0+1)
	movf	1+(??_cbuffGetByte+0+0),w
	xorwf	1+(??_cbuffGetByte+2+0),w
	skipz
	goto	u3945
	movf	0+(??_cbuffGetByte+0+0),w
	xorwf	0+(??_cbuffGetByte+2+0),w
u3945:

	skipz
	goto	u3941
	goto	u3940
u3941:
	goto	l48
u3940:
	
l30001723:	
	line	754
;cbuff.c: 752: {
;cbuff.c: 754: hCircBuffer->localFlag |= (0x01 << 6);
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(6/8),(6)&7
	
l48:	
	line	759
;cbuff.c: 755: }
;cbuff.c: 759: hCircBuffer->localFlag &= ~(0x01 << 7);
	movf	(cbuffGetByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bcf	indf+(7/8),(7)&7
	
l30001724:	
	line	761
;cbuff.c: 761: return 0x01;
	movlw	(01h)
	
l45:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffGetByte
	__end_of_cbuffGetByte:
; =============== function _cbuffGetByte ends ============

psect	text401,local,class=CODE,delta=2
global __ptext401
__ptext401:
	line	762
	signat	_cbuffGetByte,8313
	global	_cbuffPeekTail

; *************** function _cbuffPeekTail *****************
; Defined at:
;		line 791 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  data            1    0[BANK0 ] PTR unsigned char 
;		 -> main@readData(1), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    3[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h
; Tracked objects:
;		On entry : 160/20
;		On exit  : 140/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       1       0       0       0
;      Temp:     3
;      Total:    5
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text401
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	791
	global	__size_of_cbuffPeekTail
	__size_of_cbuffPeekTail	equ	__end_of_cbuffPeekTail-_cbuffPeekTail
;cbuff.c: 789: unsigned char cbuffPeekTail(HCBUFF hCircBuffer,
;cbuff.c: 790: CBUFF * data)
;cbuff.c: 791: {
	
_cbuffPeekTail:	
	opt stack 7
; Regs used in _cbuffPeekTail: [wregfsr0]
;cbuffPeekTail@hCircBuffer stored from wreg
	line	793
	movwf	(cbuffPeekTail@hCircBuffer)
	
l30001758:	
;cbuff.c: 793: if (!(hCircBuffer->localFlag & (0x01 << 6)))
	movf	(cbuffPeekTail@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfsc	indf,(6)&7
	goto	u4051
	goto	u4050
u4051:
	goto	l30001763
u4050:
	
l30001759:	
	line	796
;cbuff.c: 794: {
;cbuff.c: 796: *data = *hCircBuffer->outPointer;
	movf	(cbuffPeekTail@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPeekTail+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPeekTail+0+0+1)
	movf	0+(??_cbuffPeekTail+0+0),w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_cbuffPeekTail+0+0),0
	bcf	status,7
	movf	indf,w
	movwf	(??_cbuffPeekTail+2+0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(cbuffPeekTail@data),w
	movwf	fsr0
	movf	(??_cbuffPeekTail+2+0),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l30001760:	
	line	797
;cbuff.c: 797: return 0x01;
	movlw	(01h)
	goto	l49
	
l30001763:	
	line	801
;cbuff.c: 799: else
;cbuff.c: 800: {
;cbuff.c: 801: return 0x00;
	movlw	(0)
	
l49:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffPeekTail
	__end_of_cbuffPeekTail:
; =============== function _cbuffPeekTail ends ============

psect	text402,local,class=CODE,delta=2
global __ptext402
__ptext402:
	line	803
	signat	_cbuffPeekTail,8313
	global	_cbuffGetArray

; *************** function _cbuffGetArray *****************
; Defined at:
;		line 1092 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  data            1    3[BANK0 ] PTR unsigned char 
;		 -> testBuffer2(16), 
;  noOfBytes       2    4[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    2[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  bytesRead       2    0[BANK0 ] unsigned int 
; Return value:  Size  Location     Type
;                  2    3[BANK0 ] unsigned int 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       6       0       0       0
;      Temp:     4
;      Total:   10
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text402
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	1092
	global	__size_of_cbuffGetArray
	__size_of_cbuffGetArray	equ	__end_of_cbuffGetArray-_cbuffGetArray
;cbuff.c: 1089: unsigned int cbuffGetArray(HCBUFF hCircBuffer,
;cbuff.c: 1090: CBUFF * data,
;cbuff.c: 1091: unsigned int noOfBytes)
;cbuff.c: 1092: {
	
_cbuffGetArray:	
	opt stack 7
; Regs used in _cbuffGetArray: [wreg-fsr0h+status,2+status,0]
;cbuffGetArray@hCircBuffer stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(cbuffGetArray@hCircBuffer)
	
l30001742:	
	line	1093
;cbuff.c: 1093: unsigned int bytesRead = 0;
	clrf	(cbuffGetArray@bytesRead)
	clrf	(cbuffGetArray@bytesRead+1)
	
l30001743:	
	line	1096
;cbuff.c: 1096: if (hCircBuffer->localFlag & (0x01 << 6))
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(6)&7
	goto	u4001
	goto	u4000
u4001:
	goto	l30001754
u4000:
	
l30001744:	
	line	1098
;cbuff.c: 1097: {
;cbuff.c: 1098: return bytesRead;
	clrf	(?_cbuffGetArray)
	clrf	(?_cbuffGetArray+1)
	goto	l74
	
l30001746:	
	line	1104
;cbuff.c: 1102: {
;cbuff.c: 1104: *data = *hCircBuffer->outPointer;
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0+1)
	movf	0+(??_cbuffGetArray+0+0),w
	movwf	fsr0
	bsf	status,7
	btfss	1+(??_cbuffGetArray+0+0),0
	bcf	status,7
	movf	indf,w
	movwf	(??_cbuffGetArray+2+0)
	movf	(cbuffGetArray@data),w
	movwf	fsr0
	movf	(??_cbuffGetArray+2+0),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l30001747:	
	line	1107
;cbuff.c: 1107: hCircBuffer->outPointer++;
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movlw	01h
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	1109
;cbuff.c: 1109: data++;
	incf	(cbuffGetArray@data),f
	
l30001748:	
	line	1112
;cbuff.c: 1112: if (hCircBuffer->outPointer > hCircBuffer->endOfBuffer)
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0+1)
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetArray+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetArray+2+0+1)
	movf	1+(??_cbuffGetArray+0+0),w
	subwf	1+(??_cbuffGetArray+2+0),w
	skipz
	goto	u4015
	movf	0+(??_cbuffGetArray+0+0),w
	subwf	0+(??_cbuffGetArray+2+0),w
u4015:
	skipnc
	goto	u4011
	goto	u4010
u4011:
	goto	l79
u4010:
	
l30001749:	
	line	1114
;cbuff.c: 1113: {
;cbuff.c: 1114: hCircBuffer->outPointer = hCircBuffer->startOfBuffer;
	movf	(cbuffGetArray@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0+1)
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	0+(??_cbuffGetArray+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffGetArray+0+0),w
	movwf	indf
	
l79:	
	line	1119
;cbuff.c: 1115: }
;cbuff.c: 1119: if (hCircBuffer->outPointer == hCircBuffer->inPointer)
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetArray+0+0+1)
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetArray+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetArray+2+0+1)
	movf	1+(??_cbuffGetArray+0+0),w
	xorwf	1+(??_cbuffGetArray+2+0),w
	skipz
	goto	u4025
	movf	0+(??_cbuffGetArray+0+0),w
	xorwf	0+(??_cbuffGetArray+2+0),w
u4025:

	skipz
	goto	u4021
	goto	u4020
u4021:
	goto	l30001751
u4020:
	
l30001750:	
	line	1122
;cbuff.c: 1120: {
;cbuff.c: 1122: hCircBuffer->localFlag |= (0x01 << 6);
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(6/8),(6)&7
	
l30001751:	
	line	1125
;cbuff.c: 1123: }
;cbuff.c: 1125: bytesRead++;
	incf	(cbuffGetArray@bytesRead),f
	skipnz
	incf	(cbuffGetArray@bytesRead+1),f
	
l30001752:	
	line	1129
;cbuff.c: 1129: if (bytesRead == noOfBytes)
	movf	(cbuffGetArray@noOfBytes+1),w
	xorwf	(cbuffGetArray@bytesRead+1),w
	skipz
	goto	u4035
	movf	(cbuffGetArray@noOfBytes),w
	xorwf	(cbuffGetArray@bytesRead),w
u4035:

	skipz
	goto	u4031
	goto	u4030
u4031:
	goto	l30001754
u4030:
	goto	l30001755
	
l30001754:	
	line	1101
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(6)&7
	goto	u4041
	goto	u4040
u4041:
	goto	l30001746
u4040:
	
l30001755:	
	line	1137
;cbuff.c: 1132: }
;cbuff.c: 1133: }
;cbuff.c: 1137: hCircBuffer->localFlag &= ~(0x01 << 7);
	movf	(cbuffGetArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bcf	indf+(7/8),(7)&7
	
l30001756:	
	line	1139
;cbuff.c: 1139: return bytesRead;
	movf	(cbuffGetArray@bytesRead+1),w
	movwf	(?_cbuffGetArray+1)
	movf	(cbuffGetArray@bytesRead),w
	movwf	(?_cbuffGetArray)
	
l74:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffGetArray
	__end_of_cbuffGetArray:
; =============== function _cbuffGetArray ends ============

psect	text403,local,class=CODE,delta=2
global __ptext403
__ptext403:
	line	1140
	signat	_cbuffGetArray,12410
	global	_cbuffPutArray

; *************** function _cbuffPutArray *****************
; Defined at:
;		line 1005 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  data            1    3[BANK0 ] PTR const unsigned char 
;		 -> testBuffer2(16), 
;  noOfBytes       2    4[BANK0 ] unsigned int 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    2[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  bytesWritten    2    0[BANK0 ] unsigned int 
; Return value:  Size  Location     Type
;                  2    3[BANK0 ] unsigned int 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       6       0       0       0
;      Temp:     4
;      Total:   10
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text403
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	1005
	global	__size_of_cbuffPutArray
	__size_of_cbuffPutArray	equ	__end_of_cbuffPutArray-_cbuffPutArray
;cbuff.c: 1002: unsigned int cbuffPutArray(HCBUFF hCircBuffer,
;cbuff.c: 1003: const CBUFF * data,
;cbuff.c: 1004: unsigned int noOfBytes)
;cbuff.c: 1005: {
	
_cbuffPutArray:	
	opt stack 7
; Regs used in _cbuffPutArray: [wreg-fsr0h+status,2+status,0]
;cbuffPutArray@hCircBuffer stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(cbuffPutArray@hCircBuffer)
	
l30001726:	
	line	1006
;cbuff.c: 1006: unsigned int bytesWritten = 0;
	clrf	(cbuffPutArray@bytesWritten)
	clrf	(cbuffPutArray@bytesWritten+1)
	
l30001727:	
	line	1010
;cbuff.c: 1010: if (hCircBuffer->localFlag & (0x01 << 7))
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(7)&7
	goto	u3951
	goto	u3950
u3951:
	goto	l30001738
u3950:
	
l30001728:	
	line	1012
;cbuff.c: 1011: {
;cbuff.c: 1012: return bytesWritten;
	clrf	(?_cbuffPutArray)
	clrf	(?_cbuffPutArray+1)
	goto	l66
	
l30001730:	
	line	1019
;cbuff.c: 1017: {
;cbuff.c: 1019: *hCircBuffer->inPointer = *data;
	movf	(cbuffPutArray@data),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0)
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+1+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutArray+1+0+1)
	movf	0+(??_cbuffPutArray+1+0),w
	movwf	fsr0
	bcf	status,7
	btfsc	1+(??_cbuffPutArray+1+0),0
	bsf	status,7
	
	movf	(??_cbuffPutArray+0+0),w
	movwf	indf
	
l30001731:	
	line	1021
;cbuff.c: 1021: hCircBuffer->inPointer++;
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movlw	01h
	bcf	status, 7	;select IRP bank0
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	line	1024
;cbuff.c: 1024: data++;
	incf	(cbuffPutArray@data),f
	
l30001732:	
	line	1028
;cbuff.c: 1028: if (hCircBuffer->inPointer > hCircBuffer->endOfBuffer)
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0+1)
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutArray+2+0+1)
	movf	1+(??_cbuffPutArray+0+0),w
	subwf	1+(??_cbuffPutArray+2+0),w
	skipz
	goto	u3965
	movf	0+(??_cbuffPutArray+0+0),w
	subwf	0+(??_cbuffPutArray+2+0),w
u3965:
	skipnc
	goto	u3961
	goto	u3960
u3961:
	goto	l71
u3960:
	
l30001733:	
	line	1030
;cbuff.c: 1029: {
;cbuff.c: 1030: hCircBuffer->inPointer = hCircBuffer->startOfBuffer;
	movf	(cbuffPutArray@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0+1)
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	0+(??_cbuffPutArray+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffPutArray+0+0),w
	movwf	indf
	
l71:	
	line	1035
;cbuff.c: 1031: }
;cbuff.c: 1035: if (hCircBuffer->inPointer == hCircBuffer->outPointer)
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutArray+0+0+1)
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutArray+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutArray+2+0+1)
	movf	1+(??_cbuffPutArray+0+0),w
	xorwf	1+(??_cbuffPutArray+2+0),w
	skipz
	goto	u3975
	movf	0+(??_cbuffPutArray+0+0),w
	xorwf	0+(??_cbuffPutArray+2+0),w
u3975:

	skipz
	goto	u3971
	goto	u3970
u3971:
	goto	l30001735
u3970:
	
l30001734:	
	line	1041
;cbuff.c: 1036: {
;cbuff.c: 1041: hCircBuffer->localFlag |= (0x01 << 7);
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(7/8),(7)&7
	
l30001735:	
	line	1044
;cbuff.c: 1042: }
;cbuff.c: 1044: bytesWritten++;
	incf	(cbuffPutArray@bytesWritten),f
	skipnz
	incf	(cbuffPutArray@bytesWritten+1),f
	
l30001736:	
	line	1047
;cbuff.c: 1047: if (bytesWritten == noOfBytes)
	movf	(cbuffPutArray@noOfBytes+1),w
	xorwf	(cbuffPutArray@bytesWritten+1),w
	skipz
	goto	u3985
	movf	(cbuffPutArray@noOfBytes),w
	xorwf	(cbuffPutArray@bytesWritten),w
u3985:

	skipz
	goto	u3981
	goto	u3980
u3981:
	goto	l30001738
u3980:
	goto	l30001739
	
l30001738:	
	line	1016
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(7)&7
	goto	u3991
	goto	u3990
u3991:
	goto	l30001730
u3990:
	
l30001739:	
	line	1054
;cbuff.c: 1050: }
;cbuff.c: 1051: }
;cbuff.c: 1054: hCircBuffer->localFlag &= ~(0x01 << 6);
	movf	(cbuffPutArray@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bcf	indf+(6/8),(6)&7
	
l30001740:	
	line	1056
;cbuff.c: 1056: return bytesWritten;
	movf	(cbuffPutArray@bytesWritten+1),w
	movwf	(?_cbuffPutArray+1)
	movf	(cbuffPutArray@bytesWritten),w
	movwf	(?_cbuffPutArray)
	
l66:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffPutArray
	__end_of_cbuffPutArray:
; =============== function _cbuffPutArray ends ============

psect	text404,local,class=CODE,delta=2
global __ptext404
__ptext404:
	line	1057
	signat	_cbuffPutArray,12410
	global	_cbuffUnputByte

; *************** function _cbuffUnputByte *****************
; Defined at:
;		line 886 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    0[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       1       0       0       0
;      Temp:     4
;      Total:    5
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text404
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	886
	global	__size_of_cbuffUnputByte
	__size_of_cbuffUnputByte	equ	__end_of_cbuffUnputByte-_cbuffUnputByte
;cbuff.c: 885: unsigned char cbuffUnputByte(HCBUFF hCircBuffer)
;cbuff.c: 886: {
	
_cbuffUnputByte:	
	opt stack 7
; Regs used in _cbuffUnputByte: [wregfsr0]
;cbuffUnputByte@hCircBuffer stored from wreg
	line	890
	bcf	status, 5	;RP0=0, select bank0
	movwf	(cbuffUnputByte@hCircBuffer)
	
l30001765:	
;cbuff.c: 890: if (hCircBuffer->localFlag & (0x01 << 6))
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(6)&7
	goto	u4061
	goto	u4060
u4061:
	goto	l30001768
u4060:
	
l30001766:	
	line	892
;cbuff.c: 891: {
;cbuff.c: 892: return 1;
	movlw	(01h)
	goto	l57
	
l30001768:	
	line	897
;cbuff.c: 893: }
;cbuff.c: 897: if (hCircBuffer->inPointer != hCircBuffer->startOfBuffer)
	movf	(cbuffUnputByte@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffUnputByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffUnputByte+0+0+1)
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffUnputByte+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffUnputByte+2+0+1)
	movf	1+(??_cbuffUnputByte+0+0),w
	xorwf	1+(??_cbuffUnputByte+2+0),w
	skipz
	goto	u4075
	movf	0+(??_cbuffUnputByte+0+0),w
	xorwf	0+(??_cbuffUnputByte+2+0),w
u4075:

	skipnz
	goto	u4071
	goto	u4070
u4071:
	goto	l30001770
u4070:
	
l30001769:	
	line	899
;cbuff.c: 898: {
;cbuff.c: 899: hCircBuffer->inPointer--;
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movlw	low(01h)
	subwf	indf,f
	incfsz	fsr0,f
	movlw	high(01h)
	skipc
	decf	indf,f
	subwf	indf,f
	decf	fsr0,f
	goto	l60
	
l30001770:	
	line	905
;cbuff.c: 903: else
;cbuff.c: 904: {
;cbuff.c: 905: hCircBuffer->inPointer = hCircBuffer->endOfBuffer;
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffUnputByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffUnputByte+0+0+1)
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	0+(??_cbuffUnputByte+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffUnputByte+0+0),w
	movwf	indf
	
l60:	
	line	908
;cbuff.c: 906: }
;cbuff.c: 908: if (hCircBuffer->inPointer == hCircBuffer->outPointer)
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffUnputByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffUnputByte+0+0+1)
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffUnputByte+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffUnputByte+2+0+1)
	movf	1+(??_cbuffUnputByte+0+0),w
	xorwf	1+(??_cbuffUnputByte+2+0),w
	skipz
	goto	u4085
	movf	0+(??_cbuffUnputByte+0+0),w
	xorwf	0+(??_cbuffUnputByte+2+0),w
u4085:

	skipz
	goto	u4081
	goto	u4080
u4081:
	goto	l61
u4080:
	
l30001771:	
	line	910
;cbuff.c: 909: {
;cbuff.c: 910: hCircBuffer->localFlag |= (0x01 << 6);
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(6/8),(6)&7
	
l61:	
	line	913
;cbuff.c: 911: }
;cbuff.c: 913: hCircBuffer->localFlag &= ~(0x01 << 7);
	movf	(cbuffUnputByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bcf	indf+(7/8),(7)&7
	
l30001772:	
	line	915
;cbuff.c: 915: return 0;
	movlw	(0)
	
l57:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffUnputByte
	__end_of_cbuffUnputByte:
; =============== function _cbuffUnputByte ends ============

psect	text405,local,class=CODE,delta=2
global __ptext405
__ptext405:
	line	916
	signat	_cbuffUnputByte,4217
	global	_cbuffPutByte

; *************** function _cbuffPutByte *****************
; Defined at:
;		line 510 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  data            1    1[BANK0 ] unsigned char 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    0[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/0
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       2       0       0       0
;      Temp:     4
;      Total:    6
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text405
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	510
	global	__size_of_cbuffPutByte
	__size_of_cbuffPutByte	equ	__end_of_cbuffPutByte-_cbuffPutByte
;cbuff.c: 508: unsigned char cbuffPutByte(HCBUFF hCircBuffer,
;cbuff.c: 509: CBUFF data)
;cbuff.c: 510: {
	
_cbuffPutByte:	
	opt stack 7
; Regs used in _cbuffPutByte: [wreg-fsr0h+status,2+status,0]
;cbuffPutByte@hCircBuffer stored from wreg
	line	514
	bcf	status, 5	;RP0=0, select bank0
	movwf	(cbuffPutByte@hCircBuffer)
	
l30001774:	
;cbuff.c: 514: if (hCircBuffer->localFlag & (0x01 << 7))
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(7)&7
	goto	u4091
	goto	u4090
u4091:
	goto	l30001777
u4090:
	
l30001775:	
	line	516
;cbuff.c: 515: {
;cbuff.c: 516: return 0x00;
	movlw	(0)
	goto	l34
	
l30001777:	
	line	519
;cbuff.c: 517: }
;cbuff.c: 519: *hCircBuffer->inPointer = data;
	movf	(cbuffPutByte@data),w
	movwf	(??_cbuffPutByte+0+0)
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutByte+1+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutByte+1+0+1)
	movf	0+(??_cbuffPutByte+1+0),w
	movwf	fsr0
	bcf	status,7
	btfsc	1+(??_cbuffPutByte+1+0),0
	bsf	status,7
	
	movf	(??_cbuffPutByte+0+0),w
	movwf	indf
	
l30001778:	
	line	521
;cbuff.c: 521: hCircBuffer->inPointer++;
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movlw	01h
	bcf	status, 7	;select IRP bank0
	addwf	indf,f
	incf	fsr0,f
	skipnc
	incf	indf,f
	
l30001779:	
	line	525
;cbuff.c: 525: hCircBuffer->localFlag &= ~(0x01 << 6);
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bcf	indf+(6/8),(6)&7
	
l30001780:	
	line	529
;cbuff.c: 529: if (hCircBuffer->inPointer > hCircBuffer->endOfBuffer)
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutByte+0+0+1)
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutByte+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutByte+2+0+1)
	movf	1+(??_cbuffPutByte+0+0),w
	subwf	1+(??_cbuffPutByte+2+0),w
	skipz
	goto	u4105
	movf	0+(??_cbuffPutByte+0+0),w
	subwf	0+(??_cbuffPutByte+2+0),w
u4105:
	skipnc
	goto	u4101
	goto	u4100
u4101:
	goto	l36
u4100:
	
l30001781:	
	line	531
;cbuff.c: 530: {
;cbuff.c: 531: hCircBuffer->inPointer = hCircBuffer->startOfBuffer;
	movf	(cbuffPutByte@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutByte+0+0+1)
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	0+(??_cbuffPutByte+0+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffPutByte+0+0),w
	movwf	indf
	
l36:	
	line	536
;cbuff.c: 532: }
;cbuff.c: 536: if (hCircBuffer->inPointer == hCircBuffer->outPointer)
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutByte+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutByte+0+0+1)
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffPutByte+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffPutByte+2+0+1)
	movf	1+(??_cbuffPutByte+0+0),w
	xorwf	1+(??_cbuffPutByte+2+0),w
	skipz
	goto	u4115
	movf	0+(??_cbuffPutByte+0+0),w
	xorwf	0+(??_cbuffPutByte+2+0),w
u4115:

	skipz
	goto	u4111
	goto	u4110
u4111:
	goto	l30001783
u4110:
	
l30001782:	
	line	542
;cbuff.c: 537: {
;cbuff.c: 542: hCircBuffer->localFlag |= (0x01 << 7);
	movf	(cbuffPutByte@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(7/8),(7)&7
	
l30001783:	
	line	545
;cbuff.c: 543: }
;cbuff.c: 545: return 0x01;
	movlw	(01h)
	
l34:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffPutByte
	__end_of_cbuffPutByte:
; =============== function _cbuffPutByte ends ============

psect	text406,local,class=CODE,delta=2
global __ptext406
__ptext406:
	line	546
	signat	_cbuffPutByte,8313
	global	_cbuffDestroy

; *************** function _cbuffDestroy *****************
; Defined at:
;		line 326 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  bufferNumber    1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  bufferNumber    1    2[COMMON] unsigned char 
;  localCircBuf    1    3[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  tempCircBuff    1    1[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 7F/20
;		On exit  : 100/0
;		Unchanged: FFE80/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       0       0       0       0
;      Temp:     1
;      Total:    4
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text406
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	326
	global	__size_of_cbuffDestroy
	__size_of_cbuffDestroy	equ	__end_of_cbuffDestroy-_cbuffDestroy
;cbuff.c: 325: unsigned char cbuffDestroy(CBUFFNUM bufferNumber)
;cbuff.c: 326: {
	
_cbuffDestroy:	
	opt stack 7
; Regs used in _cbuffDestroy: [wreg-fsr0h+status,2+status,0]
;cbuffDestroy@bufferNumber stored from wreg
	line	333
	movwf	(cbuffDestroy@bufferNumber)
	
l30001816:	
;cbuff.c: 327: CBUFFOBJ * localCircBufferObj;
;cbuff.c: 328: CBUFFOBJ * tempCircBufferObj;
;cbuff.c: 333: localCircBufferObj = startOfCbuffObjs;
	movf	(_startOfCbuffObjs),w
	movwf	(cbuffDestroy@localCircBufferObj)
	
l30001817:	
	line	337
;cbuff.c: 337: if (localCircBufferObj->bufferNumber == bufferNumber)
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	04h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(cbuffDestroy@bufferNumber),w
	skipz
	goto	u4191
	goto	u4190
u4191:
	goto	l30001821
u4190:
	
l30001818:	
	line	339
;cbuff.c: 338: {
;cbuff.c: 339: startOfCbuffObjs = localCircBufferObj->nextCircBufferObj;
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,w
	movwf	(_startOfCbuffObjs)
	
l30001819:	
	line	340
;cbuff.c: 340: return 0x01;
	movlw	(01h)
	goto	l16
	
l30001821:	
	line	350
;cbuff.c: 347: {
;cbuff.c: 350: tempCircBufferObj = localCircBufferObj;
	movf	(cbuffDestroy@localCircBufferObj),w
	movwf	(cbuffDestroy@tempCircBufferObj)
	
l30001822:	
	line	354
;cbuff.c: 354: if(localCircBufferObj->nextCircBufferObj != (CBUFFOBJ *) 0)
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,w
	xorlw	0
	skipnz
	goto	u4201
	goto	u4200
u4201:
	goto	l30001827
u4200:
	
l30001823:	
	line	358
;cbuff.c: 355: {
;cbuff.c: 358: localCircBufferObj = localCircBufferObj->nextCircBufferObj;
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,w
	movwf	(cbuffDestroy@localCircBufferObj)
	line	361
;cbuff.c: 361: if (localCircBufferObj->bufferNumber == bufferNumber)
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	xorwf	(cbuffDestroy@bufferNumber),w
	skipz
	goto	u4211
	goto	u4210
u4211:
	goto	l30001827
u4210:
	
l30001824:	
	line	367
;cbuff.c: 362: {
;cbuff.c: 366: tempCircBufferObj->nextCircBufferObj =
;cbuff.c: 367: localCircBufferObj->nextCircBufferObj;
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffDestroy+0+0)
	movf	(cbuffDestroy@tempCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	(??_cbuffDestroy+0+0),w
	movwf	indf
	goto	l30001819
	
l30001827:	
	line	372
;cbuff.c: 369: }
;cbuff.c: 370: }
;cbuff.c: 372: } while(localCircBufferObj->nextCircBufferObj != (CBUFFOBJ *) 0);
	movf	(cbuffDestroy@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,f
	skipz
	goto	u4221
	goto	u4220
u4221:
	goto	l30001821
u4220:
	
l30001828:	
	line	375
;cbuff.c: 375: return 0x00;
	movlw	(0)
	
l16:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffDestroy
	__end_of_cbuffDestroy:
; =============== function _cbuffDestroy ends ============

psect	text407,local,class=CODE,delta=2
global __ptext407
__ptext407:
	line	376
	signat	_cbuffDestroy,4217
	global	_cbuffCreate

; *************** function _cbuffCreate *****************
; Defined at:
;		line 208 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  buffer          2    2[BANK0 ] PTR unsigned char 
;		 -> RAM(128), outBuffer(32), testBuffer1(8), inBuffer(64), 
;		 -> testBuffer2(16), 
;  sizeOfBuffer    2    4[BANK0 ] unsigned int 
;  newCircBuffe    1    6[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Auto vars:     Size  Location     Type
;  localCircBuf    1    1[BANK0 ] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
;  circBuffNum     1    0[BANK0 ] unsigned char 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 7F/0
;		On exit  : 60/0
;		Unchanged: FFE80/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         4       7       0       0       0
;      Temp:     4
;      Total:   11
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text407
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	208
	global	__size_of_cbuffCreate
	__size_of_cbuffCreate	equ	__end_of_cbuffCreate-_cbuffCreate
;cbuff.c: 205: CBUFFNUM cbuffCreate(CBUFF * buffer,
;cbuff.c: 206: unsigned int sizeOfBuffer,
;cbuff.c: 207: CBUFFOBJ * newCircBufferObj)
;cbuff.c: 208: {
	
_cbuffCreate:	
	opt stack 7
; Regs used in _cbuffCreate: [wreg-fsr0h+status,2+status,0]
	line	210
	
l30001785:	
;cbuff.c: 209: CBUFFOBJ * localCircBufferObj;
;cbuff.c: 210: CBUFFNUM circBuffNum = 1;
	clrf	(cbuffCreate@circBuffNum)
	incf	(cbuffCreate@circBuffNum),f
	
l30001786:	
	line	217
;cbuff.c: 217: if ((buffer != (unsigned char *) 0) && (sizeOfBuffer != 0))
	movf	(cbuffCreate@buffer+1),w
	iorwf	(cbuffCreate@buffer),w
	skipnz
	goto	u4121
	goto	u4120
u4121:
	goto	l30001811
u4120:
	
l30001787:	
	movf	(cbuffCreate@sizeOfBuffer+1),w
	iorwf	(cbuffCreate@sizeOfBuffer),w
	skipnz
	goto	u4131
	goto	u4130
u4131:
	goto	l30001811
u4130:
	
l30001788:	
	line	221
;cbuff.c: 218: {
;cbuff.c: 221: if (newCircBufferObj != (CBUFFOBJ *) 0)
	movf	(cbuffCreate@newCircBufferObj),w
	skipz
	goto	u4140
	goto	l30001811
u4140:
	
l30001789:	
	line	224
;cbuff.c: 222: {
;cbuff.c: 224: newCircBufferObj->startOfBuffer = buffer;
	movf	(cbuffCreate@newCircBufferObj),w
	movwf	fsr0
	movf	(cbuffCreate@buffer),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(cbuffCreate@buffer+1),w
	movwf	indf
	
l30001790:	
	line	226
;cbuff.c: 225: newCircBufferObj->endOfBuffer = buffer + (sizeof(CBUFF) *
;cbuff.c: 226: (sizeOfBuffer - 1));
	movf	(cbuffCreate@sizeOfBuffer),w
	addwf	(cbuffCreate@buffer),w
	movwf	(??_cbuffCreate+0+0)
	movf	(cbuffCreate@buffer+1),w
	skipnc
	addlw	1
	movwf	1+((??_cbuffCreate+0+0))
	movf	0+(??_cbuffCreate+0+0),w
	addlw	low(0FFFFh)
	movwf	(??_cbuffCreate+2+0)
	movf	1+(??_cbuffCreate+0+0),w
	skipnc
	addlw	1
	addlw	high(0FFFFh)
	movwf	1+(??_cbuffCreate+2+0)
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	01h
	movwf	fsr0
	movf	0+(??_cbuffCreate+2+0),w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_cbuffCreate+2+0),w
	movwf	indf
	
l30001791:	
	line	227
;cbuff.c: 227: newCircBufferObj->inPointer = buffer;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	02h
	movwf	fsr0
	movf	(cbuffCreate@buffer),w
	movwf	indf
	incf	fsr0,f
	movf	(cbuffCreate@buffer+1),w
	movwf	indf
	
l30001792:	
	line	228
;cbuff.c: 228: newCircBufferObj->outPointer = buffer;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	03h
	movwf	fsr0
	movf	(cbuffCreate@buffer),w
	movwf	indf
	incf	fsr0,f
	movf	(cbuffCreate@buffer+1),w
	movwf	indf
	
l30001793:	
	line	230
;cbuff.c: 230: newCircBufferObj->localFlag = 0x00;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	05h
	movwf	fsr0
	clrf	indf
	
l30001794:	
	line	232
;cbuff.c: 232: newCircBufferObj->localFlag |= (0x01 << 6);
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(6/8),(6)&7
	
l30001795:	
	line	234
;cbuff.c: 234: newCircBufferObj->nextCircBufferObj = (CBUFFOBJ *) 0;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	06h
	movwf	fsr0
	clrf	indf
	
l30001796:	
	line	241
;cbuff.c: 241: if (startOfCbuffObjs == (CBUFFOBJ *) 0)
	movf	(_startOfCbuffObjs),f
	skipz
	goto	u4151
	goto	u4150
u4151:
	goto	l30001799
u4150:
	
l30001797:	
	line	243
;cbuff.c: 242: {
;cbuff.c: 243: startOfCbuffObjs = newCircBufferObj;
	movf	(cbuffCreate@newCircBufferObj),w
	movwf	(_startOfCbuffObjs)
	
l30001798:	
	line	244
;cbuff.c: 244: newCircBufferObj->bufferNumber = 1;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	04h
	movwf	fsr0
	clrf	indf
	incf	indf,f
	goto	l30001809
	
l30001799:	
	line	252
;cbuff.c: 248: else
;cbuff.c: 249: {
;cbuff.c: 252: localCircBufferObj = startOfCbuffObjs;
	movf	(_startOfCbuffObjs),w
	movwf	(cbuffCreate@localCircBufferObj)
	goto	l30001806
	
l30001800:	
	line	255
;cbuff.c: 254: {
;cbuff.c: 255: if (localCircBufferObj->bufferNumber == circBuffNum)
	movf	(cbuffCreate@localCircBufferObj),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	xorwf	(cbuffCreate@circBuffNum),w
	skipz
	goto	u4161
	goto	u4160
u4161:
	goto	l30001805
u4160:
	
l30001801:	
	line	259
;cbuff.c: 256: {
;cbuff.c: 259: circBuffNum ++;
	incf	(cbuffCreate@circBuffNum),f
	
l30001802:	
	line	262
;cbuff.c: 262: if (circBuffNum >= 0xFF)
	movf	(cbuffCreate@circBuffNum),w
	xorlw	0FFh
	skipz
	goto	u4171
	goto	u4170
u4171:
	goto	l30001799
u4170:
	goto	l30001811
	
l30001805:	
	line	277
;cbuff.c: 272: else
;cbuff.c: 273: {
;cbuff.c: 276: localCircBufferObj =
;cbuff.c: 277: localCircBufferObj->nextCircBufferObj;
	movf	(cbuffCreate@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,w
	movwf	(cbuffCreate@localCircBufferObj)
	
l30001806:	
	line	253
	movf	(cbuffCreate@localCircBufferObj),f
	skipz
	goto	u4181
	goto	u4180
u4181:
	goto	l30001800
u4180:
	
l30001807:	
	line	281
;cbuff.c: 278: }
;cbuff.c: 279: }
;cbuff.c: 281: newCircBufferObj->bufferNumber = circBuffNum;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	04h
	movwf	fsr0
	movf	(cbuffCreate@circBuffNum),w
	movwf	indf
	line	285
;cbuff.c: 285: newCircBufferObj->nextCircBufferObj = startOfCbuffObjs;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	(_startOfCbuffObjs),w
	movwf	indf
	
l30001808:	
	line	286
;cbuff.c: 286: startOfCbuffObjs = newCircBufferObj;
	movf	(cbuffCreate@newCircBufferObj),w
	movwf	(_startOfCbuffObjs)
	
l30001809:	
	line	289
;cbuff.c: 287: }
;cbuff.c: 289: return newCircBufferObj->bufferNumber;
	movf	(cbuffCreate@newCircBufferObj),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	goto	l4
	
l30001811:	
	line	295
;cbuff.c: 295: return 0;
	movlw	(0)
	
l4:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffCreate
	__end_of_cbuffCreate:
; =============== function _cbuffCreate ends ============

psect	text408,local,class=CODE,delta=2
global __ptext408
__ptext408:
	line	296
	signat	_cbuffCreate,12409
	global	_cbuffInit

; *************** function _cbuffInit *****************
; Defined at:
;		line 141 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;		None
; Auto vars:     Size  Location     Type
;		None
; Return value:  Size  Location     Type
;		None               void
; Registers used:
;		status,2
; Tracked objects:
;		On entry : 17F/20
;		On exit  : 17F/20
;		Unchanged: FFE80/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         0       0       0       0       0
;      Temp:     0
;      Total:    0
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text408
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	141
	global	__size_of_cbuffInit
	__size_of_cbuffInit	equ	__end_of_cbuffInit-_cbuffInit
;cbuff.h: 100: typedef unsigned char CBUFF;
;cbuff.h: 109: typedef unsigned char CBUFFNUM;
;cbuff.h: 131: typedef struct CBUFFTYPE {
;cbuff.h: 132: CBUFF * startOfBuffer;
;cbuff.h: 133: CBUFF * endOfBuffer;
;cbuff.h: 134: CBUFF * inPointer;
;cbuff.h: 135: CBUFF * outPointer;
;cbuff.h: 136: CBUFFNUM bufferNumber;
;cbuff.h: 137: unsigned char localFlag;
;cbuff.h: 138: struct CBUFFTYPE * nextCircBufferObj;
;cbuff.h: 139: } CBUFFOBJ;
;cbuff.h: 146: typedef CBUFFOBJ * HCBUFF;
;cbuff.h: 163: void cbuffInit(void);
	
_cbuffInit:	
	opt stack 7
; Regs used in _cbuffInit: [status,2]
	line	143
	
l30001830:	
;cbuff.c: 143: startOfCbuffObjs = (CBUFFOBJ *) 0;
	clrf	(_startOfCbuffObjs)
	
l2:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffInit
	__end_of_cbuffInit:
; =============== function _cbuffInit ends ============

psect	text409,local,class=CODE,delta=2
global __ptext409
__ptext409:
	line	144
	signat	_cbuffInit,88
	global	_cbuffOpen

; *************** function _cbuffOpen *****************
; Defined at:
;		line 404 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  bufferNumber    1    wreg     unsigned char 
; Auto vars:     Size  Location     Type
;  bufferNumber    1    0[COMMON] unsigned char 
;  localCircBuf    1    1[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      PTR struct CBUFFTYPE
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 7F/20
;		On exit  : 100/0
;		Unchanged: FFE80/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         2       0       0       0       0
;      Temp:     0
;      Total:    2
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text409
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	404
	global	__size_of_cbuffOpen
	__size_of_cbuffOpen	equ	__end_of_cbuffOpen-_cbuffOpen
;cbuff.c: 403: HCBUFF cbuffOpen(CBUFFNUM bufferNumber)
;cbuff.c: 404: {
	
_cbuffOpen:	
	opt stack 7
; Regs used in _cbuffOpen: [wreg-fsr0h+status,2+status,0]
;cbuffOpen@bufferNumber stored from wreg
	line	409
	movwf	(cbuffOpen@bufferNumber)
	
l30001831:	
;cbuff.c: 405: CBUFFOBJ * localCircBufferObj;
;cbuff.c: 409: localCircBufferObj = startOfCbuffObjs;
	movf	(_startOfCbuffObjs),w
	movwf	(cbuffOpen@localCircBufferObj)
	
l30001832:	
	line	413
;cbuff.c: 412: {
;cbuff.c: 413: if (localCircBufferObj->bufferNumber == bufferNumber)
	movf	(cbuffOpen@localCircBufferObj),w
	addlw	04h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(cbuffOpen@bufferNumber),w
	skipz
	goto	u4231
	goto	u4230
u4231:
	goto	l30001840
u4230:
	
l30001833:	
	line	416
;cbuff.c: 414: {
;cbuff.c: 416: if (!(localCircBufferObj->localFlag & (0x01 << 5)))
	movf	(cbuffOpen@localCircBufferObj),w
	addlw	05h
	movwf	fsr0
	btfsc	indf,(5)&7
	goto	u4241
	goto	u4240
u4241:
	goto	l30001838
u4240:
	
l30001834:	
	line	419
;cbuff.c: 417: {
;cbuff.c: 419: localCircBufferObj->localFlag |= (0x01 << 5);
	movf	(cbuffOpen@localCircBufferObj),w
	addlw	05h
	movwf	fsr0
	bsf	indf+(5/8),(5)&7
	
l30001835:	
	line	421
;cbuff.c: 421: return localCircBufferObj;
	movf	(cbuffOpen@localCircBufferObj),w
	goto	l23
	
l30001838:	
	line	427
;cbuff.c: 425: else
;cbuff.c: 426: {
;cbuff.c: 427: return (CBUFFOBJ *) 0;
	movlw	(0)
	goto	l23
	
l30001840:	
	line	432
;cbuff.c: 430: else
;cbuff.c: 431: {
;cbuff.c: 432: localCircBufferObj = localCircBufferObj->nextCircBufferObj;
	movf	(cbuffOpen@localCircBufferObj),w
	addlw	06h
	movwf	fsr0
	movf	indf,w
	movwf	(cbuffOpen@localCircBufferObj)
	
l30001841:	
	line	434
;cbuff.c: 433: }
;cbuff.c: 434: } while (localCircBufferObj != (CBUFFOBJ *) 0);
	movf	(cbuffOpen@localCircBufferObj),f
	skipz
	goto	u4251
	goto	u4250
u4251:
	goto	l30001832
u4250:
	goto	l30001838
	
l23:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffOpen
	__end_of_cbuffOpen:
; =============== function _cbuffOpen ends ============

psect	text410,local,class=CODE,delta=2
global __ptext410
__ptext410:
	line	438
	signat	_cbuffOpen,4217
	global	_cbuffGetFill

; *************** function _cbuffGetFill *****************
; Defined at:
;		line 657 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    1[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  2   12[BANK1 ] unsigned int 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/20
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0      12       0       0
;      Temp:    10
;      Total:   13
; This function calls:
;		_cbuffGetSpace
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text410
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	657
	global	__size_of_cbuffGetFill
	__size_of_cbuffGetFill	equ	__end_of_cbuffGetFill-_cbuffGetFill
;cbuff.c: 656: unsigned int cbuffGetFill(HCBUFF hCircBuffer)
;cbuff.c: 657: {
	
_cbuffGetFill:	
	opt stack 7
; Regs used in _cbuffGetFill: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;cbuffGetFill@hCircBuffer stored from wreg
	line	662
	movwf	(cbuffGetFill@hCircBuffer)
	
l30001427:	
;cbuff.c: 661: return ( (hCircBuffer->endOfBuffer - hCircBuffer->startOfBuffer +
;cbuff.c: 662: sizeof(CBUFF)) - cbuffGetSpace(hCircBuffer) );
	movf	(cbuffGetFill@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetFill+0+0)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetFill+0+0+1)^080h
	movf	(cbuffGetFill@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetFill+2+0)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetFill+2+0+1)^080h
	movf	(cbuffGetFill@hCircBuffer),w
	fcall	_cbuffGetSpace
	comf	(0+(?_cbuffGetSpace))^080h,w
	movwf	??_cbuffGetFill+4+0
	comf	(1+(?_cbuffGetSpace))^080h,w
	movwf	??_cbuffGetFill+4+0+1
	incf	??_cbuffGetFill+4+0,f
	skipnz
	incf	??_cbuffGetFill+4+0+1,f
	movf	0+(??_cbuffGetFill+2+0)^080h,w
	subwf	0+(??_cbuffGetFill+4+0)^080h,w
	movwf	(??_cbuffGetFill+6+0)^080h
	movf	1+(??_cbuffGetFill+2+0)^080h,w
	skipc
	incf	1+(??_cbuffGetFill+2+0)^080h,w
	subwf	1+(??_cbuffGetFill+4+0)^080h,w
	movwf	1+(??_cbuffGetFill+6+0)^080h
	movf	0+(??_cbuffGetFill+0+0)^080h,w
	addwf	0+(??_cbuffGetFill+6+0)^080h,w
	movwf	(??_cbuffGetFill+8+0)^080h
	movf	1+(??_cbuffGetFill+0+0)^080h,w
	skipnc
	incf	1+(??_cbuffGetFill+0+0)^080h,w
	addwf	1+(??_cbuffGetFill+6+0)^080h,w
	movwf	1+(??_cbuffGetFill+8+0)^080h
	movf	0+(??_cbuffGetFill+8+0)^080h,w
	addlw	low(01h)
	movwf	(?_cbuffGetFill)^080h
	movf	1+(??_cbuffGetFill+8+0)^080h,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(?_cbuffGetFill)^080h
	
l43:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffGetFill
	__end_of_cbuffGetFill:
; =============== function _cbuffGetFill ends ============

psect	text411,local,class=CODE,delta=2
global __ptext411
__ptext411:
	line	663
	signat	_cbuffGetFill,4218
	global	_cbuffClose

; *************** function _cbuffClose *****************
; Defined at:
;		line 465 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    0[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  1    wreg      unsigned char 
; Registers used:
;		wreg, fsr0l, fsr0h
; Tracked objects:
;		On entry : 17F/20
;		On exit  : 17F/20
;		Unchanged: FFE80/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1       0       0       0       0
;      Temp:     0
;      Total:    1
; This function calls:
;		Nothing
; This function is called by:
;		_main
; This function uses a non-reentrant model
; 
psect	text411
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	465
	global	__size_of_cbuffClose
	__size_of_cbuffClose	equ	__end_of_cbuffClose-_cbuffClose
;cbuff.c: 464: CBUFFNUM cbuffClose(HCBUFF hCircBuffer)
;cbuff.c: 465: {
	
_cbuffClose:	
	opt stack 7
; Regs used in _cbuffClose: [wregfsr0]
;cbuffClose@hCircBuffer stored from wreg
	line	467
	movwf	(cbuffClose@hCircBuffer)
	
l30001844:	
;cbuff.c: 467: if (hCircBuffer->localFlag & (0x01 << 5))
	movf	(cbuffClose@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(5)&7
	goto	u4261
	goto	u4260
u4261:
	goto	l30001848
u4260:
	
l30001845:	
	line	471
;cbuff.c: 468: {
;cbuff.c: 471: hCircBuffer->localFlag &= ~(0x01 << 5);
	movf	(cbuffClose@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	bcf	indf+(5/8),(5)&7
	line	474
;cbuff.c: 474: return hCircBuffer->bufferNumber;
	movf	(cbuffClose@hCircBuffer),w
	addlw	04h
	movwf	fsr0
	movf	indf,w
	goto	l31
	
l30001848:	
	line	480
;cbuff.c: 478: else
;cbuff.c: 479: {
;cbuff.c: 480: return (CBUFFNUM) 0;
	movlw	(0)
	
l31:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffClose
	__end_of_cbuffClose:
; =============== function _cbuffClose ends ============

psect	text412,local,class=CODE,delta=2
global __ptext412
__ptext412:
	line	482
	signat	_cbuffClose,4217
	global	_cbuffGetSpace

; *************** function _cbuffGetSpace *****************
; Defined at:
;		line 571 in file "C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
; Parameters:    Size  Location     Type
;  hCircBuffer     1    wreg     PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Auto vars:     Size  Location     Type
;  hCircBuffer     1    0[COMMON] PTR struct CBUFFTYPE
;		 -> RAM(128), inBufferObj(7), outBufferObj(7), testBuffer1Obj(7), 
;		 -> testBuffer2Obj(7), 
; Return value:  Size  Location     Type
;                  2    0[BANK1 ] unsigned int 
; Registers used:
;		wreg, fsr0l, fsr0h, status,2, status,0
; Tracked objects:
;		On entry : 160/20
;		On exit  : 160/20
;		Unchanged: FFE9F/0
; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;      Locals:         1      14       2       0       0
;      Temp:    14
;      Total:   17
; This function calls:
;		Nothing
; This function is called by:
;		_cbuffGetFill
;		_main
; This function uses a non-reentrant model
; 
psect	text412
	file	"C:\MyMPLABWork\Personal\CODINGHEAD\MASTERS2010-1422GSM\circBufferIV\cbuff_module\cbuff.c"
	line	571
	global	__size_of_cbuffGetSpace
	__size_of_cbuffGetSpace	equ	__end_of_cbuffGetSpace-_cbuffGetSpace
;cbuff.c: 570: unsigned int cbuffGetSpace(HCBUFF hCircBuffer)
;cbuff.c: 571: {
	
_cbuffGetSpace:	
	opt stack 6
; Regs used in _cbuffGetSpace: [wreg-fsr0h+status,2+status,0]
;cbuffGetSpace@hCircBuffer stored from wreg
	line	589
	movwf	(cbuffGetSpace@hCircBuffer)
	
l30001415:	
;cbuff.c: 589: if (hCircBuffer->localFlag & (0x01 << 7))
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(7)&7
	goto	u2851
	goto	u2850
u2851:
	goto	l30001418
u2850:
	
l30001416:	
	line	591
;cbuff.c: 590: {
;cbuff.c: 591: return 0;
	clrf	(?_cbuffGetSpace)^080h
	clrf	(?_cbuffGetSpace+1)^080h
	goto	l38
	
l30001418:	
	line	595
;cbuff.c: 592: }
;cbuff.c: 595: if (hCircBuffer->localFlag & (0x01 << 6))
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	05h
	movwf	fsr0
	btfss	indf,(6)&7
	goto	u2861
	goto	u2860
u2861:
	goto	l30001421
u2860:
	
l30001419:	
	line	599
;cbuff.c: 596: {
;cbuff.c: 598: return (unsigned int) ((hCircBuffer->endOfBuffer + sizeof(CBUFF)) -
;cbuff.c: 599: hCircBuffer->startOfBuffer);
	movf	(cbuffGetSpace@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_cbuffGetSpace+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+0+0+1)
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0+1)
	movf	0+(??_cbuffGetSpace+0+0),w
	subwf	0+(??_cbuffGetSpace+2+0),w
	movwf	(??_cbuffGetSpace+4+0)
	movf	1+(??_cbuffGetSpace+0+0),w
	skipc
	incf	1+(??_cbuffGetSpace+0+0),w
	subwf	1+(??_cbuffGetSpace+2+0),w
	movwf	1+(??_cbuffGetSpace+4+0)
	movf	0+(??_cbuffGetSpace+4+0),w
	addlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_cbuffGetSpace)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_cbuffGetSpace+4+0),w
	skipnc
	addlw	1
	addlw	high(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	1+(?_cbuffGetSpace)^080h
	goto	l38
	
l30001421:	
	line	610
;cbuff.c: 604: }
;cbuff.c: 610: if (hCircBuffer->inPointer > hCircBuffer->outPointer)
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_cbuffGetSpace+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+0+0+1)
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0+1)
	movf	1+(??_cbuffGetSpace+0+0),w
	subwf	1+(??_cbuffGetSpace+2+0),w
	skipz
	goto	u2875
	movf	0+(??_cbuffGetSpace+0+0),w
	subwf	0+(??_cbuffGetSpace+2+0),w
u2875:
	skipnc
	goto	u2871
	goto	u2870
u2871:
	goto	l30001425
u2870:
	
l30001422:	
	line	615
;cbuff.c: 611: {
;cbuff.c: 612: return (unsigned int) ( (hCircBuffer->endOfBuffer -
;cbuff.c: 613: hCircBuffer->startOfBuffer + sizeof(CBUFF))
;cbuff.c: 614: - (hCircBuffer->inPointer -
;cbuff.c: 615: hCircBuffer->outPointer));
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+0+0+1)
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0+1)
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+4+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+4+0+1)
	movf	(cbuffGetSpace@hCircBuffer),w
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+6+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+6+0+1)
	comf	(??_cbuffGetSpace+6+0),f
	comf	(??_cbuffGetSpace+6+1),f
	incf	(??_cbuffGetSpace+6+0),f
	skipnz
	incf	(??_cbuffGetSpace+6+1),f
	movf	0+(??_cbuffGetSpace+4+0),w
	subwf	0+(??_cbuffGetSpace+6+0),w
	movwf	(??_cbuffGetSpace+8+0)
	movf	1+(??_cbuffGetSpace+4+0),w
	skipc
	incf	1+(??_cbuffGetSpace+4+0),w
	subwf	1+(??_cbuffGetSpace+6+0),w
	movwf	1+(??_cbuffGetSpace+8+0)
	movf	0+(??_cbuffGetSpace+2+0),w
	addwf	0+(??_cbuffGetSpace+8+0),w
	movwf	(??_cbuffGetSpace+10+0)
	movf	1+(??_cbuffGetSpace+2+0),w
	skipnc
	incf	1+(??_cbuffGetSpace+2+0),w
	addwf	1+(??_cbuffGetSpace+8+0),w
	movwf	1+(??_cbuffGetSpace+10+0)
	movf	0+(??_cbuffGetSpace+0+0),w
	addwf	0+(??_cbuffGetSpace+10+0),w
	movwf	(??_cbuffGetSpace+12+0)
	movf	1+(??_cbuffGetSpace+0+0),w
	skipnc
	incf	1+(??_cbuffGetSpace+0+0),w
	addwf	1+(??_cbuffGetSpace+10+0),w
	movwf	1+(??_cbuffGetSpace+12+0)
	movf	0+(??_cbuffGetSpace+12+0),w
	addlw	low(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_cbuffGetSpace)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_cbuffGetSpace+12+0),w
	skipnc
	addlw	1
	addlw	high(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	1+(?_cbuffGetSpace)^080h
	goto	l38
	
l30001425:	
	line	625
;cbuff.c: 621: else
;cbuff.c: 622: {
;cbuff.c: 624: return (unsigned int) (hCircBuffer->outPointer -
;cbuff.c: 625: hCircBuffer->inPointer);
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+0+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+0+0+1)
	movf	(cbuffGetSpace@hCircBuffer),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0)
	incf	fsr0,f
	movf	indf,w
	movwf	(??_cbuffGetSpace+2+0+1)
	movf	0+(??_cbuffGetSpace+0+0),w
	subwf	0+(??_cbuffGetSpace+2+0),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_cbuffGetSpace)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_cbuffGetSpace+0+0),w
	skipc
	incf	1+(??_cbuffGetSpace+0+0),w
	subwf	1+(??_cbuffGetSpace+2+0),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	1+(?_cbuffGetSpace)^080h
	
l38:	
	return
	opt stack 0
GLOBAL	__end_of_cbuffGetSpace
	__end_of_cbuffGetSpace:
; =============== function _cbuffGetSpace ends ============

psect	text413,local,class=CODE,delta=2
global __ptext413
__ptext413:
	line	631
	signat	_cbuffGetSpace,4218
	end
