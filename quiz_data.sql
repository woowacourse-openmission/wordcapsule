-- 퀴즈 데이터 삽입 스크립트
-- 사용자 ID 1을 관리자로 가정
-- 관리자 사용자 추가 (없을 경우)
INSERT IGNORE INTO users (id, login_id, password, username, role, level, created_at, updated_at)
VALUES (1, 'admin1', 'password1234', '관리자1', 'ADMIN', 'BEGINNER', NOW(), NOW());
INSERT IGNORE INTO users (id, login_id, password, username, role, level, created_at, updated_at)
VALUES (2, 'admin2', 'password1234', '관리자2', 'ADMIN', 'BEGINNER', NOW(), NOW());

-- 일반 사용자 추가
INSERT IGNORE INTO users (login_id, password, username, role, level, created_at, updated_at)
VALUES
('user01', 'password123', 'test1', 'USER', 'BEGINNER', NOW(), NOW()),
('user02', 'password123', 'test2', 'USER', 'INTERMEDIATE', NOW(), NOW()),
('user03', 'password123', 'test3', 'USER', 'ADVANCED', NOW(), NOW()),
('user04', 'password123', 'test4', 'USER', 'BEGINNER', NOW(), NOW()),
('user05', 'password123', 'test5', 'USER', 'INTERMEDIATE', NOW(), NOW());

-- 1. WORD_MEANING - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '초급 단어 뜻 맞추기', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, 'apple', 'WORD_MEANING'),
(@config_id, 'book', 'WORD_MEANING'),
(@config_id, 'water', 'WORD_MEANING'),
(@config_id, 'dog', 'WORD_MEANING'),
(@config_id, 'school', 'WORD_MEANING'),
(@config_id, 'friend', 'WORD_MEANING'),
(@config_id, 'happy', 'WORD_MEANING'),
(@config_id, 'chair', 'WORD_MEANING'),
(@config_id, 'coffee', 'WORD_MEANING'),
(@config_id, 'rain', 'WORD_MEANING');

-- apple 문제의 quiz_id 저장
SET @apple_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'apple');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- apple 문제 옵션들
(@apple_quiz_id, '사과', 1, true),
(@apple_quiz_id, '자동차', 2, false),
(@apple_quiz_id, '공항', 3, false),
(@apple_quiz_id, '나무', 4, false);

-- book 문제의 quiz_id 저장
SET @book_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'book');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- book 문제 옵션들
(@book_quiz_id, '강', 1, false),
(@book_quiz_id, '책', 2, true),
(@book_quiz_id, '구름', 3, false),
(@book_quiz_id, '신발', 4, false);

-- water 문제의 quiz_id 저장
SET @water_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'water');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- water 문제 옵션들
(@water_quiz_id, '물', 1, true),
(@water_quiz_id, '불', 2, false),
(@water_quiz_id, '바람', 3, false),
(@water_quiz_id, '돌', 4, false);

-- dog 문제의 quiz_id 저장
SET @dog_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'dog');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- dog 문제 옵션들
(@dog_quiz_id, '고양이', 1, false),
(@dog_quiz_id, '강아지', 2, true),
(@dog_quiz_id, '새', 3, false),
(@dog_quiz_id, '소', 4, false);

-- school 문제의 quiz_id 저장
SET @school_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'school');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- school 문제 옵션들
(@school_quiz_id, '은행', 1, false),
(@school_quiz_id, '병원', 2, false),
(@school_quiz_id, '학교', 3, true),
(@school_quiz_id, '시장', 4, false);

-- friend 문제의 quiz_id 저장
SET @friend_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'friend');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- friend 문제 옵션들
(@friend_quiz_id, '가족', 1, false),
(@friend_quiz_id, '친구', 2, true),
(@friend_quiz_id, '선생님', 3, false),
(@friend_quiz_id, '이웃', 4, false);

-- happy 문제의 quiz_id 저장
SET @happy_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'happy');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- happy 문제 옵션들
(@happy_quiz_id, '슬픈', 1, false),
(@happy_quiz_id, '화난', 2, false),
(@happy_quiz_id, '행복한', 3, true),
(@happy_quiz_id, '심심한', 4, false);

-- chair 문제의 quiz_id 저장
SET @chair_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'chair');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- chair 문제 옵션들
(@chair_quiz_id, '의자', 1, true),
(@chair_quiz_id, '침대', 2, false),
(@chair_quiz_id, '문', 3, false),
(@chair_quiz_id, '창문', 4, false);

-- coffee 문제의 quiz_id 저장
SET @coffee_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'coffee');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- coffee 문제 옵션들
(@coffee_quiz_id, '홍차', 1, false),
(@coffee_quiz_id, '우유', 2, false),
(@coffee_quiz_id, '주스', 3, false),
(@coffee_quiz_id, '커피', 4, true);

-- rain 문제의 quiz_id 저장
SET @rain_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'rain');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- rain 문제 옵션들
(@rain_quiz_id, '바다', 1, false),
(@rain_quiz_id, '비', 2, true),
(@rain_quiz_id, '산', 3, false),
(@rain_quiz_id, '눈', 4, false);

-- 2. WORD_MEANING - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '중급 단어 뜻 맞추기', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, 'benevolent', 'WORD_MEANING'),
(@config_id, 'candid', 'WORD_MEANING'),
(@config_id, 'fragile', 'WORD_MEANING'),
(@config_id, 'meticulous', 'WORD_MEANING'),
(@config_id, 'ambiguous', 'WORD_MEANING'),
(@config_id, 'elated', 'WORD_MEANING'),
(@config_id, 'arduous', 'WORD_MEANING'),
(@config_id, 'prudent', 'WORD_MEANING'),
(@config_id, 'ardent', 'WORD_MEANING'),
(@config_id, 'obsolete', 'WORD_MEANING');

-- benevolent 문제의 quiz_id 저장
SET @benevolent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'benevolent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- benevolent 문제 옵션들
(@benevolent_quiz_id, '자비로운', 1, true),
(@benevolent_quiz_id, '무관심한', 2, false),
(@benevolent_quiz_id, '잔인한', 3, false),
(@benevolent_quiz_id, '냉정한', 4, false);

