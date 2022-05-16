
INSERT
IGNORE INTO `statut_social` (`id`, `code`, `libelle`)
VALUES (1, '1', 'Student'),
       (2, '2', 'Unemployed'),
       (3, '3', 'Employed');
--
-- Dumping data for table `categorie_prof`
--

INSERT
IGNORE INTO `categorie_prof` (`id`, `code`, `lesson_rate`, `level`)
VALUES (1, 'c1', '230.00', 'Junior'),
       (2, 'c2', '270.00', 'Middle'),
       (3, 'c3', '300.00', 'Senior');

--
-- Dumping data for table `categorie_section`
--

INSERT
IGNORE INTO `categorie_section` (`id`, `code`, `libelle`, `numero_order`, `super_categorie_section`)
VALUES (1, 'Additional', 'Warm up', 1, 160),
       (2, 'Additional', 'Get to know', 4, 160),
       (3, 'Additional', 'Discussion', 6, 160),
       (4, 'Additional', 'Life Story', 8, 160),
       (5, 'Additional', 'Games', 9, 160),
       (6, 'Study the information', "Let's practice", 5, 159),
       (7, 'Study the information', "Let's sum up", 7, 159),
       (8, 'Additional', 'Vocabulary', 3, 160),
       (9, 'Home Work Review', 'Home Work Review', 2, 159),
       (10, 'Additional', 'Role Play', 10, 160);

--
-- Dumping data for table `centre`
--

INSERT
IGNORE INTO `centre` (`id`, `description`, `libelle`, `log`, `password`, `ref`)
VALUES (83, NULL, 'American Center 1', NULL, NULL, 'a1'),
       (88, NULL, 'American Center 2', NULL, NULL, 'a2');

--


--
--
-- Dumping data for table `etat_inscription`
--

INSERT
IGNORE INTO `etat_inscription` (`id`, `libelle`, `ref`)
VALUES (3, 'refused', 'E3'),
       (2, 'Validated', 'E2'),
       (1, 'Pending', 'E1');



INSERT
IGNORE INTO `faq_type` (`id`, `libelle`, `destinataire`)
VALUES (1485, 'Common questions', 'teacher'),
       (1486, 'Salary', 'teacher'),
       (1487, 'Exams', 'student'),
       (1488, 'Diplome', 'student'),
       (1, 'DE Class Support', 'teacher'),
       (2, 'Teachers effectiveness', 'teacher'),
       (3, 'Methodological care', 'teacher');


--
-- Dumping data for table `groupe_etude`
--

INSERT
IGNORE INTO `groupe_etude` (`id`, `description`, `libelle`, `nombre_etudiant`)
VALUES (25908, NULL, 'Group for 10 person', 10),
       (25907, NULL, 'Group for 5 person', 5),
       (25906, NULL, 'Group for 2 person', 2),
       (25905, NULL, 'Group for 1 person', 1);



INSERT
IGNORE INTO `interet_etudiant` (`id`, `code`, `libelle`)
VALUES (1, '1', 'Discussing with family'),
       (2, '2', 'Boosting my studies '),
       (3, '3', 'Self cultivation'),
       (4, '4', 'Boosting my career\r\n'),
       (5, '5', 'Travel'),
       (6, '6', 'Other');



INSERT
IGNORE INTO `niveau_etude` (`id`, `code`, `libelle`)
VALUES (1, '1', 'Secondary'),
       (2, '2', 'Primary '),
       (3, '3', 'College'),
       (4, '4', 'Other');

--
-- Dumping data for table `pack_student`
--

INSERT
IGNORE INTO `pack_student` (`id`, `code`, `for_groupe`, `nombre_cours`, `prix`, `libelle`, `total_students`)
VALUES (25910, 'P2', b'0', 30, 400, 'Pack 2', 0),
       (25909, 'P1', b'0', 20, 300, 'Pack 1', 0),
       (25911, 'P3', b'0', 50, 450, 'Pack 3', 0);



INSERT
IGNORE INTO `role` (`id`, `authority`)
VALUES (1, 'ROLE_ADMIN'),
       (2, 'ROLE_PROF'),
       (3, 'ROLE_STUDENT');


-- Dumping data for table `section`
--

