#include <lpc214x.h>
#include "delay.h"
#define t1 8
#define t2 2
#define t3 3
int main()
{
	int b=0;
PINSEL0=0x0;
PINSEL1=0x0;
IODIR0=0xFFFFFF;
	while(1)
{
	//1st set
	IOCLR0=1<<21;
	IOCLR0=1<<22;
  IOPIN0=(0xE2529);
	delay(t1*200000);
	IOPIN0=0x52529;
	delay(t2*200000);
	delay(200000);
	
	//2nd set
	//IOSET0=1<<21;
	IOPIN0=(0x4F129)+(1<<21);
	delay(t1*200000);
	IOPIN0=(0x4A929)+(1<<21);
	delay(t2*200000);
	delay(200000);
	
	//3rd set
	//IOCLR0=1<<21;
	//IOSET0=1<<22;
  IOPIN0=0x4A789+(1<<22);
	delay(t1*200000);
	IOPIN0=0x4A549+(1<<22);
	delay(t2*200000);
	delay(200000);
	
	//4th set
	b=IOPIN0&0x800000;
	if(b==0x800000)
	{
		//IOSET0=1<<21;
		//IOSET0=1<<22;
	
	IOPIN0=0x4A53C+(3<<21);
	delay(t3*200000);
	IOPIN0=0x4A52A+(3<<21);
	delay(t2*200000);
	delay(200000);
	
	}
}
}

