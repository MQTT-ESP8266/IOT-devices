EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:74xgxx
LIBS:ac-dc
LIBS:actel
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:battery_management
LIBS:bbd
LIBS:brooktre
LIBS:cmos_ieee
LIBS:dc-dc
LIBS:diode
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic
LIBS:hc11
LIBS:ir
LIBS:Lattice
LIBS:logo
LIBS:maxim
LIBS:mechanical
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic32mcu
LIBS:motor_drivers
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:Oscillators
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:relays
LIBS:rfcom
LIBS:sensors
LIBS:silabs
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:tinkerforge
LIBS:transf
LIBS:ttl_ieee
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:zetex
LIBS:Zilog
LIBS:wallplug-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CP1 C
U 1 1 586A87B3
P 6200 1850
F 0 "C" H 6225 1950 50  0001 L CNN
F 1 "10uF" H 6225 1750 50  0000 L CNN
F 2 "" H 6200 1850 50  0000 C CNN
F 3 "" H 6200 1850 50  0000 C CNN
	1    6200 1850
	1    0    0    -1  
$EndComp
$Comp
L R R
U 1 1 586CC756
P 6750 4200
F 0 "R" V 6830 4200 50  0001 C CNN
F 1 "10K" V 6750 4200 50  0000 C CNN
F 2 "" V 6680 4200 50  0000 C CNN
F 3 "" H 6750 4200 50  0000 C CNN
	1    6750 4200
	0    1    1    0   
$EndComp
$Comp
L R R
U 1 1 586CC847
P 4200 3800
F 0 "R" V 4280 3800 50  0000 C CNN
F 1 "10K" V 4200 3800 50  0000 C CNN
F 2 "" V 4130 3800 50  0000 C CNN
F 3 "" H 4200 3800 50  0000 C CNN
	1    4200 3800
	0    1    1    0   
$EndComp
$Comp
L Transformer_1P_1S T?
U 1 1 58C961E2
P 2650 1600
F 0 "T?" H 2650 1850 50  0001 C CNN
F 1 "Transformer" H 2650 1300 50  0000 C CNN
F 2 "" H 2650 1600 50  0000 C CNN
F 3 "" H 2650 1600 50  0000 C CNN
	1    2650 1600
	1    0    0    -1  
$EndComp
$Comp
L Fuse 1A
U 1 1 58C96319
P 3350 1400
F 0 "1A" V 3430 1400 50  0000 C CNN
F 1 "Fuse" V 3275 1400 50  0000 C CNN
F 2 "" V 3280 1400 50  0000 C CNN
F 3 "" H 3350 1400 50  0000 C CNN
	1    3350 1400
	0    1    1    0   
$EndComp
$Comp
L DIODE 1N4001
U 1 1 58C963C4
P 4050 1400
F 0 "1N4001" H 4050 1550 50  0001 C CNN
F 1 "DIODE" H 4050 1225 50  0001 C CNN
F 2 "" H 4050 1400 50  0000 C CNN
F 3 "" H 4050 1400 50  0000 C CNN
	1    4050 1400
	-1   0    0    1   
$EndComp
$Comp
L DIODE 1N4001
U 1 1 58C96B83
P 4050 2100
F 0 "1N4001" H 4050 2250 50  0001 C CNN
F 1 "DIODE" H 4050 1925 50  0001 C CNN
F 2 "" H 4050 2100 50  0000 C CNN
F 3 "" H 4050 2100 50  0000 C CNN
	1    4050 2100
	1    0    0    1   
$EndComp
$Comp
L DIODE 1N?
U 1 1 58C96C07
P 3600 1750
F 0 "1N?" H 3600 1900 50  0001 C CNN
F 1 "DIODE" H 3600 1575 50  0001 C CNN
F 2 "" H 3600 1750 50  0000 C CNN
F 3 "" H 3600 1750 50  0000 C CNN
	1    3600 1750
	0    -1   1    0   
$EndComp
$Comp
L DIODE 1N4001
U 1 1 58C96CC6
P 4450 1750
F 0 "1N4001" H 4450 1900 50  0001 C CNN
F 1 "DIODE" H 4450 1575 50  0001 C CNN
F 2 "" H 4450 1750 50  0000 C CNN
F 3 "" H 4450 1750 50  0000 C CNN
	1    4450 1750
	0    -1   -1   0   
