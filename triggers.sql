-- Automatically mark room as occupied when booking is checked in
DELIMITER //
CREATE TRIGGER update_room_status_after_checkin
AFTER UPDATE ON bookings
FOR EACH ROW
BEGIN
    IF NEW.status = 'checked_in' THEN
        UPDATE rooms SET status='occupied' WHERE room_id = NEW.room_id;
    ELSEIF NEW.status = 'checked_out' THEN
        UPDATE rooms SET status='available' WHERE room_id = NEW.room_id;
    ELSEIF NEW.status = 'cancelled' THEN
        UPDATE rooms SET status='available' WHERE room_id = NEW.room_id;
    END IF;
END//
DELIMITER ;
