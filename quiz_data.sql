-- 퀴즈 데이터 삽입 스크립트
-- 사용자 ID 1을 관리자로 가정

-- 관리자 사용자 추가 (없을 경우)
INSERT IGNORE INTO users (id, login_id, password, username, role, level, created_at, updated_at) 
VALUES (1, 'admin', 'password123', '관리자', 'ADMIN', 'BEGINNER', NOW(), NOW());

-- 1. WORD_MEANING - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '초급 단어 뜻 맞추기', 'BEGINNER', 'WORD_MEANING', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'apple', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'book', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'water', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'dog', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'school', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'friend', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'happy', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'chair', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'coffee', 'WORD_MEANING', 'BEGINNER', NOW(), NOW()),
(@config_id, 'rain', 'WORD_MEANING', 'BEGINNER', NOW(), NOW());

-- apple 문제의 quiz_id 저장
SET @apple_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'apple');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- apple 문제 옵션들
(@apple_quiz_id, '사과', 1, true, NOW(), NOW()),
(@apple_quiz_id, '자동차', 2, false, NOW(), NOW()),
(@apple_quiz_id, '공항', 3, false, NOW(), NOW()),
(@apple_quiz_id, '나무', 4, false, NOW(), NOW());

-- book 문제의 quiz_id 저장
SET @book_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'book');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- book 문제 옵션들
(@book_quiz_id, '강', 1, false, NOW(), NOW()),
(@book_quiz_id, '책', 2, true, NOW(), NOW()),
(@book_quiz_id, '구름', 3, false, NOW(), NOW()),
(@book_quiz_id, '신발', 4, false, NOW(), NOW());

-- water 문제의 quiz_id 저장
SET @water_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'water');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- water 문제 옵션들
(@water_quiz_id, '물', 1, true, NOW(), NOW()),
(@water_quiz_id, '불', 2, false, NOW(), NOW()),
(@water_quiz_id, '바람', 3, false, NOW(), NOW()),
(@water_quiz_id, '돌', 4, false, NOW(), NOW());

-- dog 문제의 quiz_id 저장
SET @dog_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'dog');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- dog 문제 옵션들
(@dog_quiz_id, '고양이', 1, false, NOW(), NOW()),
(@dog_quiz_id, '강아지', 2, true, NOW(), NOW()),
(@dog_quiz_id, '새', 3, false, NOW(), NOW()),
(@dog_quiz_id, '소', 4, false, NOW(), NOW());

-- school 문제의 quiz_id 저장
SET @school_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'school');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- school 문제 옵션들
(@school_quiz_id, '은행', 1, false, NOW(), NOW()),
(@school_quiz_id, '병원', 2, false, NOW(), NOW()),
(@school_quiz_id, '학교', 3, true, NOW(), NOW()),
(@school_quiz_id, '시장', 4, false, NOW(), NOW());

-- friend 문제의 quiz_id 저장
SET @friend_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'friend');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- friend 문제 옵션들
(@friend_quiz_id, '가족', 1, false, NOW(), NOW()),
(@friend_quiz_id, '친구', 2, true, NOW(), NOW()),
(@friend_quiz_id, '선생님', 3, false, NOW(), NOW()),
(@friend_quiz_id, '이웃', 4, false, NOW(), NOW());

-- happy 문제의 quiz_id 저장
SET @happy_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'happy');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- happy 문제 옵션들
(@happy_quiz_id, '슬픈', 1, false, NOW(), NOW()),
(@happy_quiz_id, '화난', 2, false, NOW(), NOW()),
(@happy_quiz_id, '행복한', 3, true, NOW(), NOW()),
(@happy_quiz_id, '심심한', 4, false, NOW(), NOW());

-- chair 문제의 quiz_id 저장
SET @chair_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'chair');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- chair 문제 옵션들
(@chair_quiz_id, '의자', 1, true, NOW(), NOW()),
(@chair_quiz_id, '침대', 2, false, NOW(), NOW()),
(@chair_quiz_id, '문', 3, false, NOW(), NOW()),
(@chair_quiz_id, '창문', 4, false, NOW(), NOW());

-- coffee 문제의 quiz_id 저장
SET @coffee_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'coffee');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- coffee 문제 옵션들
(@coffee_quiz_id, '홍차', 1, false, NOW(), NOW()),
(@coffee_quiz_id, '우유', 2, false, NOW(), NOW()),
(@coffee_quiz_id, '주스', 3, false, NOW(), NOW()),
(@coffee_quiz_id, '커피', 4, true, NOW(), NOW());

-- rain 문제의 quiz_id 저장
SET @rain_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'rain');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- rain 문제 옵션들
(@rain_quiz_id, '바다', 1, false, NOW(), NOW()),
(@rain_quiz_id, '비', 2, true, NOW(), NOW()),
(@rain_quiz_id, '산', 3, false, NOW(), NOW()),
(@rain_quiz_id, '눈', 4, false, NOW(), NOW());

-- 2. WORD_MEANING - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '중급 단어 뜻 맞추기', 'INTERMEDIATE', 'WORD_MEANING', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'benevolent', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'candid', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'fragile', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'meticulous', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'ambiguous', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'elated', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'arduous', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'prudent', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'ardent', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'obsolete', 'WORD_MEANING', 'INTERMEDIATE', NOW(), NOW());

-- benevolent 문제의 quiz_id 저장
SET @benevolent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'benevolent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- benevolent 문제 옵션들
(@benevolent_quiz_id, '자비로운', 1, true, NOW(), NOW()),
(@benevolent_quiz_id, '무관심한', 2, false, NOW(), NOW()),
(@benevolent_quiz_id, '잔인한', 3, false, NOW(), NOW()),
(@benevolent_quiz_id, '냉정한', 4, false, NOW(), NOW());

-- candid 문제의 quiz_id 저장
SET @candid_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'candid');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- candid 문제 옵션들
(@candid_quiz_id, '솔직한', 1, true, NOW(), NOW()),
(@candid_quiz_id, '은밀한', 2, false, NOW(), NOW()),
(@candid_quiz_id, '거짓된', 3, false, NOW(), NOW()),
(@candid_quiz_id, '교활한', 4, false, NOW(), NOW());

