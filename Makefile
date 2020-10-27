KERN_DIR = /home/code/rk3399_kernel
CROSS_COMPILE = aarch64-linux-gnu-
MODULE_NAME = led_basic
$(MODULE_NAME)-y := leddrv.o board_rk3399.o
obj-m += $(MODULE_NAME).o

all:
	make CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERN_DIR) M=`pwd` modules
	$(CROSS_COMPILE)gcc -o led_test led_test.c

clean:
	make CROSS_COMPILE=$(CROSS_COMPILE) -C $(KERN_DIR) M=`pwd` modules clean
	rm -rf modules.order
	rm -f led_test

install:
