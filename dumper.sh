#!/bin/bash
# sizes (from file system of files from [some] downloaded firmware) and addresses (from [some] flash readme):
# 28080 Sep 18 21:34 eagle.flash.bin
# 241896 Sep 18 21:34 eagle.irom0text.bin
# 4096 Aug 7 19:56 blank.bin
# 128 Sep 18 20:18 esp_init_data_default.bin

# eagle.flash.bin	0x00000
# eagle.irom0text.bin 0x40000
# blank.bin 0x7e000 & 0xfe000
# esp_init_data_default.bin	0xfc000

echo starting backup part 1 of 5...
~/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip auto --port /dev/cu.usbmodem5D11 --baud 115200 read_flash 0x00000 28080 eagle.flash_backup.bin
echo backup of part 1 of 5 finished
read -p "please reset board again into flash mode...[Enter] when done."

echo starting backup part 2 of 5...
~/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip auto --port /dev/cu.usbmodem5D11 --baud 115200 read_flash 0x40000 241896 eagle.irom0text_backup.bin
echo backup of part 2 of 5 finished
read -p "please reset board again into flash mode...[Enter] when done."

# not necessary just to be complete
echo starting backup part 3 of 5...
~/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip auto --port /dev/cu.usbmodem5D11 --baud 115200 read_flash 0x7e000 4096 blank_backup.bin
echo backup of part 3 of 5 finished
read -p "please reset board again into flash mode...[Enter] when done."

# not necessary just to be complete
echo starting backup part 4 of 5...
~/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip auto --port /dev/cu.usbmodem5D11 --baud 115200 read_flash 0xfe000 4096 blank_backup.bin
echo backup of part 4 of 5 finished
read -p "please reset board again into flash mode...[Enter] when done."

# not necessary just to be complete
echo starting last part of backup...
~/esp/esp-idf/components/esptool_py/esptool/esptool.py --chip auto --port /dev/cu.usbmodem5D11 --baud 115200 read_flash 0xfc000 128 esp_init_data_default_backup.bin
Echo backup completed!
