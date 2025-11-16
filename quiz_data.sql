-- 퀴즈 데이터 삽입 스크립트
-- 사용자 ID 1을 관리자로 가정

-- 1. WORD_MEANING - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '초급 단어 뜻 맞추기', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'apple', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'book', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'water', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'dog', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'school', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'friend', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'happy', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'chair', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'coffee', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'rain', 'WORD_MEANING', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- apple 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'apple'), '사과', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'apple'), '자동차', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'apple'), '공항', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'apple'), '나무', 4, false, NOW(), NOW()),
-- book 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book'), '강', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book'), '책', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book'), '구름', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book'), '신발', 4, false, NOW(), NOW()),
-- water 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'water'), '물', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'water'), '불', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'water'), '바람', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'water'), '돌', 4, false, NOW(), NOW()),
-- dog 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog'), '고양이', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog'), '강아지', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog'), '새', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog'), '소', 4, false, NOW(), NOW()),
-- school 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'school'), '은행', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'school'), '병원', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'school'), '학교', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'school'), '시장', 4, false, NOW(), NOW()),
-- friend 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'friend'), '가족', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'friend'), '친구', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'friend'), '선생님', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'friend'), '이웃', 4, false, NOW(), NOW()),
-- happy 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'happy'), '슬픈', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'happy'), '화난', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'happy'), '행복한', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'happy'), '심심한', 4, false, NOW(), NOW()),
-- chair 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'chair'), '의자', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'chair'), '침대', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'chair'), '문', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'chair'), '창문', 4, false, NOW(), NOW()),
-- coffee 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee'), '홍차', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee'), '우유', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee'), '주스', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee'), '커피', 4, true, NOW(), NOW()),
-- rain 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'rain'), '바다', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'rain'), '비', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'rain'), '산', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'rain'), '눈', 4, false, NOW(), NOW());

-- 2. WORD_MEANING - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '중급 단어 뜻 맞추기', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'benevolent', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'candid', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'fragile', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'meticulous', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'ambiguous', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'elated', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'arduous', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'prudent', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'ardent', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'obsolete', 'WORD_MEANING', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- benevolent 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'benevolent'), '자비로운', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'benevolent'), '무관심한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'benevolent'), '잔인한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'benevolent'), '냉정한', 4, false, NOW(), NOW()),
-- candid 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'candid'), '솔직한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'candid'), '은밀한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'candid'), '거짓된', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'candid'), '교활한', 4, false, NOW(), NOW()),
-- fragile 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'fragile'), '취약한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'fragile'), '튼튼한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'fragile'), '빠른', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'fragile'), '느린', 4, false, NOW(), NOW()),
-- meticulous 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'meticulous'), '꼼꼼한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'meticulous'), '성급한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'meticulous'), '게으른', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'meticulous'), '무심한', 4, false, NOW(), NOW()),
-- ambiguous 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ambiguous'), '애매한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ambiguous'), '분명한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ambiguous'), '확실한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ambiguous'), '명료한', 4, false, NOW(), NOW()),
-- elated 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'elated'), '의기양양한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'elated'), '슬픈', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'elated'), '화난', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'elated'), '지루한', 4, false, NOW(), NOW()),
-- arduous 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'arduous'), '힘든', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'arduous'), '쉬운', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'arduous'), '빠른', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'arduous'), '느린', 4, false, NOW(), NOW()),
-- prudent 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'prudent'), '신중한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'prudent'), '무모한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'prudent'), '급한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'prudent'), '대담한', 4, false, NOW(), NOW()),
-- ardent 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ardent'), '열렬한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ardent'), '차가운', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ardent'), '냉정한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ardent'), '평온한', 4, false, NOW(), NOW()),
-- obsolete 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obsolete'), '구식의', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obsolete'), '최신의', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obsolete'), '중요한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obsolete'), '유용한', 4, false, NOW(), NOW());

-- 3. WORD_MEANING - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '고급 단어 뜻 맞추기', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'obfuscate', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'laconic', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'ephemeral', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'equivocate', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'sagacious', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'intransigent', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'obstreperous', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'pellucid', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'recalcitrant', 'WORD_MEANING', NOW(), NOW()),
(@config_id, 'temerity', 'WORD_MEANING', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- obfuscate 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obfuscate'), '혼동시키다', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obfuscate'), '명확히 하다', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obfuscate'), '발전시키다', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obfuscate'), '정리하다', 4, false, NOW(), NOW()),
-- laconic 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'laconic'), '간결한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'laconic'), '장황한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'laconic'), '시끄러운', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'laconic'), '지루한', 4, false, NOW(), NOW()),
-- ephemeral 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ephemeral'), '순식간의', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ephemeral'), '영구적인', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ephemeral'), '지속적인', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ephemeral'), '느린', 4, false, NOW(), NOW()),
-- equivocate 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'equivocate'), '애매하게 말하다', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'equivocate'), '분명히 말하다', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'equivocate'), '고집하다', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'equivocate'), '포기하다', 4, false, NOW(), NOW()),
-- sagacious 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sagacious'), '현명한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sagacious'), '어리석은', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sagacious'), '성급한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sagacious'), '무모한', 4, false, NOW(), NOW()),
-- intransigent 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'intransigent'), '비타협적인', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'intransigent'), '유연한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'intransigent'), '친절한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'intransigent'), '관대한', 4, false, NOW(), NOW()),
-- obstreperous 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obstreperous'), '시끄러운', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obstreperous'), '조용한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obstreperous'), '순종적인', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'obstreperous'), '친근한', 4, false, NOW(), NOW()),
-- pellucid 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pellucid'), '투명한', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pellucid'), '불투명한', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pellucid'), '모호한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pellucid'), '흐린', 4, false, NOW(), NOW()),
-- recalcitrant 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'recalcitrant'), '반항적인', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'recalcitrant'), '순종적인', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'recalcitrant'), '겸손한', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'recalcitrant'), '친절한', 4, false, NOW(), NOW()),
-- temerity 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'temerity'), '무모함', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'temerity'), '신중함', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'temerity'), '용기', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'temerity'), '조심', 4, false, NOW(), NOW());

-- 4. WORD_MATCHING - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '초급 일치하는 단어 맞추기', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'cat - 고양이', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'house - 집', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'food - 음식', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'car - 자동차', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'tree - 나무', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'flower - 꽃', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'sun - 태양', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'moon - 달', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'star - 별', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'sea - 바다', 'WORD_MATCHING', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- cat - 고양이 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat - 고양이'), 'cat', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat - 고양이'), 'dog', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat - 고양이'), 'bird', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat - 고양이'), 'fish', 4, false, NOW(), NOW()),
-- house - 집 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'house - 집'), 'school', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'house - 집'), 'house', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'house - 집'), 'store', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'house - 집'), 'park', 4, false, NOW(), NOW()),
-- food - 음식 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'food - 음식'), 'food', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'food - 음식'), 'drink', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'food - 음식'), 'game', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'food - 음식'), 'music', 4, false, NOW(), NOW()),
-- car - 자동차 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car - 자동차'), 'bus', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car - 자동차'), 'train', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car - 자동차'), 'car', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car - 자동차'), 'plane', 4, false, NOW(), NOW()),
-- tree - 나무 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'tree - 나무'), 'tree', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'tree - 나무'), 'grass', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'tree - 나무'), 'rock', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'tree - 나무'), 'water', 4, false, NOW(), NOW()),
-- flower - 꽃 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'flower - 꽃'), 'leaf', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'flower - 꽃'), 'flower', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'flower - 꽃'), 'seed', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'flower - 꽃'), 'root', 4, false, NOW(), NOW()),
-- sun - 태양 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sun - 태양'), 'sun', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sun - 태양'), 'moon', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sun - 태양'), 'cloud', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sun - 태양'), 'wind', 4, false, NOW(), NOW()),
-- moon - 달 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'moon - 달'), 'star', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'moon - 달'), 'moon', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'moon - 달'), 'sun', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'moon - 달'), 'earth', 4, false, NOW(), NOW()),
-- star - 별 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'star - 별'), 'sky', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'star - 별'), 'cloud', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'star - 별'), 'star', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'star - 별'), 'planet', 4, false, NOW(), NOW()),
-- sea - 바다 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sea - 바다'), 'river', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sea - 바다'), 'lake', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sea - 바다'), 'mountain', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'sea - 바다'), 'sea', 4, true, NOW(), NOW());

-- 5. WORD_MATCHING - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '중급 일치하는 단어 맞추기', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'perseverance - 인내', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'achievement - 성취', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'opportunity - 기회', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'challenge - 도전', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'dedication - 헌신', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'enthusiasm - 열정', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'innovation - 혁신', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'resilience - 회복력', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'collaboration - 협력', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'excellence - 우수성', 'WORD_MATCHING', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- perseverance - 인내 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perseverance - 인내'), 'perseverance', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perseverance - 인내'), 'persistence', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perseverance - 인내'), 'patience', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perseverance - 인내'), 'performance', 4, false, NOW(), NOW()),
-- achievement - 성취 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement - 성취'), 'accomplish', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement - 성취'), 'achievement', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement - 성취'), 'agreement', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement - 성취'), 'adjustment', 4, false, NOW(), NOW()),
-- opportunity - 기회 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity - 기회'), 'opportunity', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity - 기회'), 'operation', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity - 기회'), 'occupation', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity - 기회'), 'organization', 4, false, NOW(), NOW()),
-- challenge - 도전 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'challenge - 도전'), 'change', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'challenge - 도전'), 'chance', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'challenge - 도전'), 'challenge', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'challenge - 도전'), 'character', 4, false, NOW(), NOW()),
-- dedication - 헌신 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dedication - 헌신'), 'dedication', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dedication - 헌신'), 'decoration', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dedication - 헌신'), 'decision', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dedication - 헌신'), 'description', 4, false, NOW(), NOW()),
-- enthusiasm - 열정 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'enthusiasm - 열정'), 'entertainment', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'enthusiasm - 열정'), 'enthusiasm', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'enthusiasm - 열정'), 'environment', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'enthusiasm - 열정'), 'establishment', 4, false, NOW(), NOW()),
-- innovation - 혁신 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovation - 혁신'), 'information', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovation - 혁신'), 'invitation', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovation - 혁신'), 'innovation', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovation - 혁신'), 'investigation', 4, false, NOW(), NOW()),
-- resilience - 회복력 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'resilience - 회복력'), 'resistance', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'resilience - 회복력'), 'resilience', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'resilience - 회복력'), 'residence', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'resilience - 회복력'), 'reference', 4, false, NOW(), NOW()),
-- collaboration - 협력 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration - 협력'), 'collection', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration - 협력'), 'combination', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration - 협력'), 'collaboration', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration - 협력'), 'communication', 4, false, NOW(), NOW()),
-- excellence - 우수성 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'excellence - 우수성'), 'experience', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'excellence - 우수성'), 'excellence', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'excellence - 우수성'), 'existence', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'excellence - 우수성'), 'explanation', 4, false, NOW(), NOW());

-- 6. WORD_MATCHING - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '고급 일치하는 단어 맞추기', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'perspicacious - 통찰력 있는', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'ubiquitous - 어디에나 있는', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'serendipity - 뜻밖의 발견', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'magnanimous - 관대한', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'quintessential - 전형적인', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'ineffable - 말로 표현할 수 없는', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'surreptitious - 은밀한', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'pusillanimous - 소심한', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'perspicuous - 명료한', 'WORD_MATCHING', NOW(), NOW()),
(@config_id, 'verisimilitude - 진실성', 'WORD_MATCHING', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- perspicacious - 통찰력 있는 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicacious - 통찰력 있는'), 'perspicacious', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicacious - 통찰력 있는'), 'perspicuous', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicacious - 통찰력 있는'), 'perspiration', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicacious - 통찰력 있는'), 'perspective', 4, false, NOW(), NOW()),
-- ubiquitous - 어디에나 있는 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ubiquitous - 어디에나 있는'), 'unanimous', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ubiquitous - 어디에나 있는'), 'ubiquitous', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ubiquitous - 어디에나 있는'), 'unequivocal', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ubiquitous - 어디에나 있는'), 'unprecedented', 4, false, NOW(), NOW()),
-- serendipity - 뜻밖의 발견 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'serendipity - 뜻밖의 발견'), 'serendipity', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'serendipity - 뜻밖의 발견'), 'solidarity', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'serendipity - 뜻밖의 발견'), 'sincerity', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'serendipity - 뜻밖의 발견'), 'sensitivity', 4, false, NOW(), NOW()),
-- magnanimous - 관대한 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'magnanimous - 관대한'), 'magnificent', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'magnanimous - 관대한'), 'magnanimous', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'magnanimous - 관대한'), 'malevolent', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'magnanimous - 관대한'), 'meticulous', 4, false, NOW(), NOW()),
-- quintessential - 전형적인 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'quintessential - 전형적인'), 'questionable', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'quintessential - 전형적인'), 'quantitative', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'quintessential - 전형적인'), 'quintessential', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'quintessential - 전형적인'), 'qualitative', 4, false, NOW(), NOW()),
-- ineffable - 말로 표현할 수 없는 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ineffable - 말로 표현할 수 없는'), 'incredible', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ineffable - 말로 표현할 수 없는'), 'ineffable', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ineffable - 말로 표현할 수 없는'), 'inflexible', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ineffable - 말로 표현할 수 없는'), 'inevitable', 4, false, NOW(), NOW()),
-- surreptitious - 은밀한 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'surreptitious - 은밀한'), 'superstitious', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'surreptitious - 은밀한'), 'surreptitious', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'surreptitious - 은밀한'), 'synchronous', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'surreptitious - 은밀한'), 'simultaneous', 4, false, NOW(), NOW()),
-- pusillanimous - 소심한 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pusillanimous - 소심한'), 'pusillanimous', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pusillanimous - 소심한'), 'punctilious', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pusillanimous - 소심한'), 'pretentious', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'pusillanimous - 소심한'), 'perspicacious', 4, false, NOW(), NOW()),
-- perspicuous - 명료한 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicuous - 명료한'), 'perspicacious', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicuous - 명료한'), 'perspicuous', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicuous - 명료한'), 'preposterous', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspicuous - 명료한'), 'precarious', 4, false, NOW(), NOW()),
-- verisimilitude - 진실성 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'verisimilitude - 진실성'), 'vicissitude', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'verisimilitude - 진실성'), 'versatility', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'verisimilitude - 진실성'), 'verisimilitude', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'verisimilitude - 진실성'), 'vulnerability', 4, false, NOW(), NOW());

-- 7. FILL_BLANK - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '초급 문장에 빈칸 채우기', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'I like to eat _____ for breakfast.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The cat is sleeping on the _____.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'My favorite color is _____.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'Please turn off the _____ when you leave.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'I go to _____ every day.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The weather is very _____ today.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'I need to buy some _____ from the store.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'My _____ is very kind.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The dog is _____ in the yard.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'I watch TV in the _____.', 'FILL_BLANK', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- I like to eat _____ for breakfast. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I like to eat _____ for breakfast.'), 'bread', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I like to eat _____ for breakfast.'), 'car', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I like to eat _____ for breakfast.'), 'music', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I like to eat _____ for breakfast.'), 'book', 4, false, NOW(), NOW()),
-- The cat is sleeping on the _____. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The cat is sleeping on the _____.'), 'water', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The cat is sleeping on the _____.'), 'bed', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The cat is sleeping on the _____.'), 'sky', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The cat is sleeping on the _____.'), 'time', 4, false, NOW(), NOW()),
-- My favorite color is _____. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My favorite color is _____.'), 'blue', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My favorite color is _____.'), 'happy', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My favorite color is _____.'), 'run', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My favorite color is _____.'), 'big', 4, false, NOW(), NOW()),
-- Please turn off the _____ when you leave. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Please turn off the _____ when you leave.'), 'door', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Please turn off the _____ when you leave.'), 'light', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Please turn off the _____ when you leave.'), 'chair', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Please turn off the _____ when you leave.'), 'food', 4, false, NOW(), NOW()),
-- I go to _____ every day. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I go to _____ every day.'), 'sleep', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I go to _____ every day.'), 'school', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I go to _____ every day.'), 'color', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I go to _____ every day.'), 'fast', 4, false, NOW(), NOW()),
-- The weather is very _____ today. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The weather is very _____ today.'), 'book', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The weather is very _____ today.'), 'nice', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The weather is very _____ today.'), 'table', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The weather is very _____ today.'), 'money', 4, false, NOW(), NOW()),
-- I need to buy some _____ from the store. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I need to buy some _____ from the store.'), 'milk', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I need to buy some _____ from the store.'), 'dream', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I need to buy some _____ from the store.'), 'think', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I need to buy some _____ from the store.'), 'tall', 4, false, NOW(), NOW()),
-- My _____ is very kind. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My _____ is very kind.'), 'wall', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My _____ is very kind.'), 'mother', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My _____ is very kind.'), 'cold', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'My _____ is very kind.'), 'small', 4, false, NOW(), NOW()),
-- The dog is _____ in the yard. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The dog is _____ in the yard.'), 'running', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The dog is _____ in the yard.'), 'window', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The dog is _____ in the yard.'), 'pencil', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The dog is _____ in the yard.'), 'heavy', 4, false, NOW(), NOW()),
-- I watch TV in the _____. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I watch TV in the _____.'), 'sky', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I watch TV in the _____.'), 'living room', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I watch TV in the _____.'), 'number', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I watch TV in the _____.'), 'quiet', 4, false, NOW(), NOW());

-- 8. FILL_BLANK - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '중급 문장에 빈칸 채우기', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'The company decided to _____ its operations to reduce costs.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'Her _____ approach to problem-solving impressed everyone.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The research findings will _____ our understanding of the topic.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'Despite the challenges, they remained _____ about the outcome.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The new policy aims to _____ workplace diversity.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'His _____ personality made him popular among colleagues.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The team needs to _____ their strategies for better results.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The _____ growth of the market surprised investors.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'She has an _____ ability to understand complex concepts.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The project requires _____ planning and execution.', 'FILL_BLANK', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The company decided to _____ its operations to reduce costs. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company decided to _____ its operations to reduce costs.'), 'streamline', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company decided to _____ its operations to reduce costs.'), 'complicate', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company decided to _____ its operations to reduce costs.'), 'expand', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company decided to _____ its operations to reduce costs.'), 'ignore', 4, false, NOW(), NOW()),
-- Her _____ approach to problem-solving impressed everyone. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ approach to problem-solving impressed everyone.'), 'chaotic', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ approach to problem-solving impressed everyone.'), 'systematic', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ approach to problem-solving impressed everyone.'), 'random', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ approach to problem-solving impressed everyone.'), 'lazy', 4, false, NOW(), NOW()),
-- The research findings will _____ our understanding of the topic. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The research findings will _____ our understanding of the topic.'), 'enhance', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The research findings will _____ our understanding of the topic.'), 'diminish', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The research findings will _____ our understanding of the topic.'), 'confuse', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The research findings will _____ our understanding of the topic.'), 'eliminate', 4, false, NOW(), NOW()),
-- Despite the challenges, they remained _____ about the outcome. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Despite the challenges, they remained _____ about the outcome.'), 'pessimistic', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Despite the challenges, they remained _____ about the outcome.'), 'optimistic', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Despite the challenges, they remained _____ about the outcome.'), 'indifferent', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Despite the challenges, they remained _____ about the outcome.'), 'worried', 4, false, NOW(), NOW()),
-- The new policy aims to _____ workplace diversity. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The new policy aims to _____ workplace diversity.'), 'reduce', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The new policy aims to _____ workplace diversity.'), 'promote', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The new policy aims to _____ workplace diversity.'), 'ignore', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The new policy aims to _____ workplace diversity.'), 'discourage', 4, false, NOW(), NOW()),
-- His _____ personality made him popular among colleagues. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ personality made him popular among colleagues.'), 'abrasive', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ personality made him popular among colleagues.'), 'charismatic', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ personality made him popular among colleagues.'), 'boring', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ personality made him popular among colleagues.'), 'rude', 4, false, NOW(), NOW()),
-- The team needs to _____ their strategies for better results. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The team needs to _____ their strategies for better results.'), 'abandon', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The team needs to _____ their strategies for better results.'), 'refine', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The team needs to _____ their strategies for better results.'), 'ignore', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The team needs to _____ their strategies for better results.'), 'copy', 4, false, NOW(), NOW()),
-- The _____ growth of the market surprised investors. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The _____ growth of the market surprised investors.'), 'rapid', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The _____ growth of the market surprised investors.'), 'slow', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The _____ growth of the market surprised investors.'), 'negative', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The _____ growth of the market surprised investors.'), 'stagnant', 4, false, NOW(), NOW()),
-- She has an _____ ability to understand complex concepts. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'She has an _____ ability to understand complex concepts.'), 'limited', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'She has an _____ ability to understand complex concepts.'), 'exceptional', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'She has an _____ ability to understand complex concepts.'), 'poor', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'She has an _____ ability to understand complex concepts.'), 'ordinary', 4, false, NOW(), NOW()),
-- The project requires _____ planning and execution. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The project requires _____ planning and execution.'), 'careless', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The project requires _____ planning and execution.'), 'meticulous', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The project requires _____ planning and execution.'), 'hasty', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The project requires _____ planning and execution.'), 'minimal', 4, false, NOW(), NOW());

-- 9. FILL_BLANK - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '고급 문장에 빈칸 채우기', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'The philosopher''s _____ arguments challenged conventional wisdom.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'Her _____ nature made it difficult to predict her next move.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The treaty aimed to _____ tensions between the warring nations.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'His _____ behavior at the meeting was completely inappropriate.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The scientist''s discovery was considered _____ in the field.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The politician''s _____ response avoided answering the question directly.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The committee decided to _____ the controversial proposal.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'Her _____ knowledge of literature impressed the professors.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The judge''s decision was based on _____ evidence.', 'FILL_BLANK', NOW(), NOW()),
(@config_id, 'The company''s _____ practices led to widespread criticism.', 'FILL_BLANK', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- The philosopher's _____ arguments challenged conventional wisdom. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The philosopher''s _____ arguments challenged conventional wisdom.'), 'cogent', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The philosopher''s _____ arguments challenged conventional wisdom.'), 'frivolous', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The philosopher''s _____ arguments challenged conventional wisdom.'), 'superficial', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The philosopher''s _____ arguments challenged conventional wisdom.'), 'incoherent', 4, false, NOW(), NOW()),
-- Her _____ nature made it difficult to predict her next move. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ nature made it difficult to predict her next move.'), 'predictable', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ nature made it difficult to predict her next move.'), 'mercurial', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ nature made it difficult to predict her next move.'), 'consistent', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ nature made it difficult to predict her next move.'), 'stable', 4, false, NOW(), NOW()),
-- The treaty aimed to _____ tensions between the warring nations. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The treaty aimed to _____ tensions between the warring nations.'), 'exacerbate', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The treaty aimed to _____ tensions between the warring nations.'), 'mitigate', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The treaty aimed to _____ tensions between the warring nations.'), 'intensify', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The treaty aimed to _____ tensions between the warring nations.'), 'perpetuate', 4, false, NOW(), NOW()),
-- His _____ behavior at the meeting was completely inappropriate. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ behavior at the meeting was completely inappropriate.'), 'decorous', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ behavior at the meeting was completely inappropriate.'), 'obstreperous', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ behavior at the meeting was completely inappropriate.'), 'respectful', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'His _____ behavior at the meeting was completely inappropriate.'), 'professional', 4, false, NOW(), NOW()),
-- The scientist's discovery was considered _____ in the field. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The scientist''s discovery was considered _____ in the field.'), 'mundane', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The scientist''s discovery was considered _____ in the field.'), 'seminal', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The scientist''s discovery was considered _____ in the field.'), 'trivial', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The scientist''s discovery was considered _____ in the field.'), 'obsolete', 4, false, NOW(), NOW()),
-- The politician's _____ response avoided answering the question directly. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The politician''s _____ response avoided answering the question directly.'), 'forthright', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The politician''s _____ response avoided answering the question directly.'), 'equivocal', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The politician''s _____ response avoided answering the question directly.'), 'candid', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The politician''s _____ response avoided answering the question directly.'), 'explicit', 4, false, NOW(), NOW()),
-- The committee decided to _____ the controversial proposal. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The committee decided to _____ the controversial proposal.'), 'endorse', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The committee decided to _____ the controversial proposal.'), 'abrogate', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The committee decided to _____ the controversial proposal.'), 'ratify', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The committee decided to _____ the controversial proposal.'), 'approve', 4, false, NOW(), NOW()),
-- Her _____ knowledge of literature impressed the professors. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ knowledge of literature impressed the professors.'), 'superficial', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ knowledge of literature impressed the professors.'), 'encyclopedic', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ knowledge of literature impressed the professors.'), 'limited', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'Her _____ knowledge of literature impressed the professors.'), 'rudimentary', 4, false, NOW(), NOW()),
-- The judge's decision was based on _____ evidence. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The judge''s decision was based on _____ evidence.'), 'circumstantial', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The judge''s decision was based on _____ evidence.'), 'incontrovertible', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The judge''s decision was based on _____ evidence.'), 'dubious', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The judge''s decision was based on _____ evidence.'), 'fabricated', 4, false, NOW(), NOW()),
-- The company's _____ practices led to widespread criticism. 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company''s _____ practices led to widespread criticism.'), 'ethical', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company''s _____ practices led to widespread criticism.'), 'reprehensible', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company''s _____ practices led to widespread criticism.'), 'exemplary', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'The company''s _____ practices led to widespread criticism.'), 'commendable', 4, false, NOW(), NOW());

-- 10. SENTENCE_ORDER - BEGINNER
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '초급 단어 조합하여 문장 만들기', 'BEGINNER', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'cat / the / is / sleeping', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'I / school / go / to', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'book / reading / a / am / I', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'weather / nice / today / is / the', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'my / happy / friend / is', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'dog / the / running / is', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'coffee / drink / I / morning / every', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'beautiful / flowers / are / the', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'watch / TV / evening / the / in / I', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'car / red / is / my', 'SENTENCE_ORDER', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- cat / the / is / sleeping 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat / the / is / sleeping'), 'The cat is sleeping', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat / the / is / sleeping'), 'Sleeping cat the is', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat / the / is / sleeping'), 'Is the cat sleeping', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'cat / the / is / sleeping'), 'Cat sleeping is the', 4, false, NOW(), NOW()),
-- I / school / go / to 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I / school / go / to'), 'School I go to', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I / school / go / to'), 'I go to school', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I / school / go / to'), 'Go I to school', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'I / school / go / to'), 'To school I go', 4, false, NOW(), NOW()),
-- book / reading / a / am / I 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book / reading / a / am / I'), 'I am reading a book', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book / reading / a / am / I'), 'Reading I am a book', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book / reading / a / am / I'), 'A book reading am I', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'book / reading / a / am / I'), 'Am I reading book a', 4, false, NOW(), NOW()),
-- weather / nice / today / is / the 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'weather / nice / today / is / the'), 'Weather nice today the is', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'weather / nice / today / is / the'), 'The weather is nice today', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'weather / nice / today / is / the'), 'Today nice weather is the', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'weather / nice / today / is / the'), 'Nice the weather today is', 4, false, NOW(), NOW()),
-- my / happy / friend / is 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'my / happy / friend / is'), 'My friend is happy', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'my / happy / friend / is'), 'Happy my friend is', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'my / happy / friend / is'), 'Friend my is happy', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'my / happy / friend / is'), 'Is my friend happy', 4, false, NOW(), NOW()),
-- dog / the / running / is 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog / the / running / is'), 'Dog the running is', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog / the / running / is'), 'The dog is running', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog / the / running / is'), 'Running dog the is', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'dog / the / running / is'), 'Is the dog running', 4, false, NOW(), NOW()),
-- coffee / drink / I / morning / every 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee / drink / I / morning / every'), 'Coffee drink I every morning', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee / drink / I / morning / every'), 'I drink coffee every morning', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee / drink / I / morning / every'), 'Every morning coffee I drink', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'coffee / drink / I / morning / every'), 'Drink I coffee morning every', 4, false, NOW(), NOW()),
-- beautiful / flowers / are / the 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'beautiful / flowers / are / the'), 'Beautiful flowers are the', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'beautiful / flowers / are / the'), 'The flowers are beautiful', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'beautiful / flowers / are / the'), 'Are the flowers beautiful', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'beautiful / flowers / are / the'), 'Flowers beautiful the are', 4, false, NOW(), NOW()),
-- watch / TV / evening / the / in / I 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'watch / TV / evening / the / in / I'), 'Watch TV evening in the I', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'watch / TV / evening / the / in / I'), 'I watch TV in the evening', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'watch / TV / evening / the / in / I'), 'In the evening watch TV I', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'watch / TV / evening / the / in / I'), 'TV watch I in evening the', 4, false, NOW(), NOW()),
-- car / red / is / my 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car / red / is / my'), 'Car red is my', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car / red / is / my'), 'My car is red', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car / red / is / my'), 'Red my car is', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'car / red / is / my'), 'Is my car red', 4, false, NOW(), NOW());