-- fragile 문제의 quiz_id 저장
SET @fragile_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'fragile');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- fragile 문제 옵션들
(@fragile_quiz_id, '취약한', 1, true, NOW(), NOW()),
(@fragile_quiz_id, '튼튼한', 2, false, NOW(), NOW()),
(@fragile_quiz_id, '빠른', 3, false, NOW(), NOW()),
(@fragile_quiz_id, '느린', 4, false, NOW(), NOW());

-- meticulous 문제의 quiz_id 저장
SET @meticulous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'meticulous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- meticulous 문제 옵션들
(@meticulous_quiz_id, '꼼꼼한', 1, true, NOW(), NOW()),
(@meticulous_quiz_id, '성급한', 2, false, NOW(), NOW()),
(@meticulous_quiz_id, '게으른', 3, false, NOW(), NOW()),
(@meticulous_quiz_id, '무심한', 4, false, NOW(), NOW());

-- ambiguous 문제의 quiz_id 저장
SET @ambiguous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'ambiguous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- ambiguous 문제 옵션들
(@ambiguous_quiz_id, '애매한', 1, true, NOW(), NOW()),
(@ambiguous_quiz_id, '분명한', 2, false, NOW(), NOW()),
(@ambiguous_quiz_id, '확실한', 3, false, NOW(), NOW()),
(@ambiguous_quiz_id, '명료한', 4, false, NOW(), NOW());

-- elated 문제의 quiz_id 저장
SET @elated_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'elated');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- elated 문제 옵션들
(@elated_quiz_id, '의기양양한', 1, true, NOW(), NOW()),
(@elated_quiz_id, '슬픈', 2, false, NOW(), NOW()),
(@elated_quiz_id, '화난', 3, false, NOW(), NOW()),
(@elated_quiz_id, '지루한', 4, false, NOW(), NOW());

-- arduous 문제의 quiz_id 저장
SET @arduous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'arduous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- arduous 문제 옵션들
(@arduous_quiz_id, '힘든', 1, true, NOW(), NOW()),
(@arduous_quiz_id, '쉬운', 2, false, NOW(), NOW()),
(@arduous_quiz_id, '빠른', 3, false, NOW(), NOW()),
(@arduous_quiz_id, '느린', 4, false, NOW(), NOW());

-- prudent 문제의 quiz_id 저장
SET @prudent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'prudent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- prudent 문제 옵션들
(@prudent_quiz_id, '신중한', 1, true, NOW(), NOW()),
(@prudent_quiz_id, '무모한', 2, false, NOW(), NOW()),
(@prudent_quiz_id, '급한', 3, false, NOW(), NOW()),
(@prudent_quiz_id, '대담한', 4, false, NOW(), NOW());

-- ardent 문제의 quiz_id 저장
SET @ardent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'ardent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- ardent 문제 옵션들
(@ardent_quiz_id, '열렬한', 1, true, NOW(), NOW()),
(@ardent_quiz_id, '차가운', 2, false, NOW(), NOW()),
(@ardent_quiz_id, '냉정한', 3, false, NOW(), NOW()),
(@ardent_quiz_id, '평온한', 4, false, NOW(), NOW());

-- obsolete 문제의 quiz_id 저장
SET @obsolete_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'obsolete');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- obsolete 문제 옵션들
(@obsolete_quiz_id, '구식의', 1, true, NOW(), NOW()),
(@obsolete_quiz_id, '최신의', 2, false, NOW(), NOW()),
(@obsolete_quiz_id, '중요한', 3, false, NOW(), NOW()),
(@obsolete_quiz_id, '유용한', 4, false, NOW(), NOW());

-- 3. WORD_MEANING - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '고급 단어 뜻 맞추기', 'ADVANCED', 'WORD_MEANING', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'obfuscate', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'laconic', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'ephemeral', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'equivocate', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'sagacious', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'intransigent', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'obstreperous', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'pellucid', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'recalcitrant', 'WORD_MEANING', 'ADVANCED', NOW(), NOW()),
(@config_id, 'temerity', 'WORD_MEANING', 'ADVANCED', NOW(), NOW());

-- obfuscate 문제의 quiz_id 저장
SET @obfuscate_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'obfuscate');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- obfuscate 문제 옵션들
(@obfuscate_quiz_id, '혼동시키다', 1, true, NOW(), NOW()),
(@obfuscate_quiz_id, '명확히 하다', 2, false, NOW(), NOW()),
(@obfuscate_quiz_id, '발전시키다', 3, false, NOW(), NOW()),
(@obfuscate_quiz_id, '정리하다', 4, false, NOW(), NOW());

-- laconic 문제의 quiz_id 저장
SET @laconic_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'laconic');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- laconic 문제 옵션들
(@laconic_quiz_id, '간결한', 1, true, NOW(), NOW()),
(@laconic_quiz_id, '장황한', 2, false, NOW(), NOW()),
(@laconic_quiz_id, '시끄러운', 3, false, NOW(), NOW()),
(@laconic_quiz_id, '지루한', 4, false, NOW(), NOW());

-- ephemeral 문제의 quiz_id 저장
SET @ephemeral_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'ephemeral');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- ephemeral 문제 옵션들
(@ephemeral_quiz_id, '순식간의', 1, true, NOW(), NOW()),
(@ephemeral_quiz_id, '영구적인', 2, false, NOW(), NOW()),
(@ephemeral_quiz_id, '지속적인', 3, false, NOW(), NOW()),
(@ephemeral_quiz_id, '느린', 4, false, NOW(), NOW());

-- equivocate 문제의 quiz_id 저장
SET @equivocate_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'equivocate');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- equivocate 문제 옵션들
(@equivocate_quiz_id, '애매하게 말하다', 1, true, NOW(), NOW()),
(@equivocate_quiz_id, '분명히 말하다', 2, false, NOW(), NOW()),
(@equivocate_quiz_id, '고집하다', 3, false, NOW(), NOW()),
(@equivocate_quiz_id, '포기하다', 4, false, NOW(), NOW());

-- sagacious 문제의 quiz_id 저장
SET @sagacious_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'sagacious');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- sagacious 문제 옵션들
(@sagacious_quiz_id, '현명한', 1, true, NOW(), NOW()),
(@sagacious_quiz_id, '어리석은', 2, false, NOW(), NOW()),
(@sagacious_quiz_id, '성급한', 3, false, NOW(), NOW()),
(@sagacious_quiz_id, '무모한', 4, false, NOW(), NOW());

-- intransigent 문제의 quiz_id 저장
SET @intransigent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'intransigent');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- intransigent 문제 옵션들
(@intransigent_quiz_id, '비타협적인', 1, true, NOW(), NOW()),
(@intransigent_quiz_id, '유연한', 2, false, NOW(), NOW()),
(@intransigent_quiz_id, '친절한', 3, false, NOW(), NOW()),
(@intransigent_quiz_id, '관대한', 4, false, NOW(), NOW());

-- obstreperous 문제의 quiz_id 저장
SET @obstreperous_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'obstreperous');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- obstreperous 문제 옵션들
(@obstreperous_quiz_id, '시끄러운', 1, true, NOW(), NOW()),
(@obstreperous_quiz_id, '조용한', 2, false, NOW(), NOW()),
(@obstreperous_quiz_id, '순종적인', 3, false, NOW(), NOW()),
(@obstreperous_quiz_id, '친근한', 4, false, NOW(), NOW());

-- pellucid 문제의 quiz_id 저장
SET @pellucid_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'pellucid');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- pellucid 문제 옵션들
(@pellucid_quiz_id, '명확한', 1, true, NOW(), NOW()),
(@pellucid_quiz_id, '흐린', 2, false, NOW(), NOW()),
(@pellucid_quiz_id, '혼란스러운', 3, false, NOW(), NOW()),
(@pellucid_quiz_id, '복잡한', 4, false, NOW(), NOW());

-- recalcitrant 문제의 quiz_id 저장
SET @recalcitrant_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'recalcitrant');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- recalcitrant 문제 옵션들
(@recalcitrant_quiz_id, '반항적인', 1, true, NOW(), NOW()),
(@recalcitrant_quiz_id, '순종적인', 2, false, NOW(), NOW()),
(@recalcitrant_quiz_id, '협조적인', 3, false, NOW(), NOW()),
(@recalcitrant_quiz_id, '친화적인', 4, false, NOW(), NOW());

-- temerity 문제의 quiz_id 저장
SET @temerity_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'temerity');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- temerity 문제 옵션들
(@temerity_quiz_id, '무모함', 1, true, NOW(), NOW()),
(@temerity_quiz_id, '신중함', 2, false, NOW(), NOW()),
(@temerity_quiz_id, '겸손함', 3, false, NOW(), NOW()),
(@temerity_quiz_id, '지혜', 4, false, NOW(), NOW());

-- 4. FILL_BLANK - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '초급 문법 퀴즈', 'BEGINNER', 'FILL_BLANK', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'I ___ a student.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'She ___ to school every day.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'They ___ playing soccer.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'He ___ breakfast at 7 AM.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'We ___ English class now.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'The cat ___ sleeping.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'You ___ my best friend.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'It ___ raining outside.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'My mother ___ cooking dinner.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW()),
(@config_id, 'The children ___ in the park.', 'FILL_BLANK', 'BEGINNER', NOW(), NOW());

-- I ___ a student. 문제의 quiz_id 저장
SET @student_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I ___ a student.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I ___ a student. 문제 옵션들
(@student_quiz_id, 'am', 1, true, NOW(), NOW()),
(@student_quiz_id, 'is', 2, false, NOW(), NOW()),
(@student_quiz_id, 'are', 3, false, NOW(), NOW()),
(@student_quiz_id, 'be', 4, false, NOW(), NOW());

-- She ___ to school every day. 문제의 quiz_id 저장
SET @goes_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'She ___ to school every day.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- She ___ to school every day. 문제 옵션들
(@goes_quiz_id, 'go', 1, false, NOW(), NOW()),
(@goes_quiz_id, 'goes', 2, true, NOW(), NOW()),
(@goes_quiz_id, 'going', 3, false, NOW(), NOW()),
(@goes_quiz_id, 'went', 4, false, NOW(), NOW());

-- They ___ playing soccer. 문제의 quiz_id 저장
SET @playing_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'They ___ playing soccer.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- They ___ playing soccer. 문제 옵션들
(@playing_quiz_id, 'is', 1, false, NOW(), NOW()),
(@playing_quiz_id, 'am', 2, false, NOW(), NOW()),
(@playing_quiz_id, 'are', 3, true, NOW(), NOW()),
(@playing_quiz_id, 'be', 4, false, NOW(), NOW());

-- He ___ breakfast at 7 AM. 문제의 quiz_id 저장
SET @breakfast_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'He ___ breakfast at 7 AM.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- He ___ breakfast at 7 AM. 문제 옵션들
(@breakfast_quiz_id, 'eat', 1, false, NOW(), NOW()),
(@breakfast_quiz_id, 'eats', 2, true, NOW(), NOW()),
(@breakfast_quiz_id, 'eating', 3, false, NOW(), NOW()),
(@breakfast_quiz_id, 'ate', 4, false, NOW(), NOW());

-- We ___ English class now. 문제의 quiz_id 저장
SET @english_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'We ___ English class now.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- We ___ English class now. 문제 옵션들
(@english_quiz_id, 'have', 1, false, NOW(), NOW()),
(@english_quiz_id, 'has', 2, false, NOW(), NOW()),
(@english_quiz_id, 'having', 3, false, NOW(), NOW()),
(@english_quiz_id, 'are having', 4, true, NOW(), NOW());

-- The cat ___ sleeping. 문제의 quiz_id 저장
SET @sleeping_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The cat ___ sleeping.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The cat ___ sleeping. 문제 옵션들
(@sleeping_quiz_id, 'am', 1, false, NOW(), NOW()),
(@sleeping_quiz_id, 'is', 2, true, NOW(), NOW()),
(@sleeping_quiz_id, 'are', 3, false, NOW(), NOW()),
(@sleeping_quiz_id, 'be', 4, false, NOW(), NOW());

-- You ___ my best friend. 문제의 quiz_id 저장
SET @friend2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'You ___ my best friend.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- You ___ my best friend. 문제 옵션들
(@friend2_quiz_id, 'am', 1, false, NOW(), NOW()),
(@friend2_quiz_id, 'is', 2, false, NOW(), NOW()),
(@friend2_quiz_id, 'are', 3, true, NOW(), NOW()),
(@friend2_quiz_id, 'be', 4, false, NOW(), NOW());

-- It ___ raining outside. 문제의 quiz_id 저장
SET @raining_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'It ___ raining outside.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- It ___ raining outside. 문제 옵션들
(@raining_quiz_id, 'am', 1, false, NOW(), NOW()),
(@raining_quiz_id, 'is', 2, true, NOW(), NOW()),
(@raining_quiz_id, 'are', 3, false, NOW(), NOW()),
(@raining_quiz_id, 'be', 4, false, NOW(), NOW());

