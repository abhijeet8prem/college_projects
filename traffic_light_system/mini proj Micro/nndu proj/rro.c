#include<lpc214x.h>
#include"delay.h"
#define t1 8
#define t2 5
int main()
{
 int i,temp=t2,f,s,o,c=1;
	int state=1;
	PINSEL0=0x0;
	PINSEL1=0x0;
	PINSEL2=0x0;
 IODIR0=0x0FFFFFF;
 
 //c=IOPIN0>>25;
 	while(c)
	{
	//c=IOPIN0>>25;
	state=IOPIN1>>16&0x3;
	for(i=10;i>0;i--)
	{
	  f=i/10;
	  s=i%10;
	  o=(f<<4)+s;
	  //write different conditions
		if(state==0)
		{
		IOPIN0=o+(o<<8)+((((f+2)<<4)+s)<<16);
		 delay(200000);
		}
		else if(state==1)
		{
		IOPIN0=(((f+2)<<4)+s)+(o<<8)+(o<<16);
		 delay(200000);
		}
		else if(state==2)
		{
		IOPIN0=o+((((f+2)<<4)+s)<<8)+(o<<16);
		 delay(200000);
		}
		else if(state==3)
		{
			break;
		}
	}
	if(state==3)
	{
		for(i=t2;i>=0;i--)
		{
			f=i/10;
			s=i%10;
			o=(f<<4)+s;
			IOPIN0=o+((((f+2)<<4)+s)<<8)+(o<<16);
				temp--;
			 delay(200000);
		}
	}
	}
}