-- candid 문제의 quiz_id 저장
SET @candid_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'candid');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- candid 문제 옵션들
(@candid_quiz_id, '솔직한', 1, true),
(@candid_quiz_id, '은밀한', 2, false),
(@candid_quiz_id, '거짓된', 3, false),
(@candid_quiz_id, '교활한', 4, false);

-- fragile 문제의 quiz_id 저장
SET @fragile_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'fragile');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- fragile 문제 옵션들
(@fragile_quiz_id, '취약한', 1, true),
(@fragile_quiz_id, '튼튼한', 2, false),
(@fragile_quiz_id, '빠른', 3, false),
(@fragile_quiz_id, '느린', 4, false);

-- meticulous 문제의 quiz_id 저장
SET @meticulous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'meticulous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- meticulous 문제 옵션들
(@meticulous_quiz_id, '꼼꼼한', 1, true),
(@meticulous_quiz_id, '성급한', 2, false),
(@meticulous_quiz_id, '게으른', 3, false),
(@meticulous_quiz_id, '무심한', 4, false);

-- ambiguous 문제의 quiz_id 저장
SET @ambiguous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'ambiguous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- ambiguous 문제 옵션들
(@ambiguous_quiz_id, '애매한', 1, true),
(@ambiguous_quiz_id, '분명한', 2, false),
(@ambiguous_quiz_id, '확실한', 3, false),
(@ambiguous_quiz_id, '명료한', 4, false);

-- elated 문제의 quiz_id 저장
SET @elated_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'elated');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- elated 문제 옵션들
(@elated_quiz_id, '의기양양한', 1, true),
(@elated_quiz_id, '슬픈', 2, false),
(@elated_quiz_id, '화난', 3, false),
(@elated_quiz_id, '지루한', 4, false);

-- arduous 문제의 quiz_id 저장
SET @arduous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'arduous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- arduous 문제 옵션들
(@arduous_quiz_id, '힘든', 1, true),
(@arduous_quiz_id, '쉬운', 2, false),
(@arduous_quiz_id, '빠른', 3, false),
(@arduous_quiz_id, '느린', 4, false);

-- prudent 문제의 quiz_id 저장
SET @prudent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'prudent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- prudent 문제 옵션들
(@prudent_quiz_id, '신중한', 1, true),
(@prudent_quiz_id, '무모한', 2, false),
(@prudent_quiz_id, '급한', 3, false),
(@prudent_quiz_id, '대담한', 4, false);

-- ardent 문제의 quiz_id 저장
SET @ardent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'ardent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- ardent 문제 옵션들
(@ardent_quiz_id, '열렬한', 1, true),
(@ardent_quiz_id, '차가운', 2, false),
(@ardent_quiz_id, '냉정한', 3, false),
(@ardent_quiz_id, '평온한', 4, false);

-- obsolete 문제의 quiz_id 저장
SET @obsolete_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'obsolete');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- obsolete 문제 옵션들
(@obsolete_quiz_id, '구식의', 1, true),
(@obsolete_quiz_id, '최신의', 2, false),
(@obsolete_quiz_id, '중요한', 3, false),
(@obsolete_quiz_id, '유용한', 4, false);

-- 3. WORD_MEANING - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '고급 단어 뜻 맞추기', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, 'obfuscate', 'WORD_MEANING'),
(@config_id, 'laconic', 'WORD_MEANING'),
(@config_id, 'ephemeral', 'WORD_MEANING'),
(@config_id, 'equivocate', 'WORD_MEANING'),
(@config_id, 'sagacious', 'WORD_MEANING'),
(@config_id, 'intransigent', 'WORD_MEANING'),
(@config_id, 'obstreperous', 'WORD_MEANING'),
(@config_id, 'pellucid', 'WORD_MEANING'),
(@config_id, 'recalcitrant', 'WORD_MEANING'),
(@config_id, 'temerity', 'WORD_MEANING');

-- obfuscate 문제의 quiz_id 저장
SET @obfuscate_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'obfuscate');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- obfuscate 문제 옵션들
(@obfuscate_quiz_id, '혼동시키다', 1, true),
(@obfuscate_quiz_id, '명확히 하다', 2, false),
(@obfuscate_quiz_id, '발전시키다', 3, false),
(@obfuscate_quiz_id, '정리하다', 4, false);

-- laconic 문제의 quiz_id 저장
SET @laconic_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'laconic');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- laconic 문제 옵션들
(@laconic_quiz_id, '간결한', 1, true),
(@laconic_quiz_id, '장황한', 2, false),
(@laconic_quiz_id, '시끄러운', 3, false),
(@laconic_quiz_id, '지루한', 4, false);

-- ephemeral 문제의 quiz_id 저장
SET @ephemeral_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'ephemeral');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- ephemeral 문제 옵션들
(@ephemeral_quiz_id, '순식간의', 1, true),
(@ephemeral_quiz_id, '영구적인', 2, false),
(@ephemeral_quiz_id, '지속적인', 3, false),
(@ephemeral_quiz_id, '느린', 4, false);

-- equivocate 문제의 quiz_id 저장
SET @equivocate_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'equivocate');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- equivocate 문제 옵션들
(@equivocate_quiz_id, '애매하게 말하다', 1, true),
(@equivocate_quiz_id, '분명히 말하다', 2, false),
(@equivocate_quiz_id, '고집하다', 3, false),
(@equivocate_quiz_id, '포기하다', 4, false);

-- sagacious 문제의 quiz_id 저장
SET @sagacious_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'sagacious');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- sagacious 문제 옵션들
(@sagacious_quiz_id, '현명한', 1, true),
(@sagacious_quiz_id, '어리석은', 2, false),
(@sagacious_quiz_id, '성급한', 3, false),
(@sagacious_quiz_id, '무모한', 4, false);

-- intransigent 문제의 quiz_id 저장
SET @intransigent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'intransigent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- intransigent 문제 옵션들
(@intransigent_quiz_id, '비타협적인', 1, true),
(@intransigent_quiz_id, '유연한', 2, false),
(@intransigent_quiz_id, '친절한', 3, false),
(@intransigent_quiz_id, '관대한', 4, false);