-- My mother ___ cooking dinner. 문제의 quiz_id 저장
SET @cooking_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'My mother ___ cooking dinner.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- My mother ___ cooking dinner. 문제 옵션들
(@cooking_quiz_id, 'am', 1, false, NOW(), NOW()),
(@cooking_quiz_id, 'is', 2, true, NOW(), NOW()),
(@cooking_quiz_id, 'are', 3, false, NOW(), NOW()),
(@cooking_quiz_id, 'be', 4, false, NOW(), NOW());

-- The children ___ in the park. 문제의 quiz_id 저장
SET @park_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The children ___ in the park.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The children ___ in the park. 문제 옵션들
(@park_quiz_id, 'is', 1, false, NOW(), NOW()),
(@park_quiz_id, 'am', 2, false, NOW(), NOW()),
(@park_quiz_id, 'are', 3, true, NOW(), NOW()),
(@park_quiz_id, 'be', 4, false, NOW(), NOW());

-- 5. FILL_BLANK - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '중급 문법 퀴즈', 'INTERMEDIATE', 'FILL_BLANK', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'If I ___ rich, I would travel the world.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'She has been studying English ___ five years.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The book ___ by many people is very popular.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'I wish I ___ speak French fluently.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'By next year, he ___ graduated from university.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The meeting ___ postponed due to bad weather.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, '___ it was raining, we decided to go for a walk.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'She is ___ intelligent ___ her sister.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'I would rather ___ at home than go out tonight.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The project ___ completed by the end of this week.', 'FILL_BLANK', 'INTERMEDIATE', NOW(), NOW());

-- If I ___ rich, I would travel the world. 문제의 quiz_id 저장
SET @rich_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'If I ___ rich, I would travel the world.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- If I ___ rich, I would travel the world. 문제 옵션들
(@rich_quiz_id, 'am', 1, false, NOW(), NOW()),
(@rich_quiz_id, 'was', 2, false, NOW(), NOW()),
(@rich_quiz_id, 'were', 3, true, NOW(), NOW()),
(@rich_quiz_id, 'will be', 4, false, NOW(), NOW());

-- She has been studying English ___ five years. 문제의 quiz_id 저장
SET @studying_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'She has been studying English ___ five years.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- She has been studying English ___ five years. 문제 옵션들
(@studying_quiz_id, 'since', 1, false, NOW(), NOW()),
(@studying_quiz_id, 'for', 2, true, NOW(), NOW()),
(@studying_quiz_id, 'during', 3, false, NOW(), NOW()),
(@studying_quiz_id, 'from', 4, false, NOW(), NOW());

-- The book ___ by many people is very popular. 문제의 quiz_id 저장
SET @popular_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The book ___ by many people is very popular.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The book ___ by many people is very popular. 문제 옵션들
(@popular_quiz_id, 'read', 1, true, NOW(), NOW()),
(@popular_quiz_id, 'reading', 2, false, NOW(), NOW()),
(@popular_quiz_id, 'reads', 3, false, NOW(), NOW()),
(@popular_quiz_id, 'to read', 4, false, NOW(), NOW());

-- I wish I ___ speak French fluently. 문제의 quiz_id 저장
SET @french_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I wish I ___ speak French fluently.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I wish I ___ speak French fluently. 문제 옵션들
(@french_quiz_id, 'can', 1, false, NOW(), NOW()),
(@french_quiz_id, 'could', 2, true, NOW(), NOW()),
(@french_quiz_id, 'will', 3, false, NOW(), NOW()),
(@french_quiz_id, 'would', 4, false, NOW(), NOW());

-- By next year, he ___ graduated from university. 문제의 quiz_id 저장
SET @graduated_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'By next year, he ___ graduated from university.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- By next year, he ___ graduated from university. 문제 옵션들
(@graduated_quiz_id, 'will have', 1, true, NOW(), NOW()),
(@graduated_quiz_id, 'will be', 2, false, NOW(), NOW()),
(@graduated_quiz_id, 'has', 3, false, NOW(), NOW()),
(@graduated_quiz_id, 'had', 4, false, NOW(), NOW());

-- The meeting ___ postponed due to bad weather. 문제의 quiz_id 저장
SET @postponed_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The meeting ___ postponed due to bad weather.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The meeting ___ postponed due to bad weather. 문제 옵션들
(@postponed_quiz_id, 'is', 1, false, NOW(), NOW()),
(@postponed_quiz_id, 'was', 3, true, NOW(), NOW()),
(@postponed_quiz_id, 'has', 2, false, NOW(), NOW()),
(@postponed_quiz_id, 'had', 4, false, NOW(), NOW());

-- ___ it was raining, we decided to go for a walk. 문제의 quiz_id 저장
SET @raining2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '___ it was raining, we decided to go for a walk.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- ___ it was raining, we decided to go for a walk. 문제 옵션들
(@raining2_quiz_id, 'Because', 1, false, NOW(), NOW()),
(@raining2_quiz_id, 'Since', 2, false, NOW(), NOW()),
(@raining2_quiz_id, 'Although', 3, true, NOW(), NOW()),
(@raining2_quiz_id, 'If', 4, false, NOW(), NOW());

-- She is ___ intelligent ___ her sister. 문제의 quiz_id 저장
SET @intelligent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'She is ___ intelligent ___ her sister.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- She is ___ intelligent ___ her sister. 문제 옵션들
(@intelligent_quiz_id, 'more... than', 1, false, NOW(), NOW()),
(@intelligent_quiz_id, 'as... as', 2, true, NOW(), NOW()),
(@intelligent_quiz_id, 'so... as', 3, false, NOW(), NOW()),
(@intelligent_quiz_id, 'much... than', 4, false, NOW(), NOW());

-- I would rather ___ at home than go out tonight. 문제의 quiz_id 저장
SET @rather_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I would rather ___ at home than go out tonight.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I would rather ___ at home than go out tonight. 문제 옵션들
(@rather_quiz_id, 'stay', 1, true, NOW(), NOW()),
(@rather_quiz_id, 'to stay', 2, false, NOW(), NOW()),
(@rather_quiz_id, 'staying', 3, false, NOW(), NOW()),
(@rather_quiz_id, 'stayed', 4, false, NOW(), NOW());

