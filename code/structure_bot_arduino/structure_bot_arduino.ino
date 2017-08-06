#include <Servo.h> 
 
Servo y_rotate_servo;
Servo z_rotate_servo;

int toggle_motor_pin = 12;

unsigned long last_command_time = 0;

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

  pinMode(toggle_motor_pin, OUTPUT);
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

	last_command_time = millis();
  }
  if(millis() - last_command_time < 1500){
    digitalWrite(toggle_motor_pin, HIGH); 
  }else{
    digitalWrite(toggle_motor_pin, LOW); 
  }
  y_rotate_servo.write(y_rotate_servo_pos);
  z_rotate_servo.write(z_rotate_servo_pos);
   
} 
