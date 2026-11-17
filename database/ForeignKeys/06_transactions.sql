--Связывает финансовые операции с пользователями и бронированиями. booking_id может быть пустым, например, при пополнении баланса.
ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_users
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE RESTRICT;

ALTER TABLE transactions
ADD CONSTRAINT fk_transactions_bookings
FOREIGN KEY (booking_id)
REFERENCES bookings(id)
ON DELETE RESTRICT;