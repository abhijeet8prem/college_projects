#include <lpc214x.h>
#include "delay.h"
#include "InitPLL0.h"
#include "InitTimer0.h"
int main()
{
	int b=0;
	PINSEL0=0x0;

	IODIR0=0x0FFF;
	InitPLL0();
	InitTimer0();
		while(1)
		{
			//1st set
			IOPIN0=0x849;
			delay(1000000);
			IOPIN0=0x449;
			delay(200000);
			
			//2nd set
			IOPIN0=0x309;
			delay(1000000);
			IOPIN0=0x289;
			delay(200000);
			
			//3rd set
			IOPIN0=0x261;
			delay(1000000);
			IOPIN0=0x251;
			delay(200000);
			
			//4th set
			b=IOPIN0&0x1000;
			if(b==0x1000)
			{
			IOPIN0=0x24C;
			delay(1000000);
			IOPIN0=0x24A;
			delay(200000);
			}
		}
}