-- 11. SENTENCE_ORDER - INTERMEDIATE
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '중급 단어 조합하여 문장 만들기', 'INTERMEDIATE', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'team / successful / project / completed / the / a', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'innovative / company / solutions / develops / the', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'students / challenging / examination / the / passed', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'research / conducted / comprehensive / scientists / the', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'presentation / impressive / delivered / she / an', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'opportunity / excellent / provides / program / this / an', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'strategies / effective / implemented / management / the', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'analysis / detailed / requires / situation / this / a', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'collaboration / promotes / environment / work / the', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'achievement / remarkable / accomplished / they / a', 'SENTENCE_ORDER', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- team / successful / project / completed / the / a 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'team / successful / project / completed / the / a'), 'The team completed a successful project', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'team / successful / project / completed / the / a'), 'Successful project the team completed a', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'team / successful / project / completed / the / a'), 'A successful team completed the project', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'team / successful / project / completed / the / a'), 'Project successful a completed the team', 4, false, NOW(), NOW()),
-- innovative / company / solutions / develops / the 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovative / company / solutions / develops / the'), 'Innovative company solutions the develops', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovative / company / solutions / develops / the'), 'The company develops innovative solutions', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovative / company / solutions / develops / the'), 'Solutions innovative the company develops', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'innovative / company / solutions / develops / the'), 'Develops the company innovative solutions', 4, false, NOW(), NOW()),
-- students / challenging / examination / the / passed 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'students / challenging / examination / the / passed'), 'Students challenging examination passed the', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'students / challenging / examination / the / passed'), 'The students passed challenging examination', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'students / challenging / examination / the / passed'), 'The students passed the challenging examination', 3, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'students / challenging / examination / the / passed'), 'Passed the students challenging examination', 4, false, NOW(), NOW()),
-- research / conducted / comprehensive / scientists / the 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'research / conducted / comprehensive / scientists / the'), 'Research conducted comprehensive the scientists', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'research / conducted / comprehensive / scientists / the'), 'The scientists conducted comprehensive research', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'research / conducted / comprehensive / scientists / the'), 'Comprehensive research conducted the scientists', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'research / conducted / comprehensive / scientists / the'), 'Scientists the conducted comprehensive research', 4, false, NOW(), NOW()),
-- presentation / impressive / delivered / she / an 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'presentation / impressive / delivered / she / an'), 'Presentation impressive delivered an she', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'presentation / impressive / delivered / she / an'), 'She delivered an impressive presentation', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'presentation / impressive / delivered / she / an'), 'An impressive presentation she delivered', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'presentation / impressive / delivered / she / an'), 'Delivered she an impressive presentation', 4, false, NOW(), NOW()),
-- opportunity / excellent / provides / program / this / an 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity / excellent / provides / program / this / an'), 'Opportunity excellent provides program this an', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity / excellent / provides / program / this / an'), 'This program provides an excellent opportunity', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity / excellent / provides / program / this / an'), 'An excellent opportunity this program provides', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'opportunity / excellent / provides / program / this / an'), 'Provides this program an excellent opportunity', 4, false, NOW(), NOW()),
-- strategies / effective / implemented / management / the 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'strategies / effective / implemented / management / the'), 'Strategies effective implemented the management', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'strategies / effective / implemented / management / the'), 'The management implemented effective strategies', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'strategies / effective / implemented / management / the'), 'Effective strategies the management implemented', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'strategies / effective / implemented / management / the'), 'Implemented the management effective strategies', 4, false, NOW(), NOW()),
-- analysis / detailed / requires / situation / this / a 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'analysis / detailed / requires / situation / this / a'), 'Analysis detailed requires situation a this', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'analysis / detailed / requires / situation / this / a'), 'This situation requires a detailed analysis', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'analysis / detailed / requires / situation / this / a'), 'A detailed analysis this situation requires', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'analysis / detailed / requires / situation / this / a'), 'Requires this situation a detailed analysis', 4, false, NOW(), NOW()),
-- collaboration / promotes / environment / work / the 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration / promotes / environment / work / the'), 'Collaboration promotes environment the work', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration / promotes / environment / work / the'), 'The work environment promotes collaboration', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration / promotes / environment / work / the'), 'Work environment collaboration the promotes', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'collaboration / promotes / environment / work / the'), 'Promotes the work environment collaboration', 4, false, NOW(), NOW()),
-- achievement / remarkable / accomplished / they / a 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement / remarkable / accomplished / they / a'), 'Achievement remarkable accomplished a they', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement / remarkable / accomplished / they / a'), 'They accomplished a remarkable achievement', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement / remarkable / accomplished / they / a'), 'A remarkable achievement they accomplished', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'achievement / remarkable / accomplished / they / a'), 'Accomplished they a remarkable achievement', 4, false, NOW(), NOW());

-- 12. SENTENCE_ORDER - ADVANCED
INSERT INTO quiz_configs (user_id, quiz_name, level, created_at, updated_at) 
VALUES (1, '고급 단어 조합하여 문장 만들기', 'ADVANCED', NOW(), NOW());

SET @config_id = LAST_INSERT_ID();

INSERT INTO quizzes (config_id, content, quiz_type, created_at, updated_at) VALUES
(@config_id, 'paradigm / revolutionary / established / scientists / the / a / new', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'methodology / rigorous / investigation / requires / this / scientific', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'implications / far-reaching / discovery / the / has / profound', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'consensus / unanimous / committee / the / reached / a', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'perspectives / multifaceted / analysis / comprehensive / the / incorporates', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'phenomenon / unprecedented / observed / researchers / the / have / an', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'hypothesis / innovative / substantiated / empirical / was / the / evidence / by', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'synthesis / sophisticated / requires / problem / this / theoretical / a', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'trajectory / exponential / demonstrates / technology / an / this', 'SENTENCE_ORDER', NOW(), NOW()),
(@config_id, 'ramifications / significant / decision / strategic / the / yielded / has', 'SENTENCE_ORDER', NOW(), NOW());

