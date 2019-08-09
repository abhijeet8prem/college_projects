#include <lpc214x.h>
void InitTimer0(void)
{
		T0CTCR=0X00;
		T0PR=59999;
}