-- obstreperous 문제의 quiz_id 저장
SET @obstreperous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'obstreperous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- obstreperous 문제 옵션들
(@obstreperous_quiz_id, '시끄러운', 1, true),
(@obstreperous_quiz_id, '조용한', 2, false),
(@obstreperous_quiz_id, '순종적인', 3, false),
(@obstreperous_quiz_id, '친근한', 4, false);

-- pellucid 문제의 quiz_id 저장
SET @pellucid_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'pellucid');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- pellucid 문제 옵션들
(@pellucid_quiz_id, '명확한', 1, true),
(@pellucid_quiz_id, '흐린', 2, false),
(@pellucid_quiz_id, '혼란스러운', 3, false),
(@pellucid_quiz_id, '복잡한', 4, false);

-- recalcitrant 문제의 quiz_id 저장
SET @recalcitrant_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'recalcitrant');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- recalcitrant 문제 옵션들
(@recalcitrant_quiz_id, '반항적인', 1, true),
(@recalcitrant_quiz_id, '순종적인', 2, false),
(@recalcitrant_quiz_id, '협조적인', 3, false),
(@recalcitrant_quiz_id, '친화적인', 4, false);

-- temerity 문제의 quiz_id 저장
SET @temerity_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'temerity');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- temerity 문제 옵션들
(@temerity_quiz_id, '무모함', 1, true),
(@temerity_quiz_id, '신중함', 2, false),
(@temerity_quiz_id, '겸손함', 3, false),
(@temerity_quiz_id, '지혜', 4, false);

-- 4. FILL_BLANK - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '초급 문법 퀴즈', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, 'I ___ a student.', 'FILL_BLANK'),
(@config_id, 'She ___ to school every day.', 'FILL_BLANK'),
(@config_id, 'They ___ playing soccer.', 'FILL_BLANK'),
(@config_id, 'He ___ breakfast at 7 AM.', 'FILL_BLANK'),
(@config_id, 'We ___ English class now.', 'FILL_BLANK'),
(@config_id, 'The cat ___ sleeping.', 'FILL_BLANK'),
(@config_id, 'You ___ my best friend.', 'FILL_BLANK'),
(@config_id, 'It ___ raining outside.', 'FILL_BLANK'),
(@config_id, 'My mother ___ cooking dinner.', 'FILL_BLANK'),
(@config_id, 'The children ___ in the park.', 'FILL_BLANK');

-- I ___ a student. 문제의 quiz_id 저장
SET @student_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I ___ a student.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- I ___ a student. 문제 옵션들
(@student_quiz_id, 'am', 1, true),
(@student_quiz_id, 'is', 2, false),
(@student_quiz_id, 'are', 3, false),
(@student_quiz_id, 'be', 4, false);

-- She ___ to school every day. 문제의 quiz_id 저장
SET @goes_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'She ___ to school every day.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- She ___ to school every day. 문제 옵션들
(@goes_quiz_id, 'go', 1, false),
(@goes_quiz_id, 'goes', 2, true),
(@goes_quiz_id, 'going', 3, false),
(@goes_quiz_id, 'went', 4, false);

-- They ___ playing soccer. 문제의 quiz_id 저장
SET @playing_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'They ___ playing soccer.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- They ___ playing soccer. 문제 옵션들
(@playing_quiz_id, 'is', 1, false),
(@playing_quiz_id, 'am', 2, false),
(@playing_quiz_id, 'are', 3, true),
(@playing_quiz_id, 'be', 4, false);

-- He ___ breakfast at 7 AM. 문제의 quiz_id 저장
SET @breakfast_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'He ___ breakfast at 7 AM.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- He ___ breakfast at 7 AM. 문제 옵션들
(@breakfast_quiz_id, 'eat', 1, false),
(@breakfast_quiz_id, 'eats', 2, true),
(@breakfast_quiz_id, 'eating', 3, false),
(@breakfast_quiz_id, 'ate', 4, false);

-- We ___ English class now. 문제의 quiz_id 저장
SET @english_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'We ___ English class now.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- We ___ English class now. 문제 옵션들
(@english_quiz_id, 'have', 1, false),
(@english_quiz_id, 'has', 2, false),
(@english_quiz_id, 'having', 3, false),
(@english_quiz_id, 'are having', 4, true);

-- The cat ___ sleeping. 문제의 quiz_id 저장
SET @sleeping_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The cat ___ sleeping.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The cat ___ sleeping. 문제 옵션들
(@sleeping_quiz_id, 'am', 1, false),
(@sleeping_quiz_id, 'is', 2, true),
(@sleeping_quiz_id, 'are', 3, false),
(@sleeping_quiz_id, 'be', 4, false);

-- You ___ my best friend. 문제의 quiz_id 저장
SET @friend2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'You ___ my best friend.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- You ___ my best friend. 문제 옵션들
(@friend2_quiz_id, 'am', 1, false),
(@friend2_quiz_id, 'is', 2, false),
(@friend2_quiz_id, 'are', 3, true),
(@friend2_quiz_id, 'be', 4, false);

-- It ___ raining outside. 문제의 quiz_id 저장
SET @raining_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'It ___ raining outside.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- It ___ raining outside. 문제 옵션들
(@raining_quiz_id, 'am', 1, false),
(@raining_quiz_id, 'is', 2, true),
(@raining_quiz_id, 'are', 3, false),
(@raining_quiz_id, 'be', 4, false);

-- My mother ___ cooking dinner. 문제의 quiz_id 저장
SET @cooking_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'My mother ___ cooking dinner.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- My mother ___ cooking dinner. 문제 옵션들
(@cooking_quiz_id, 'am', 1, false),
(@cooking_quiz_id, 'is', 2, true),
(@cooking_quiz_id, 'are', 3, false),
(@cooking_quiz_id, 'be', 4, false);

-- The children ___ in the park. 문제의 quiz_id 저장
SET @park_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The children ___ in the park.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The children ___ in the park. 문제 옵션들
(@park_quiz_id, 'is', 1, false),
(@park_quiz_id, 'am', 2, false),
(@park_quiz_id, 'are', 3, true),
(@park_quiz_id, 'be', 4, false);