INSERT INTO quiz_options (quiz_id, content, position, is_correct, created_at, updated_at) VALUES
-- paradigm / revolutionary / established / scientists / the / a / new 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'paradigm / revolutionary / established / scientists / the / a / new'), 'The scientists established a new revolutionary paradigm', 1, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'paradigm / revolutionary / established / scientists / the / a / new'), 'Revolutionary paradigm the scientists established a new', 2, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'paradigm / revolutionary / established / scientists / the / a / new'), 'A new paradigm revolutionary the scientists established', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'paradigm / revolutionary / established / scientists / the / a / new'), 'Established the scientists a revolutionary new paradigm', 4, false, NOW(), NOW()),
-- methodology / rigorous / investigation / requires / this / scientific 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'methodology / rigorous / investigation / requires / this / scientific'), 'Methodology rigorous investigation this scientific requires', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'methodology / rigorous / investigation / requires / this / scientific'), 'This scientific investigation requires rigorous methodology', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'methodology / rigorous / investigation / requires / this / scientific'), 'Rigorous methodology this scientific investigation requires', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'methodology / rigorous / investigation / requires / this / scientific'), 'Scientific investigation rigorous methodology this requires', 4, false, NOW(), NOW()),
-- implications / far-reaching / discovery / the / has / profound 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'implications / far-reaching / discovery / the / has / profound'), 'Implications far-reaching discovery has profound the', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'implications / far-reaching / discovery / the / has / profound'), 'The discovery has profound far-reaching implications', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'implications / far-reaching / discovery / the / has / profound'), 'Far-reaching implications the discovery has profound', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'implications / far-reaching / discovery / the / has / profound'), 'Discovery the has far-reaching profound implications', 4, false, NOW(), NOW()),
-- consensus / unanimous / committee / the / reached / a 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'consensus / unanimous / committee / the / reached / a'), 'Consensus unanimous committee reached a the', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'consensus / unanimous / committee / the / reached / a'), 'The committee reached a unanimous consensus', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'consensus / unanimous / committee / the / reached / a'), 'A unanimous consensus the committee reached', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'consensus / unanimous / committee / the / reached / a'), 'Reached the committee a unanimous consensus', 4, false, NOW(), NOW()),
-- perspectives / multifaceted / analysis / comprehensive / the / incorporates 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspectives / multifaceted / analysis / comprehensive / the / incorporates'), 'Perspectives multifaceted analysis the incorporates comprehensive', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspectives / multifaceted / analysis / comprehensive / the / incorporates'), 'The comprehensive analysis incorporates multifaceted perspectives', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspectives / multifaceted / analysis / comprehensive / the / incorporates'), 'Multifaceted perspectives the comprehensive analysis incorporates', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'perspectives / multifaceted / analysis / comprehensive / the / incorporates'), 'Analysis comprehensive incorporates the multifaceted perspectives', 4, false, NOW(), NOW()),
-- phenomenon / unprecedented / observed / researchers / the / have / an 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'phenomenon / unprecedented / observed / researchers / the / have / an'), 'Phenomenon unprecedented observed the researchers have an', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'phenomenon / unprecedented / observed / researchers / the / have / an'), 'The researchers have observed an unprecedented phenomenon', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'phenomenon / unprecedented / observed / researchers / the / have / an'), 'An unprecedented phenomenon the researchers have observed', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'phenomenon / unprecedented / observed / researchers / the / have / an'), 'Observed the researchers have an unprecedented phenomenon', 4, false, NOW(), NOW()),
-- hypothesis / innovative / substantiated / empirical / was / the / evidence / by 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'hypothesis / innovative / substantiated / empirical / was / the / evidence / by'), 'Hypothesis innovative substantiated empirical the evidence by was', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'hypothesis / innovative / substantiated / empirical / was / the / evidence / by'), 'The innovative hypothesis was substantiated by empirical evidence', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'hypothesis / innovative / substantiated / empirical / was / the / evidence / by'), 'Empirical evidence substantiated the innovative hypothesis was by', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'hypothesis / innovative / substantiated / empirical / was / the / evidence / by'), 'By empirical evidence the innovative hypothesis was substantiated', 4, false, NOW(), NOW()),
-- synthesis / sophisticated / requires / problem / this / theoretical / a 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'synthesis / sophisticated / requires / problem / this / theoretical / a'), 'Synthesis sophisticated requires this theoretical a problem', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'synthesis / sophisticated / requires / problem / this / theoretical / a'), 'This problem requires a sophisticated theoretical synthesis', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'synthesis / sophisticated / requires / problem / this / theoretical / a'), 'A sophisticated theoretical synthesis this problem requires', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'synthesis / sophisticated / requires / problem / this / theoretical / a'), 'Theoretical synthesis sophisticated a this problem requires', 4, false, NOW(), NOW()),
-- trajectory / exponential / demonstrates / technology / an / this 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'trajectory / exponential / demonstrates / technology / an / this'), 'Trajectory exponential demonstrates technology this an', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'trajectory / exponential / demonstrates / technology / an / this'), 'This technology demonstrates an exponential trajectory', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'trajectory / exponential / demonstrates / technology / an / this'), 'An exponential trajectory this technology demonstrates', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'trajectory / exponential / demonstrates / technology / an / this'), 'Demonstrates this technology an exponential trajectory', 4, false, NOW(), NOW()),
-- ramifications / significant / decision / strategic / the / yielded / has 문제 옵션들
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ramifications / significant / decision / strategic / the / yielded / has'), 'Ramifications significant decision the yielded strategic has', 1, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ramifications / significant / decision / strategic / the / yielded / has'), 'The strategic decision has yielded significant ramifications', 2, true, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ramifications / significant / decision / strategic / the / yielded / has'), 'Significant ramifications the strategic decision has yielded', 3, false, NOW(), NOW()),
((SELECT id FROM quizzes WHERE config_id = @config_id AND content = 'ramifications / significant / decision / strategic / the / yielded / has'), 'Strategic decision significant ramifications the has yielded', 4, false, NOW(), NOW());