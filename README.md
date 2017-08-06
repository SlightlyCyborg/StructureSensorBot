# Structure Sensor motor mount.

The structure sensor motor mount is my attempt at improving an already interesting piece of technology. I wanted to integrate the structure sensor into a larger organism so that it may be used for purposes such as routine data collection or automated scanning.

## The hardware

- 2x Savox sc0251mg servos
- 1x Arduino uno
- 3d printed parts
- 1x TIP120 Darlington
- Single strand wires

The hardware is simple. There is an arduino board at the base of the bot. There is a single servo motor to rotate around the z axis and another servo to rotate around the y axis.

The motor mount requires a standard 6v power supply. I have supplied the power supply in the kit. This power supply is conected to the servos only. Plug the power supply into the silver jack on the back of the bot.

The motor mount requires that the arduino cable be hooked up to ones laptop. 

The structure sensor can be connected to the motor mount without screws, however, it is advisable to secure the sensor with either screws or hot glue.

The wiring is the most fragile part of the bot. I reccomend not opening the motor mount unless absolutely neccisary. For this reason, the bottom lid of the motor mount has been glued shut. 

If wiring does become disconnected, you may follow [this link](https://imgur.com/a/aAUPn) to view the circuit diagram

## The software

I have written several software modules which will be outlined here.

### Arduino Firmware

The Arduino firmware is the only software that runs on the actual bot. It consists of a simple loop that reads commands from the serial port. 

If you purchased a bot, the serial firmware has already been installed on the arduino board.

If you are building the bot yourself, please note that the firmware depends on a **modified** version of the Servo library. This library must replace the library that is already installed with the arduino package. This library can be found in `code/lib`. This code is required because the Savox servos do not use the standard servo pwm frequencies.

There are two lines that need to be edited in Servo.h. The MIN_PULSE_WIDTH should be changed to 699 and MAX_PULSE WIDTH should be changed to 2250

```
#define MIN_PULSE_WIDTH       699     // the shortest pulse sent to a servo  
#define MAX_PULSE_WIDTH      2250     // the longest pulse sent to a servo 

```

On linux replace `/usr/share/arduino/libraries/Servo/Servo.h`

On windows replace `C://Arduino/libraries/Servo/Servo.h`


The commands are sent as 2 bytes.

The first byte is the motor to move (0 for y axis, 1 for z axis).

The second byte is the position that motor should move to.

### Utils.StructureSensorBot

If you are on x64 Linux, then the binary is already precompiled.
Otherwise, you must compile the package yourself.

Dependencies for compiling yourself require:
- OpenCV with OpenNI2 support
- cmake
- Boost Libs


```
cd build
rm -rf *
cmake ..
make
makefifo mover_pipe
```

The utils package includes the following utilities

#### Mover.Utils.StrctureSensorBot

The mover is a command listening server. It is the most basic way to use the StructureSensorBot.


To use it:

```
cd build
./Mover.Utils.StructureSensorBot
```

If the arduino is not connected to `/dev/ttyACM0`, then you should specify the serial-port 

```
./Mover.Utils.StructureSensorBot -s /dev/<actual serial port>
```
The serial port can be found by opening up the arduino editor and clicking on `Tools->Serial Port` in the menu

Once the server has started, you may pass write cordinates into the mover_pipe as if it were a file. The command to write is `<z>,<y>\n`


```
printf "90,60\n" > mover_pipe 
```

Will move the bot to z position 90 and y position 60.

Please note that if you are writing a python script to write to the mover_pipe that you must call `flush` to get actually write to the buffer.

You could just call `printf` from a shell interface. Printf automatically flushes the output.

