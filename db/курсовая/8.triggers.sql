DELIMITER $$

CREATE TRIGGER StopDeleteBike
BEFORE DELETE ON bike
FOR EACH ROW
BEGIN
   SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
   SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END
$$

CREATE TRIGGER StopDeleteBikeHistory
BEFORE DELETE ON bike_history_item
FOR EACH ROW
BEGIN
   SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
   SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END
$$

CREATE TRIGGER StopUpdateBike
BEFORE UPDATE ON bike
FOR EACH ROW
BEGIN
   SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
   SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END
$$

CREATE TRIGGER StopUpdateBikeHistory
BEFORE UPDATE ON bike_history_item
FOR EACH ROW
BEGIN
   SIGNAL SQLSTATE '45000' -- "unhandled user-defined exception"
   SET MESSAGE_TEXT = 'This record is sacred! You are not allowed to remove it!!';
END
$$

DELIMITER ;