-- 5. FILL_BLANK - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '중급 문법 퀴즈', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, 'If I ___ rich, I would travel the world.', 'FILL_BLANK'),
(@config_id, 'She has been studying English ___ five years.', 'FILL_BLANK'),
(@config_id, 'The book ___ by many people is very popular.', 'FILL_BLANK'),
(@config_id, 'I wish I ___ speak French fluently.', 'FILL_BLANK'),
(@config_id, 'By next year, he ___ graduated from university.', 'FILL_BLANK'),
(@config_id, 'The meeting ___ postponed due to bad weather.', 'FILL_BLANK'),
(@config_id, '___ it was raining, we decided to go for a walk.', 'FILL_BLANK'),
(@config_id, 'She is ___ intelligent ___ her sister.', 'FILL_BLANK'),
(@config_id, 'I would rather ___ at home than go out tonight.', 'FILL_BLANK'),
(@config_id, 'The project ___ completed by the end of this week.', 'FILL_BLANK');

-- If I ___ rich, I would travel the world. 문제의 quiz_id 저장
SET @rich_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'If I ___ rich, I would travel the world.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- If I ___ rich, I would travel the world. 문제 옵션들
(@rich_quiz_id, 'am', 1, false),
(@rich_quiz_id, 'was', 2, false),
(@rich_quiz_id, 'were', 3, true),
(@rich_quiz_id, 'will be', 4, false);

-- She has been studying English ___ five years. 문제의 quiz_id 저장
SET @studying_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'She has been studying English ___ five years.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- She has been studying English ___ five years. 문제 옵션들
(@studying_quiz_id, 'since', 1, false),
(@studying_quiz_id, 'for', 2, true),
(@studying_quiz_id, 'during', 3, false),
(@studying_quiz_id, 'from', 4, false);

-- The book ___ by many people is very popular. 문제의 quiz_id 저장
SET @popular_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The book ___ by many people is very popular.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The book ___ by many people is very popular. 문제 옵션들
(@popular_quiz_id, 'read', 1, true),
(@popular_quiz_id, 'reading', 2, false),
(@popular_quiz_id, 'reads', 3, false),
(@popular_quiz_id, 'to read', 4, false);

-- I wish I ___ speak French fluently. 문제의 quiz_id 저장
SET @french_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I wish I ___ speak French fluently.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- I wish I ___ speak French fluently. 문제 옵션들
(@french_quiz_id, 'can', 1, false),
(@french_quiz_id, 'could', 2, true),
(@french_quiz_id, 'will', 3, false),
(@french_quiz_id, 'would', 4, false);

-- By next year, he ___ graduated from university. 문제의 quiz_id 저장
SET @graduated_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'By next year, he ___ graduated from university.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- By next year, he ___ graduated from university. 문제 옵션들
(@graduated_quiz_id, 'will have', 1, true),
(@graduated_quiz_id, 'will be', 2, false),
(@graduated_quiz_id, 'has', 3, false),
(@graduated_quiz_id, 'had', 4, false);

-- The meeting ___ postponed due to bad weather. 문제의 quiz_id 저장
SET @postponed_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The meeting ___ postponed due to bad weather.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The meeting ___ postponed due to bad weather. 문제 옵션들
(@postponed_quiz_id, 'is', 1, false),
(@postponed_quiz_id, 'was', 3, true),
(@postponed_quiz_id, 'has', 2, false),
(@postponed_quiz_id, 'had', 4, false);

-- ___ it was raining, we decided to go for a walk. 문제의 quiz_id 저장
SET @raining2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '___ it was raining, we decided to go for a walk.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- ___ it was raining, we decided to go for a walk. 문제 옵션들
(@raining2_quiz_id, 'Because', 1, false),
(@raining2_quiz_id, 'Since', 2, false),
(@raining2_quiz_id, 'Although', 3, true),
(@raining2_quiz_id, 'If', 4, false);

-- She is ___ intelligent ___ her sister. 문제의 quiz_id 저장
SET @intelligent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'She is ___ intelligent ___ her sister.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- She is ___ intelligent ___ her sister. 문제 옵션들
(@intelligent_quiz_id, 'more... than', 1, false),
(@intelligent_quiz_id, 'as... as', 2, true),
(@intelligent_quiz_id, 'so... as', 3, false),
(@intelligent_quiz_id, 'much... than', 4, false);

-- I would rather ___ at home than go out tonight. 문제의 quiz_id 저장
SET @rather_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I would rather ___ at home than go out tonight.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- I would rather ___ at home than go out tonight. 문제 옵션들
(@rather_quiz_id, 'stay', 1, true),
(@rather_quiz_id, 'to stay', 2, false),
(@rather_quiz_id, 'staying', 3, false),
(@rather_quiz_id, 'stayed', 4, false);

-- The project ___ completed by the end of this week. 문제의 quiz_id 저장
SET @completed_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The project ___ completed by the end of this week.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The project ___ completed by the end of this week. 문제 옵션들
(@completed_quiz_id, 'will be', 1, true),
(@completed_quiz_id, 'is', 2, false),
(@completed_quiz_id, 'was', 3, false),
(@completed_quiz_id, 'has been', 4, false);

-- 6. FILL_BLANK - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '고급 문법 퀴즈', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, 'Had I known about the traffic, I ___ earlier.', 'FILL_BLANK'),
(@config_id, 'The professor demanded that each student ___ present.', 'FILL_BLANK'),
(@config_id, 'Scarcely ___ the door when the phone rang.', 'FILL_BLANK'),
(@config_id, 'It is imperative that the report ___ submitted on time.', 'FILL_BLANK'),
(@config_id, 'Not until the rain stopped ___ continue our journey.', 'FILL_BLANK'),
(@config_id, 'The committee suggested that the proposal ___ revised.', 'FILL_BLANK'),
(@config_id, '___ for your help, I would have failed the exam.', 'FILL_BLANK'),
(@config_id, 'So complicated ___ the instructions that nobody understood them.', 'FILL_BLANK'),
(@config_id, 'The lawyer insisted that his client ___ innocent.', 'FILL_BLANK'),
(@config_id, 'Little ___ that this decision would change everything.', 'FILL_BLANK');