-- The project ___ completed by the end of this week. 문제의 quiz_id 저장
SET @completed_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The project ___ completed by the end of this week.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The project ___ completed by the end of this week. 문제 옵션들
(@completed_quiz_id, 'will be', 1, true, NOW(), NOW()),
(@completed_quiz_id, 'is', 2, false, NOW(), NOW()),
(@completed_quiz_id, 'was', 3, false, NOW(), NOW()),
(@completed_quiz_id, 'has been', 4, false, NOW(), NOW());

-- 6. FILL_BLANK - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '고급 문법 퀴즈', 'ADVANCED', 'FILL_BLANK', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'Had I known about the traffic, I ___ earlier.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The professor demanded that each student ___ present.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'Scarcely ___ the door when the phone rang.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'It is imperative that the report ___ submitted on time.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'Not until the rain stopped ___ continue our journey.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The committee suggested that the proposal ___ revised.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, '___ for your help, I would have failed the exam.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'So complicated ___ the instructions that nobody understood them.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The lawyer insisted that his client ___ innocent.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW()),
(@config_id, 'Little ___ that this decision would change everything.', 'FILL_BLANK', 'ADVANCED', NOW(), NOW());

-- Had I known about the traffic, I ___ earlier. 문제의 quiz_id 저장
SET @traffic_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Had I known about the traffic, I ___ earlier.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Had I known about the traffic, I ___ earlier. 문제 옵션들
(@traffic_quiz_id, 'would leave', 1, false, NOW(), NOW()),
(@traffic_quiz_id, 'would have left', 2, true, NOW(), NOW()),
(@traffic_quiz_id, 'will leave', 3, false, NOW(), NOW()),
(@traffic_quiz_id, 'left', 4, false, NOW(), NOW());

-- The professor demanded that each student ___ present. 문제의 quiz_id 저장
SET @present_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The professor demanded that each student ___ present.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The professor demanded that each student ___ present. 문제 옵션들
(@present_quiz_id, 'is', 1, false, NOW(), NOW()),
(@present_quiz_id, 'be', 2, true, NOW(), NOW()),
(@present_quiz_id, 'was', 3, false, NOW(), NOW()),
(@present_quiz_id, 'were', 4, false, NOW(), NOW());

-- Scarcely ___ the door when the phone rang. 문제의 quiz_id 저장
SET @scarcely_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Scarcely ___ the door when the phone rang.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Scarcely ___ the door when the phone rang. 문제 옵션들
(@scarcely_quiz_id, 'I had opened', 1, false, NOW(), NOW()),
(@scarcely_quiz_id, 'had I opened', 2, true, NOW(), NOW()),
(@scarcely_quiz_id, 'I opened', 3, false, NOW(), NOW()),
(@scarcely_quiz_id, 'did I open', 4, false, NOW(), NOW());

-- It is imperative that the report ___ submitted on time. 문제의 quiz_id 저장
SET @imperative_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'It is imperative that the report ___ submitted on time.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- It is imperative that the report ___ submitted on time. 문제 옵션들
(@imperative_quiz_id, 'is', 1, false, NOW(), NOW()),
(@imperative_quiz_id, 'be', 2, true, NOW(), NOW()),
(@imperative_quiz_id, 'was', 3, false, NOW(), NOW()),
(@imperative_quiz_id, 'will be', 4, false, NOW(), NOW());

-- Not until the rain stopped ___ continue our journey. 문제의 quiz_id 저장
SET @journey_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Not until the rain stopped ___ continue our journey.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Not until the rain stopped ___ continue our journey. 문제 옵션들
(@journey_quiz_id, 'we could', 1, false, NOW(), NOW()),
(@journey_quiz_id, 'could we', 2, true, NOW(), NOW()),
(@journey_quiz_id, 'we can', 3, false, NOW(), NOW()),
(@journey_quiz_id, 'can we', 4, false, NOW(), NOW());

-- The committee suggested that the proposal ___ revised. 문제의 quiz_id 저장
SET @proposal_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The committee suggested that the proposal ___ revised.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The committee suggested that the proposal ___ revised. 문제 옵션들
(@proposal_quiz_id, 'is', 1, false, NOW(), NOW()),
(@proposal_quiz_id, 'be', 2, true, NOW(), NOW()),
(@proposal_quiz_id, 'was', 3, false, NOW(), NOW()),
(@proposal_quiz_id, 'would be', 4, false, NOW(), NOW());

-- ___ for your help, I would have failed the exam. 문제의 quiz_id 저장
SET @help_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = '___ for your help, I would have failed the exam.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- ___ for your help, I would have failed the exam. 문제 옵션들
(@help_quiz_id, 'If not', 1, false, NOW(), NOW()),
(@help_quiz_id, 'Were it not', 2, false, NOW(), NOW()),
(@help_quiz_id, 'Had it not been', 3, true, NOW(), NOW()),
(@help_quiz_id, 'Unless', 4, false, NOW(), NOW());

-- So complicated ___ the instructions that nobody understood them. 문제의 quiz_id 저장
SET @complicated_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'So complicated ___ the instructions that nobody understood them.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- So complicated ___ the instructions that nobody understood them. 문제 옵션들
(@complicated_quiz_id, 'was', 1, false, NOW(), NOW()),
(@complicated_quiz_id, 'were', 2, true, NOW(), NOW()),
(@complicated_quiz_id, 'are', 3, false, NOW(), NOW()),
(@complicated_quiz_id, 'is', 4, false, NOW(), NOW());

-- The lawyer insisted that his client ___ innocent. 문제의 quiz_id 저장
SET @innocent_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The lawyer insisted that his client ___ innocent.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The lawyer insisted that his client ___ innocent. 문제 옵션들
(@innocent_quiz_id, 'is', 1, false, NOW(), NOW()),
(@innocent_quiz_id, 'was', 2, true, NOW(), NOW()),
(@innocent_quiz_id, 'be', 3, false, NOW(), NOW()),
(@innocent_quiz_id, 'were', 4, false, NOW(), NOW());

-- Little ___ that this decision would change everything. 문제의 quiz_id 저장
SET @decision_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Little ___ that this decision would change everything.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Little ___ that this decision would change everything. 문제 옵션들
(@decision_quiz_id, 'we knew', 1, false, NOW(), NOW()),
(@decision_quiz_id, 'did we know', 2, true, NOW(), NOW()),
(@decision_quiz_id, 'we know', 3, false, NOW(), NOW()),
(@decision_quiz_id, 'do we know', 4, false, NOW(), NOW());

