# fetch real time clock
mov $0x2C, %ah
int $0x21

# mangle time fields
mov %dl, %al

shl $4, %al
shr %dl
shl $2, %cl

xor %dl, %al
xor %cl, %al
xor %dh, %al

# return mangled time as error code
mov $0x4C, %ah
int $0x21
