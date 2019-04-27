-- functions for getting user input

function get_input()
 input_x = 0
 input_y = 0
 input_xp = 0
 input_yp = 0

 if (btn(0)) input_x -= 1
 if (btn(1)) input_x += 1
 if (btn(2)) input_y -= 1
 if (btn(3)) input_y += 1

 if (btnp(0)) input_xp -= 1
 if (btnp(1)) input_xp += 1
 if (btnp(2)) input_yp -= 1
 if (btnp(3)) input_yp += 1

 if (input_x * input_y != 0) then
  input_x *= 0.707
  input_y *= 0.707
 end

 if (input_xp * input_yp != 0) then
  input_xp *= 0.707
  input_yp *= 0.707
 end
end