-- 7. SENTENCE_ORDER - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '초급 문장 완성', 'BEGINNER', 'SENTENCE_ORDER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'I like to eat ___ for breakfast.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'The sun is ___ in the sky.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'My favorite color is ___.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'I go to ___ five days a week.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'The cat is sitting ___ the chair.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'I brush my teeth ___ I go to bed.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'There are ___ days in a week.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'Water becomes ice when it is very ___.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'I use a ___ to write on paper.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW()),
(@config_id, 'Birds can ___ in the sky.', 'SENTENCE_ORDER', 'BEGINNER', NOW(), NOW());

-- I like to eat ___ for breakfast. 문제의 quiz_id 저장
SET @breakfast2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I like to eat ___ for breakfast.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I like to eat ___ for breakfast. 문제 옵션들
(@breakfast2_quiz_id, 'cereal', 1, true, NOW(), NOW()),
(@breakfast2_quiz_id, 'car', 2, false, NOW(), NOW()),
(@breakfast2_quiz_id, 'book', 3, false, NOW(), NOW()),
(@breakfast2_quiz_id, 'chair', 4, false, NOW(), NOW());

-- The sun is ___ in the sky. 문제의 quiz_id 저장
SET @sun_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The sun is ___ in the sky.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The sun is ___ in the sky. 문제 옵션들
(@sun_quiz_id, 'cold', 1, false, NOW(), NOW()),
(@sun_quiz_id, 'bright', 2, true, NOW(), NOW()),
(@sun_quiz_id, 'dark', 3, false, NOW(), NOW()),
(@sun_quiz_id, 'small', 4, false, NOW(), NOW());

-- My favorite color is ___. 문제의 quiz_id 저장
SET @color_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'My favorite color is ___.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- My favorite color is ___. 문제 옵션들
(@color_quiz_id, 'red', 1, true, NOW(), NOW()),
(@color_quiz_id, 'fast', 2, false, NOW(), NOW()),
(@color_quiz_id, 'loud', 3, false, NOW(), NOW()),
(@color_quiz_id, 'heavy', 4, false, NOW(), NOW());

-- I go to ___ five days a week. 문제의 quiz_id 저장
SET @school2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I go to ___ five days a week.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I go to ___ five days a week. 문제 옵션들
(@school2_quiz_id, 'sleep', 1, false, NOW(), NOW()),
(@school2_quiz_id, 'school', 2, true, NOW(), NOW()),
(@school2_quiz_id, 'eat', 3, false, NOW(), NOW()),
(@school2_quiz_id, 'jump', 4, false, NOW(), NOW());

-- The cat is sitting ___ the chair. 문제의 quiz_id 저장
SET @chair2_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The cat is sitting ___ the chair.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The cat is sitting ___ the chair. 문제 옵션들
(@chair2_quiz_id, 'under', 1, false, NOW(), NOW()),
(@chair2_quiz_id, 'on', 2, true, NOW(), NOW()),
(@chair2_quiz_id, 'through', 3, false, NOW(), NOW()),
(@chair2_quiz_id, 'behind', 4, false, NOW(), NOW());

-- I brush my teeth ___ I go to bed. 문제의 quiz_id 저장
SET @teeth_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I brush my teeth ___ I go to bed.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I brush my teeth ___ I go to bed. 문제 옵션들
(@teeth_quiz_id, 'after', 1, false, NOW(), NOW()),
(@teeth_quiz_id, 'before', 2, true, NOW(), NOW()),
(@teeth_quiz_id, 'during', 3, false, NOW(), NOW()),
(@teeth_quiz_id, 'without', 4, false, NOW(), NOW());

-- There are ___ days in a week. 문제의 quiz_id 저장
SET @week_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'There are ___ days in a week.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- There are ___ days in a week. 문제 옵션들
(@week_quiz_id, 'five', 1, false, NOW(), NOW()),
(@week_quiz_id, 'seven', 2, true, NOW(), NOW()),
(@week_quiz_id, 'ten', 3, false, NOW(), NOW()),
(@week_quiz_id, 'twelve', 4, false, NOW(), NOW());

-- Water becomes ice when it is very ___. 문제의 quiz_id 저장
SET @ice_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Water becomes ice when it is very ___.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Water becomes ice when it is very ___. 문제 옵션들
(@ice_quiz_id, 'hot', 1, false, NOW(), NOW()),
(@ice_quiz_id, 'cold', 2, true, NOW(), NOW()),
(@ice_quiz_id, 'loud', 3, false, NOW(), NOW()),
(@ice_quiz_id, 'soft', 4, false, NOW(), NOW());

-- I use a ___ to write on paper. 문제의 quiz_id 저장
SET @pen_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'I use a ___ to write on paper.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I use a ___ to write on paper. 문제 옵션들
(@pen_quiz_id, 'spoon', 1, false, NOW(), NOW()),
(@pen_quiz_id, 'pen', 2, true, NOW(), NOW()),
(@pen_quiz_id, 'shoe', 3, false, NOW(), NOW()),
(@pen_quiz_id, 'cup', 4, false, NOW(), NOW());

-- Birds can ___ in the sky. 문제의 quiz_id 저장
SET @birds_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Birds can ___ in the sky.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Birds can ___ in the sky. 문제 옵션들
(@birds_quiz_id, 'swim', 1, false, NOW(), NOW()),
(@birds_quiz_id, 'fly', 2, true, NOW(), NOW()),
(@birds_quiz_id, 'walk', 3, false, NOW(), NOW()),
(@birds_quiz_id, 'sleep', 4, false, NOW(), NOW());

-- 8. SENTENCE_ORDER - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '중급 문장 완성', 'INTERMEDIATE', 'SENTENCE_ORDER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'Despite the challenging circumstances, she managed to ___ her goals.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The research findings were so ___ that they changed our entire understanding.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'His ___ attitude towards work made him very popular among colleagues.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The company decided to ___ its operations to include international markets.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The artist''s work was ___ by critics and audiences alike.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The new technology promises to ___ the way we communicate.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'Her ___ speech moved the entire audience to tears.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The detective was able to ___ the mystery after careful investigation.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'The economic ___ affected millions of people worldwide.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW()),
(@config_id, 'Scientists are working to ___ a cure for this rare disease.', 'SENTENCE_ORDER', 'INTERMEDIATE', NOW(), NOW());