-- Had I known about the traffic, I ___ earlier. 문제의 quiz_id 저장
SET @traffic_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Had I known about the traffic, I ___ earlier.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- Had I known about the traffic, I ___ earlier. 문제 옵션들
(@traffic_quiz_id, 'would leave', 1, false),
(@traffic_quiz_id, 'would have left', 2, true),
(@traffic_quiz_id, 'will leave', 3, false),
(@traffic_quiz_id, 'left', 4, false);

-- The professor demanded that each student ___ present. 문제의 quiz_id 저장
SET @present_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The professor demanded that each student ___ present.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The professor demanded that each student ___ present. 문제 옵션들
(@present_quiz_id, 'is', 1, false),
(@present_quiz_id, 'be', 2, true),
(@present_quiz_id, 'was', 3, false),
(@present_quiz_id, 'were', 4, false);

-- Scarcely ___ the door when the phone rang. 문제의 quiz_id 저장
SET @scarcely_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Scarcely ___ the door when the phone rang.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- Scarcely ___ the door when the phone rang. 문제 옵션들
(@scarcely_quiz_id, 'I had opened', 1, false),
(@scarcely_quiz_id, 'had I opened', 2, true),
(@scarcely_quiz_id, 'I opened', 3, false),
(@scarcely_quiz_id, 'did I open', 4, false);

-- It is imperative that the report ___ submitted on time. 문제의 quiz_id 저장
SET @imperative_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'It is imperative that the report ___ submitted on time.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- It is imperative that the report ___ submitted on time. 문제 옵션들
(@imperative_quiz_id, 'is', 1, false),
(@imperative_quiz_id, 'be', 2, true),
(@imperative_quiz_id, 'was', 3, false),
(@imperative_quiz_id, 'will be', 4, false);

-- Not until the rain stopped ___ continue our journey. 문제의 quiz_id 저장
SET @journey_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Not until the rain stopped ___ continue our journey.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- Not until the rain stopped ___ continue our journey. 문제 옵션들
(@journey_quiz_id, 'we could', 1, false),
(@journey_quiz_id, 'could we', 2, true),
(@journey_quiz_id, 'we can', 3, false),
(@journey_quiz_id, 'can we', 4, false);

-- The committee suggested that the proposal ___ revised. 문제의 quiz_id 저장
SET @proposal_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The committee suggested that the proposal ___ revised.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The committee suggested that the proposal ___ revised. 문제 옵션들
(@proposal_quiz_id, 'is', 1, false),
(@proposal_quiz_id, 'be', 2, true),
(@proposal_quiz_id, 'was', 3, false),
(@proposal_quiz_id, 'would be', 4, false);

-- ___ for your help, I would have failed the exam. 문제의 quiz_id 저장
SET @help_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '___ for your help, I would have failed the exam.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- ___ for your help, I would have failed the exam. 문제 옵션들
(@help_quiz_id, 'If not', 1, false),
(@help_quiz_id, 'Were it not', 2, false),
(@help_quiz_id, 'Had it not been', 3, true),
(@help_quiz_id, 'Unless', 4, false);

-- So complicated ___ the instructions that nobody understood them. 문제의 quiz_id 저장
SET @complicated_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'So complicated ___ the instructions that nobody understood them.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- So complicated ___ the instructions that nobody understood them. 문제 옵션들
(@complicated_quiz_id, 'was', 1, false),
(@complicated_quiz_id, 'were', 2, true),
(@complicated_quiz_id, 'are', 3, false),
(@complicated_quiz_id, 'is', 4, false);

-- The lawyer insisted that his client ___ innocent. 문제의 quiz_id 저장
SET @innocent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The lawyer insisted that his client ___ innocent.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- The lawyer insisted that his client ___ innocent. 문제 옵션들
(@innocent_quiz_id, 'is', 1, false),
(@innocent_quiz_id, 'was', 2, true),
(@innocent_quiz_id, 'be', 3, false),
(@innocent_quiz_id, 'were', 4, false);

-- Little ___ that this decision would change everything. 문제의 quiz_id 저장
SET @decision_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Little ___ that this decision would change everything.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- Little ___ that this decision would change everything. 문제 옵션들
(@decision_quiz_id, 'we knew', 1, false),
(@decision_quiz_id, 'did we know', 2, true),
(@decision_quiz_id, 'we know', 3, false),
(@decision_quiz_id, 'do we know', 4, false);

-- 7. SENTENCE_ORDER - BEGINNER (자기소개 & 일상)
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '초급 문장 순서 - 자기소개', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, '나의 이름은 John입니다', 'SENTENCE_ORDER'),
(@config_id, '나는 매일 학교에 갑니다', 'SENTENCE_ORDER'),
(@config_id, '우리는 서울에 살고 있습니다', 'SENTENCE_ORDER'),
(@config_id, '당신은 매우 행복합니다', 'SENTENCE_ORDER');

-- 나의 이름은 John입니다 문제의 quiz_id 저장
SET @name_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '나의 이름은 John입니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 나의 이름은 John입니다 문제 옵션들
(@name_quiz_id, 'name', 2, true),
(@name_quiz_id, 'John', 4, true),
(@name_quiz_id, 'is', 3, true),
(@name_quiz_id, 'My', 1, true);

-- 나는 매일 학교에 갑니다 문제의 quiz_id 저장
SET @school_order_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '나는 매일 학교에 갑니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 나는 매일 학교에 갑니다 문제 옵션들
(@school_order_quiz_id, 'school', 4, true),
(@school_order_quiz_id, 'every', 5, true),
(@school_order_quiz_id, 'I', 1, true),
(@school_order_quiz_id, 'to', 3, true),
(@school_order_quiz_id, 'day', 6, true),
(@school_order_quiz_id, 'go', 2, true);

-- 우리는 서울에 살고 있습니다 문제의 quiz_id 저장
SET @seoul_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '우리는 서울에 살고 있습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 우리는 서울에 살고 있습니다 문제 옵션들
(@seoul_quiz_id, 'Seoul', 4, true),
(@seoul_quiz_id, 'We', 1, true),
(@seoul_quiz_id, 'in', 3, true),
(@seoul_quiz_id, 'live', 2, true);

