#include <Servo.h> 
 
Servo y_rotate_servo;
Servo z_rotate_servo;

//Negative looks down
//Positive looks up
int y_rotate_servo_pos = 60;

//Negative looks right
//Positive looks left
int z_rotate_servo_pos = 90;

byte command_motor, command_position;

 
 
void setup() 
{ 
  Serial.begin(9600);
  y_rotate_servo.attach(10); 
  z_rotate_servo.attach(11);
  y_rotate_servo.write(y_rotate_servo_pos);             
  z_rotate_servo.write(z_rotate_servo_pos);             
} 
 
 
void loop() 
{ 
  while(Serial.available() >= 2){
	command_motor = Serial.read();
	Serial.print(command_motor);
	command_position = Serial.read();
	Serial.print(command_position);
	if(command_motor == 0){
	   y_rotate_servo_pos = command_position;
	}
	if(command_motor == 1){
	   z_rotate_servo_pos = command_position;
	}
  }
  y_rotate_servo.write(y_rotate_servo_pos);
  z_rotate_servo.write(z_rotate_servo_pos);
   
} 