$EndComp
$Comp
L CP C?
U 1 1 58C971C4
P 4750 1800
F 0 "C?" H 4775 1900 50  0001 L CNN
F 1 "470uF" H 4775 1700 50  0000 L CNN
F 2 "" H 4788 1650 50  0000 C CNN
F 3 "" H 4750 1800 50  0000 C CNN
	1    4750 1800
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58C97201
P 5100 1800
F 0 "C?" H 5125 1900 50  0001 L CNN
F 1 "0.1uF" H 5125 1700 50  0000 L CNN
F 2 "" H 5138 1650 50  0000 C CNN
F 3 "" H 5100 1800 50  0000 C CNN
	1    5100 1800
	1    0    0    -1  
$EndComp
$Comp
L 7805 U?
U 1 1 58C97397
P 5450 1450
F 0 "U?" H 5600 1254 50  0001 C CNN
F 1 "7805" H 5450 1650 50  0000 C CNN
F 2 "" H 5450 1450 50  0000 C CNN
F 3 "" H 5450 1450 50  0000 C CNN
	1    5450 1450
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 58C97420
P 5850 1850
F 0 "C?" H 5875 1950 50  0001 L CNN
F 1 "0.1uF" H 5875 1750 50  0000 L CNN
F 2 "" H 5888 1700 50  0000 C CNN
F 3 "" H 5850 1850 50  0000 C CNN
	1    5850 1850
	1    0    0    -1  
$EndComp
$Comp
L FINDER-36.11.4001 Relay
U 1 1 58C977C8
P 2750 2950
F 0 "Relay" H 3200 3100 50  0000 L CNN
F 1 "FINDER-36.11.4001" H 3200 3000 50  0001 L CNN
F 2 "" H 2750 2950 50  0000 C CNN
F 3 "" H 2750 2950 50  0000 C CNN
	1    2750 2950
	-1   0    0    -1  
$EndComp
$Comp
L AP7333 U?
U 1 1 58C9782D
P 6550 1400
F 0 "U?" H 6350 1600 60  0001 C CNN
F 1 "HT7333" H 6550 1597 60  0000 C TNN
F 2 "" H 6550 1400 60  0000 C CNN
F 3 "" H 6550 1400 60  0000 C CNN
	1    6550 1400
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 58C97980
P 7000 1850
F 0 "C?" H 7025 1950 50  0001 L CNN
F 1 "10uF" H 7025 1750 50  0000 L CNN
F 2 "" H 7000 1850 50  0000 C CNN
F 3 "" H 7000 1850 50  0000 C CNN
	1    7000 1850
	1    0    0    -1  
$EndComp
$Comp
L ESP-12E ESP8266
U 1 1 586A3153
P 5600 3900
F 0 "ESP8266" H 5600 3800 50  0000 C CNN
F 1 "ESP-12E" H 5600 4000 50  0000 C CNN
F 2 "" H 5600 3900 50  0001 C CNN
F 3 "" H 5600 3900 50  0001 C CNN
	1    5600 3900
	1    0    0    -1  
$EndComp
Text GLabel 1900 1400 0    60   Input ~ 0
220VAC_L
Text GLabel 1900 1800 0    60   Input ~ 0
220VAC_N
Wire Wire Line
	3600 1550 3600 1400
Wire Wire Line
	3500 1400 3850 1400
Wire Wire Line
	3900 1400 5100 1400
Wire Wire Line
	4450 1400 4450 1550
Wire Wire Line
	4450 1950 4450 2350
Wire Wire Line
	4450 2100 4250 2100
Wire Wire Line
	3850 2100 3600 2100
Wire Wire Line
	3600 1950 3600 2450
Wire Wire Line
	3200 1400 3050 1400
Connection ~ 3600 1400
Wire Wire Line
	3050 1800 3200 1800
Wire Wire Line
	3200 1800 3200 2350
Wire Wire Line
	3200 2350 4450 2350
Connection ~ 4450 2100
Wire Wire Line
	4750 1400 4750 1650
Connection ~ 4450 1400
Wire Wire Line
	4750 2450 4750 1950
Connection ~ 3600 2100
Wire Wire Line
	5850 2450 5850 2000
Connection ~ 4750 2450
Wire Wire Line
	5450 2450 5450 1700
Connection ~ 5450 2450
Wire Wire Line
	5100 2450 5100 1950