-- 당신은 매우 행복합니다 문제의 quiz_id 저장
SET @happy_order_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '당신은 매우 행복합니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 당신은 매우 행복합니다 문제 옵션들
(@happy_order_quiz_id, 'You', 1, true),
(@happy_order_quiz_id, 'are', 2, true),
(@happy_order_quiz_id, 'happy', 4, true),
(@happy_order_quiz_id, 'very', 3, true);

-- 8. SENTENCE_ORDER - INTERMEDIATE (완료형 & 진행형)
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '중급 문장 순서 - 시제', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
(@config_id, '나는 5년 동안 영어를 공부해왔습니다', 'SENTENCE_ORDER'),
(@config_id, '그는 이미 그 영화를 봤습니다', 'SENTENCE_ORDER'),
(@config_id, '우리는 제주 여행을 계획하고 있습니다', 'SENTENCE_ORDER'),
(@config_id, '그녀는 저녁 전에 숙제를 끝낼 것입니다', 'SENTENCE_ORDER');

-- 나는 5년 동안 영어를 공부해왔습니다 문제의 quiz_id 저장
SET @studying_eng_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '나는 5년 동안 영어를 공부해왔습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 나는 5년 동안 영어를 공부해왔습니다 문제 옵션들
(@studying_eng_quiz_id, 'I', 1, true),
(@studying_eng_quiz_id, 'have', 2, true),
(@studying_eng_quiz_id, 'years', 8, true),
(@studying_eng_quiz_id, 'English', 5, true),
(@studying_eng_quiz_id, 'studying', 4, true),
(@studying_eng_quiz_id, 'been', 3, true),
(@studying_eng_quiz_id, 'for', 6, true),
(@studying_eng_quiz_id, 'five', 7, true);

-- 그녀는 저녁 전에 숙제를 끝낼 것입니다 문제의 quiz_id 저장
SET @homework_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '그녀는 저녁 전에 숙제를 끝낼 것입니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 그녀는 저녁 전에 숙제를 끝낼 것입니다 문제 옵션들
(@homework_quiz_id, 'finish', 3, true),
(@homework_quiz_id, 'will', 2, true),
(@homework_quiz_id, 'her', 4, true),
(@homework_quiz_id, 'dinner', 7, true),
(@homework_quiz_id, 'She', 1, true),
(@homework_quiz_id, 'before', 6, true),
(@homework_quiz_id, 'homework', 5, true);

-- 그는 이미 그 영화를 봤습니다 문제의 quiz_id 저장
SET @movie_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '그는 이미 그 영화를 봤습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 그는 이미 그 영화를 봤습니다 문제 옵션들
(@movie_quiz_id, 'already', 3, true),
(@movie_quiz_id, 'has', 2, true),
(@movie_quiz_id, 'movie', 6, true),
(@movie_quiz_id, 'He', 1, true),
(@movie_quiz_id, 'seen', 4, true),
(@movie_quiz_id, 'the', 5, true);

-- 우리는 제주 여행을 계획하고 있습니다 문제의 quiz_id 저장
SET @jeju_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '우리는 제주 여행을 계획하고 있습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 우리는 제주 여행을 계획하고 있습니다 문제 옵션들
(@jeju_quiz_id, 'planning', 3, true),
(@jeju_quiz_id, 'a', 4, true),
(@jeju_quiz_id, 'trip', 5, true),
(@jeju_quiz_id, 'are', 2, true),
(@jeju_quiz_id, 'to', 6, true),
(@jeju_quiz_id, 'We', 1, true),
(@jeju_quiz_id, 'Jeju', 7, true);

-- 9. SENTENCE_ORDER - INTERMEDIATE (조동사 & 수동태)
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '중급 문장 순서 - 조동사', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
                                                        (@config_id, '당신은 항상 다른 사람들에게 친절해야 합니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '그 회의는 비 때문에 취소되었습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '그녀는 세 가지 언어를 유창하게 말할 수 있습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '우리는 금요일까지 이 프로젝트를 완료해야 합니다', 'SENTENCE_ORDER');

-- 당신은 항상 다른 사람들에게 친절해야 합니다 문제의 quiz_id 저장
SET @kind_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '당신은 항상 다른 사람들에게 친절해야 합니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 당신은 항상 다른 사람들에게 친절해야 합니다 문제 옵션들
(@kind_quiz_id, 'to', 6, true),
(@kind_quiz_id, 'You', 1, true),
(@kind_quiz_id, 'should', 2, true),
(@kind_quiz_id, 'always', 3, true),
(@kind_quiz_id, 'others', 7, true),
(@kind_quiz_id, 'be', 4, true),
(@kind_quiz_id, 'kind', 5, true);

-- 그 회의는 비 때문에 취소되었습니다 문제의 quiz_id 저장
SET @meeting_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '그 회의는 비 때문에 취소되었습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 그 회의는 비 때문에 취소되었습니다 문제 옵션들
(@meeting_quiz_id, 'the', 7, true),
(@meeting_quiz_id, 'meeting', 2, true),
(@meeting_quiz_id, 'of', 6, true),
(@meeting_quiz_id, 'The', 1, true),
(@meeting_quiz_id, 'because', 5, true),
(@meeting_quiz_id, 'rain', 8, true),
(@meeting_quiz_id, 'canceled', 4, true),
(@meeting_quiz_id, 'was', 3, true);

-- 그녀는 세 가지 언어를 유창하게 말할 수 있습니다 문제의 quiz_id 저장
SET @languages_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '그녀는 세 가지 언어를 유창하게 말할 수 있습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 그녀는 세 가지 언어를 유창하게 말할 수 있습니다 문제 옵션들
(@languages_quiz_id, 'speak', 3, true),
(@languages_quiz_id, 'languages', 5, true),
(@languages_quiz_id, 'can', 2, true),
(@languages_quiz_id, 'She', 1, true),
(@languages_quiz_id, 'fluently', 6, true),
(@languages_quiz_id, 'three', 4, true);

-- 우리는 금요일까지 이 프로젝트를 완료해야 합니다 문제의 quiz_id 저장
SET @project_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '우리는 금요일까지 이 프로젝트를 완료해야 합니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 우리는 금요일까지 이 프로젝트를 완료해야 합니다 문제 옵션들
(@project_quiz_id, 'complete', 3, true),
(@project_quiz_id, 'this', 4, true),
(@project_quiz_id, 'We', 1, true),
(@project_quiz_id, 'Friday', 7, true),
(@project_quiz_id, 'must', 2, true),
(@project_quiz_id, 'by', 6, true),
(@project_quiz_id, 'project', 5, true);

-- 10. SENTENCE_ORDER - ADVANCED (가정법 & 복잡한 구문)
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at)
VALUES (1, '고급 문장 순서 - 가정법', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type) VALUES
                                                        (@config_id, '내가 그 교통 상황을 알았더라면, 더 일찍 출발했을 것입니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '그녀의 부지런한 노력에도 불구하고, 프로젝트는 예상치 못한 상황으로 완료되지 못했습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '과학자의 혁신적인 연구 접근법은 획기적인 발견으로 이어졌습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '회의에서 그의 거친 행동은 많은 잠재적 지지자들을 소외시켰습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '소설의 복잡한 서사 구조는 가장 경험 많은 독자들조차 도전하게 만들었습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, 'CEO의 국제적 확장에 대한 대담한 결정은 선구적인 것으로 증명되었습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '예술가의 작품은 인간 심리에 대한 깊은 이해를 보여줍니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '조약은 국제 외교 관계에서 패러다임의 전환을 나타냈습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '시장 동향에 대한 그녀의 포괄적인 분석은 이사회 전체를 감동시켰습니다', 'SENTENCE_ORDER'),
                                                        (@config_id, '철학자의 미묘한 논증은 신중한 고려와 깊은 사고를 요구했습니다', 'SENTENCE_ORDER');

