#include <LPC214x.h>
#include "delay.h"
void init_ext_interrupt(void);
__irq void My_IRQ_ISR(void);
int main(void){
	IO1DIR |=(1<<25);
	init_ext_interrupt();
	while(1){
	init_ext_interrupt();}
}

void init_ext_interrupt(void){
	EXTINT =0; //clear all bits
	INTWAKE=(1<<2);//ENT2 will wake up the processor
	EXTMODE=(1<<2);//edge sensetive
	EXTPOLAR=(1<<2);//rising edge
	//Pin function (P0.15):	EINT2
	PINSEL0=0x80000000;
	//source number of EXINT=16
	//EINT2 is to assing to IRQ
	VICIntSelect=~(1<<16);
	//load the address of ISR
	VICVectAddr5= (unsigned int)My_IRQ_ISR;
	//channel 5 is enabled
	VICVectCntl5=(1<<5)|16;
	VICIntEnable=(1<<16);
}

__irq void My_IRQ_ISR(void){
IO1SET =(1<<25);
delay(200000);
IOCLR1 =(1<<25);
EXTINT |=(1<<2);//clear flag
VICVectAddr=0x00;//reset priority hardware
}