-- Despite the challenging circumstances, she managed to ___ her goals. 문제의 quiz_id 저장
SET @achieve_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Despite the challenging circumstances, she managed to ___ her goals.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Despite the challenging circumstances, she managed to ___ her goals. 문제 옵션들
(@achieve_quiz_id, 'forget', 1, false, NOW(), NOW()),
(@achieve_quiz_id, 'achieve', 2, true, NOW(), NOW()),
(@achieve_quiz_id, 'ignore', 3, false, NOW(), NOW()),
(@achieve_quiz_id, 'avoid', 4, false, NOW(), NOW());

-- The research findings were so ___ that they changed our entire understanding. 문제의 quiz_id 저장
SET @findings_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The research findings were so ___ that they changed our entire understanding.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The research findings were so ___ that they changed our entire understanding. 문제 옵션들
(@findings_quiz_id, 'boring', 1, false, NOW(), NOW()),
(@findings_quiz_id, 'significant', 2, true, NOW(), NOW()),
(@findings_quiz_id, 'confusing', 3, false, NOW(), NOW()),
(@findings_quiz_id, 'simple', 4, false, NOW(), NOW());

-- His ___ attitude towards work made him very popular among colleagues. 문제의 quiz_id 저장
SET @attitude_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'His ___ attitude towards work made him very popular among colleagues.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- His ___ attitude towards work made him very popular among colleagues. 문제 옵션들
(@attitude_quiz_id, 'negative', 1, false, NOW(), NOW()),
(@attitude_quiz_id, 'positive', 2, true, NOW(), NOW()),
(@attitude_quiz_id, 'lazy', 3, false, NOW(), NOW()),
(@attitude_quiz_id, 'selfish', 4, false, NOW(), NOW());

-- The company decided to ___ its operations to include international markets. 문제의 quiz_id 저장
SET @expand_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The company decided to ___ its operations to include international markets.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The company decided to ___ its operations to include international markets. 문제 옵션들
(@expand_quiz_id, 'reduce', 1, false, NOW(), NOW()),
(@expand_quiz_id, 'expand', 2, true, NOW(), NOW()),
(@expand_quiz_id, 'eliminate', 3, false, NOW(), NOW()),
(@expand_quiz_id, 'hide', 4, false, NOW(), NOW());

-- The artist's work was ___ by critics and audiences alike. 문제의 quiz_id 저장
SET @praised_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The artist''s work was ___ by critics and audiences alike.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The artist's work was ___ by critics and audiences alike. 문제 옵션들
(@praised_quiz_id, 'ignored', 1, false, NOW(), NOW()),
(@praised_quiz_id, 'praised', 2, true, NOW(), NOW()),
(@praised_quiz_id, 'criticized', 3, false, NOW(), NOW()),
(@praised_quiz_id, 'forgotten', 4, false, NOW(), NOW());

-- The new technology promises to ___ the way we communicate. 문제의 quiz_id 저장
SET @revolutionize_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The new technology promises to ___ the way we communicate.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The new technology promises to ___ the way we communicate. 문제 옵션들
(@revolutionize_quiz_id, 'complicate', 1, false, NOW(), NOW()),
(@revolutionize_quiz_id, 'revolutionize', 2, true, NOW(), NOW()),
(@revolutionize_quiz_id, 'prevent', 3, false, NOW(), NOW()),
(@revolutionize_quiz_id, 'destroy', 4, false, NOW(), NOW());

-- Her ___ speech moved the entire audience to tears. 문제의 quiz_id 저장
SET @emotional_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Her ___ speech moved the entire audience to tears.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Her ___ speech moved the entire audience to tears. 문제 옵션들
(@emotional_quiz_id, 'boring', 1, false, NOW(), NOW()),
(@emotional_quiz_id, 'emotional', 2, true, NOW(), NOW()),
(@emotional_quiz_id, 'confusing', 3, false, NOW(), NOW()),
(@emotional_quiz_id, 'technical', 4, false, NOW(), NOW());

-- The detective was able to ___ the mystery after careful investigation. 문제의 quiz_id 저장
SET @solve_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The detective was able to ___ the mystery after careful investigation.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The detective was able to ___ the mystery after careful investigation. 문제 옵션들
(@solve_quiz_id, 'create', 1, false, NOW(), NOW()),
(@solve_quiz_id, 'solve', 2, true, NOW(), NOW()),
(@solve_quiz_id, 'ignore', 3, false, NOW(), NOW()),
(@solve_quiz_id, 'complicate', 4, false, NOW(), NOW());

-- The economic ___ affected millions of people worldwide. 문제의 quiz_id 저장
SET @crisis_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The economic ___ affected millions of people worldwide.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The economic ___ affected millions of people worldwide. 문제 옵션들
(@crisis_quiz_id, 'success', 1, false, NOW(), NOW()),
(@crisis_quiz_id, 'crisis', 2, true, NOW(), NOW()),
(@crisis_quiz_id, 'celebration', 3, false, NOW(), NOW()),
(@crisis_quiz_id, 'party', 4, false, NOW(), NOW());

-- Scientists are working to ___ a cure for this rare disease. 문제의 quiz_id 저장
SET @develop_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Scientists are working to ___ a cure for this rare disease.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Scientists are working to ___ a cure for this rare disease. 문제 옵션들
(@develop_quiz_id, 'prevent', 1, false, NOW(), NOW()),
(@develop_quiz_id, 'develop', 2, true, NOW(), NOW()),
(@develop_quiz_id, 'hide', 3, false, NOW(), NOW()),
(@develop_quiz_id, 'destroy', 4, false, NOW(), NOW());