-- 내가 그 교통 상황을 알았더라면, 더 일찍 출발했을 것입니다 문제의 quiz_id 저장
SET @traffic_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '내가 그 교통 상황을 알았더라면, 더 일찍 출발했을 것입니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 내가 그 교통 상황을 알았더라면, 더 일찍 출발했을 것입니다 문제 옵션들
(@traffic_adv_quiz_id, 'traffic', 6, true),
(@traffic_adv_quiz_id, 'have', 9, true),
(@traffic_adv_quiz_id, 'I', 7, true),
(@traffic_adv_quiz_id, 'known', 3, true),
(@traffic_adv_quiz_id, 'left', 10, true),
(@traffic_adv_quiz_id, 'Had', 1, true),
(@traffic_adv_quiz_id, 'would', 8, true),
(@traffic_adv_quiz_id, 'about', 4, true),
(@traffic_adv_quiz_id, 'I', 2, true),
(@traffic_adv_quiz_id, 'earlier', 11, true),
(@traffic_adv_quiz_id, 'the', 5, true);

-- 그녀의 부지런한 노력에도 불구하고, 프로젝트는 예상치 못한 상황으로 완료되지 못했습니다 문제의 quiz_id 저장
SET @efforts_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '그녀의 부지런한 노력에도 불구하고, 프로젝트는 예상치 못한 상황으로 완료되지 못했습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 그녀의 부지런한 노력에도 불구하고, 프로젝트는 예상치 못한 상황으로 완료되지 못했습니다 문제 옵션들
(@efforts_adv_quiz_id, 'her', 2, true),
(@efforts_adv_quiz_id, 'due', 9, true),
(@efforts_adv_quiz_id, 'diligent', 3, true),
(@efforts_adv_quiz_id, 'circumstances', 12, true),
(@efforts_adv_quiz_id, 'Despite', 1, true),
(@efforts_adv_quiz_id, 'remained', 7, true),
(@efforts_adv_quiz_id, 'the', 5, true),
(@efforts_adv_quiz_id, 'project', 6, true),
(@efforts_adv_quiz_id, 'efforts', 4, true),
(@efforts_adv_quiz_id, 'to', 10, true),
(@efforts_adv_quiz_id, 'incomplete', 8, true),
(@efforts_adv_quiz_id, 'unforeseen', 11, true);

-- 과학자의 혁신적인 연구 접근법은 획기적인 발견으로 이어졌습니다 문제의 quiz_id 저장
SET @scientist_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '과학자의 혁신적인 연구 접근법은 획기적인 발견으로 이어졌습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 과학자의 혁신적인 연구 접근법은 획기적인 발견으로 이어졌습니다 문제 옵션들
(@scientist_adv_quiz_id, 'innovative', 3, true),
(@scientist_adv_quiz_id, 'discoveries', 10, true),
(@scientist_adv_quiz_id, 'The', 1, true),
(@scientist_adv_quiz_id, 'to', 5, true),
(@scientist_adv_quiz_id, 'led', 7, true),
(@scientist_adv_quiz_id, 'research', 6, true),
(@scientist_adv_quiz_id, 'to', 8, true),
(@scientist_adv_quiz_id, 'approach', 4, true),
(@scientist_adv_quiz_id, 'scientist', 2, true),
(@scientist_adv_quiz_id, 'groundbreaking', 9, true);

-- 회의에서 그의 거친 행동은 많은 잠재적 지지자들을 소외시켰습니다 문제의 quiz_id 저장
SET @behavior_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '회의에서 그의 거친 행동은 많은 잠재적 지지자들을 소외시켰습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 회의에서 그의 거친 행동은 많은 잠재적 지지자들을 소외시켰습니다 문제 옵션들
(@behavior_adv_quiz_id, 'potential', 9, true),
(@behavior_adv_quiz_id, 'at', 4, true),
(@behavior_adv_quiz_id, 'His', 1, true),
(@behavior_adv_quiz_id, 'meeting', 6, true),
(@behavior_adv_quiz_id, 'abrasive', 2, true),
(@behavior_adv_quiz_id, 'many', 8, true),
(@behavior_adv_quiz_id, 'the', 5, true),
(@behavior_adv_quiz_id, 'supporters', 10, true),
(@behavior_adv_quiz_id, 'alienated', 7, true),
(@behavior_adv_quiz_id, 'behavior', 3, true);