INSERT
IGNORE INTO `skill` (`id`, `code`, `libelle`)
VALUES (1, NULL, 'Reading'),
       (2, NULL, 'Dancing'),
       (3, NULL, 'Playing video games'),
       (4, NULL, 'Listening music'),
       (5, NULL, 'Sewing'),
       (6, NULL, 'Cook'),
       (7, NULL, 'Playing tennis'),
       (8, NULL, 'Horse riding'),
       (9, '', 'Doing sport'),
       (10, NULL, 'Playing football'),
       (11, NULL, 'Biking'),
       (12, NULL, 'Travel'),
       (13, NULL, 'Hunting'),
       (14, NULL, 'Fishing'),
       (15, NULL, 'Hiking '),
       (16, NULL, 'Sailing'),
       (17, NULL, 'Swimming'),
       (18, NULL, 'Gardening'),
       (19, NULL, 'Running'),
       (20, NULL, 'Scuba diving'),
       (21, NULL, 'Other');



INSERT
IGNORE INTO `super_categorie_section` (`id`, `code`, `libelle`)
VALUES (159, 'Obligatory', 'Obligatory'),
       (160, 'Additional', 'Additional');



INSERT
IGNORE INTO `type_de_question` (`id`, `lib`, `ref`)
VALUES (2, 'Write it up', 't2'),
       (11675, 'Describe what you see', 't7'),
       (11701, 'Read and add new words', 't8'),
       (6, 'Write the correct form', 't6'),
       (5, 'True or False', 't5'),
       (4, 'Correct the mistake', 't4'),
       (3, 'Translate the phrase', 't3'),
       (1, 'Choose the correct alternative', 't1'),
       (23386, 'Watch and add new words', 't9'),
       (7, 'Put words to gap', 't10'),
       (8, 'Put in order', 't11'),
       (9, 'Word By Word', 't12'),
       (10, 'Drag and Drop', 't13');

--
-- Dumping data for table `type_home_work`
--

INSERT
IGNORE INTO `type_home_work` (`id`, `lib`)
VALUES (5, 'Watch it'),
       (4, 'Phrasebook'),
       (3, 'Write it Up'),
       (2, "Let\'s Practice"),
       (1, 'Reading'),
       (6, 'Life Story');






INSERT
IGNORE INTO `user` (`dtype`, `id`, `account_non_expired`, `account_non_locked`, `addresse`, `age`, `credentials_non_expired`, `enabled`, `image`, `nom`, `numero`, `password`, `prenom`, `username`, `ville`, `ref`, `etat_etudiant_schedule`, `parcours`, `categorie_prof`, `role`, `group_option`, `teacher_locality`, `groupe_etude`, `country`, `date_naissance`, `level_max`, `level_min`, `pack_student`, `fonction`, `interet_etudiant`, `niveau_etude`, `statut_social`, `langue`, `skill`, `skype`, `type_teacher`) VALUES
('Admin', 1, true, true, 'marrakech', 23, true, true, 'http://localhost:8036/user/image/admin@gmail.com/admin@gmail.com.jpg', 'Elmoudene', '0605120314', '$2a$10$VW1CnG0HpYa5eiGikTlzQOWjAjwjA/ZptHA09uD.LlBE/HWc3YiqC', 'Youssef', 'admin@gmail.com', 'AIT OURIR', NULL, NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 3, true, true, NULL, 0, true, true, 'http://localhost:8036/user/image/teacher@gmail.com/teacher@gmail.com.jpg', 'teacher', '0605120314', '$2a$10$xpy0yulabuTwf8ikJM8j5eM337f81aETiLSRSHsvPaHhDqyUh6bDm', 'teacher', 'teacher@gmail.com', NULL, NULL, NULL, NULL, 1, 'TEACHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 4, true, true, 'Marrakech', 30, true, true, 'http://localhost:8036/user/image/prof@gmail.com/prof@gmail.com.jpg', 'prof', '0613203310', '$2a$10$I7o4zmXgcErHbiX91EPcW.rc2WPlecYuryGmfarBpHL/ZNyQDBRza', 'prof', 'prof@gmail.com', NULL, NULL, NULL, NULL, 1, 'TEACHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Admin', 7, true, true, 'Marrakech', 22, true, true, 'http://localhost:8036/user/image/zouani@gmail.com/zouani@gmail.com.jpg', 'Zouani', '0760102030', '$2a$10$G6z1mCKHaDMLUZv9RiK1/OwjvXfK4tnNm/DMA.Wsm7KEadi4GL/Ua', 'Younes', 'zouani@gmail.com', 'Marrakech', NULL, NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 41, true, true, NULL, 0, true, true, 'http://localhost:8036/user/image/profile/teacherahmed@gmail.com', 'Teacher', '0605120314', '$2a$10$Njdjp6xPcvfKc3Agfi1NKOtV5BAYIaD44YwXcYpg4SrS7Yk5Lx8oy', 'Ahmed', 'teacherahmed@gmail.com', NULL, NULL, NULL, NULL, 1, 'TEACHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