-- 9. SENTENCE_ORDER - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, quiz_type, created_at, updated_at) 
VALUES (1, '고급 문장 완성', 'ADVANCED', 'SENTENCE_ORDER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, level, created_at, updated_at) VALUES
(@config_id, 'The politician''s ___ remarks during the debate significantly undermined his credibility.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'Despite her ___ efforts, the project remained incomplete due to unforeseen circumstances.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The scientist''s ___ approach to research led to groundbreaking discoveries.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'His ___ behavior at the meeting alienated many potential supporters.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The novel''s ___ narrative structure challenged even the most experienced readers.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The CEO''s ___ decision to expand internationally proved to be visionary.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The artist''s work demonstrates a ___ understanding of human psychology.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The treaty represented a ___ shift in international diplomatic relations.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'Her ___ analysis of the market trends impressed the entire board of directors.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW()),
(@config_id, 'The philosopher''s ___ arguments required careful consideration and deep thought.', 'SENTENCE_ORDER', 'ADVANCED', NOW(), NOW());

-- The politician's ___ remarks during the debate significantly undermined his credibility. 문제의 quiz_id 저장
SET @politician_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The politician''s ___ remarks during the debate significantly undermined his credibility.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The politician's ___ remarks during the debate significantly undermined his credibility. 문제 옵션들
(@politician_quiz_id, 'thoughtful', 1, false, NOW(), NOW()),
(@politician_quiz_id, 'inflammatory', 2, true, NOW(), NOW()),
(@politician_quiz_id, 'supportive', 3, false, NOW(), NOW()),
(@politician_quiz_id, 'encouraging', 4, false, NOW(), NOW());

-- Despite her ___ efforts, the project remained incomplete due to unforeseen circumstances. 문제의 quiz_id 저장
SET @efforts_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Despite her ___ efforts, the project remained incomplete due to unforeseen circumstances.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Despite her ___ efforts, the project remained incomplete due to unforeseen circumstances. 문제 옵션들
(@efforts_quiz_id, 'half-hearted', 1, false, NOW(), NOW()),
(@efforts_quiz_id, 'diligent', 2, true, NOW(), NOW()),
(@efforts_quiz_id, 'careless', 3, false, NOW(), NOW()),
(@efforts_quiz_id, 'sporadic', 4, false, NOW(), NOW());

-- The scientist's ___ approach to research led to groundbreaking discoveries. 문제의 quiz_id 저장
SET @scientist_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The scientist''s ___ approach to research led to groundbreaking discoveries.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The scientist's ___ approach to research led to groundbreaking discoveries. 문제 옵션들
(@scientist_quiz_id, 'conventional', 1, false, NOW(), NOW()),
(@scientist_quiz_id, 'innovative', 2, true, NOW(), NOW()),
(@scientist_quiz_id, 'outdated', 3, false, NOW(), NOW()),
(@scientist_quiz_id, 'rigid', 4, false, NOW(), NOW());

-- His ___ behavior at the meeting alienated many potential supporters. 문제의 quiz_id 저장
SET @behavior_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'His ___ behavior at the meeting alienated many potential supporters.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- His ___ behavior at the meeting alienated many potential supporters. 문제 옵션들
(@behavior_quiz_id, 'diplomatic', 1, false, NOW(), NOW()),
(@behavior_quiz_id, 'abrasive', 2, true, NOW(), NOW()),
(@behavior_quiz_id, 'cooperative', 3, false, NOW(), NOW()),
(@behavior_quiz_id, 'respectful', 4, false, NOW(), NOW());

-- The novel's ___ narrative structure challenged even the most experienced readers. 문제의 quiz_id 저장
SET @narrative_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The novel''s ___ narrative structure challenged even the most experienced readers.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The novel's ___ narrative structure challenged even the most experienced readers. 문제 옵션들
(@narrative_quiz_id, 'simple', 1, false, NOW(), NOW()),
(@narrative_quiz_id, 'intricate', 2, true, NOW(), NOW()),
(@narrative_quiz_id, 'straightforward', 3, false, NOW(), NOW()),
(@narrative_quiz_id, 'basic', 4, false, NOW(), NOW());

-- The CEO's ___ decision to expand internationally proved to be visionary. 문제의 quiz_id 저장
SET @ceo_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The CEO''s ___ decision to expand internationally proved to be visionary.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The CEO's ___ decision to expand internationally proved to be visionary. 문제 옵션들
(@ceo_quiz_id, 'hesitant', 1, false, NOW(), NOW()),
(@ceo_quiz_id, 'audacious', 2, true, NOW(), NOW()),
(@ceo_quiz_id, 'conservative', 3, false, NOW(), NOW()),
(@ceo_quiz_id, 'reluctant', 4, false, NOW(), NOW());

-- The artist's work demonstrates a ___ understanding of human psychology. 문제의 quiz_id 저장
SET @psychology_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The artist''s work demonstrates a ___ understanding of human psychology.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The artist's work demonstrates a ___ understanding of human psychology. 문제 옵션들
(@psychology_quiz_id, 'superficial', 1, false, NOW(), NOW()),
(@psychology_quiz_id, 'profound', 2, true, NOW(), NOW()),
(@psychology_quiz_id, 'limited', 3, false, NOW(), NOW()),
(@psychology_quiz_id, 'naive', 4, false, NOW(), NOW());

-- The treaty represented a ___ shift in international diplomatic relations. 문제의 quiz_id 저장
SET @treaty_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The treaty represented a ___ shift in international diplomatic relations.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The treaty represented a ___ shift in international diplomatic relations. 문제 옵션들
(@treaty_quiz_id, 'minor', 1, false, NOW(), NOW()),
(@treaty_quiz_id, 'paradigmatic', 2, true, NOW(), NOW()),
(@treaty_quiz_id, 'temporary', 3, false, NOW(), NOW()),
(@treaty_quiz_id, 'insignificant', 4, false, NOW(), NOW());

-- Her ___ analysis of the market trends impressed the entire board of directors. 문제의 quiz_id 저장
SET @analysis_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'Her ___ analysis of the market trends impressed the entire board of directors.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- Her ___ analysis of the market trends impressed the entire board of directors. 문제 옵션들
(@analysis_quiz_id, 'cursory', 1, false, NOW(), NOW()),
(@analysis_quiz_id, 'comprehensive', 2, true, NOW(), NOW()),
(@analysis_quiz_id, 'superficial', 3, false, NOW(), NOW()),
(@analysis_quiz_id, 'incomplete', 4, false, NOW(), NOW());

-- The philosopher's ___ arguments required careful consideration and deep thought. 문제의 quiz_id 저장
SET @philosopher_quiz_id = (SELECT quiz_id FROM quizzes WHERE config_id = @config_id AND content = 'The philosopher''s ___ arguments required careful consideration and deep thought.');

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The philosopher's ___ arguments required careful consideration and deep thought. 문제 옵션들
(@philosopher_quiz_id, 'simplistic', 1, false, NOW(), NOW()),
(@philosopher_quiz_id, 'nuanced', 2, true, NOW(), NOW()),
(@philosopher_quiz_id, 'obvious', 3, false, NOW(), NOW()),
(@philosopher_quiz_id, 'shallow', 4, false, NOW(), NOW());