-- 소설의 복잡한 서사 구조는 가장 경험 많은 독자들조차 도전하게 만들었습니다 문제의 quiz_id 저장
SET @narrative_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '소설의 복잡한 서사 구조는 가장 경험 많은 독자들조차 도전하게 만들었습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 소설의 복잡한 서사 구조는 가장 경험 많은 독자들조차 도전하게 만들었습니다 문제 옵션들
(@narrative_adv_quiz_id, 'most', 9, true),
(@narrative_adv_quiz_id, 'experienced', 10, true),
(@narrative_adv_quiz_id, 'intricate', 3, true),
(@narrative_adv_quiz_id, 'narrative', 4, true),
(@narrative_adv_quiz_id, 'challenged', 6, true),
(@narrative_adv_quiz_id, 'readers', 11, true),
(@narrative_adv_quiz_id, 'The', 1, true),
(@narrative_adv_quiz_id, 'even', 7, true),
(@narrative_adv_quiz_id, 'novel', 2, true),
(@narrative_adv_quiz_id, 'structure', 5, true),
(@narrative_adv_quiz_id, 'the', 8, true);

-- CEO의 국제적 확장에 대한 대담한 결정은 선구적인 것으로 증명되었습니다 문제의 quiz_id 저장
SET @ceo_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'CEO의 국제적 확장에 대한 대담한 결정은 선구적인 것으로 증명되었습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- CEO의 국제적 확장에 대한 대담한 결정은 선구적인 것으로 증명되었습니다 문제 옵션들
(@ceo_adv_quiz_id, 'to', 5, true),
(@ceo_adv_quiz_id, 'decision', 4, true),
(@ceo_adv_quiz_id, 'internationally', 7, true),
(@ceo_adv_quiz_id, 'The', 1, true),
(@ceo_adv_quiz_id, 'visionary', 11, true),
(@ceo_adv_quiz_id, 'proved', 8, true),
(@ceo_adv_quiz_id, 'audacious', 3, true),
(@ceo_adv_quiz_id, 'expand', 6, true),
(@ceo_adv_quiz_id, 'be', 10, true),
(@ceo_adv_quiz_id, 'to', 9, true),
(@ceo_adv_quiz_id, 'CEO', 2, true);

-- 예술가의 작품은 인간 심리에 대한 깊은 이해를 보여줍니다 문제의 quiz_id 저장
SET @psychology_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '예술가의 작품은 인간 심리에 대한 깊은 이해를 보여줍니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 예술가의 작품은 인간 심리에 대한 깊은 이해를 보여줍니다 문제 옵션들
(@psychology_adv_quiz_id, 'artist', 2, true),
(@psychology_adv_quiz_id, 'profound', 6, true),
(@psychology_adv_quiz_id, 'The', 1, true),
(@psychology_adv_quiz_id, 'human', 9, true),
(@psychology_adv_quiz_id, 'demonstrates', 4, true),
(@psychology_adv_quiz_id, 'work', 3, true),
(@psychology_adv_quiz_id, 'psychology', 10, true),
(@psychology_adv_quiz_id, 'a', 5, true),
(@psychology_adv_quiz_id, 'of', 8, true),
(@psychology_adv_quiz_id, 'understanding', 7, true);

-- 조약은 국제 외교 관계에서 패러다임의 전환을 나타냈습니다 문제의 quiz_id 저장
SET @treaty_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '조약은 국제 외교 관계에서 패러다임의 전환을 나타냈습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 조약은 국제 외교 관계에서 패러다임의 전환을 나타냈습니다 문제 옵션들
(@treaty_adv_quiz_id, 'treaty', 2, true),
(@treaty_adv_quiz_id, 'represented', 3, true),
(@treaty_adv_quiz_id, 'relations', 10, true),
(@treaty_adv_quiz_id, 'a', 4, true),
(@treaty_adv_quiz_id, 'The', 1, true),
(@treaty_adv_quiz_id, 'shift', 6, true),
(@treaty_adv_quiz_id, 'diplomatic', 9, true),
(@treaty_adv_quiz_id, 'paradigmatic', 5, true),
(@treaty_adv_quiz_id, 'in', 7, true),
(@treaty_adv_quiz_id, 'international', 8, true);

-- 시장 동향에 대한 그녀의 포괄적인 분석은 이사회 전체를 감동시켰습니다 문제의 quiz_id 저장
SET @analysis_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '시장 동향에 대한 그녀의 포괄적인 분석은 이사회 전체를 감동시켰습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 시장 동향에 대한 그녀의 포괄적인 분석은 이사회 전체를 감동시켰습니다 문제 옵션들
(@analysis_adv_quiz_id, 'of', 4, true),
(@analysis_adv_quiz_id, 'board', 11, true),
(@analysis_adv_quiz_id, 'analysis', 3, true),
(@analysis_adv_quiz_id, 'directors', 13, true),
(@analysis_adv_quiz_id, 'trends', 7, true),
(@analysis_adv_quiz_id, 'market', 6, true),
(@analysis_adv_quiz_id, 'the', 9, true),
(@analysis_adv_quiz_id, 'of', 12, true),
(@analysis_adv_quiz_id, 'entire', 10, true),
(@analysis_adv_quiz_id, 'Her', 1, true),
(@analysis_adv_quiz_id, 'the', 5, true),
(@analysis_adv_quiz_id, 'impressed', 8, true),
(@analysis_adv_quiz_id, 'comprehensive', 2, true);

-- 철학자의 미묘한 논증은 신중한 고려와 깊은 사고를 요구했습니다 문제의 quiz_id 저장
SET @philosopher_adv_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '철학자의 미묘한 논증은 신중한 고려와 깊은 사고를 요구했습니다');

INSERT INTO quiz_options (quiz_id, content, position, is_correct) VALUES
-- 철학자의 미묘한 논증은 신중한 고려와 깊은 사고를 요구했습니다 문제 옵션들
(@philosopher_adv_quiz_id, 'arguments', 4, true),
(@philosopher_adv_quiz_id, 'required', 5, true),
(@philosopher_adv_quiz_id, 'consideration', 7, true),
(@philosopher_adv_quiz_id, 'and', 8, true),
(@philosopher_adv_quiz_id, 'deep', 9, true),
(@philosopher_adv_quiz_id, 'The', 1, true),
(@philosopher_adv_quiz_id, 'careful', 6, true),
(@philosopher_adv_quiz_id, 'nuanced', 3, true),
(@philosopher_adv_quiz_id, 'thought', 10, true),
(@philosopher_adv_quiz_id, 'philosopher', 2, true);