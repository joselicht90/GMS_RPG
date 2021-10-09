//Player inputs
keyLeft = keyboard_check(vk_left) || gamepad_button_check(0,gp_padl) || gamepad_axis_value(0, gp_axislh) < -0.3;
keyRight = keyboard_check(vk_right) || gamepad_button_check(0,gp_padr) || gamepad_axis_value(0, gp_axislh) > 0.3;
keyUp = keyboard_check(vk_up) || gamepad_button_check(0,gp_padu) || gamepad_axis_value(0, gp_axislv) < -0.3;
keyDown = keyboard_check(vk_down) || gamepad_button_check(0,gp_padd) || gamepad_axis_value(0, gp_axislv) > 0.3;
keyActivate = keyboard_check_pressed(vk_space) || gamepad_button_check_pressed(0,gp_face1);
keyAttack = keyboard_check(ord("E")) || gamepad_button_check(0,gp_face3);
keyItem = keyboard_check(vk_control) || gamepad_button_check(0,gp_face4);

//this is to pass front and behind other objects
depth = -y;

//this is to calculate de distance of the vector between where the player is and were it want to be.
//its important for diagonal movement
inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

//execute de script of the current state in this frame
script_execute(state);








