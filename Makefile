# builds the kprobes example kernel modules;
# then to use one (as root):  insmod <module_name.ko>

obj-m += kprobe_example.o

KVERSION = $(shell uname -r)
all:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules
	@rm -rf *.o Module* module* *.mod.* .tmp_versions .*.cmd
clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean
