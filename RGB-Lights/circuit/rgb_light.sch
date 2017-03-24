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
LIBS:rgb_light-cache
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
L ESP-12E U?
U 1 1 586BAAAF
P 4100 2150
F 0 "U?" H 4100 2050 50  0001 C CNN
F 1 "ESP-12E" H 4100 2250 50  0000 C CNN
F 2 "" H 4100 2150 50  0001 C CNN
F 3 "" H 4100 2150 50  0001 C CNN
	1    4100 2150
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 58CA7BE2
P 2900 2050
F 0 "R?" V 2980 2050 50  0001 C CNN
F 1 "10K" V 2900 2050 50  0000 C CNN
F 2 "" V 2830 2050 50  0000 C CNN
F 3 "" H 2900 2050 50  0000 C CNN
	1    2900 2050
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58CA7C27
P 5150 2450
F 0 "R?" V 5230 2450 50  0001 C CNN
F 1 "10K" V 5150 2450 50  0000 C CNN
F 2 "" V 5080 2450 50  0000 C CNN
F 3 "" H 5150 2450 50  0000 C CNN
	1    5150 2450
	0    1    1    0   
$EndComp
$Comp
L AP7333 U?
U 1 1 58CA7D15
P 2200 1900
F 0 "U?" H 2000 2100 60  0001 C CNN
F 1 "HT7333" H 2003 2077 60  0000 L TNN
F 2 "" H 2200 1900 60  0000 C CNN
F 3 "" H 2200 1900 60  0000 C CNN
	1    2200 1900
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 58CA7D52
P 2550 2050
F 0 "C?" H 2575 2150 50  0001 L CNN
F 1 "10uF" V 2575 1950 50  0000 R TNN
F 2 "" H 2550 2050 50  0000 C CNN
F 3 "" H 2550 2050 50  0000 C CNN
	1    2550 2050
	1    0    0    -1  
$EndComp
$Comp
L CP1 C?
U 1 1 58CA7F4D
P 1850 2050
F 0 "C?" H 1875 2150 50  0001 L CNN
F 1 "10uF" V 1875 1950 50  0000 R TNN
F 2 "" H 1850 2050 50  0000 C CNN
F 3 "" H 1850 2050 50  0000 C CNN
	1    1850 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1900 1850 1900
Wire Wire Line
	1850 2200 1850 2450
Wire Wire Line
	1550 2450 2550 2450
Wire Wire Line
	2200 2450 2200 2300
Connection ~ 2200 2450
$Comp
L GND #PWR?
U 1 1 58CA81C7
P 1550 2450
F 0 "#PWR?" H 1550 2200 50  0001 C CNN
F 1 "GND" H 1550 2300 50  0000 C CNN
F 2 "" H 1550 2450 50  0000 C CNN
F 3 "" H 1550 2450 50  0000 C CNN
	1    1550 2450
	1    0    0    -1  
$EndComp
Connection ~ 1850 2450
Wire Wire Line
	2750 2550 3200 2550
Wire Wire Line
	2750 1900 2750 2550
Wire Wire Line
	2750 1900 2550 1900
Wire Wire Line
	3050 2050 3200 2050
Connection ~ 2750 2050
Wire Wire Line
	5300 2550 5000 2550
Connection ~ 2550 2450
Connection ~ 5300 2550
Wire Wire Line
	2550 2450 2550 2200
$Comp
L GND #PWR?
U 1 1 58CA8283
P 5300 2900
F 0 "#PWR?" H 5300 2650 50  0001 C CNN
F 1 "GND" H 5300 2750 50  0000 C CNN
F 2 "" H 5300 2900 50  0000 C CNN
F 3 "" H 5300 2900 50  0000 C CNN
	1    5300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 2450 5300 2900
$Comp
L +12V #PWR?
U 1 1 58CA8660
P 1550 1900
F 0 "#PWR?" H 1550 1750 50  0001 C CNN
F 1 "+12V" H 1550 2040 50  0000 C CNN
F 2 "" H 1550 1900 50  0000 C CNN
F 3 "" H 1550 1900 50  0000 C CNN
	1    1550 1900
	1    0    0    -1  
$EndComp
$Comp
L Q_NPN_BCE Q?
U 1 1 58CA87BC
P 2700 900
F 0 "Q?" H 2900 950 50  0001 L CNN
F 1 "NPN" V 2900 850 50  0000 L CNN
F 2 "" H 2900 1000 50  0000 C CNN
F 3 "" H 2700 900 50  0000 C CNN
	1    2700 900 
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58CA8841
P 2950 800
F 0 "#PWR?" H 2950 550 50  0001 C CNN
F 1 "GND" H 2950 650 50  0000 C CNN
F 2 "" H 2950 800 50  0000 C CNN
F 3 "" H 2950 800 50  0000 C CNN
	1    2950 800 
	-1   0    0    -1  
$EndComp
$Comp
L LED_ARGB D?
U 1 1 58CA89A8
P 2100 1150
F 0 "D?" H 2100 1520 50  0001 C CNN
F 1 "12V_LED_RGB" H 2100 800 50  0000 C CNN
F 2 "" H 2100 1100 50  0000 C CNN
F 3 "" H 2100 1100 50  0000 C CNN
	1    2100 1150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1750 1900 1750 1150
Wire Wire Line
	1750 1150 1900 1150
Connection ~ 1750 1900
$Comp
L Q_NPN_BCE Q?
U 1 1 58CA8AD6
P 3550 1250
F 0 "Q?" H 3750 1300 50  0001 L CNN
F 1 "NPN" V 3750 1200 50  0000 L CNN
F 2 "" H 3750 1350 50  0000 C CNN
F 3 "" H 3550 1250 50  0000 C CNN
	1    3550 1250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58CA8ADC
P 3800 1150
F 0 "#PWR?" H 3800 900 50  0001 C CNN
F 1 "GND" H 3800 1000 50  0000 C CNN
F 2 "" H 3800 1150 50  0000 C CNN
F 3 "" H 3800 1150 50  0000 C CNN
	1    3800 1150
	-1   0    0    -1  
$EndComp
$Comp
L Q_NPN_BCE Q?
U 1 1 58CA8B23
P 2500 1450
F 0 "Q?" H 2700 1500 50  0001 L CNN
F 1 "NPN" V 2700 1400 50  0000 L CNN
F 2 "" H 2700 1550 50  0000 C CNN
F 3 "" H 2500 1450 50  0000 C CNN
	1    2500 1450
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 58CA8B29
P 2750 1350
F 0 "#PWR?" H 2750 1100 50  0001 C CNN
F 1 "GND" H 2750 1200 50  0000 C CNN
F 2 "" H 2750 1350 50  0000 C CNN
F 3 "" H 2750 1350 50  0000 C CNN
	1    2750 1350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3050 1650 3050 2250
Wire Wire Line
	3050 2250 3200 2250
Wire Wire Line
	2700 1100 2700 1250
Wire Wire Line
	3100 1250 3100 2350
Wire Wire Line
	3100 2350 3200 2350
Wire Wire Line
	3150 2450 3200 2450
Wire Wire Line
	3150 1450 3150 2450
Wire Wire Line
	3350 1150 2300 1150
Wire Wire Line
	2500 800  2400 800 
Wire Wire Line
	2400 800  2400 950 
Wire Wire Line
	2400 950  2300 950 
$Comp
L R R?
U 1 1 58CA8D1F
P 2950 1250
F 0 "R?" V 3030 1250 50  0001 C CNN
F 1 "2K" V 2950 1250 50  0000 C CNN
F 2 "" V 2880 1250 50  0000 C CNN
F 3 "" H 2950 1250 50  0000 C CNN
	1    2950 1250
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58CA8D36
P 2900 1650
F 0 "R?" V 2980 1650 50  0001 C CNN
F 1 "2K" V 2900 1650 50  0000 C CNN
F 2 "" V 2830 1650 50  0000 C CNN
F 3 "" H 2900 1650 50  0000 C CNN
	1    2900 1650
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 58CA8D41
P 3400 1450
F 0 "R?" V 3480 1450 50  0001 C CNN
F 1 "2K" V 3400 1450 50  0000 C CNN
F 2 "" V 3330 1450 50  0000 C CNN
F 3 "" H 3400 1450 50  0000 C CNN
	1    3400 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 1450 3250 1450
Wire Wire Line
	2700 1250 2800 1250
Wire Wire Line
	2700 1350 2750 1350
Wire Wire Line
	2900 800  2950 800 
Wire Wire Line
	3750 1150 3800 1150
Wire Wire Line
	2500 1650 2750 1650
$EndSCHEMATC
