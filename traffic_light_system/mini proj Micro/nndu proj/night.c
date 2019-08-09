
void night(void)
{
	IOSET0=1<<1;
	IOSET0=1<<6;
	IOSET0=1<<11;
	IOSET0=1<<16;
	delay(4000);
	IOCLR0=1<<1;
	IOCLR0=1<<6;
	IOCLR0=1<<11;
	IOCLR0=1<<16;
	delay(4000);
}
