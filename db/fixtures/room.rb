Room.seed do |s|
	s.id = 1
    s.student_id = 1
    s.teacher_id = 2
    s.send_user_id = 1
    s.receiver_user_id = 2
end

Room.seed do |s|
	s.id = 2
    s.student_id = 2
    s.teacher_id = 1
    s.send_user_id = 2
    s.receiver_user_id = 1
end

Room.seed do |s|
	s.id = 3
    s.student_id = 1
    s.teacher_id = 3
    s.send_user_id = 1
    s.receiver_user_id = 3
end

Room.seed do |s|
	s.id = 4
    s.student_id = 1
    s.teacher_id = 4
    s.send_user_id = 4
    s.receiver_user_id = 1
end

Room.seed do |s|
	s.id = 5
    s.student_id = 1
    s.teacher_id = 3
    s.send_user_id = 1
    s.receiver_user_id = 3
end

