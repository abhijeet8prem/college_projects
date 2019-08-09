//#include <lpc214x.h>
void delay(unsigned int count)
{
		//T0TCR=0X02;
		//T0TCR=0X01;
		//while(T0TC<count) {}
		//T0TCR=0X00;
	while(count>0)
	{
		count--;
	}
		}