move_timer = 0;

// helper function to move in the X direction and check success
function move_and_check_x(direction) {
    return obj_move_manager.move_object(self, direction, 0);
}

// helper function to move in the Y direction and check success
function move_and_check_y(direction) {
    return obj_move_manager.move_object(self, 0, direction);
}