Connection ~ 5100 2450
Connection ~ 4750 1400
Wire Wire Line
	5100 1400 5100 1650
Wire Wire Line
	7000 2000 7000 5000
Connection ~ 5850 2450
Wire Wire Line
	6550 2450 6550 1800
Connection ~ 6550 2450
Wire Wire Line
	6200 2450 6200 2000
Connection ~ 6200 2450
Wire Wire Line
	6200 1700 6200 1400
Wire Wire Line
	6800 1400 7350 1400
Wire Wire Line
	7000 1400 7000 1700
Connection ~ 7000 2450
Wire Wire Line
	4000 4300 4000 2900
Wire Wire Line
	7350 1400 7350 2900
Connection ~ 7000 1400
Wire Wire Line
	1900 1400 2250 1400
Wire Wire Line
	2100 1400 2100 2450
Wire Wire Line
	2100 2450 2450 2450
Wire Wire Line
	2450 2450 2450 2650
Connection ~ 2100 1400
Wire Wire Line
	2250 1800 1900 1800
Text GLabel 1900 3700 0    60   Output ~ 0
220VAC_L
Text GLabel 1900 3350 0    60   Output ~ 0
220VAC_N
Wire Wire Line
	1900 3700 2550 3700
Wire Wire Line
	2550 3700 2550 3250
Wire Wire Line
	1900 3350 2000 3350
Wire Wire Line
	2000 3350 2000 1800
Connection ~ 2000 1800
$Comp
L SW_Push Switch
U 1 1 58CA6589
P 4350 3150
F 0 "Switch" H 4400 3250 50  0000 L CNN
F 1 "SW_Push" H 4350 3090 50  0001 C CNN
F 2 "" H 4350 3350 50  0000 C CNN
F 3 "" H 4350 3350 50  0000 C CNN
	1    4350 3150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58CA66D1
P 4750 3150
F 0 "R?" V 4830 3150 50  0001 C CNN
F 1 "10K" V 4750 3150 50  0000 C CNN
F 2 "" V 4680 3150 50  0000 C CNN
F 3 "" H 4750 3150 50  0000 C CNN
	1    4750 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 3150 4600 3150
Wire Wire Line
	4150 3150 4150 2900
Wire Wire Line
	4550 3150 4550 3900
Wire Wire Line
	4550 3900 4700 3900
Wire Wire Line
	4000 4300 4700 4300
Wire Wire Line
	4700 3800 4350 3800
$Comp
L LED D?
U 1 1 58CA6B7B
P 5800 5000
F 0 "D?" H 5800 5100 50  0001 C CNN
F 1 "LED" H 5800 4900 50  0000 C CNN
F 2 "" H 5800 5000 50  0000 C CNN
F 3 "" H 5800 5000 50  0000 C CNN
	1    5800 5000
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58CA6D13
P 5400 5000
F 0 "R?" V 5480 5000 50  0001 C CNN
F 1 "68" V 5400 5000 50  0000 C CNN
F 2 "" V 5330 5000 50  0000 C CNN
F 3 "" H 5400 5000 50  0000 C CNN
	1    5400 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	4700 4200 4550 4200
Wire Wire Line
	4550 4200 4550 5000
Wire Wire Line
	4550 5000 5250 5000
Wire Wire Line
	5550 5000 5650 5000
Wire Wire Line
	4050 3800 4000 3800
Connection ~ 4000 3800
Connection ~ 4150 2900
Wire Wire Line
	2950 2600 2950 2650
Wire Wire Line
	4700 4000 2950 4000
Wire Wire Line
	2950 4000 2950 3250
Wire Wire Line
	3600 2450 7000 2450
Wire Wire Line
	7000 2600 2950 2600
Connection ~ 7000 2600
Wire Wire Line
	7350 2900 4000 2900
Wire Wire Line
	4900 3150 7000 3150
Connection ~ 7000 3150
Wire Wire Line
	7000 5000 5950 5000
Wire Wire Line
	6900 4200 7000 4200
Connection ~ 7000 4200
Wire Wire Line
	6600 4200 6500 4200
Wire Wire Line
	6500 4300 7000 4300
Connection ~ 7000 4300
Wire Wire Line
	6200 1400 5850 1400
Wire Wire Line
	5850 1400 5850 1700
Connection ~ 5850 1400
Connection ~ 5100 1400
Connection ~ 6200 1400
$EndSCHEMATC
