-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 30, 2021 at 09:10 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learn`
--

-- --------------------------------------------------------

--
-- Table structure for table `calendrier_prof`
--

CREATE TABLE `calendrier_prof` (
  `id` bigint(20) NOT NULL,
  `end_recur` datetime DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `start_recur` datetime DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `calendrier_prof`
--

INSERT INTO `calendrier_prof` (`id`, `end_recur`, `end_time`, `ref`, `start_recur`, `start_time`, `etudiant`, `prof`) VALUES
(4076, '2021-09-09 00:00:00', '16:00:00', 'opkopko', '2021-09-09 00:00:00', '14:00:00', 5, 3),
(4450, '2021-10-06 23:00:00', '12:00:00', 'IE5377', '2021-10-07 18:12:11', '10:30:00', 5, 4),
(4451, '2021-10-07 23:00:00', '12:00:00', 'ir45', '2021-10-07 23:00:00', '10:00:00', 5, 3),
(4452, '2021-10-10 23:00:00', '14:00:00', 'I3436FD', '2021-10-10 23:00:00', '12:00:00', 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `categorie_prof`
--

CREATE TABLE `categorie_prof` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `lesson_rate` decimal(19,2) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie_prof`
--

INSERT INTO `categorie_prof` (`id`, `code`, `lesson_rate`, `level`) VALUES
(1, 'c1', '230.00', 'Junior'),
(2, 'c2', '270.00', 'Middle'),
(3, 'c3', '300.00', 'Senior');

-- --------------------------------------------------------

--
-- Table structure for table `categorie_section`
--

CREATE TABLE `categorie_section` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero_order` int(11) DEFAULT NULL,
  `super_categorie_section` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie_section`
--

INSERT INTO `categorie_section` (`id`, `code`, `libelle`, `numero_order`, `super_categorie_section`) VALUES
(1, 'Describe what you see', 'Warm up', 1, 159),
(2, 'Study the information', 'Grammar-1', 2, 159),
(3, 'Time to talk', 'Discussion', 5, 159),
(4, 'Watch the video', 'Life story', 6, 160),
(5, 'Let\'s have fun!', 'Games', 7, 159),
(1951, 'Study the information', 'Grammar-2', 3, 159),
(1952, 'Study the information', 'Grammar-3', 4, 159),
(6, NULL, 'Vocabulary', 8, 159);

-- --------------------------------------------------------

--
-- Table structure for table `centre`
--

CREATE TABLE `centre` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `centre`
--

INSERT INTO `centre` (`id`, `description`, `libelle`, `log`, `password`, `ref`) VALUES
(83, NULL, 'American Center 1', NULL, NULL, 'a1'),
(88, NULL, 'American Center 2', NULL, NULL, 'a2');

-- --------------------------------------------------------

--
-- Table structure for table `class_room`
--

CREATE TABLE `class_room` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `responsable` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_room`
--

INSERT INTO `class_room` (`id`, `description`, `libelle`, `responsable`) VALUES
(1, 'classe 1', 'Writting', 15),
(2, 'classe 2', 'Reading', 15),
(3, 'classe 3', 'Communication', 15);

-- --------------------------------------------------------

--
-- Table structure for table `cours`
--

CREATE TABLE `cours` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` longtext,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_link_en_cours` int(11) NOT NULL,
  `nombre_link_finalise` int(11) NOT NULL,
  `nombre_section_en_cours` int(11) NOT NULL,
  `nombre_section_finalise` int(11) NOT NULL,
  `numero_order` int(11) NOT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `etat_cours` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cours`
--

INSERT INTO `cours` (`id`, `code`, `description`, `image`, `libelle`, `nombre_link_en_cours`, `nombre_link_finalise`, `nombre_section_en_cours`, `nombre_section_finalise`, `numero_order`, `parcours`, `etat_cours`) VALUES
(567, NULL, NULL, NULL, 'fr', 5, 0, 1, 4, 18, 6, NULL),
(566, NULL, NULL, NULL, 'eng', 5, 0, 1, 4, 17, 6, NULL),
(101, 'Intro lesson', '', '', 'Intro lesson', 0, 5, 0, 5, 1, 5, NULL),
(41, '', '', '', 'More about you', 0, 5, 1, 4, 20, 5, NULL),
(40, '', '', '', 'Personal profile', 0, 5, 1, 4, 19, 5, NULL),
(39, '', '', '', 'When youâ€™re free', 0, 5, 1, 4, 18, 5, NULL),
(38, '', '', '', 'Leisure activities', 0, 5, 1, 4, 17, 5, NULL),
(37, '', '', '', 'Just another day', 0, 5, 1, 4, 16, 5, NULL),
(36, '', '', '', 'koko', 1, 4, 1, 4, 36, 5, NULL),
(35, '', '', '', 'lolo', 5, 0, 4, 1, 35, 7, NULL),
(34, '', '', '', 'For the geeks', 0, 5, 1, 4, 26, 5, NULL),
(33, '', '', '', 'Technology', 0, 5, 1, 4, 25, 5, NULL),
(32, '', '', '', 'More occasions', 0, 5, 1, 4, 24, 5, NULL),
(31, '', '', '', 'Events', 0, 5, 1, 4, 23, 5, NULL),
(30, '', '', '', 'Get emotional', 0, 5, 1, 4, 22, 5, NULL),
(29, '', '', '', 'Feel good', 0, 5, 1, 4, 21, 5, NULL),
(28, '', '', '', 'A day in a life', 0, 5, 1, 4, 15, 5, NULL),
(27, '', '', '', 'No place like home', 0, 5, 1, 4, 14, 5, NULL),
(26, '', '', '', 'Home sweet home', 1, 4, 1, 4, 13, 5, NULL),
(25, '', '', '', 'Grab a bite', 0, 5, 1, 4, 12, 5, NULL),
(24, '', '', '', 'Food you have', 0, 5, 1, 4, 11, 5, NULL),
(23, '', '', '', 'Socializing', 5, 0, 1, 4, 23, 601, NULL),
(22, '', '', '', 'Social Networking', 5, 0, 1, 4, 22, 601, NULL),
(21, '', '', '', 'Special Events', 5, 0, 1, 4, 21, 601, NULL),
(20, '', '', '', 'Special occasions', 5, 0, 1, 4, 20, 601, NULL),
(19, '', '', '', 'Other celebrations', 5, 0, 1, 4, 19, 601, NULL),
(18, '', '', '', 'Holidays', 5, 0, 1, 4, 18, 601, NULL),
(17, '', '', '', 'More about tech', 5, 0, 1, 4, 17, 601, NULL),
(16, '', '', '', 'Modern devices and appliances', 5, 0, 1, 4, 16, 601, NULL),
(15, '', '', '', 'Mates', 5, 0, 1, 4, 15, 601, NULL),
(14, '', '', '', 'Friends', 5, 0, 1, 4, 14, 601, NULL),
(13, '', '', '', 'Intro lesson', 0, 5, 0, 5, 1, 601, NULL),
(12, '', '', '', 'More in common', 0, 5, 1, 4, 10, 5, NULL),
(11, '', '', '', 'Same or different', 5, 0, 1, 4, 9, 5, NULL),
(10, '', '', '', 'More relatives?', 1, 4, 2, 3, 8, 5, NULL),
(9, '', '', '', 'Family and friends', 0, 5, 1, 4, 7, 5, NULL),
(8, '', '', '', 'More people to know', 0, 5, 1, 4, 6, 5, NULL),
(7, '', '', '', ' Meeting people', 0, 5, 1, 4, 5, 5, NULL),
(6, '', '', 'https://satoms.com/wp-content/uploads/2020/07/English-Course-Online.jpg', 'Let me introduce myself', 0, 5, 1, 4, 4, 5, NULL),
(5, '', '', 'https://cdn.cleverism.com/wp-content/uploads/2020/04/Top-10-Courses-to-Learn-English-Online-for-Beginners-and-Advanced-Students.jpg', 'Let\'s get acquainted', 0, 5, 0, 5, 3, 5, NULL),
(2, 'Say Hello!', '', 'https://satoms.com/wp-content/uploads/2020/07/English-Course-Online.jpg', 'Say Hello!!', 0, 5, 0, 5, 2, 5, NULL),
(599, NULL, NULL, NULL, '', 6, 0, 1, 5, 50, 6, NULL),
(600, NULL, NULL, NULL, '', 6, 0, 1, 5, 51, 6, NULL),
(627, NULL, NULL, NULL, '', 5, 1, 1, 5, 3, 601, NULL),
(628, NULL, NULL, NULL, '', 5, 0, 1, 4, 4, 601, NULL),
(629, NULL, NULL, NULL, '', 5, 0, 1, 4, 5, 601, NULL),
(631, NULL, NULL, NULL, '', 5, 0, 1, 4, 7, 601, NULL),
(643, NULL, NULL, NULL, '', 0, 6, 2, 4, 6, 7, NULL),
(644, NULL, NULL, NULL, '', 0, 6, 2, 4, 7, 7, NULL),
(651, NULL, NULL, NULL, '', 0, 6, 1, 5, 14, 7, NULL),
(652, NULL, NULL, NULL, '', 0, 6, 1, 5, 15, 7, NULL),
(653, NULL, NULL, NULL, 'hh', 0, 5, 1, 4, 16, 7, NULL),
(660, NULL, NULL, NULL, '', 0, 6, 1, 5, 23, 7, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dictionary`
--

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL,
  `definition` varchar(255) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dictionary`
--

INSERT INTO `dictionary` (`id`, `definition`, `word`, `etudiant`) VALUES
(3950, 'يوم', 'day', 5),
(4151, 'بلد', 'country', 5),
(4437, 'اسم', 'name', 5),
(4670, 'مفضل', 'favourite ', 38),
(4672, 'هاتف', 'phone ', 38),
(4675, 'مفضل', 'favourite ', 21),
(4676, 'بلد', 'country ', 21),
(4677, 'سعيد', 'happy', 21),
(4679, 'اسم العائلة', 'surname', 21),
(4680, 'سفر', 'travelling', 21),
(4681, 'تهجى', 'spell ', 21),
(4683, 'الموسيقى', 'music ', 38),
(4688, 'هاتف', 'phone ', 39),
(4691, 'مفضل', 'favourite ', 39),
(4694, 'من', 'from', 39),
(4695, 'المدينة', 'city ', 39),
(4697, 'خليل', 'friend ', 39),
(4710, 'مرحباً', 'from ', 22);

-- --------------------------------------------------------

--
-- Table structure for table `etat_etudiant`
--

CREATE TABLE `etat_etudiant` (
  `id` bigint(20) NOT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `etat_number` bigint(20) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_class` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `nationnalité` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `schedule1` varchar(255) DEFAULT NULL,
  `schedule2` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nbr_class` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etat_etudiant`
--

INSERT INTO `etat_etudiant` (`id`, `etat`, `etat_number`, `first_name`, `last_class`, `last_name`, `nationnalité`, `reference`, `schedule1`, `schedule2`, `username`, `nbr_class`) VALUES
(27, 'active', 1, 'Anouar', 'Feb 3 2021', 'Lamghari', NULL, 'stud-1', 'Sat 12:00', 'Tue 16:00', 'stud021alc', '2'),
(28, 'onbreak', 3, 'mohssine', 'May 4 2021', 'morchid', NULL, 'stud-2', 'Sun 08:45', 'Fri 10:45', 'stud022alc', '1'),
(29, 'start', 2, 'oussama', 'May 6 2021', 'bentaouil', NULL, 'stud-3', 'Fri 21:00', 'Tue 21:00', 'stud-023alc', '6'),
(30, 'active', 1, 'Hajar', 'Feb 17 2021', 'kati', NULL, 'stud-4', 'Sun 08:45', 'Sun 11:00', 'stud024alc', '5'),
(31, 'start', 2, 'meryam', 'Feb 10 2021', 'louhaidy', NULL, 'stud-5', 'Tue 12:00', 'Sat 16:00', 'stud025alc', '9'),
(32, 'active', 1, 'nourdine', 'Jun 6 2021', 'lemrabet', NULL, 'stud-6', 'Thu 10:00', 'Wed  10:00', 'stud025alc', '4'),
(33, 'onbreak', 3, 'adil', 'May 7 2021', 'taarabt', NULL, 'stud-7', 'Wed 12:00', 'Fri 09:00', 'stud027alc', '5'),
(34, 'onbreak', 3, 'yassine', 'Feb 6 2021', 'Enessayri', NULL, 'stud-8', 'Sun 08:30', 'Sun 11:00', 'stud028', '7');

-- --------------------------------------------------------

--
-- Table structure for table `etat_etudiant_schedule`
--

CREATE TABLE `etat_etudiant_schedule` (
  `id` bigint(20) NOT NULL,
  `couleur` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etat_etudiant_schedule`
--

INSERT INTO `etat_etudiant_schedule` (`id`, `couleur`, `libelle`, `ref`) VALUES
(1, 'green', 'Active', 'c1'),
(2, 'red', 'Start', 'c2');

-- --------------------------------------------------------

--
-- Table structure for table `etat_inscription`
--

CREATE TABLE `etat_inscription` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etat_inscription`
--

INSERT INTO `etat_inscription` (`id`, `libelle`, `ref`) VALUES
(3, 'refused', 'E3'),
(2, 'Validated', 'E2'),
(1, 'Pending', 'E1');

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_class_room`
--

CREATE TABLE `etudiant_class_room` (
  `id` bigint(20) NOT NULL,
  `class_room` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etudiant_class_room`
--

INSERT INTO `etudiant_class_room` (`id`, `class_room`, `etudiant`) VALUES
(917, 3, 5),
(916, 2, 5),
(915, 2, 5),
(911, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_cours`
--

CREATE TABLE `etudiant_cours` (
  `id` bigint(20) NOT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etudiant_cours`
--

INSERT INTO `etudiant_cours` (`id`, `cours`, `etudiant`, `date_fin`, `payer`, `prof`) VALUES
(4487, 566, 20, '2021-11-08 21:27:42', '0', 3),
(4489, 567, 20, '2021-11-08 21:40:28', '0', 3),
(4492, 101, 20, '2021-11-08 21:43:45', '0', 3),
(4494, 101, 22, '2021-11-10 14:50:09', '0', 3),
(4496, 2, 20, '2021-11-10 14:51:11', '0', 3),
(4498, 566, 21, '2021-11-10 14:59:31', '0', 3),
(4500, 599, 21, '2021-11-10 15:05:51', '0', 3),
(4510, 101, 20, '2021-11-19 12:53:50', '0', 4),
(4512, 2, 22, '2021-11-19 14:22:01', '0', 3),
(4514, 2, 20, '2021-11-19 20:11:45', '0', 4),
(4519, 101, 23, '2021-11-20 21:19:52', '0', 4),
(4521, 2, 23, '2021-11-20 21:27:05', '0', 4),
(4545, 101, 24, '2021-11-24 18:44:30', '0', 3),
(4556, 566, 26, '2021-11-30 20:42:45', '0', 3),
(4567, 2, 27, '2021-12-01 17:40:03', '0', 4),
(4571, 2, 28, '2021-12-01 17:47:49', '0', 3),
(4578, 2, 30, '2021-12-01 18:39:32', '0', 3),
(4585, 566, 31, '2021-12-01 19:29:33', '0', 3),
(4620, 2, 38, '2021-12-07 21:18:48', '0', 3),
(4629, 101, 38, '2021-12-08 16:24:05', '0', 3),
(4673, 101, 21, '2021-12-13 18:25:39', '0', 4),
(4686, 2, 39, '2021-12-13 19:39:04', '0', 4),
(4689, 101, 39, '2021-12-13 19:49:58', '0', 4),
(4692, 5, 39, '2021-12-13 19:52:49', '0', 4),
(4784, 101, 36, '2021-12-17 22:22:25', '0', 3),
(4820, 2, 36, '2021-12-18 20:29:40', '0', 3),
(5025, 5, 22, '2021-12-21 19:46:56', '0', 3),
(5487, 101, 28, '2021-12-29 17:47:05', '0', 3),
(5495, 5, 28, '2021-12-29 17:51:14', '0', 3),
(5532, 101, 27, '2021-12-30 13:22:16', '0', 4);

-- --------------------------------------------------------

--
-- Table structure for table `etudiant_review`
--

CREATE TABLE `etudiant_review` (
  `id` bigint(20) NOT NULL,
  `review` int(11) NOT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_review` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `etudiant_review`
--

INSERT INTO `etudiant_review` (`id`, `review`, `cours`, `etudiant`, `prof`, `comment`, `date_review`) VALUES
(4491, 0, 567, 20, 3, 'hello', '2021-11-08 21:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` bigint(20) NOT NULL,
  `description` varchar(2550) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `description`, `libelle`, `faq_type`) VALUES
(4211, 'In the school, all teachers must teach lessons with the camera on. Video communication with the student provides a full-fledged lesson, eye contact and involvement, as well as the ability to see the student\'s reaction to the completion of a particular task.', 'Can I turn on / off the web-camera when working in ED class?', 1485),
(4210, 'You must find alternatives as quickly as possible and be ready to teach the lesson. As a fallback, all teachers must have 3G Internet connected, which will make it possible to report what happened to you. The canceled lesson in this case must be completed outside the main schedule at a time convenient for the student.', 'I have a problem with electricity or internet, what to do?', 1485),
(4208, 'We strongly recommend all our teachers to check the mailbox, Personal Account and the list of students at least 3 times a day in order to respond to possible requests from a personal curator and update information about your students.', 'How often should I check My Account and email?', 1485),
(4209, 'Schedule of your main curator:\nMonday - Friday 10:00 - 19:00 GMT +3\nWorking hours of the duty curator:\nMonday - Friday 8:00 - 10:00 GMT +3, 19:00 - 22:00 GMT +3\nSaturday - Sunday 10:00 - 16:00 GMT +3\n', 'What is my curator\'s work schedule?', 1485),
(4212, 'To report a technical issue during the lesson\n- clicking on the \"light\" icon at the bottom right will open a popup with a field for filling\nTo report a technical issue outside of the lesson\n- clicking on the \"Headteacher\'s Help\" button will open a form for contacting a personal curator\n', 'Where to write if there were technical problems during the lesson?', 1),
(4213, '1. Check the browser through which you entered the EDClass. This must be the latest version of Chrome\n2. Make sure that the entrance to the lesson is made from your LC through the Enter Lesson button of the corresponding student\n3. The student must be online and you and the student are in the same lesson\n4. Make sure you and the student have only one tab open for EDClass. If there are several of them, close the extra ones.\n5. Refresh the browser page where Edclass is open\n6. Clear the cache and remove unnecessary permissions\n7. Exit Edclass and then from the LC. Log in to your account again. The same is recommended for the student.\n8. Enter the lesson with the student through the Enter Lesson button\n', 'No Start / Finish button lesson', 1),
(4214, '1. Follow the link http://www.speedtest.net/ru\n2. On the page that opens, click the Start button and wait until the values for three parameters appear on the screen: Ping, Download and Download.\n3. The Edclass platform works well if the Download and Download indicators are not less than 5 Mb / sec (megabits per second) each. Otherwise, contact your ISP to increase the speed.\n', 'How do I check the speed of my internet connection?', 1),
(4215, 'Under the terms of the contract, the approved schedule is assigned to the student for 14 days. If a student has not attended classes for more than 14 days, he goes to the on hold tab and his schedule is automatically deleted by the system. A new student can be assigned to the vacated cells. Students who are on hold should be kept in touch and returned to class.', 'Why is the student missing from my schedule?', 1),
(4216, '1. Prepare for a related lesson with a student using the DE Courses Preview\n2. Check the quality of your Internet connection in advance (see the faq DEClass support section)\n3. Test the operation of the headset and microphone in the Skype application at least 5 minutes before the lesson.\n4. Before the start of the lesson, write to your student on Skype: “Hello, (student\'s name)! We start in ___ minutes. \"\n5. Clearly on time to start the lesson with a Skype call and then go with the student to the corresponding DEClass lesson\n', 'What should you do before starting the lesson?', 2),
(4217, 'The transfer / cancellation of the lesson by the teacher is not allowed. The exceptions are extreme cases of impossibility to conduct a lesson (illness, natural disasters that resulted in a lack of communication, ...), which must be agreed with the curator.', 'When, as a teacher, can I reschedule a lesson?', 2),
(4218, 'The student cancels the lesson according to the rule 12 hours or more in advance\nwe DO NOT write off the lesson\nWe agree with the student to conduct the canceled lesson outside the schedule within 10 days from the date of cancellation, in order to maintain the intensity of the lessons. After the lesson, the lesson can be written off.\nthe student is allowed to make 2 such cancellations per month\nNB! for corporate students, there is a rule of cancellation of classes 6 hours in advance.\nThe student cancels the lesson NOT according to the rule (less than 12 hours) or does not come to the lesson and does not warn anyone\nthe first case - we DO NOT write off the lesson, remind the rules and schedule the lesson to be worked out out of schedule\nthe second case - we write off the lesson as ABSENT, inform the student about it, remind the rules of cancellation and rescheduling of lessons. We agree with the student to conduct an excellent lesson outside the schedule within 10 days to maintain the intensity of the classes. We DO NOT write off the practice of the lesson.\nNB! If a student cancels a lesson twice in a row not according to the rules or does not attend the lesson at all without warning, we write off the lesson from the balance ONCE as ABSENT and the student loses the right to practice. In order to avoid the third absence in a row - revision of the student\'s schedule with the help of a supervisor.\nIMPORTANT!\nAs an ABSENT lesson is not debited two or more times in a row! This is contrary to the school\'s rules for dealing with clients. We turn to the curator for help.\n', 'Cancellation of classes by students. Teacher actions', 2),
(4219, 'You must notify the school at least 2 weeks before the suspension of lessons.\nTo go on vacation, you need to follow a few simple steps:\n1. Coordinate with the personal curator the work of students for the period of vacation (working off or replacement).\n2. In case of replacement - recommend a replacement teacher to the student (together with the curator)\n3. Upon return, resume work with all students', 'How do I go on vacation?', 1486),
(4220, 'Upgrading, that is, the transition of a teacher from Junior to Middle, from Middle to Senior, is possible if 6 (six) full months have passed since the start of his work in the Company or since the moment when the teacher was assigned his current grade. Revision of the teacher\'s grade will be carried out if the necessary criteria are met according to the new grade to the current one. These criteria are specified in the addendum to the employment agreement that you entered into with the company at the start of work.', 'How can you increase your lesson rate?', 1486),
(4221, 'The teacher sees the actual amount of bonuses accrued for the current month on the last day of the month. During the month, the figure can change both up and down. It is most influenced by the Class Average bonus, which takes its final value only based on the total of all classes held in a month for all the teacher\'s students.', 'When are bonuses for Workload, Lifetime and Class Average credited?', 1486),
(4222, 'Warm Up, Homework review, Vocabulary, Get to know, Let\'s practice, Discussion are required in every lesson. Role-play, Life story and Games - alternate, which allows you to variably use sections of the lesson in each subsequent lesson, as a result, to make the learning process more interesting and active.', 'Should all sections of the lesson be completed in one lesson? ', 3),
(4223, 'The certificate is in the student\'s Personal Account in the English via Skype section after the final lesson. It is automatically unlocked upon completion of all lessons of the course and the final test.', 'How can a student get a Certificate?', 3),
(4224, 'Quizzes and independent work are essential to consolidate a student\'s progress. After passing the block of topics, it is necessary to control the student\'s knowledge using test tasks that are in the Homework section.', 'Knowledge control. Do you need a test to consolidate the passed topic?', 3),
(5056, NULL, 'What s you name', 1486),
(5057, 'youssef', 'What you name', 1486);

-- --------------------------------------------------------

--
-- Table structure for table `faq_etudiant`
--

CREATE TABLE `faq_etudiant` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `admin` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `faq_prof`
--

CREATE TABLE `faq_prof` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `admin` bigint(20) DEFAULT NULL,
  `faq_type` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq_prof`
--

INSERT INTO `faq_prof` (`id`, `description`, `libelle`, `admin`, `faq_type`, `prof`) VALUES
(1767, 'rep1', 'qst1', 1775, 1485, 3);

-- --------------------------------------------------------

--
-- Table structure for table `faq_type`
--

CREATE TABLE `faq_type` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `destinataire` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faq_type`
--

INSERT INTO `faq_type` (`id`, `libelle`, `destinataire`) VALUES
(1485, 'Common questions', 'teacher'),
(1486, 'Salary', 'teacher'),
(1487, 'Exams', 'student'),
(1488, 'Diplome', 'student'),
(1, 'DE Class Support', 'teacher'),
(2, 'Teachers effectiveness', 'teacher'),
(3, 'Methodological care', 'teacher');

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etude`
--

CREATE TABLE `groupe_etude` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_etudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etude`
--

INSERT INTO `groupe_etude` (`id`, `description`, `libelle`, `nombre_etudiant`) VALUES
(4608, 'this group for 5 person ', 'Group for 5 students', 5),
(4600, NULL, 'Group for 3', 3),
(4599, NULL, 'Group for 2', 2),
(4598, NULL, 'Group for 1', 1),
(4609, 'this group for 4 student', 'Group of 4 student', 4),
(4613, '', 'Group of 6 students', 6);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etude_detail`
--

CREATE TABLE `groupe_etude_detail` (
  `id` bigint(20) NOT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etudiant`
--

CREATE TABLE `groupe_etudiant` (
  `id` bigint(20) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `niveau` varchar(255) DEFAULT NULL,
  `nombre_place` bigint(20) DEFAULT NULL,
  `nombre_place_non_vide` bigint(20) DEFAULT NULL,
  `nombre_placevide` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etudiant`
--

INSERT INTO `groupe_etudiant` (`id`, `date_debut`, `date_fin`, `libelle`, `niveau`, `nombre_place`, `nombre_place_non_vide`, `nombre_placevide`, `groupe_etude`, `parcours`) VALUES
(4602, NULL, NULL, 'Group-student-130', NULL, 1, 1, 0, 4598, 5),
(4611, '0007-06-13 00:00:00', '0028-12-12 00:00:00', 'Group 5', NULL, 5, 4, 1, 4608, 5),
(4614, '0007-06-13 00:00:00', '0006-11-12 00:00:00', 'Group-6', NULL, 5, 2, 3, 4613, 6),
(4622, NULL, NULL, 'Group-7', NULL, 6, 2, 4, 4613, 5),
(4742, '0007-06-13 00:00:00', '0033-08-14 00:00:00', 'Group-8', NULL, 2, 0, 2, 4599, 5),
(5556, NULL, NULL, 'Group-aicha', NULL, NULL, 1, 0, 4598, 5);

-- --------------------------------------------------------

--
-- Table structure for table `groupe_etudiant_detail`
--

CREATE TABLE `groupe_etudiant_detail` (
  `id` bigint(20) NOT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groupe_etudiant_detail`
--

INSERT INTO `groupe_etudiant_detail` (`id`, `etudiant`, `groupe_etudiant`) VALUES
(4603, 36, 4602),
(4612, 38, 4611),
(4615, 26, 4614),
(4623, 38, 4622),
(4624, 22, 4622),
(4764, 40, 4611),
(4783, 36, 4611),
(5055, 38, 4614),
(5557, 22, 5556);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(5596),
(1);

-- --------------------------------------------------------

--
-- Table structure for table `home_work`
--

CREATE TABLE `home_work` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `url_image` varchar(255) DEFAULT NULL,
  `url_video` varchar(255) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL,
  `type_home_work` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_work`
--

INSERT INTO `home_work` (`id`, `libelle`, `question`, `url_image`, `url_video`, `quiz`, `section`, `type_home_work`) VALUES
(4523, 'Fill in the gaps', NULL, NULL, NULL, NULL, 649, NULL),
(4775, 'Describe what you see', NULL, NULL, NULL, NULL, 640, NULL),
(4515, 'Fill in the gaps', NULL, NULL, NULL, NULL, 649, NULL),
(4527, 'Time to Talk!', NULL, NULL, NULL, NULL, 644, NULL),
(4538, 'Describe what you see', NULL, NULL, NULL, NULL, 654, NULL),
(4694, 'Study the information', NULL, NULL, NULL, NULL, 647, NULL),
(4746, 'Time to Talk!', NULL, NULL, NULL, NULL, 644, NULL),
(4757, 'Study the information', NULL, NULL, NULL, NULL, 647, NULL),
(4773, 'Describe what you see', NULL, NULL, NULL, NULL, 659, NULL),
(4815, 'Describe what you see', NULL, NULL, NULL, NULL, 664, NULL),
(4844, 'Describe what you see', NULL, NULL, NULL, NULL, 669, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_work_etudiant`
--

CREATE TABLE `home_work_etudiant` (
  `id` bigint(20) NOT NULL,
  `note` double DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `home_wok` bigint(20) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `home_work_etudiant`
--

INSERT INTO `home_work_etudiant` (`id`, `note`, `etudiant`, `home_wok`, `home_work`) VALUES
(4527, NULL, 22, NULL, 4523),
(4781, NULL, 38, NULL, 4775),
(5516, NULL, 22, NULL, 4775),
(4523, NULL, 22, NULL, 4515),
(4535, NULL, 22, NULL, 4527),
(4544, NULL, 22, NULL, 4538),
(4729, NULL, 26, NULL, 4527),
(4778, NULL, 22, NULL, 4773),
(4837, NULL, 22, NULL, 4815),
(4858, NULL, 22, NULL, 4844);

-- --------------------------------------------------------

--
-- Table structure for table `home_work_question`
--

CREATE TABLE `home_work_question` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `point_reponse_juste` double NOT NULL,
  `point_reponsefausse` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL,
  `type_de_question` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_work_question`
--

INSERT INTO `home_work_question` (`id`, `libelle`, `numero`, `point_reponse_juste`, `point_reponsefausse`, `ref`, `home_work`, `type_de_question`) VALUES
(4524, 'age ', 1, 1, 0, NULL, 4523, 1),
(4776, 'are you okey', 1, 1, 0, NULL, 4775, 1),
(4779, 'My name is youusef', 2, 1, 0, NULL, 4775, 5),
(4516, 'is it working in heruko ?', 1, 1, 1, NULL, 4515, 1),
(4519, 'wach heroku zin ?', 2, 1, 0, NULL, 4515, 2),
(4528, 'khssk deleti l qst ok ?', 1, 1, 0, NULL, 4527, 1),
(4531, 'how old are you ?', 2, 1, 1, NULL, 4527, 3),
(4539, 'ach hadchi ?', 1, 1, 1, NULL, 4538, 1),
(4695, 'how are you doing ?', 1, 1, 1, NULL, 4694, 1),
(4698, 'what\'s your name', 2, 1, 1, NULL, 4694, 2),
(4702, 'how old are you ?', 3, 1, 1, NULL, 4694, 3),
(4747, 'you is fine', 1, 1, 0, NULL, 4746, 4),
(4749, 'are you ahmed', 2, 1, 0, NULL, 4746, 5),
(4758, 'are you happy ?', 1, 0, 0, NULL, 4757, 5),
(4774, 'casa is in Tanger', 1, 0, 0, NULL, 4773, 5),
(4816, 'how old @is@ you', 1, 1, 1, NULL, 4815, 4),
(4845, 'are you happy', 1, 1, 0, NULL, 4844, 1),
(4847, 'are you fine', 2, 1, 1, NULL, 4844, 2),
(4852, 'how old are you', 3, 1, 1, NULL, 4844, 3),
(4854, 'how old @are@ she', 4, 1, 1, NULL, 4844, 4);

-- --------------------------------------------------------

--
-- Table structure for table `howe_workqstreponse`
--

CREATE TABLE `howe_workqstreponse` (
  `id` bigint(20) NOT NULL,
  `etat_reponse` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `home_work_question` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `howe_workqstreponse`
--

INSERT INTO `howe_workqstreponse` (`id`, `etat_reponse`, `lib`, `numero`, `ref`, `home_work_question`) VALUES
(4525, 'true', '22', 1, NULL, 4524),
(4526, 'false', '23', 2, NULL, 4524),
(4777, 'true', 'yes', 1, NULL, 4776),
(4778, 'false', 'no', 2, NULL, 4776),
(4780, 'true', 'true', 1, NULL, 4779),
(4517, 'true', 'yes', 1, NULL, 4516),
(4518, 'false', 'no', 2, NULL, 4516),
(4520, 'true', 'ayeeh naddii', 2, NULL, 4519),
(4521, 'false', 'la 3iyan', 2, NULL, 4519),
(4522, 'true', 'ma bihch sara7a', 3, NULL, 4519),
(4529, 'true', 'ok safi', 1, NULL, 4528),
(4530, 'false', 'blach ma fiach', 2, NULL, 4528),
(4532, 'true', '22', 1, NULL, 4531),
(4540, 'true', 'm3art', 1, NULL, 4539),
(4541, 'false', 'wlah ma3art', 2, NULL, 4539),
(4696, 'true', 'i am fine', 1, NULL, 4695),
(4697, 'false', 'he is fine', 2, NULL, 4695),
(4699, 'true', 'my name is saad', 1, NULL, 4698),
(4700, 'true', 'i\'m saad', 2, NULL, 4698),
(4701, 'false', 'i\'m 22 yo', 3, NULL, 4698),
(4703, 'true', '22', 1, NULL, 4702),
(4748, 'true', 'you are fine', 1, NULL, 4747),
(4750, 'true', 'yes', 1, NULL, 4749),
(4759, 'false', 'true', 1, NULL, 4758),
(4760, 'true', 'false', 2, NULL, 4758),
(4775, 'false', 'true', 1, NULL, 4774),
(4776, 'true', 'false', 2, NULL, 4774),
(4817, 'true', 'are', 1, NULL, 4816),
(4846, 'true', 'yes', 1, NULL, 4845),
(4848, 'true', 'yes', 1, NULL, 4847),
(4849, 'false', 'no', 2, NULL, 4847),
(4850, 'false', 'mind your businnes', 3, NULL, 4847),
(4851, 'true', 'yes i am', 4, NULL, 4847),
(4853, 'true', '22', 1, NULL, 4852),
(4855, 'true', 'is', 1, NULL, 4854);

-- --------------------------------------------------------

--
-- Table structure for table `inscription`
--

CREATE TABLE `inscription` (
  `id` bigint(20) NOT NULL,
  `datedebutinscription` date DEFAULT NULL,
  `datefininscription` date DEFAULT NULL,
  `numero_inscription` int(11) NOT NULL,
  `etat_inscription` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inscription`
--

INSERT INTO `inscription` (`id`, `datedebutinscription`, `datefininscription`, `numero_inscription`, `etat_inscription`, `etudiant`, `parcours`, `prof`, `groupe_etude`) VALUES
(4473, NULL, NULL, 0, 2, 14, 6, 4, NULL),
(4475, '2021-11-02', '2022-01-04', 0, 2, 19, 6, 3, NULL),
(4476, '2021-11-02', '2021-11-17', 0, 2, 20, 6, 3, NULL),
(4477, '2021-11-01', '2021-11-18', 0, 2, 21, 5, 4, NULL),
(4478, '2021-10-01', '2021-12-01', 0, 2, 22, 601, 3, NULL),
(4544, '2021-11-01', '2022-02-04', 0, 2, 24, 5, 3, NULL),
(4551, '2021-11-01', '2022-01-01', 0, 2, 25, 5, 3, NULL),
(4555, '2021-11-01', '2021-12-18', 0, 2, 26, 6, 3, NULL),
(4565, '2021-11-01', '2022-05-01', 0, 2, 27, 5, 4, NULL),
(4569, '2021-11-01', '2022-11-01', 0, 2, 28, 5, 3, NULL),
(4576, '2021-08-01', '2022-07-01', 0, 2, 30, 5, 3, NULL),
(4583, '2021-11-01', '2021-11-01', 0, 2, 31, 6, 3, NULL),
(4587, '2021-11-01', '2022-06-01', 0, 2, 32, 601, 3, NULL),
(4590, '2021-11-01', '2022-01-01', 0, 2, 33, 601, 3, NULL),
(4592, NULL, NULL, 0, 1, 34, 7, NULL, NULL),
(4596, '2021-12-01', '2022-01-01', 0, 2, 35, 5, 3, NULL),
(4601, '2021-12-01', '2022-05-01', 0, 1, 36, 5, 4, 4598),
(4610, '2021-12-01', '2022-03-01', 0, 1, 38, 6, 3, 4608),
(4763, NULL, NULL, 0, 1, 40, 5, NULL, 4598);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `description` varchar(2550) DEFAULT NULL,
  `image` varchar(45500) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `destinataire` varchar(255) DEFAULT NULL,
  `numero_ordre` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `date_debut`, `description`, `image`, `libelle`, `ref`, `date`, `date_fin`, `destinataire`, `numero_ordre`) VALUES
(776, '2021-09-01 00:00:00', 'L’été est l\'une des quatre saisons de l\'année, dans les zones tempérées et polaires de la planète. L\'été suit le printemps et précède l\'automne.Il existe plusieurs définitions de l\'été : astronomique (saison définie par des phénomènes astronomiques marquants), météorologique (saison comprenant les mois les plus chauds de l’année) et calendaire (dont les dates varient selon les pays).', 'data:image/jpeg;base64,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', 'Welcome SUMMER', 'n5', '2021-09-01 00:00:00', '2021-12-12 00:00:00', 'student', 3),
(764, '2021-09-13 00:00:00', 'LES EXAMS cette semaine', 'data:image/jpeg;base64,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', 'EXAMS', 'n4', '2021-09-13 00:00:00', '2021-12-13 00:00:00', 'teacher', 2),
(762, '2021-09-06 00:00:00', 'La Marche verte est une grande marche pacifique partie du Maroc le 6 novembre 1975 vers le Sahara espagnol (actuel Sahara occidental, disputé avec le Front Polisario), lancée par le roi marocain Hassan II dans le but de le récupérer, car considéré comme faisant historiquement partie du Sahara marocain. Elle mobilisa environ 350 000 volontaires civils marocains.', 'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxQTExYTExQXFhYYFhsXGBkZGR4ZHhggGBsZGBkbGxcZHikhGR4mHhkfIjUjJiosLy8vHiA1OjUvOSkuLywBCgoKDg0OHBAQHDAmISc0Li4vLjQsLi4wLzouLi4wMDExLi4uLi4uLjAuLjcuLi4uLi4uLi4uLi4uLi4uLjAuLv/AABEIALwBDAMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAAAgMEBQYBBwj/xABBEAACAQMCBAQDBAgFAwQDAAABAhEAAyESMQQFQVEGEyJhMnGBkaGx8AcUFSNCUsHRYnKC4fFTkqJDY7LCFiQz/8QAGgEAAwEBAQEAAAAAAAAAAAAAAAECAwQFBv/EADARAAICAQMDAgQGAgMBAAAAAAABAhEDEiExBEFRBRMiYZHRFHGBscHwofEyQuEV/9oADAMBAAIRAxEAPwD21BilikptS6ACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAK5XaKAOVyu0UAcTYUqkptSqACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAOVyu0UAcTYUqkrtSqACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAOUUUUAIVth7UuqfieM0XbckBSrKZI+I6Co33IBpnw/zhLq6Z9YBYjsC7gZ9oH2jvWayK6Nnhlp1Lj/f2L2ov67b1lNa6xuJznO1McFzW3dAhgG1FCs5DJIZf/E/MVm/E/Dr5zOZjQDiMwrscnbCEfZRPJUbRWHBrm4ztbG0BoUzkV5WvMriPadWZQyrqg4JQlCCNj6VWrLw/4ne3rstpYWw5Q5khTtPYCenas49TFumdc/S8kY6ou/7ueh1At81sm41nWA6mCpwcgHHffpTPL+bLdti4IByWWZICnS32b/8ANed+I79s3XuTJZnED+HQSmR7wGBxinlzaUmjPpOi92coStV+56urA/h9lKNYjwHz1XQ2Xb16mZZklgRJg9wZx2qDwPi+7aLI48xAxAkw4ycas6o98+9C6iFJvuN+m5nOUI8qvlafdHos0TXnVzxsfMuOoIUqgRWH8pJeYPXUcz0FR+D8RsJ0sVEkhdwPYKcRR+JhZa9Jz1b2PTaKqeSc4t3kUC4pePUuxnr6f7VF4/nzWbrKU1JgggwciTg4OflWuuNWcS6fI5uFbo0AorFeIvEjabb8NcK5IZSoJyAVkEHsciqN/G3EgqdS43GnDfPr9kVlLqYRdM7MXpWfJHUq/J8nqNFZzkHihOJDDQyMq6iDBBHdSOx7gb07yvxPZuqssEcgSpxmJMHYjFWssHVM5J9Lli2nF7cl/RWYteKFbUrAg50kbR/DOd6s+H5zbeNJ37yIiJ37FgMdxTU4vuE+myQ5iWddrzk+LL1q44PrAdpVunqJ9LbxG3t0q54bx3YI9auh7QCPoZ/ECoWeD7m8/TeoirUbXyNYK6Kyt7xnb/gtsx9yB94mrjk3Nk4hNSgggwQdwfn1HvVrJFukzDJ02XHHVKNIsq5WP47xUbHF3LTjVbGmI+JZVSY/mGdv+Ku251b8o3UYMAJaDkYnI3H1pLJF3vwOfS5YqLa2fD/MtSKKp+XeI+HujDhTE6WwR9uD9Kc5Lx4uWyxPws6z0IRmUMD1BA3+dUpxfDIlhnC9SaotaKjcJxa3FVlOG2/qPmINHHuwtsV+IKSPcgSBTvazPS7ok1ysvy/xtw9wDWWtHswJH/cP6xUux4lsNeFoOhDKCrAgjVJBU9jgEfP5TCywfDNpdLmi2pRe3yL6ikM0UzwvFrcUMjSNsRgjBBHQg4irsxpnkXPObm9ckEhVPo/DUfcwPkABTHK+aPYuK4JIDepZ+IEBW+sAfYKr0GwzXWGYrw9buz75YMSj7VbUSn41vMdgx9TasSJO4Mff9asbnNnbhmVv8Kg7yWMkn/SrD6iqZwN6Q1wHrt07DaarU1YSw45Va4r/AAT/ANoDQqaQApYqfZo3xkyu9SOFH/7LqNmF5V/1K8f0qjW+BNPWuKZGVkBBHqBIIn5dxSTdqyZ44tNR+a/Vmi5Jx9xSjKxkMInIIcwVI7dfoO1UfG3dVxm/mZj9pJ/rTvhXmGq86frFm1aTRcadLm7pIOhASNLZjv7Gl2gLIF1gDcYTaBzA/wCoQf8AxB3Pq2AnacZaY2ceDNjeWehcbfnz+xM5Zw62rtsPPmzqI2FtVVmAb/Ed4/hEdThvjm8xVvj4idN3/MBhv9QE/MGofLrnrLEknTcYzvOhzJPUnek8s41Vcqx/duNL+0mVYDuhAb7R1rNS7djocGpauWkv5tL+Pmjq22bbMe/fbem5K/OlcVw7KWRx6lMH+4PUEZB7RUIgipdo6sa173sXPB8wAfU7EYwwEmREYkdomp3E87V9JZ5YjJ9WIkAZEbAHHc1mDPQ12D1NWsrSM5dJCU7Zf3r5CllMEaW3ypBK9Nj6z+d6gsJArvCXypJJOQR9RlZnpqApN1yTOWJOWP5++olKxxxuLaRdeGuYPZ85QAdVozMyNIOfvNNvYCW11k63hkUdF31N2noPrS+VKLKG+4Dl0KW0I+IkwzN3URH+KSO9V/GXHLlnnWxkltzV21FI5YxU80nHju/LX27k3g+YEEOx1BYUAiRnV/uakc34xGQaWkhrm0qYYIox2IFUun0MezoPtD/2pjVS9x1Rt+GjKepdvt/6WfNm1OrT8dtHPzC6T96moQE4x9TFSLx1WLTdVZ7Z+XpdfvZvsqCG+vzqZM0xJqFLta+jomjiChgEHbIz99WfLfEt+zqCaYYyQV7CO9VRYkb7bCIpsn7aqMpLhkSxQyRrJFMk8VzFrl1rr/ExE47AL37Cnk4lSjmYf0oo7h51EfIKR/qqDywhdd9wNCRAOzu06V9xgsfZfemmI0ow+JtTfSdIEfNWP1FPU+Q0RfwJUlS/mvp+4+Xn6VZ8v417IV8qWRhbAMBgWMu6zkeo6ZGY7DMXl/DqF824JWYVP+ow3H+UdT9Pl3itbkuxljnsMbADoIxFNXyRkUcj0du/2+/0HeG55eturi4fSSSp+FtXxSPf2rRcP46W5h1FsqUOqSQw1LqAEY9OrE5rH2r6zJBIgggEA5Ujcg9+1VyiT8sfOnHNOPDJyen4c3/KNNd/7/JY8QArEq38TQsfCs+gk7EkHYTtTF65LajAMzgR9gG1Idgu5E02TPtWLZ2Qh/s3XKvGnl2tN4M5AhSIk9g0/jWf5zZuXbnnWkcrdUOQmQrSVYTGTqUn61n713UZ6D8zU2xzfiEGm3dKr2/Irb3W1Umci9OUJOeFK3z4G+EvhxqtmQNzBxO00oerbPuD2qF/+RLwo8q38KozmNzA6tAkmYpfg641vg1XZrgNxiI9UkkT/pIx701huOo4v/qtS0uKuubI13m4s8QENgXGWAdRJwwGdAwQJnPaqnieMZuLF3yZUD1BToLrBEr01QcSCCVg7Vfcq45WcXAo81f4j2M57mIHf4qm89vC6LVt7Op1uBl8tTOkxcuekCIkGe8ydq64wUeF2PGydRkm9Tl3v8iPzPgxausivrGCraSpIYBgSu4MESKRxV+LLuo8xlVQqSAGUmGzO+dhWHbnd65cuOzkNcLat4BacQcgAmPar7wiiixffiDcFlRGq2QDcMaTat4ksSVBOwEk+6l0uj4rs7Y+sPJHRVOnb+fZ/qWPJPD9lXXi9bNaWSll92YGBqYf+mpmerFY7kVvOOGvjiDfbiPPYupZQxQupMFBGFx6RG2IiKsRxxa1cuuuiVBFuCAigQqLI2UD55zVqnhuz+4vKBC2Lasv8xYWzrjYkhnJJOwP0qpLe/8ABwPJDTpit7u02voiSnL7Ym7YZ0tvadPIuv5jITC+YrnJtZIJzB3gTGe4XlNxtNm1eYXWuFGtuCc6tOSAGjck5xtWg5jfdraXbdx7ZOkqywSs4YBSCIgkfkVN8Pc4t27yPcQNcggkJhi0eqSfRhBM4EVkna1LbyaubSUZb1xv5/Urgly3wrC+Iu8HqRhmWsqYtNkD4ZC99LWyYo5df4e7YS69wgtqlQJKQDEwwhsSZBEY96vOZcat66t1vVpYpcwIvW2Do1twf4ClwgbZIaNgKwcq4K0qpZKHSxYCfVeVRu6kS0DJOACOxzbwRmnK9wh6hmwpY99K7r7lLx3K7t22wRtONRPRlxsR0MiD1270cp5XxCWbZaLkuVkNkfFgao14U7dj2qy4vnjec5Vg48uNO6suQUgfkEA9KrObcyYWkRLa2UVtZh2uMzRoU6mjSACQABHqJrJY9tL4OiXqGRz91Knx8qFXuZWLbFHuaWGCD326CrOxwalddwkWw2ADpa4wzoDDIXbUegwMmobeH7F6Lz2lVGnzLgM6oA9KKTAuGO0DLE4rRcNb4fibc6il5DpRBLBEwQNOJn+bed96j2l/0/ydK9Rcvhy1T8XdFbd5gzMXMSB6QBAWMKFXoo6Co9zjbj75J77/AC9hUXjAbd90AJCxJ7aiBLTsM/PBiau+D4dUYMwMxhYwcEj/ADDHTB+tZPHO9J3fi+mjDVHt27jXOuUXLFsDzLbFgrKADpB9YEv1+gxVFaF1VtC6p13fNZoAItraYW1kj+ZlfJ7Vec25x5zC1Ja4FtE52d5CiO5Uz9V74g+Jee3OFe1wtoLKWl1k5yfUw3GNbNW6xJtwSPN/HTjGOVy7u1547C+Hvp5VxHYKxKOgJ3IDK4H+lp/01V3eaWUMNcAO/XrRxr+bwrcQyBbYbS56o0ZgjI3BiPVNQrHgi/dQC5Za0xHpdnBhWIILBTvuNO4nMYlQwRr478F5fUsim/Zpp09/yRNu89tI6J6iXIC4wdRAnUemas+KtkRPXcEQVIAJUjoYIPyZT1qbzkxctWv1S15doK1m5blHQrISSIU7bTk9Nqz93xCr3WTQRcc/UmNO0ZJGOuw7ClLEnH4eS+n9Rye4lOqZO5X4mXhrjhYZ1U6QTAUnTLDfJwMZipXK7lzjC3E8QAqBolMaoAIRJOWOZbYAE9hXOXeE0v3ke6jJFtixbIMelNSe5cEAxq0jcTW0u8HZaz5QUBUwp3KnvPU4z3zS0R07ESzzXUSl+m3j7md4m/Lam0qAAqqMKijZV/OTmo/E3Mb74FUPiDkxvTN4KyEqP4g2cH+lO8ByriOG4dPOtsIBbeYDElfcYjEYodOFrnwdmPJWX22qVbO+R+8sH0nH40hTn3qNb4ksaedW0sUXUQJ7/L/jeuet6PUclGFvg6LH8RHv8+k/bVTzPnFuydDNneAJgVruT8nS9wgc8UvnNLLbIChBgaGk6pwTq9xgxJxvjTlxs21HEIEksqiQXkAksAD8PvMH3rfHi+JKW/5HlZ/UawuWNpST4a/v1J3D8SrIHUyDtH5xRrc5Ax8qheG+EuWeHU3OHKm4SUe4G9SjYqmFB9yCYjoas9TnMn7Y+6lOKhJo7uk6iebCsjVWee8G/ms4Z/iQ5MbyIA7/ACrXp4iQItnWSqqAhyGC/Dolt+lY65zO7dMuQ0bQqr/8QJ2G9S+FL3EJgHQd8krI7DPtivTnFadz4fHkaexfct4y2mhmhEBGmB6jB9Mv8Udzkf0d5zxr3IuW3h9aIqk6TDK5LTGBgTO4I+VU3GcaCbVpLekqBJcAzpExAJHT8asuP41X4dmuPr4lmAVcykEiMziM56e+alJx3G5KSaK3mfLIIS3Nx5LOQMS2T0n76s+B/Wrl3yeEGLTi36AEtgu5JLdSJJzkwOwgRHtOlsaTNw+odJI6fKoPIvEN+wCto6Xa4LmucggERDSI74nFXGWuLXJElolabRqec+HeLZ7tl+ItwiB4UEl1I9ULuSN4nYGre07+Tbs2yWNtRZggEjSBEnEYicwKw3DeIuIN5r9xg5JUOIA1KMFARkAjFWXNuZHhme3YcaWua9UeqCAApk9vbeazyQyXUTXHkxVcrNFxnGqrLYtZKbk42IYkn3Zvfc9qoOccVBCKwbzNQ91CwYM5UjY9DBgnaoXAcey3m8xi2q2SCTMMCD9AcjHtUbm/GFpuCCQcYjEKPnsKmGPTsx5MurdGp8O8dCvakk6pyZjUAAoycY+2tlwPAJaV31km9b0sxbompoI6DUW2O8jMCPNPCjagbhOk6vT2lYjfpIr03i+Mt3uG/c6S/DqqslpkKm2/wOQD6XAX4TH8UDtrkxPTS7mWPKnK32MVd4Vrdw33bVbuQGOAQTtEdOneu3eBucQqWrKu5YqDCkwJksT/AAjByak8by/yWTiOJ0m1oIt2XUszlsoVtgYBn4nIGFAmoz81uXLBt21WxaIYFbchnBE+tySTnpsOlc1tM6tmmajlPKbSBW/WfMuWnB023BVMw8tnWSAVkEAQcmKZ574g4f8AdPZZUdbgUIIVmW6cj5S0xGPasKuuxZZLbMgMBoMSrQYMe8/bURrbWCzgBiBJV5IPuIMyAN/x2raC+FpGM5G28RcHd4nQlqQ7W7l7RGXNny1z7kXSAdvT9RXcL44D2OHsOh12D/8A1kfBkKoHWBjJ2GN6d5t45KGzxaJbN1bTcOASWxKs93GmAWGkROx7ivN7vFF3ZisamZoXpqJMCcwJqoRtbmeSTUrR6dyGwhXir7fEzi7bLZKolxUtHHUiTjoRWf5lav8AE3r15LBch/W47v6+p2zOB1qN4O464f1i0S5LWAgA2RfMVnbOwgkY/npVrnfEcOpNt3TzQDgKQ28HI7Hp0qIqps0crgl23NB4B4mbN+3cClk4lW0t0IA0nP8AitmPcVrbnFu9pmEAgmfYxjPScVhP0a8NbLcQ1wlmYKAuqMEks8A5IMAdpPer65xqWkexbZzcuuVWRIIUwxBEwFM7x99Z5d5bcnRgbjBN8MpedW2veVaF25K3A66vWZ2x0BgE9sY3zYcy4mxwzPpUXeIRT5lwz6Q0+lWUQoElQcE96f8ADPBugLOdVxrgS3r3Itny1cnoutif9B7VifHXJrnD32R3FwaVfUplTJYD6jP2+9XCOuVPgyyZFjgnHm7f8HonhnnJvodRVLLMT5ikEljB9YJkQFgTEDHWpfM+c29Pk8OxuO5lm3CzAntHX+prPeErPlcBaOHVm13F0Eki7KACN/h7f3qRzbh2sIUtmFZh6UAEalHxmJOD3rmyRVtLsdeLI6Un3LHw2toTxDjUiOUtD+ZgJGT3BGf81N+fcv8AD8TxN8uLtok+XJUABVbKzDapOTOMDaoXLuTG9w7WXuQE13BEjUzsxT5gAfhWda/d0eUzalIGG39iB1j7aqK08cDyT1u5cpUSuY3oCtgeY8+kiN9se8D5z3rRcr4yw9pXLBYQrdQfFqt4DIO7iD89VYvmbW5ItIEVYLDUSAxg7sflVx4Z5omm9re2i2/KKmPWz62cMT1iAvT0nrmiWP4dSFHPJy0tv6kvmaXbapxCek3CjLbXGjJYFnmQNIXaTJE7Vfct4EXr/mXshSzsNwWbSF+kJWW5jxouXLl3F65oC2bcMSssdTwCJJOJ6R86uOD44y7BXAdYGNOZjZyO0Y2NXClujHI5PZstOZ8U3E8LejcEuuetp50/VRHyNYm5xTTvWl8GhtV9XLbC5mIJuBlgZ6aBjpXmnNuY3DcPkuSgxtsRuNqueFTdnR0nqMuljVWQuUWQbqzEE6WDYwf4hP0rT8DYt27rWQFykyCTt0YFjB32HatNxH6M+JdjcNy2WKhcxEAaQIjeOtReA/RPxaGRdRDEShz0kZHtTlKMu558Yyi+DGcW5S4pGZYqCemYn3xUgWtBBczpM6439iJ7Vvm/RZdYAa1kRlmLGR1nudzUjlX6L3tsWa6r9ADJ0xOBJ26ZpvImhLG0zDXmi96lIVkAUwdo3E75n7KrbnLtd5iphlUs4jBIiSD7qdX0PcV67xngZ3cudJ9MIusiCOp7/hTHBeBHBLXhDEaB5Y1Qp/xE79NsSazx5NLs0yY9SqzyXlvBlnKqPUDJnY5mD7Yii/wzXTcJksF1f+QBPtAM/wDFeicR+ja9qOgSpPU6WI6iVOetNcs8KcRw/FITZfTJCY1D4Tp9QMdhnFdEs+q2jCOCqTMHdGQwGwz9f9s0jirEggdQSB3wTitR4t8OXbGq+6qEa4wUTtkkgjpERHtVrw36Pr15Eu2/LFp1DoA2IYSCoC4wdqn3FSkP23biYDhuJuIgAAKR1HXc5Hzrd/o7un9Qvi2ui4vEKSe4KLo33gho6ZNT7n6NbwtaAU3mSY/pTqeG7/DWWtebbt+aEQ6fVkEqGMgY9R/IofULuC6VvgqP2onF8OQz67qPcVid3BZijg9cAfmJrOBJAKt3H03B+mKVxHIzwl22gdXJZhdK9DBCiSoMExiT36imOaSkMu0gH5Hb8IrGVN7G0bjHfsSOP4XUIidvrpII+6pHEcPIUgYiM5B0/jmR9aTwHEB1g7x3ifaelWT+tAQQNIiNz0g/jWmJ0htJmNXwybqMbd0alM+WxwqMNS+rJyepxiqO/wAM9lwLiwdx2I7g9a9A4PkN9yOJskoE9DSwCEIQ4BDQT6m36RiqnheUX+OuuzgvbGPMk+mfV6FAiTG2N6v3EmzneF9jngqzbZuJd2JJUWEUGPS3quMfogA92npSufPrYwNIBAHYAYAH1I+yrjlfIV4aSuvMtLwCP4cQBjTOaznMbuvVE+pvsAP3fKudy1TtHRp0Y6fJdeGPCly/w96+t02SIS22ADpnzC5OywwXfed4qN+qXtHm2Wt+aimyoQTAXSCymBkhlIkdfatZyC0rcnZiSP3jKY74Y/8A2E/4qz3gniLhu3VCG5aYamxkfEojECV7xsvaDLlLd+CoKO0fI7wHiJltWOI9Fy8SgAyFXywyrb3mQCzt/iYntUDn3FNx95i2m0xt/vG3RFSYgkiSSYqT4k5U1q8b6CLZ1NEYDsvxxONQk/MMKpPDKefxQsPADgwCcEiDsNzpDV34GlilNcvj5HndQm8yxvhbv5m58PcGbHLBcukl3RWVZ+BUBa2AMZyPqfaqVrfE2nDG4ShKtBOuAwBAZmycYn2qTzfxEReHCALpAYKQoxvgHYfKNhHXEfieMcWw4GorZNsyY1aGOlsDB0tXn5YTU38z1MGXFKCe+y+hI8Q88vWAWsC2FLAEaZkqsk4O37wj6VleJt3j8VzYAGABJHUn3p7jebLcsQ72wwJOkY0ysAQdz70huaWbjEK+ScDS34kVpCMlFJrgzy5Izk3F7Mg3bbi38IIcSznpBiJ6HBxVr4Y4RkRmCapIwcCQcE/biKrLfMLauFuqVRhq1QTBO8gb5E1r+V8QugosEqVc4P8AF6lYTEjG/saMraVUGBJyuy94DhjasG6EZ5Lajg4DkqFVtlEnbeDVdzTjAhLnADhYO4/dm4dsD4lGMek1sbKWuFtWbF14MliZHrY6ncLJkwZx2FZdOX21DXWJKtdusuALagsQZAPxEzkzGwqcbt6S8ipail4Lnz224jQwIg4gGSBKZ/lkmQM4FeWRW88U6rGi4gWHLAiCBsCuJnYNWHK9+ua6oprk4srTo+vrVsRS1QUWjiP6U6PlXIjobYjSO/4fZXUQhfUI2nOB8iYpxVBwRPTP+9U/Oebm0TbAiRv06dKZKuTpFjcMgFWUAkZJxggnYjMAjP8AtUkWZrEi+x9OWyYyPt23rUcpd/LPxTBIwM+2d/t+tKMre5WSDirTLD9WPT+1Q7vBqhBLCSQMmST0gE71IbzGXLaTjpOft2ptODwdTszdZOnM5IxMexkbVo1F8IxjJrlkLmPJ7XEKUYI0MG2LQwAAM6sHFTf1bbO23/G1I8ttUhmgGM46ZiB6ieh/4rly476SgI/mBAmPqRIqaRdsdFg5zUC/yKw86rakmRMZzuCT89jV0gMR+NcNvaQCRsfup6EyVlaKPi+RWChVkCyD6wACPfUBB+R3rzXw5yS5ds8VbW0t1tT2QxaSoKBgdL4AkyCDII9q9k4jhEuKUdQ6sIKsAQfmDTHDcrtW58u1aQEyQltVk7Zjf5xT07Asu9mB8G8ktXuFSzftFbtglHgCWgsBqYCehBE9PepfPfDVjQy27LlmXGlSVmQc79jtW0s8EFYkIig5kbk+4j+tSDYHYfZUuLZSyqNdzM8Fyay1pA1nRIBK5Ug9Z0+9B8PWURlsJ5TMPiE7+4nP+9acWh2Fd8oe1LQw97ezy/mHhriLlzToUIfiI9Q0gzkEgtq2OPwqJ4m8KX7z6hbCWwTtceYggamYwBtheua9bFoVzyxSUGuCnnUuUeNHlN4cI9m3Em9BtoxK+rSklTGrqxicA/KtLy3kvDWhFu0wJUKzB2BeJyYaAcnYAVvmsjtTR4UEQR8+/wBopOEilmjzR4746tghbNp9NskyH2SIEa49QLRjpDZqv8H+Hv1Z24g3UdijC0iHXpZsE9pUYwc6q9eu+FeGYhmtAlSGEszQRkEAtAI+VR7/AIL4Rmk2h1kAkKZ6lNp96v4lHSideNy1PfweGciIbieIDq11iHEgkNkwWOg9Adp6jtV5xaaeHfEQAuZk5SYnP5PavVj4S4dSGt21tuF0q6qAQOoxEj2mqjjf0drdILX2wZEIAfqZI+6lJuUrLhOMY6TzOxyPgr62dQureZzbcpGhgSSjMCDBgBZHfNarh/C/AJYttcAtuq+WLjNmZbBBw3Ud4xVk3gK9YLHh316wAfNcLt/hRPzNP8v8GuLRtXjIloAIIIOeo7k1LcuHwaxePlVZ5P4g5PbdnFsqAhnzADFwAZCzsY6HEjfrUfl3H3bFrSjaoVmGoAgQRiN46/b3r1ceAFANrSTZgHTqiTMmW3PT2qNxf6PCQRba2oJMhk1gDsII2Aj6VSybUyJQuWpPcwfOuZcXd4Xhr7ulxGvFhpTQ9t7YYFO0EBs9YG0VZcPz1rthwisPLa6dLRg6NQ1BR/EQ/Xoav35E3DWfJFhr0MSAqPo1GfVDT36T86RwXIxZtm7cDI9wqSEUiAoIUFGjaTnO9UpxT4D25Pa78lRdW3xNlbV5WsO0FQ4iSuxRmEOMx0MHY1RWvDfkjQ9t3O4ZV1Ag7QY+6vQfFnLkbhm8wg7FJJnVOCs9Y/Ip3w3y3iUsKp0LGwY5iBE0Sz6iV09M9Etr704F9xUdG70sXKzTQmmPRvtWc5nyy8WLAah0AIn64rQg0sN3/P20+SYycTFp4fvZZQViDDNk5ncKT9IrUcq81LSq9sagB8LYJ67jFTgw710fOkopBPI5Kmh0EdZpcimdXWgN71rqMXEZ4/hi8aXKH5TP0moKcvuzm4CJ6AiRVoDP5/2pU1LSZSk0qO21ERJ+tLAFN6/tpWr3FWmiGmLFFIU12aLFQqiK4D7V2mIBRXJoNIDsUVwGumgAoArtcpgG1Ik9RS65NDBHIrhiu0kmpKQiD1iK4QKUTXGpFI4QKaZPanSaQaTLQy1odqgXeU2SZNpCfdQfxqzY0hjUtI0UmiAeXJA/dqOo9Ix8t/u7Uv8AU1/lH2VIaiPzNJJFamNWyaUO8n8/Sm1b5inR+ZxNSDFoxpxTTDOAst88HbvtTqNInP4U0Qx2T70sU1Hz/PvS+k1SIYpjXabJ7UtTTEdg+9d2NcU0oCmJgD85+lKrgNdimSxQFcmuRXT269OtMQKaVRRQI4KBXRXaYBQDXK7QI4DRNcFFFjo7STR7CuH3pDo4fpR+etGoUme9Io41JPt/eutSZFSUgDY/tSSfauN8vz/Wuk0ihstSWause2+9MXCwGwJ6/wC0xNSWhZakSfz/AM0kGfn1+7FJ89RhmE+8TSLI1zn3CWwCWugEqoPlPEuwVfVojJIFM8J4l4a63l2TeZzOnVYuqrafihvLAJgHatA3JOGODYtEdiin+lctcj4ZTK8PZUxEi2oOfcCu1Rj4OTJkTfw3+pBuNMjS5EyAbdwZGx+HOfwpZusBOkgEgCUeQSJyoU4nr/arL9mWYjyrcf5B/aj9RtDa0nwx8I2Gw22p6I+DPVLyQFuSABM9f3dzAJ09uhP2Z2E0luIbMBoAJzau/TGjNWbcBaMzbQzv6Rn54zSRy2yDItWwf8i/2o0R8Bql5Kz9afSSFMiJ/dXfkYBUEmeg2qX5iQCRckf+2+8bj09sfdvUj9m2cfureNvQuMz270fsyzt5Vv8A7F/tT0x8BqYq3bBAIJyJg439opwWx3/CmP2damfKtyNjoWRHvFK/Z1rH7q3jb0Lj5Yp6Y+BamO+WO9AsjuaZPLbJ3tWz80XpgdOgxR+y7OP3VvG3oXE/SjTHwGpjxQd/wrukd6Y/ZtmI8q3G0aF+fbvmujl1obWrY6/Au42O1LTHwFseCjvRpHf8KYHLLI2tWx/oX+1H7Ms/9G3/ANi/PtT0IVse0jac/SlC37mo37NsxHlW47aFjp0j2H2V1OWWRgWrYH+QdcHp7D7KNCHbH9I70eWKjjltkRFq3hpHoXfvtv711OBtAqRaQHoQokRtGMUaEFskeVXPK9zTlFLTELY35Xua55Q7mnaKNMfAWxkWBsJFHkDuafoo0x8D1Mj/AKsO5+7+1H6uO5/P0p+ijTHwGpkf9UHc/d/aj9UHc/d/apFFGiPgNcvJF/UV7n7v7Vw8AO5+7+1S6KNEfA9cvJD/AGeO7faP7UDly9z939qmUUtEfAa5eT//2Q==', 'Marche VERTE', 'n2', '2021-09-06 00:00:00', '2021-12-21 00:00:00', 'student', 2),
(760, '2021-09-14 00:00:00', 'La Journée internationale des femmes (selon l\'appellation officielle de l\'ONU1 ; en anglais, International Women\'s Day ou IWD)', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0E6LnpT4P31EIdTp6qLGmf35NFDTGJhf0nw&usqp=CAU', 'HAPPY WOMEN\'S DAY', 'n1', '2021-09-14 00:00:00', '2021-12-08 00:00:00', 'teacher', 1),
(763, '2021-08-13 00:00:00', 'Aïd al-Fitr est la fête musulmane marquant la rupture du jeûne du mois de ramadan. Elle est célébrée le premier jour du mois de chawwal. Elle est aussi parfois appelée aïd as-Seghir, « la petite fête », par opposition à l\\\'aïd al-Kebir, « la grande fête ».', 'data:image/jpeg;base64,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', 'AID LFITR', 'n3', '2021-08-13 00:00:00', '2021-12-20 00:00:00', 'teacher', 3);

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

CREATE TABLE `paiement` (
  `id` bigint(20) NOT NULL,
  `montant` decimal(19,2) DEFAULT NULL,
  `total_heure` decimal(19,2) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `date_paiement` datetime DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paiement`
--

INSERT INTO `paiement` (`id`, `montant`, `total_heure`, `prof`, `date_paiement`, `etudiant`) VALUES
(1802, '0.00', '0.00', 3, NULL, NULL),
(1998, '230.00', '1.00', 4, NULL, NULL),
(2014, '690.00', '3.00', 4, NULL, NULL),
(2015, '690.00', '3.00', 4, NULL, NULL),
(2016, '690.00', '3.00', 4, NULL, NULL),
(2017, '690.00', '3.00', 4, NULL, NULL),
(2018, '460.00', '2.00', 3, NULL, NULL),
(4449, '690.00', '3.00', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `parcours`
--

CREATE TABLE `parcours` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `nombre_cours` int(11) NOT NULL,
  `numero_order` int(11) NOT NULL,
  `centre` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `parcours`
--

INSERT INTO `parcours` (`id`, `code`, `date_creation`, `date_publication`, `description`, `libelle`, `nombre_cours`, `numero_order`, `centre`) VALUES
(5, 'Elementary 1', NULL, NULL, '', 'Elementary 1', 51, 1, 88),
(6, 'Intermediate 1', NULL, NULL, '', 'Intermediate 1', 51, 3, 88),
(7, 'Upper Intermediate', NULL, NULL, '', 'Upper Intermediate', 51, 4, 88),
(601, 'Pre-Intermediate', NULL, NULL, '', 'Pre-Intermediate', 51, 2, 88);

-- --------------------------------------------------------

--
-- Table structure for table `prof_review`
--

CREATE TABLE `prof_review` (
  `id` bigint(20) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_review` datetime DEFAULT NULL,
  `review` int(11) NOT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) NOT NULL,
  `libelle` varchar(25500) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `point_reponse_juste` double NOT NULL,
  `point_reponsefausse` double NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL,
  `home_work` bigint(20) DEFAULT NULL,
  `type_de_question` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `libelle`, `numero`, `point_reponse_juste`, `point_reponsefausse`, `ref`, `quiz`, `home_work`, `type_de_question`) VALUES
(5193, 'I\'ve........a terrible headache.', 1, 1, 0, NULL, 5192, NULL, 1),
(5197, 'je suis désolé', 2, 1, 0, NULL, 5192, NULL, 3),
(5199, 'The milk is @at@ the refrigerator', 3, 1, 0, NULL, 5192, NULL, 4),
(5261, 'MARRAKECH is ........ Morocco', 1, 1, 0, NULL, 5260, NULL, 1),
(5265, 'Je suis Youssef', 2, 1, 0, NULL, 5260, NULL, 3),
(5267, 'Edward has always @doed@ things very quickly and efficiently.', 3, 1, 0, NULL, 5260, NULL, 4),
(5269, 'He @want@ all of them.', 4, 1, 0, NULL, 5260, NULL, 6),
(5283, 'You can have ice cream or cake, but not both.', 1, 1, 0, NULL, 5282, NULL, 5),
(5286, 'The police went .......all of Karl\'s things, but they didn\'t find any guns.', 2, 1, 0, NULL, 5282, NULL, 1),
(5291, 'i am a joke for you !', 3, 1, 0, NULL, 5282, NULL, 5),
(5294, 'Where @are@ the Battle of the Bulge?', 4, 1, 0, NULL, 5282, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `id` bigint(20) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `seuil_reussite` bigint(20) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`id`, `date_debut`, `date_fin`, `lib`, `numero`, `ref`, `seuil_reussite`, `section`) VALUES
(5192, '2021-12-23 15:03:35', '2021-12-23 15:03:35', 'Warm up', NULL, 'quiz-640', 5, 640),
(5260, '2021-12-24 15:55:11', '2021-12-24 15:55:11', 'Life story', NULL, 'quiz-649', 5, 649),
(5282, '2021-12-24 16:42:07', '2021-12-24 16:42:07', 'Grammar-1', NULL, 'quiz-645', NULL, 645);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_class_room`
--

CREATE TABLE `quiz_class_room` (
  `id` bigint(20) NOT NULL,
  `class_room` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_etudiant`
--

CREATE TABLE `quiz_etudiant` (
  `id` bigint(20) NOT NULL,
  `note` double DEFAULT NULL,
  `question_current` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `resultat` varchar(255) DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `quiz` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `quiz_etudiant`
--

INSERT INTO `quiz_etudiant` (`id`, `note`, `question_current`, `ref`, `resultat`, `etudiant`, `quiz`) VALUES
(5427, 2, 3, 'oc5', '2 / 3', 22, 5192),
(5433, 2, 4, 'oGb', '2 / 4', 38, 5282),
(5440, 2, 4, 'fmd', '2 / 4', 36, 5282),
(5471, 2, 4, '9cv', '2 / 4', 22, 5282),
(5489, 3, 3, 'dPM', '3 / 3', 28, 5192),
(5504, 3, 4, 'mWe', '3 / 4', 28, 5260),
(5510, 3, 4, 'RVp', '3 / 4', 28, 5282),
(5522, 2, 4, 'IW9', '2 / 4', 22, 5260);

-- --------------------------------------------------------

--
-- Table structure for table `recommend_teacher`
--

CREATE TABLE `recommend_teacher` (
  `id` bigint(20) NOT NULL,
  `nombrevote` int(11) NOT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `commentaire` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(2000) DEFAULT NULL,
  `date_recommamdation` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recommend_teacher`
--

INSERT INTO `recommend_teacher` (`id`, `nombrevote`, `ref`, `prof`, `commentaire`, `login`, `nom`, `prenom`, `telephone`, `date_recommamdation`) VALUES
(1446, 0, 'C1', 3, 'Good Teacher', 'meryamLouhaidy@gmail.com', 'Louhaidy', 'meryam', '0612452387', NULL),
(1443, 0, 'C2', 4, 'Good Teacher', 'hakati1999@gmail.com', 'Kati', 'Hajar', '0612172734', NULL),
(1444, 0, 'C3', 4, 'Good Teacher', 'MourchidMohssin@gmail.com', 'Mourchid', 'Mohssin', '0653733789', NULL),
(1489, 0, 'C4', 3, 'Good Teacher', 'AnouarLamghari@gmail.com', 'Lamghari', 'Anouar', '0641628309', NULL),
(1490, 0, 'C5', 3, 'Good Teacher', 'OussamaBentaouil@gmail.com', 'Bentaouil', 'Oussama', '0618394756', NULL),
(1983, 0, NULL, 4, NULL, 'hakati1999@gmail.com', 'user22', 'user', '0637373737', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reponse`
--

CREATE TABLE `reponse` (
  `id` bigint(20) NOT NULL,
  `etat_reponse` varchar(255) DEFAULT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reponse`
--

INSERT INTO `reponse` (`id`, `etat_reponse`, `lib`, `ref`, `question`, `numero`) VALUES
(5194, 'true', 'got', NULL, 5193, 1),
(5195, 'false', 'gottin', NULL, 5193, 2),
(5196, 'false', 'have', NULL, 5193, 3),
(5198, 'true', 'i am sorry', NULL, 5197, 1),
(5200, 'true', 'in', NULL, 5199, 1),
(5262, 'true', 'in', NULL, 5261, 1),
(5263, 'false', 'at', NULL, 5261, 2),
(5264, 'false', 'for', NULL, 5261, 3),
(5266, 'true', 'i am Youssef', NULL, 5265, 1),
(5268, 'true', 'done', NULL, 5267, 1),
(5270, 'true', 'wanted', NULL, 5269, 1),
(5284, 'true', 'true', NULL, 5283, 1),
(5285, 'false', 'false', NULL, 5283, 2),
(5287, 'true', 'through', NULL, 5286, 1),
(5288, 'false', 'past', NULL, 5286, 2),
(5289, 'false', 'across', NULL, 5286, 3),
(5290, 'false', 'in', NULL, 5286, 4),
(5292, 'false', 'true', NULL, 5291, 1),
(5293, 'true', 'false', NULL, 5291, 2),
(5295, 'true', 'was', NULL, 5294, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reponse_etudiant`
--

CREATE TABLE `reponse_etudiant` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `note` double DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL,
  `quiz_etudiant` bigint(20) DEFAULT NULL,
  `reponse` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reponse_etudiant`
--

INSERT INTO `reponse_etudiant` (`id`, `answer`, `note`, `ref`, `question`, `quiz_etudiant`, `reponse`) VALUES
(5428, 'got', 1, 'X0o', 5193, 5427, 5194),
(5429, 'i am  sory', 0, 'fzk', 5197, 5427, 5198),
(5430, 'in', 1, 'pfK', 5199, 5427, 5200),
(5434, 'past', 0, '8A5', 5286, 5433, 5287),
(5435, 'false', 1, 'kn7', 5291, 5433, 5293),
(5436, 'false', 0, 'Mmz', 5283, 5433, 5284),
(5437, 'was', 1, 'mpX', 5294, 5433, 5295),
(5441, 'false', 0, 'VTC', 5283, 5440, 5284),
(5442, 'through', 1, 'VGh', 5286, 5440, 5287),
(5443, 'aref', 0, 'Dfm', 5294, 5440, 5295),
(5444, 'false', 1, 'Ljb', 5291, 5440, 5293),
(5472, 'false', 0, 'GS1', 5283, 5471, 5284),
(5473, 'past', 0, 'Sot', 5286, 5471, 5287),
(5475, 'false', 1, '5s9', 5291, 5471, 5293),
(5474, 'was', 1, 'fiy', 5294, 5471, 5295),
(5490, 'in', 1, '5if', 5199, 5489, 5200),
(5491, 'i am sorry', 1, 'LIN', 5197, 5489, 5198),
(5492, 'got', 1, '9Zg', 5193, 5489, 5194),
(5506, 'wanted', 1, 'ikz', 5269, 5504, 5270),
(5507, 'done', 1, 'f8d', 5267, 5504, 5268),
(5505, 'i am Youssef', 1, '7vj', 5265, 5504, 5266),
(5508, 'at', 0, 'Qd2', 5261, 5504, 5262),
(5513, 'through', 1, 'WlN', 5286, 5510, 5287),
(5511, 'true', 0, 'Kvw', 5291, 5510, 5293),
(5512, 'true', 1, 'xUz', 5283, 5510, 5284),
(5514, 'was', 1, '5UY', 5294, 5510, 5295),
(5523, 'done', 1, 'hUr', 5267, 5522, 5268),
(5524, 'wantedd', 0, 'iik', 5269, 5522, 5270),
(5525, 'in', 1, 'ARy', 5261, 5522, 5262),
(5526, 'i am  sorry', 0, 'mJN', 5265, 5522, 5266);

-- --------------------------------------------------------

--
-- Table structure for table `reponse_etudiant_home_work`
--

CREATE TABLE `reponse_etudiant_home_work` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `note` double DEFAULT NULL,
  `home_work_etudiant` bigint(20) DEFAULT NULL,
  `reponse` bigint(20) DEFAULT NULL,
  `question` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reponse_etudiant_home_work`
--

INSERT INTO `reponse_etudiant_home_work` (`id`, `answer`, `note`, `home_work_etudiant`, `reponse`, `question`) VALUES
(4528, '22', NULL, 4527, NULL, 4524),
(4782, 'yes', NULL, 4781, NULL, 4776);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `authority` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `authority`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_PROF'),
(3, 'ROLE_STUDENT');

-- --------------------------------------------------------

--
-- Table structure for table `salary_vo`
--

CREATE TABLE `salary_vo` (
  `id` bigint(20) NOT NULL,
  `annee` varchar(1000) DEFAULT NULL,
  `mois` varchar(2000) DEFAULT NULL,
  `montant_globale` decimal(19,2) DEFAULT NULL,
  `montant_mensuel` decimal(19,2) DEFAULT NULL,
  `nbr_session_globale` decimal(19,2) DEFAULT NULL,
  `nbr_session_mensuel` decimal(19,2) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary_vo`
--

INSERT INTO `salary_vo` (`id`, `annee`, `mois`, `montant_globale`, `montant_mensuel`, `nbr_session_globale`, `nbr_session_mensuel`, `prof`) VALUES
(1, '2021', '6', '4000.00', '1000.00', '15.00', '5.00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `schdedule_vo`
--

CREATE TABLE `schdedule_vo` (
  `id` bigint(20) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schdedule_vo`
--

INSERT INTO `schdedule_vo` (`id`, `color`, `end`, `ref`, `start`, `title`, `prof`) VALUES
(1, 'green', '2021-05-18 09:00:00', 'et1', '2021-05-18 08:00:00', 'Ahmed', 3);

-- --------------------------------------------------------

--
-- Table structure for table `schedule_prof`
--

CREATE TABLE `schedule_prof` (
  `id` bigint(20) NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL,
  `groupe_etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `grp_name` varchar(255) DEFAULT NULL,
  `prof_name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule_prof`
--

INSERT INTO `schedule_prof` (`id`, `end_time`, `ref`, `start_time`, `cours`, `groupe_etudiant`, `prof`, `subject`, `grp_name`, `prof_name`) VALUES
(4618, '2021-12-06 11:00:00', '12', '2021-12-06 09:00:00', 2, 4611, 3, 'Say Hello!!', 'Group 5', 'teacher'),
(4719, '2021-12-13 08:00:00', 'ethtr12451', '2021-12-13 06:00:00', 38, 4611, 4, 'Leisure activities', 'Group 5', 'prof'),
(4626, '2021-12-08 11:00:00', '345', '2021-12-08 09:00:00', 41, 4622, 3, 'More about you', 'Group-7', 'teacher'),
(4718, '2021-12-10 08:00:00', 'ethtr1245', '2021-12-10 06:00:00', 39, 4611, 4, 'When youâ€™re free', 'Group 5', 'prof'),
(4717, '2021-12-09 08:00:00', 'ethtr124', '2021-12-09 06:00:00', 40, 4611, 4, 'Personal profile', 'Group 5', 'prof'),
(4715, '2021-12-06 08:00:00', 'ethtr1', '2021-12-06 06:00:00', 101, 4611, 4, 'Intro lesson', 'Group 5', 'prof'),
(4716, '2021-12-07 08:00:00', 'ethtr12', '2021-12-07 06:00:00', 41, 4611, 4, 'More about you', 'Group 5', 'prof'),
(4659, '2022-01-08 11:00:00', 'cdhk258', '2022-01-08 09:00:00', 40, 4611, 3, 'Personal profile', 'Group 5', 'teacher'),
(4663, '2022-01-16 11:00:00', 'cdhk2589121516', '2022-01-16 09:00:00', 36, 4611, 3, 'koko', 'Group 5', 'teacher'),
(4664, '2022-01-19 11:00:00', 'cdhk258912151619', '2022-01-19 09:00:00', 34, 4611, 3, 'For the geeks', 'Group 5', 'teacher'),
(4665, '2022-01-22 11:00:00', 'cdhk25891215161922', '2022-01-22 09:00:00', 33, 4611, 3, 'Technology', 'Group 5', 'teacher'),
(4666, '2022-01-23 11:00:00', 'cdhk2589121516192223', '2022-01-23 09:00:00', 32, 4611, 3, 'More occasions', 'Group 5', 'teacher'),
(4667, '2022-01-26 11:00:00', 'cdhk258912151619222326', '2022-01-26 09:00:00', 31, 4611, 3, 'Events', 'Group 5', 'teacher'),
(4668, '2022-01-29 11:00:00', 'cdhk25891215161922232629', '2022-01-29 09:00:00', 30, 4611, 3, 'Get emotional', 'Group 5', 'teacher'),
(4704, '2022-01-01 11:00:00', 'ergerg12151819222526291', '2022-01-01 09:00:00', 33, 4622, 3, 'Technology', 'Group-7', 'teacher'),
(4720, '2021-12-14 08:00:00', 'ethtr124512', '2021-12-14 06:00:00', 37, 4611, 4, 'Just another day', 'Group 5', 'prof'),
(4721, '2021-12-17 08:00:00', 'ethtr12451245', '2021-12-17 06:00:00', 34, 4611, 4, 'For the geeks', 'Group 5', 'prof'),
(4728, '2021-12-20 11:00:00', 'ggg1', '2021-12-20 09:00:00', 25, 4611, 3, 'Grab a bite', 'Group 5', 'teacher'),
(4735, '2021-10-08 12:30:00', 'sssx5', '2021-10-08 10:30:00', 40, 4614, 3, 'Personal profile', 'Group-6', 'teacher'),
(4706, '2021-12-29 11:00:00', 'ergerg1215181922252629', '2021-12-29 09:00:00', 34, 4622, 3, 'For the geeks', 'Group-7', 'teacher'),
(4707, '2021-12-26 11:00:00', 'ergerg12151819222526', '2021-12-26 09:00:00', 36, 4622, 3, 'koko', 'Group-7', 'teacher'),
(4708, '2021-12-25 11:00:00', 'ergerg121518192225', '2021-12-25 09:00:00', 37, 4622, 3, 'Just another day', 'Group-7', 'teacher'),
(4722, '2021-12-16 08:00:00', 'ethtr1245124', '2021-12-16 06:00:00', 36, 4611, 4, 'koko', 'Group 5', 'prof'),
(4723, '2021-12-21 08:00:00', 'ethtr1245124512', '2021-12-21 06:00:00', 32, 4611, 4, 'More occasions', 'Group 5', 'prof'),
(4724, '2021-12-20 08:00:00', 'ethtr124512451', '2021-12-20 06:00:00', 33, 4611, 4, 'Technology', 'Group 5', 'prof'),
(4725, '2021-12-23 08:00:00', 'ethtr12451245124', '2021-12-23 06:00:00', 31, 4611, 4, 'Events', 'Group 5', 'prof'),
(4726, '2021-12-24 08:00:00', 'ethtr124512451245', '2021-12-24 06:00:00', 30, 4611, 4, 'Get emotional', 'Group 5', 'prof'),
(4727, '2021-12-13 11:00:00', 'ggg1', '2021-12-13 09:00:00', 28, 4611, 3, 'A day in a life', 'Group 5', 'teacher'),
(4731, '2021-12-23 11:00:00', 'ggg4', '2021-12-23 09:00:00', 24, 4611, 3, 'Food you have', 'Group 5', 'teacher'),
(4732, '2021-12-16 11:00:00', 'ggg4', '2021-12-16 09:00:00', 27, 4611, 3, 'No place like home', 'Group 5', 'teacher'),
(4737, '2021-10-15 12:30:00', 'sssx5', '2021-10-15 10:30:00', 37, 4614, 3, 'Just another day', 'Group-6', 'teacher'),
(4738, '2021-10-13 12:30:00', 'sssx3', '2021-10-13 10:30:00', 38, 4614, 3, 'Leisure activities', 'Group-6', 'teacher'),
(4739, '2021-10-20 12:30:00', 'sssx3', '2021-10-20 10:30:00', 34, 4614, 3, 'For the geeks', 'Group-6', 'teacher'),
(4741, '2021-10-22 12:30:00', 'sssx5', '2021-10-22 10:30:00', 33, 4614, 3, 'Technology', 'Group-6', 'teacher'),
(4749, '2021-11-18 11:00:00', 'free4', '2021-11-18 09:00:00', 37, 4742, 3, 'Just another day', 'Group-8', 'teacher'),
(4746, '2021-11-21 11:00:00', 'free0', '2021-11-21 09:00:00', 36, 4742, 3, 'koko', 'Group-8', 'teacher'),
(4748, '2021-11-11 11:00:00', 'free4', '2021-11-11 09:00:00', 40, 4742, 3, 'Personal profile', 'Group-8', 'teacher'),
(4751, '2021-11-14 11:00:00', 'free0', '2021-11-14 09:00:00', 39, 4742, 3, 'When youâ€™re free', 'Group-8', 'teacher'),
(4753, '2021-11-25 11:00:00', 'free4', '2021-11-25 09:00:00', 33, 4742, 3, 'Technology', 'Group-8', 'teacher'),
(4754, '2021-12-14 11:00:00', 'ferf', '2021-12-14 09:00:00', 41, 4742, 3, 'More about you', 'Group-8', 'teacher'),
(4759, '2022-01-12 09:00:00', 'frttt3', '2022-01-12 07:00:00', 40, 4742, 3, 'Personal profile', 'Group-8', 'teacher'),
(4760, '2022-01-19 09:00:00', 'frttt3', '2022-01-19 07:00:00', 37, 4742, 3, 'Just another day', 'Group-8', 'teacher'),
(4756, '2022-01-16 09:00:00', 'frttt0', '2022-01-16 07:00:00', 39, 4742, 3, 'When youâ€™re free', 'Group-8', 'teacher'),
(5307, '2021-12-21 20:00:00', 'wefwef', '2021-12-21 17:00:00', 34, 4742, 3, 'For the geeks', 'Group-8', 'teacher teacher'),
(5558, '2021-12-30 11:00:00', 'referf', '2021-12-30 08:00:00', 101, 5556, 3, 'Intro lesson', 'Group-aicha', 'teacher teacher');

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `content` int(11) NOT NULL,
  `contenu` varchar(3000) DEFAULT NULL,
  `indication_prof` varchar(2000) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero_order` int(11) DEFAULT NULL,
  `questions` varchar(2000) DEFAULT NULL,
  `url` int(11) NOT NULL,
  `url_image` varchar(2000) DEFAULT NULL,
  `url_image2` blob,
  `url_image3` varchar(255) DEFAULT NULL,
  `url_video` varchar(25500) DEFAULT NULL,
  `categorie_section` bigint(20) DEFAULT NULL,
  `cours` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(968, NULL, 1, 'Who has the most adorable smile?\r\nWho is a slobbery king? Why?\r\nWho do you like most? And why?\r\n', '', 'Describe what you see', 1, 'Choice:', 0, '', NULL, NULL, '', 1, 533),
(967, NULL, 1, ' Can this service help you?\r\nYou mustnâ€™t park your car on the sidewalk.\r\nThey should trust me.\r\n\r\n\r\n\r\n\r\nCould you repeat, please?\r\nIt may happen soon.\r\nYou should follow this rule.\r\nYou mustnâ€™t break the law.\r\nHe has to meet with him.\r\n\r\n\r\nBut you have to be at the dentist now!\r\nShe might study at school.\r\nShould I do it in the shop?\r\n\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 533),
(969, NULL, 1, 'It only takes up to 4 minutes to decide whether you like someone or not. How did they get this information?!\r\nWhen two lovers gaze at each other\'s\' eyes, their heart rates synchronize. Won\'t it cause a heart attack?\r\nFalling in love has neurological effects similar to those of cocaine. Does it mean we can suffer from love addiction?\r\nCuddling releases natural painkillers. Does it really work?\r\nHolding a loved one\'s hand relieves pain and stress. Should we hug each other at the exams?\r\nHistorically, sweat has been an active ingredient in perfume and love potions. Do you still want to buy new perfume?\r\nYour nerve cells work better during the first year of love. Are they workaholics?!\r\n', '', 'Let\'s have fun!', 5, 'Read the following facts about love:', 0, '', NULL, NULL, '', 5, 534),
(970, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 534),
(971, NULL, 1, ' Have you ever had a blind date in your life?\r\nDo you believe in everlasting love? And why?\r\nDo you think fairy tales influence our choice of a partner?\r\nHow old were you when you had your first boyfriend or girlfriend? 5.1s first love always unfortunate and miserable?\r\nDo you know any tips on how to get over unanswered love?\r\nHave you ever found a friend online? How did it happen?\r\nWhere would you go with your boyfriend/girlfriend on a date?\r\nShould people who love each other get finally married?\r\nCan you forgive somebody\'s betrayal? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 534),
(972, NULL, 1, 'I have just fallen out with my husband.\r\nHe has already apologized for his mistake.\r\nWe have not complained yet.\r\nHave you ever betrayed anybody?\r\nThey have never fallen out with each other.\r\nWe have hugged several times.\r\nThis couple has split up today.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 534),
(973, NULL, 1, 'Did you haveâ€¦?\r\nDo you think thatâ€¦?\r\nWhat is the main reason forâ€¦?\r\n', '', 'Describe what you see', 1, 'Finish the following questions and ask your teacher:', 0, '', NULL, NULL, '', 1, 534),
(974, NULL, 1, 'Here are words: \r\ngirlfriend, epic fail, love affair, date, worry, forget, kiss, patience, mature, funny\r\n\r\nMake a catchy story using these words.\r\nSay â€œblipâ€ instead of these words.\r\nMake your teacher find it out.\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 535),
(975, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 535),
(976, NULL, 1, ' Do you believe in love at first sight? Has it happened to anybody you know?\r\nWhat is the main purpose of marriage?\r\nIs it easy for you to forgive other people?\r\nDo you think that your beloved one should also be your best friend? Explain your opinion.\r\nDoes getting married always mean giving up freedom?\r\n6.1s it easy for you to fall in love or are you more of a picky kind of person?\r\nWhat qualities are the must-haves for a perfect relationship? Why?\r\nWhy do people step out on their partners?\r\nDo you like hugs? Do you think that hugging really makes us healthier?\r\nName 5 adjectives that describe your perfect partner. \r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 535),
(978, NULL, 1, 'Do you know about bubble gum stickers â€œLove isâ€? Do you like them?\r\nDid you use to collect them in the past?\r\nCan you give an example of a funny quote on what â€œLove isâ€?\r\n', '', 'Describe what you see', 1, 'Answer the following questions:', 0, '', NULL, NULL, '', 1, 535),
(979, NULL, 1, 'Are you a sophisticated jazz lover? Which jazz genres do you know?\r\nAre you fond of instrumental and classical music? How often do you attend such kind of concerts?\r\nAre you in love with magnificent sixties and ethnic fusion? Do you sometimes visit open-air festivals?\r\nAre you a pale and melancholic goth admirer? Which gall bands are still popular nclvadays?\r\nAre you a hip and snappy rap listener? Why is rap music so trendy these days?\r\nAre you an old school metal enthusiast? What metal bands are your favorite?\r\nOr maybe you are a mixture of all these?\r\nWhy do people love each of these genres?\r\n', '', 'Let\'s have fun!', 5, 'Choose the pictures that represent you and your music preferences best. Explain your choice.', 0, '', NULL, NULL, '', 5, 536),
(977, NULL, 1, ' I have just fallen out with my husband.\r\nHe has already apologized for his mistake.\r\nWe have not complained yet.\r\nHave you ever betrayed anybody?\r\nThey have never fallen out with each other.\r\nWe have hugged several times.\r\nThis couple has split up today.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 535),
(983, NULL, 1, 'Try to spell the word â€œrhythmâ€\r\nWhat does it mean?\r\nWhat letters are not pronounced?\r\nIs rhythm only in music or in other kinds of art too?\r\n', '', 'Describe what you see', 1, 'Puzzle:', 0, '', NULL, NULL, '', 1, 536),
(980, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 536),
(981, NULL, 1, ' Why do people like music so much?\r\nAre you fond of music?\r\nWhat genres of music do you prefer?\r\nWhat are your favorite singers/bands?\r\nS. Can you play any musical instrument? Which one?\r\nDo you like singing?\r\nHave you ever played in a band?\r\nDo you have stage fear?\r\nDid you go to music school?\r\nHave you ever sung in a chorus?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 536),
(982, NULL, 1, 'I have been on a concert tour for a month.\r\nHe has just learned the lyrics of your song.\r\nIt was a really big flop a week ago.\r\nWe have recorded more than 10 singles.\r\nDid you know anything about this lead singer last year?\r\nThey have never performed in public.\r\nHow long have you been rock music fan?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 536),
(985, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 537),
(987, NULL, 1, ' I have been on a concert tour for a month.\r\nHe has just learned the lyrics of your song.\r\nIt was a really big flop a week ago.\r\nWe have recorded more than 10 singles.\r\nDid you know anything about this lead singer last year?\r\nThey have never performed in public.\r\nHow long have you been rock music fan?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 537),
(986, NULL, 1, ' Do you agree with the phrase \'Music can change the world because it can change people?\r\nDo you know people who don\'t listen to music at all?\r\nDo you like dancing?\r\nCan you read music?\r\nWhat is more important in the song â€¢ music or lyrics?\r\nDo you know anything about folk music of your country?\r\nHave you ever met any famous singers?\r\nWhat does the word \"Melomaniae mean?\r\nDo you know the difference between beat and rhythm?\r\nHow can music make our life better?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 537),
(984, NULL, 1, 'What 5 items would you choose to tell aliens about music? Explain your choice.\r\nHow can you explain to them what music is and why do people need music?\r\nMat song would you play to an alien?\r\nWhat musical genres would you show to aliens in the first place?\r\nWhat musical instrument can amaze them?\r\nWill robots replace musicians and composers in the distant future?\r\nCan you imagine any amazing musical inventions?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 537),
(991, NULL, 1, ' Why do you think people emigrate?\r\nIs the emigration a pressing problem nowadays?\r\nAre wars and battles inevitable in any society?\r\nWill all citizens carry weapons in the future?\r\nwas bribery a problem people couldn\'t tackle in the past?\r\nHave you ever heard any news about hijacking? What did you feel?\r\nDoes modern society make you horrified? And why?\r\nHave you ever bumped into a criminal or an offender?\r\nDo you feel sorry for the homeless? And why?\r\nHow could we help homeless people?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 538),
(988, NULL, 1, 'Ask me 5 questions using  Past Simple', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 537),
(989, NULL, 1, 'Results\r\n15-13 points: what an observant person you are!\r\n12-9 points: you are really not bad, dude!\r\n8-4 points: a little attentiveness never hurts!\r\n3-0 points: underachiever and proud of it!\r\n\r\n\r\n', 'Keys\r\nStripes missing on the fire truck\r\nPolice car blue light has changed to red\r\nSnowflakes missing above the mountain\r\nSar person has lots his torch\r\nCircle on top of boat mast has changed colour\r\nTrampers shirt has changed from red to blue\r\nPukekoâ€™s beak has changed from orange to yellow\r\nWhich cable is missing from the bottom of the   being winched down\r\nFlying doctors logo is missing from the aircraft\r\nDivers snorkel is missing\r\nFlag on boat has changed colour\r\nMissing piece of quad bike tire\r\nSleeve on she pilot has changed from red to green\r\nâ€œghâ€, on she has been flipped\r\nTop of transmitter tower is missing', 'Let\'s have fun!', 5, 'Find as many differences as possible.\r\nFind out if you are helpful in a Search and Rescue Operation.', 0, '', NULL, NULL, '', 5, 538),
(990, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 538),
(992, NULL, 1, 'They were flying to Spain when I stayed at home.\r\nWe found out all the necessary information yesterday.\r\nHe is fighting for his freedom now.\r\nWe are still looking into the reasons of that strike.\r\nI am going to vote for our candidate.\r\n\r\n\r\n\r\nI have fallen a victim to a dangerous infection.\r\nTeenagers often rebel against their parents.\r\nWe are meeting with homeless boys in 30 minutes.\r\nWhile he was bribing the police caught him.\r\nThis government supported talented people 5 years ago.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 538),
(995, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 539),
(993, NULL, 1, 'Freedom\r\nIndependence\r\ncitizenship\r\n', '', 'Describe what you see', 1, 'Explain the following in your own words:', 0, '', NULL, NULL, '', 1, 538),
(994, NULL, 1, 'You are going to visit the world of Middle-earth.\r\nWho will come with you? And why?\r\nWhat are you planning to do there?\r\nWhat presents will you take to elves? And why?\r\nWill you take part in any dwarfs\' merrymaking?\r\nif you face up an ores rebellion what will you do?\r\nWhat weapons would you choose for fights? And why?\r\nDo you know any tips on how to struggle against the dragon?\r\nWould you like to keep Bilbo Baggins Company in his adventures?\r\n', '', 'Let\'s have fun!', 5, 'Ideas:', 0, '', NULL, NULL, '', 5, 539),
(996, NULL, 1, ' Do you think that nuclear power is dangerous? And why?\r\nWould you like to work in the educational institution? And why?\r\nWhat are the main reasons of any rebellion?\r\nHave you ever taken part in any strike?\r\nAre you satisfied with the industry development in your country?\r\nWhat should you do to get a school scholarship?\r\nDo you think that work trial period for up to 90 days is too long?\r\nHow does the government help accident victims?\r\nWhat kingdoms in the world would you like to visit? And why?\r\nWhat weaknesses does modern society have?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 539),
(997, NULL, 1, 'They have never been to Spain.\r\nWe found out all the necessary information yesterday.\r\nHe is fighting for his freedom now.\r\nWe are still looking into the reasons of that strike.\r\nI am going to vote for our candidate.\r\n\r\n\r\n\r\n\r\nI have fallen a victim to a dangerous infection.\r\nTeenagers often rebel against their parents.\r\nWe are meeting with homeless boys in 30 minutes.\r\nWhile he was bribing the police caught him.\r\nThis government supported talented people 5 years ago.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 539),
(1000, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 540),
(998, NULL, 1, 'Explain the following abbreviations:\r\nROFL\r\nTMI\r\nASL\r\nMOS\r\nWYWH\r\n\r\n', 'Keys\r\nRolling(on) the floor lauging / too much information / age sex location / mom over shoulder / wish you were here\r\n', 'Describe what you see', 1, 'Explain:', 0, '', NULL, NULL, '', 1, 539),
(999, NULL, 1, 'In Scotland, homeowners paint their front door .. when they pay off their mortgage.\r\nAccording to an old superstition if a bird flies into a home ... is soon to follow.\r\nRural Indians build their huts out of ...\r\nIn Germany when a couple marries, guests break a whole lot of ... It symbolizes the struggles the new couple Will face as they build a home together.\r\nA Japanese company has developed a house with an earthquake-proofing system that ...\r\nThere is a house in MidWest that is made from a ...\r\nBrass doorknobs disinfect themselves. True or false?\r\n\r\n', 'Keys:\r\nRed\r\nDeath\r\nWine glasses\r\nPorcelain\r\nLevitates\r\nMissing silo\r\ntrue\r\n', 'Let\'s have fun!', 5, 'Let\'s check out how much you know about homes around the world.', 0, '', NULL, NULL, '', 5, 540),
(1001, NULL, 1, ' Why do people decorate their houses?\r\nIs it better to live in an apartment or in a house? Why?\r\nWhat is the main purpose to renovate a house?\r\nHow do you understand this proverb: my house is my castle?\r\nDoes cozy atmosphere play an important role in our life? 6.1s an attic good enough to have a rest? And why?\r\nWhat are the pros and cons of a detached house?\r\nWhat types of houses are becoming popular today?\r\nHave you ever quarrelled with your neighbours? And why?\r\nIs it better to rent or buy a flat/house? Explain why?\r\nWhat types of houses are becoming popular today?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 540),
(1002, NULL, 1, 'Who is the most elegant at this party?\r\nTheir villa is as uncomfortable as ours.\r\nShe is not elegant enough.\r\nOur hedge is as high as our neighbours.\r\nThe attic is the cosiest part of our house.\r\nMy chest of drawers is too tasteless.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 540),
(1003, NULL, 1, 'How does she usually behave?\r\nDoes she have a good sense of humour?\r\nWhat kind of music does she listen to?\r\n', '', 'Describe what you see', 1, 'Imagine youâ€™re living in a duplex and this lady is your neighbour.', 0, '', NULL, NULL, '', 1, 540),
(1006, NULL, 1, ' Why are American people obsessed with cutting their lawns?\r\nDo you know any useful moving tips?\r\nAre you satisfied with your neighborhood?\r\nWhat color would you like to paint the walls in your house? Why? S. What are the advantages and disadvantages of a skylight?\r\nDoes it cost a fortune to rent a flat in a big city?\r\nWhat is better an e-lock or a simple lock? And why?\r\nHow can Japanese people live in such tiny flats?\r\nHave your neighbors ever made you feel uncomfortable?\r\nDo you think your home design is tasteful or tasteless? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 541),
(1004, NULL, 1, 'Make a list of the 10 rules how to steal yummy food from the fridge in your home at night and not to make your family/flatmates notice it without using the following taboo words: silence, food, should/shouldnâ€™t.\r\nDon\'t worry the funny cat in the picture will help you to make up this story ;-)', '', 'Let\'s have fun!', 5, 'Sitgame:', 0, '', NULL, NULL, '', 5, 541),
(1005, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 541),
(1007, NULL, 1, ' This lawn is more attractive than mine.\r\nWho is the most elegant at this party?\r\nTheir villa is as uncomfortable as ours.\r\nShe is not elegant enough.\r\nOur hedge is as high as our neighbours.\r\nThe attic is the cosiest part of our house.\r\nMy chest of drawers is too tasteless.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 541),
(1008, NULL, 1, 'Youâ€™re an owner of the Construction Company.\r\nWhat motto would you make up? And why?\r\n', '', 'Describe what you see', 1, 'Answer:', 0, '', NULL, NULL, '', 1, 541),
(1009, NULL, 1, 'So, your actions?\r\nWould you immediately give up this piece of irrelevant junk and ask for an autograph instead?\r\nWould you fight to the last drop of ones blood for this precious loot?\r\nWould you use it as an opportunity to get acquainted?	\r\nWould you kneel before your idol and sacrifice this holy bun to him/her (and thus make hi /her think that you\'re nuts and run away from you leaving your sacred meal to you)?\r\nOr maybe any other options? \r\nTry to make up a funny ending to this story.\r\n', '', 'Let\'s have fun!', 5, 'Imagine such kind of situation:\r\n\r\nYou\'re wandering around the supermarket picking some necessary stuff when suddenly you see the one and only piece of your favorite bun (or whatever the food you\'re passionate Â°bout). You\'re rushing to grab it fast and determined, and when your hand almost touches is some other hand also tries to grab your precious piece of pure happiness. You look impudently at your gastronomic competitor and realize that it\'s the celebrity you\'re o huge fan of.', 0, '', NULL, NULL, '', 5, 542),
(1011, NULL, 1, ' How much money do you usually spend on food per month?\r\nWhat food do you usually buy when you are in a bad mood?\r\nYou\'re having a party, what will you cook? And why?\r\nDo you prefer going shopping or buying things online?\r\nWhat do you eat for breakfast? Does it take much time?\r\nDo you think you are obsessed with shopping? Why?\r\nWhat is an advantage of eating almond and nuts in general?\r\nWhat would you choose for a snack a package of crisps or a green apple? Why?\r\nHave you ever saved some money to buy something you want?\r\nDo modern people visit bookstores often nowadays? Why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 542),
(1012, NULL, 1, 'I always eat a lot of crisps.\r\nThere isnâ€™t much salmon in this dish.\r\nDo you have any buns?\r\nWe have bought a little ginger.\r\nBring a couple of shrimps, please!\r\nThere are only few melons here. It is not enough.\r\nThey ordered a great amount of tuna 2 days ago.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 542),
(1013, NULL, 1, 'Is the statement controversial?\r\nI always cook with wine. Sometimes I even add it to the food.\r\n', '', 'Describe what you see', 1, 'Phrase:', 0, '', NULL, NULL, '', 1, 542),
(1014, NULL, 1, 'Trolley\r\nPringles\r\nChocolate\r\nYou \r\nCookie Monster\r\nDiet\r\nDonut\r\nShopping\r\nMagic\r\nWine cellar\r\n', '', 'Let\'s have fun!', 5, 'Name the advantages and disadvantages of:', 0, '', NULL, NULL, '', 5, 543),
(1015, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 543),
(1010, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 542),
(1016, NULL, 1, ' Have you ever bought second-hand things?\r\nWhat is the best toy for a child? And why?\r\nWhat is the thing you forget most often when you go shopping?\r\nWhat do you like more: melons or watermelons?\r\nDo you prefer steamed or fried meat? And why?\r\nYou\'re on a diet. What food will you eat then?\r\nWhat online clothes shops do you know? Do you use them?\r\nWhat animals can you buy at any petshop?\r\nDo you make a \"to buy\" list when you go shopping?\r\nWhat is the most popular supermarket in your country? Why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 543),
(1018, NULL, 1, 'What country would you choose to go shopping?\r\nAre there many marketplaces in Japan?\r\nWhat is Belgium famous for? Why?\r\n', '', 'Describe what you see', 1, 'Choice:', 0, '', NULL, NULL, '', 1, 543),
(1017, NULL, 1, ' I always eat a lot of crisps.\r\nThere isnâ€™t much salmon in this dish.\r\nDo you have any buns?\r\nWe have bought a little ginger.\r\nBring a couple of shrimps, please!\r\nThere are only few melons here. It is not enough.\r\nThey ordered a great amount of tuna 2 days ago.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 543),
(1020, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 544),
(1021, NULL, 1, ' Does money play an important role in our life?\r\nHave you ever given money to beggars in the street?\r\nWhat will you do, if you are really rich?\r\nHow often do you borrow money from anybody?\r\nHave you ever bargained while being abroad?\r\nDo you prefer paying by plastic card or in cash? And why?\r\nDo you think it is complicated to get a high income in your country? Why?\r\nAre you obsessed with discounts? And why?\r\nWill you be totally happy as soon as you get lots of money?\r\nDo you think you are good at saving money? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 544),
(1019, NULL, 1, 'Make up as many words as you can from the idiom:\r\n\'have the Midas touch\".\r\n\r\nYou can make a competition with your teacher. Ready, steady, go!\r\nSo, who won?\r\nbut, do you know what this phrase means? Check the first answer. Do you know the history of this idiom? Check the second answer. Do you or any of your friends have the Midas touch?\r\n\r\n', 'Answers:\r\n1 - to have the ability to make money easily-\r\n\r\n2 - King Midas from the Greek mythology turned everything that he touched into gold.', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 544),
(1022, NULL, 1, 'If you look around, you will find this shop easily.\r\nIf he lends me some money, I will pay back in a month.\r\nWe will spend all our savings if we donâ€™t earn anything.\r\nIf they make a profit on it, they will agree to do it.\r\nShe will be very happy if she buys cut-price shoes there.\r\nThey will start their own business if they pay all the taxes.\r\nIf you calculate all the charges, you will not want to do this.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 544),
(1023, NULL, 1, 'I like discounts, becauseâ€¦\r\nIâ€™ve never had a credit, becauseâ€¦\r\nIâ€™ve seen â€œThe Wolf of Wall Streetâ€, becauseâ€¦\r\n', '', 'Describe what you see', 1, 'Finish the following sentences:', 0, '', NULL, NULL, '', 1, 544),
(1024, NULL, 1, 'A dentist invented the electric chair.\r\nThere is more Monopoly money printed every year than actual cash.\r\nItâ€™s possible to lead a cow upstairs but not downstairs.\r\n', '', 'Let\'s have fun!', 5, 'Prove the following facts:', 0, '', NULL, NULL, '', 5, 545),
(1025, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 545),
(1026, NULL, 1, ' What are the advantages and disadvantages of being rich? And why?\r\nAre there lots of taxes you should pay in your country?\r\nDo you agree with the following phrase: money can\'t buy me love?\r\nDo you think that money is the root of all evil? And why?\r\nHave you ever found any money? If so, what did you do with it?\r\nHow much do you usually spend each month on entertainment?\r\nShould one person or both handle the finances in a marriage?\r\nShould children get pocket money from their parents?\r\nDo the best things in life cost no money? And why?\r\nDo you think the per cent of bank loans is high in your country?\r\n\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 545),
(1027, NULL, 1, 'If you look around, you will find this shop easily.\r\nIf he lends me some money, I will pay back in a month.\r\nWe will spend all our savings if we donâ€™t earn anything.\r\nIf they make a profit on it, they will agree to do it.\r\nShe will be very happy if she buys cut-price shoes there.\r\nThey will start their own business if they pay all the taxes.\r\nIf you calculate all the charges, you will not want to do this. \r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 545),
(1, NULL, 1, 'Make three sentences with the following words:\r\nSavings\r\nTrade\r\nlend\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 545),
(2, NULL, 1, 'You make plans with a friend and they cancel on you. You get very upset. Yes or No?\r\nif you knew you\'d die tomorrow, would you go to spend your lag day in Vegas? Yes or No?\r\nYou are a fan of independent films. Yes or No?\r\nYou can say you are grumpy. Yes or No?\r\nYou can let your close friend sit by the window on a plane even if the seat is yours. Yes or No?\r\nIt is okay for you to stay alone for a long time. Yes or No?\r\n\r\n\r\n\r\n\r\n', 'Mostly Yes - Emotional\r\nYou wear your heart on your sleeve. When you\'re sad, angry, or happy, everyone knows it. You can\'t help it. You\'re in touch with your emotions and aren\'t afraid to share it. You tend to have lots of crushes (celebrities, friends, neighbors, you name it!) and you hope to find true love someday.\r\nMostly No - Realistic\r\nYou\'re well-grounded. You donâ€™t really daydream or think about the future. Actually, you tend to find daydreaming pretty pointless. Sometimes people think you\'re pessimistic, but you know that you\'re just being real.\r\n', 'Let\'s have fun!', 5, 'Let\'s find out what type of personality you have.', 0, '', NULL, NULL, '', 5, 546),
(3, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 546),
(4, NULL, 1, 'Why is money the most common way of estimating success?\r\nWhat are the advantages and disadvantages of fame?\r\nWhat would you do if you were absolutely broke?\r\nDo you know any tips on how to deal with failures?\r\nHave there been any failures that made your life better?\r\nHave you ever wanted to be a celebrity? And why?\r\nWhy do you think famous people suffer from drug addiction?\r\nDo you know any hacks on how to be successful?\r\nDo you agree that popularity always means happiness? And why?\r\nWhat achievements have you already had? Are you satisfied with them?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 546),
(5, NULL, 1, 'If I became a celebrity I would perform a lot in public.\r\nWe would succeed in business if we had more money next month.\r\nIf I felt braver, I would deal with it quicklier.\r\nHe could make a fortune if he worked as a pop star.\r\nWhat would you do if you became a president?\r\nI would not have a star syndrome if I won so many awards.\r\nWould you achieve fame if you had a chance?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 546),
(6, NULL, 1, 'Try to spell the word â€œimpregnabilityâ€\r\nDo you know what it means?\r\nHow many vowels do you pronounce as  /É™/\r\n', '', 'Describe what you see', 1, 'Puzzle:', 0, '', NULL, NULL, '', 1, 546),
(7, NULL, 1, 'What pictures represent your attitude to the world in general? And why?\r\nWhat pictures represent your best friend well? And why?\r\nIf you had a chance what activity represented in the picture, would you like to try?\r\nWould you like to join the group of volunteers who plant trees? And why?\r\nDo you think that people are brave enough to make their life perfect? And why?\r\nWhat picture shows a rational solution to the garbage problem? And why?\r\nDo you agree that the root of all evil especially wars is intolerance? And why?\r\nWhat picture in your opinion shows the perfect world? And why?\r\n\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 547),
(10, NULL, 1, 'What will you do if the weather is gloomy next weekend?\r\nIf the food were so disgusting, he wouldnâ€™t eat with so much pleasure now.\r\nIf I lived on the North Pole, I would probably be the happiest person in the world.\r\nI will start a touristic business next year if I find a business angel.\r\nWill we watch this mysterious movie when she comes?\r\nIs she were not so dull, she would be married now.\r\nUnless the issue is crucial we will have a break.\r\n\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 547),
(8, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 547),
(9, NULL, 1, ' How much ideal is your life? Would you like to change anything?\r\nHow do you understand the phrase \"ideal world\'?\r\nIf people all over the globe were more tolerant, what would the world look like?\r\nWhat would be the crucial symbols of the perfect world? And why?\r\nWhat should human beings do to make this world much better?\r\nWhat do you think the ideal working conditions will be in the future? And why?\r\nWhat would be the best way of transport in 1000 years?\r\nIf you had an opportunity, what planet would you visit? And why?\r\nDo you think that family will play an important role in the future? And why?\r\nDo you agree that utopia always means happiness and equality? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 547),
(13, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 548),
(11, NULL, 1, 'The First Conditional\r\nThe Second Conditional\r\n\r\n', '', 'Describe what you see', 1, 'Ask the teacher two questions using:', 0, '', NULL, NULL, '', 1, 547),
(12, NULL, 1, 'What pictures represent your attitude to the world in general? And why?\r\nWhat pictures represent your best friend well? And why?\r\nIf you had a chance what activity represented in the picture, would you like to try?\r\nWould you like to join the group of volunteers who plant trees? And why?\r\nDo you think that people are brave enough to make their life perfect? And why?\r\nWhat picture shows a rational solution to the garbage problem? And why?\r\nDo you agree that the root of all evil especially wars is intolerance? And why?\r\nWhat picture in your opinion shows the perfect world? And why?\r\n\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 548),
(15, NULL, 1, 'What will you do if the weather is gloomy next weekend?\r\nIf the food were so disgusting, he wouldnâ€™t eat with so much pleasure now.\r\nIf I lived on the North Pole, I would probably be the happiest person in the world.\r\nI will start a touristic business next year if I find a business angel.\r\nWill we watch this mysterious movie when she comes?\r\nIs she were not so dull, she would be married now.\r\nUnless the issue is crucial we will have a break.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 548),
(14, NULL, 1, ' How much ideal is your life? Would you like to change anything?\r\nHow do you understand the phrase \"ideal world\'?\r\nIf people all over the globe were more tolerant, what would the world look like?\r\nWhat would be the crucial symbols of the perfect world? And why?\r\n What should human beings do to make this world much better?\r\nWhat do you think the ideal working conditions will be in the future? And why?\r\nWhat would be the best way of transport in 1000 years?\r\nIf you had an opportunity, what planet would you visit? And why?\r\nDo you think that family will play an important role in the future? And why?\r\nDo you agree that utopia always means happiness and equality? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 548),
(16, NULL, 1, 'Disgusting\r\nMagnificent\r\nmarine\r\n', '', 'Describe what you see', 1, 'Explain the following words:', 0, '', NULL, NULL, '', 1, 548),
(17, NULL, 1, 'You\'re going to send a time capsule to the other galaxy where a new life has just been discovered.\r\nWhat things would you choose? And why?\r\nWhat food are you planning to send? And why?\r\nWould you send them your favorite alcohol?\r\nWhat present would you send?\r\n What do you write in a letter about human beings?\r\nWhat questions would you ask? What for?\r\nWould you invite them to visit the Earth? And why?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 549),
(18, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 549),
(19, NULL, 1, ' What comes to mind when you think about your future?\r\nDo you think the world isn\'t perfect now, because we\'re afraid of changes? And why?\r\nDo you agree that the past can teach us about the future? And why?\r\nAre you optimistic or pessimistic about the future of the planet? And why?\r\nWhat would you do, if you had a supernatural power?\r\nWhat miraculous power shouldn\'t people have no matter what? And why?\r\nDo you believe that social problems will totally disappear in the future?\r\nIf you had a chance, what planet in the Solar System would you choose to live?\r\nWhat do you do to make the Earth the best place to live?\r\nWhat does the following phrase mean: \"the good old days?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 549),
(25, NULL, 1, 'They always film only love-stories. Itâ€™s incredible.\r\nYou will drive me mad one day with your fantastic idea!\r\nI threw away all my old clothes last weekend.\r\nWhy did you admire him so much then?\r\nThis novel will obviously become the best one ever.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 550),
(23, NULL, 1, '', '', 'Watch the video', 3, '', 1, '', NULL, NULL, '', 4, 550),
(24, NULL, 1, 'What do you do when you have free time?\r\nHave you tried any kind of extreme sports? What was it?\r\nHow often do you go abroad? Why?\r\nWhere do you like going to best of all?\r\nDo you usually go alone?\r\nWould you go to unpopular for tourists countries just for fun?\r\nWhere would you never go? Why?\r\nDid you use to be a good student or a party animal?\r\nCan you remember the best party you have ever visited?\r\nDo you have any crazy friends who can always make any party special? Tell more about them.\r\n', '', 'Time to talk', 4, '', 1, '', NULL, NULL, '', 3, 550),
(21, NULL, 1, 'It was out of this world!\r\nFor example: if you tried eating at a new restaurant, and the food was REALLY great, you can describe it as â€œout of this world.â€\r\n', '', 'Describe what you see', 1, 'Explain the following idiom:', 0, '', NULL, NULL, '', 1, 549),
(22, NULL, 1, 'What country and region would it be?\r\nWould it be a lively public place or a quiet reserved one?\r\nWho would you like to have as your neighbor?\r\nWould you like to take your old furniture there or some new?\r\n', '', 'Let\'s have fun!', 5, 'Think about a perfect house you would love to live in.', 0, '', NULL, NULL, '', 5, 550),
(20, NULL, 1, 'What will you do if the weather is gloomy next weekend?\r\nIf the food were so disgusting, he wouldnâ€™t eat with so much pleasure now.\r\nIf I lived on the North Pole, I would probably be the happiest person in the world.\r\nI will start a touristic business next year if I find a business angel.\r\nWill we watch this mysterious movie when she comes?\r\nIs she were not so dull, she would be married now.\r\nUnless the issue is crucial we will have a break.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 549),
(26, NULL, 1, 'Ask me 5 questions about my favourite things â˜º\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 550),
(27, NULL, 1, 'Who would you like to spend your perfect day with?\r\nWhat would you do?\r\nWhere would you like to be and when (choose any historical period)?\r\n\r\nUse these words:\r\nIncredible\r\nHighly\r\nFully\r\nKeen on\r\nadore\r\n', '', 'Let\'s have fun!', 3, 'Talking about a perfect dayâ€¦', 1, '', NULL, NULL, '', 5, 551),
(28, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 551),
(29, NULL, 1, 'What do you do every day?\r\nWhat do you prefer doing at weekends?\r\nDo you have any bad habits?\r\nIs it good or bad to have a lot of steady habits?\r\nWhat things do you detest or loathe?\r\nWhat qualities do you abhor in people?\r\nAnd what qualities do you admire?\r\nDo you prefer believable stories or incredible ones?\r\nDo you like cats or dogs more?\r\n', '', 'Time to talk', 5, '', 1, '', NULL, NULL, '', 3, 551),
(30, NULL, 1, 'They always film only love-stories. Itâ€™s incredible.\r\nYou will drive me mad one day with your fantastic idea!\r\nI threw away all my old clothes last weekend.\r\nWhy did you admire him so much then?\r\nThis novel will obviously become the best one ever.\r\n', '', 'Study the information', 1, '', 1, '', NULL, NULL, '', 2, 551),
(31, NULL, 1, 'Iâ€™ve got several brothers and sisters.\r\nI live in a very cold country.\r\nI like crows.\r\nI know nothing.\r\nI died once and came back to life.\r\n', '', 'Describe what you see', 2, 'Is this about you?', 1, '', NULL, NULL, '', 1, 551),
(32, NULL, 1, 'Also, some hints might be helpful:\r\nIs it a rom-com or a drama?\r\nWhat time and place does it take place in?\r\nWho are the main characters?\r\nWill you include some mystery in it?\r\nIs it true-to-life or maybe absurd and surreal?\r\nWhat is the main twist?\r\nDoes it have a happy or a sad ending?\r\nWould you like to watch a movie based on your plot?\r\nDo you know any novels or movies about love or friendship between robots and humans?\r\n', '', 'Let\'s have fun!', 5, 'Make up an exciting love story', 0, '', NULL, NULL, '', 5, 552),
(36, NULL, 1, 'Who could say this?\r\nâ€œMy hobbies include responding to stupid questions with sarcastic answers.â€\r\n', '', 'Describe what you see', 1, 'Phrases:', 0, '', NULL, NULL, '', 1, 552),
(33, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 552),
(34, NULL, 1, 'What hobbies do you have?\r\nIs your job your hobby?\r\nWhat do you want to try if you have more money/free time?\r\nIf you have a lot of money, will you continue working or will you spend more time on hobbies?\r\nWhat movies and books do you prefer?\r\nWhat movie is the most true-to-life for you? And a book?\r\nDo you like throwing away old things?\r\nDo you know people who are mad about collecting? What do they collect?\r\nDo you know people who are so mad about something that they can\'t imagine their life without it?\r\nAnd do you have anything you can\'t imagine your life without?\r\n\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 552),
(37, NULL, 1, '1-Who is it better to be:\r\nA vegan with superpowers\r\nA true old hippie\r\nA joyful goth\r\nA revolutioner\r\nA king\r\nA Buddhist monk\r\nA hermit\r\nThe happiest person on Earth\r\nThe only person on the uninhabited island\r\nThe last person on Earth\r\n2-Why do you think so?\r\n3-What would you do then?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 553),
(35, NULL, 1, 'They always film only love-stories. Itâ€™s incredible.\r\nYou will drive me mad one day with your fantastic idea!\r\nI threw away all my old clothes last weekend.\r\nWhy did you admire him so much then?\r\nThis novel will obviously become the best one ever.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 552),
(38, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 553),
(39, NULL, 1, 'Is other peopleâ€™s acceptance important to you?\r\nAre you tolerant to other peopleâ€™s drawbacks and distinctions?\r\nHave you ever escaped from home when you were a teenager?\r\nAre you a rebellious person?\r\nWhy do people join subcultures?\r\nWhere you a part of any subculture? Are you now?\r\nWhat is the difference between subculture and cult?\r\nDo you agree that youth is the best period of time?\r\nDo you often feel that younger people are more stupid than you were at their age?\r\nDo you want to feel younger or older?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 553),
(40, NULL, 1, 'I am talking to you right now.\r\nWhen I saw her yesterday she was going down these stairs.\r\nI will be waiting at the station at 6 on Monday.\r\nThey always wear baggy trousers and oversized T-shirts.\r\n\r\n\r\nHe collected network information and made a conclusion a week ago.\r\nYesterday at the same time he was collecting network information.\r\nToday they are fooling around more than usual.\r\nYesterday morning while they were fooling around she was negotiating with an important client.\r\n\r\n\r\n\r\nAt this moment I donâ€™t perceive any smells.\r\nSam, what will you be doing tomorrow at 6 pm? â€“ I will be helping in the dining room.\r\nI promise your son wonâ€™t escape from the lesson.\r\nWill you be cooking a dinner at the same time tomorrow?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 553),
(41, NULL, 1, 'I like wearingâ€¦\r\nI collectâ€¦\r\nMy distinctive feature isâ€¦\r\nI think that subcultures areâ€¦\r\nMy role model isâ€¦\r\n', '', 'Describe what you see', 1, 'Finish the sentences', 0, '', NULL, NULL, '', 1, 553),
(42, NULL, 1, 'Quiz\r\nWhy donâ€™t cannibals eat clowns?\r\nA is the father of B. But B is not the son of A. Howâ€™s that possible?\r\nA truck driver is going down a one-way street the wrong way and passes at least 10 cops. Why he is not caught?\r\nHow can a man go 8 days without sleep?\r\nThere was an airplane crash, every single person is dead, but yet two people survived. How is this possible?\r\nWhat 3 letters change a girl into a woman?\r\nIs it illegal for a man to marry his widowâ€™s sister?\r\nJoin these two sentences: I was riding to school. I saw a dead body.\r\nApproximately how many birthdays does the average Japanese woman have?\r\nLarryâ€™s father has five sonsâ€™ named Ten, Twenty, Thirty, and Forty. Guess what would be the name of the fifth?\r\n\r\n\r\n\r\n\r\n', 'Keys:\r\nThey taste funny\r\nB is the daughter\r\nBecause he was not driving! Heâ€™s walking on the sidewalk\r\nBy sleeping during the night time\r\nThe two were married\r\nAge\r\nNo, but since heâ€™s dead it would be kind of difficult \r\nI saw a dead body riding to school\r\nJust one. All the others are anniversaries\r\nLarry', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 554),
(43, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 554),
(44, NULL, 1, 'Did you often feel depressed when you were a teen?\r\nDo you have friends or relatives who completely understand you?\r\nIs the world around a hostile place or a joyful one?\r\nHave you ever helped anybody in deep depression?\r\nWhy do people have a need to protest?\r\nHave you ever protested against anything?\r\nDo clothes reflect oneâ€™s character?\r\nDo you pay a lot of attention to the way people dress?\r\nHave you ever pretended to be someone youâ€™re not?\r\nIs it good or bad that people are so much different?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 554),
(45, NULL, 1, ' I am talking to you right now.\r\nWhen I saw her yesterday she was going down these stairs.\r\nI will be waiting at the station at 6 on Monday.\r\nThey always wear baggy trousers and oversized T-shirts.\r\n\r\n\r\n\r\nHe collected network information and made a conclusion a week ago.\r\nYesterday at the same time he was collecting network information.\r\nToday they are fooling around more than usual.\r\nYesterday morning while they were fooling around she was negotiating with an important client.\r\n\r\n\r\n\r\nAt this moment I donâ€™t perceive any smells.\r\nSam, what will you be doing tomorrow at 6 pm? â€“ I will be helping in the dining room.\r\nI promise your son wonâ€™t escape from the lesson.\r\nWill you be cooking a dinner at the same time tomorrow?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 554),
(46, NULL, 1, 'Do you prefer extraordinary or casual style?\r\nWhich one is better?\r\nWhy?\r\n', '', 'Describe what you see', 1, 'Choice:', 0, '', NULL, NULL, '', 1, 554),
(47, NULL, 1, 'Advices at parties\r\nWhat kind of parties do you prefer?\r\nDescribe your ideal party.	^\r\nIs it polite to use devices when you are meeting with friends?\r\nHow can devices be used when you are meeting with friends?\r\nDo you post pictures from your parties somewhere? Why?\r\nDo you communicate with your Facebook / Instagram / Other social network friends while you are meeting with your \'real life\' friends?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 555),
(48, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 555),
(49, NULL, 1, 'What are the most fascinating changes in communication brought by social networks?\r\nWhen did you write a long letter last time?\r\nWhom did you write a letter last time?\r\nDo you prefer to write a message or talk via cell phone? Why?\r\nHow long have you been using social networks?\r\nWhat social networks have you been using?\r\nWhat is the main purpose of using social networks?\r\nWhat helps to be in touch with friends nowadays?\r\nHave you ever felt tired of digital interaction?\r\nWhat will communication eventually be like in 5 years?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 555),
(55, NULL, 1, ' They have been fixing her cell phone for ages.\r\nI am worried. I have been dialling his number all day but there is no reply.\r\nHe hasnâ€™t been rehearsing for more than a month.\r\nHave they been keeping in touch since they were children?\r\nOur date has been lasting since 7 oâ€™clock. It seems to be endless.\r\nMolly has been looking back on her wedding all day long.\r\nMy friends havenâ€™t been keeping in touch for a year already.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 556),
(51, NULL, 1, 'How to communicate with a person in a long distance relationship?\r\nImagine he/she doesnâ€™t use digital devices.\r\n', '', 'Describe what you see', 1, 'Explain:', 0, '', NULL, NULL, '', 1, 555),
(52, NULL, 1, 'Make as many words as you can from â€œTextpectationâ€ in 2 minutes.\r\nDo you know what the word means? It means waiting for the answer to your text message.\r\nDo you know any other unusual words like this?\r\n', '', 'Let\'s have fun!', 5, 'Creating words:', 0, '', NULL, NULL, '', 5, 556),
(50, NULL, 1, 'They have been fixing her cell phone for ages.\r\nI am worried. I have been dialling his number all day but there is no reply.\r\nHe hasnâ€™t been rehearsing for more than a month.\r\nHave they been keeping in touch since they were children?\r\nOur date has been lasting since 7 oâ€™clock. It seems to be endless.\r\nMolly has been looking back on her wedding all day long.\r\nMy friends havenâ€™t been keeping in touch for a year already.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 555),
(56, NULL, 1, 'Have you been using voicemails for several years?\r\nDo you text your colleagues?\r\nHave you been using social networks for five years?\r\nDo you keep in touch with your classmates?\r\nIs Viber your favourite mobile app?\r\n', '', 'Describe what you see', 1, 'Answer the following questions without using yes/no', 0, '', NULL, NULL, '', 1, 556),
(53, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 556),
(54, NULL, 1, 'Can you name ten different forms of communication?\r\nHow will you communicate if your smartphone is out of order?\r\nHow do you keep yourself up-to-date?\r\nHow do you usually keep in touch with your friends?\r\nHow long have you been using mobile apps?\r\nHow often do you use voicemails?\r\nCan you look back and say what your first friendship on social networks is?\r\nWhom have you recently talked to?\r\nWhat kind of information do you usually share on social networks?\r\nWhat kind of information will you never share on social networks?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 556),
(57, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 557),
(58, NULL, 1, ' What can make the date perfect?\r\nWhat are the most common reasons for people to break off their relationships?\r\nWhat are the traits of a perfect partner for you?\r\nDo you believe in love at first sight? Explain your opinion.\r\nWhy do people sometimes cheat on their partners?\r\nHow can lies be good in a relationship?\r\nWhat best ways to make it up with somebody do you know?\r\nWhat are the pros and cons of dating someone?\r\nWhy are some dating apps like Tinder so popular nowadays?\r\nWhatâ€™s your attitude towards dating apps? Do you think it is possible to meet your other half this way?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 557),
(59, NULL, 1, 'Something has been bothering me since I moved out of my parentsâ€™ house.\r\nI am almost 60 but I have never bothered about my age.\r\nYou know, Susie has been cheating on her husband long enough.\r\nThey have just decided to break off their relationships although they have been together for more than 5 years.\r\nHow long have they remained just friends?\r\nShe hasnâ€™t made it up with her boyfriend. They are still on the outs with each other.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 557),
(60, NULL, 1, 'Read the following riddle:\r\nA doctor and a bus driver are both in love with a pretty girl named Sarah. The bus driver had to go on a long trip that would last a week. Before leaving, he gave Sarah seven apples. Why?\r\nDo you know the answer?\r\nWhat does the answer to this riddle mean?\r\n\r\n\r\n', 'Keys:\r\nBecause an apple a day keeps the doctor away.', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 557),
(61, NULL, 1, 'What do these pictures convey?\r\nWhich picture gives you warm feelings?\r\nFind similar pictures and tell why they are similar.\r\nFind the opposite pictures and tell why they are opposite.\r\nHave you ever drawn something like that on your fingers?\r\n', '', 'Let\'s have fun!', 5, 'Finger pictures:', 0, '', NULL, NULL, '', 5, 558),
(62, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 558);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(63, NULL, 1, 'Have you ever experienced one-sided love?\r\nWhat threatens romantic relationships?\r\nWhat might help to build a steady relationship?\r\nWhat repels people from each other in a relationship?\r\nHave you ever been on a blind date?\r\nHow do you feel on the first date?\r\nHow would you dress up on a first date?\r\nHow would you compare short-term and long-term relationships?\r\nHow do you assure rapport in your relationship?\r\nDo you have any expectation for your partner?\r\n\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 558),
(64, NULL, 1, 'Something has been bothering me since I moved out of my parentsâ€™ house.\r\nI am almost 60 but I have never bothered about my age.\r\nYou know, Susie has been cheating on her husband long enough.\r\nThey have just decided to break off their relationships although they have been together for more than 5 years.\r\nHow long have they remained just friends?\r\nShe hasnâ€™t made it up with her boyfriend. They are still on the outs with each other.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 558),
(65, NULL, 1, 'If you have a crush on someone, don\'t do anything; just wait until they fall in love with you.\r\nWhen you quarrel with your partner, remember that you\'re always right and you have to prove it by all means possible.\r\nTry to control every step of your partner, thus they will never cheat on you.\r\nRead the personal mail and a private message of your partner, after all, forewarned is forearmed.\r\nWhen you\'re far away from each other, don\'t forget to text or call every minute to check if everythings okay and they miss you properly.\r\nAre these tips useful?\r\nDo you know any other brilliant tips like these?\r\n', '', 'Describe what you see', 1, 'Read the following tips:', 0, '', NULL, NULL, '', 1, 558),
(66, NULL, 1, 'Do you think you underestimate your knowledge in sports? Let\'s check it!\r\nHow many players are there in a cricket team?\r\nWhen did boxing become legal?\r\nWhat sport is the most attended and watched one?\r\nWhy were yellow balls introduced for tennis?\r\nDo women also play golf?\r\nWhat was used as the first basketball hoop?\r\nAt what speed does a badminton shuttle travel?\r\nWhat company manufactures all the NBA uniforms?\r\nHow many stitches are there on a baseball ball?\r\nWho was the youngest football player winning the World Cup?\r\n', 'Keys:\r\nEleven\r\nIn 1901\r\nFootball\r\nTo make them visible on TV\r\nSure, but only 22.8% of all golfers are women\r\nA peach basket with on bottom\r\n180 mph \r\n adidas\r\n108 stitches \r\npele\r\n', 'Let\'s have fun!', 5, 'Sports quiz:', 0, '', NULL, NULL, '', 5, 559),
(68, NULL, 1, ' Do you like extreme sports?\r\nAre the precautions in extreme sports justified?\r\nHow often do you go hiking?\r\nDo you consider auto racing is a sport or a fancy?\r\nDo you think a world championship is a sport event or just a business project?\r\nHave you ever given up doing any sport? Why?\r\nHow would you encourage your friend to start training?\r\nDo you wear a helmet while cycling?\r\nIs hang gliding suitable for tourists and amateurs?\r\nDo you think archery is a popular sport?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 559),
(72, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 560),
(73, NULL, 1, 'Do you think jogging is a sport for all ages?\r\nIs victory so necessary in sports competitions?\r\nIs it a good habit to check your weight changes every day?\r\nDo you try to keep fit before any upcoming event?\r\nDo you consider rock climbing a sport or a hobby?\r\nCan you recall the names of any famous soccer players?\r\nIs professional equipment in sport useful or just a waste of money?\r\nIs it necessary to warm-up before training?\r\nHave you ever tried parachute jumping? If no, do you want to?\r\nIs it an easy thing to judge a sports event?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 560),
(67, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 559),
(71, NULL, 1, '\r\nHow many sporting events do you know?\r\nSome hints: Olympic Games, Soccer World Cup, Asian Games, Youth Olympics, Winter Olympics Choose the biggest and the most significant. And don\'t forget to add your own examples!\r\nWould you like to have a ticket for one of these events? If so, which one?\r\nWhat sporting event is the most important in your country?\r\nIs there a national game that millions of fans follow?\r\nTell us about the most popular championship in your country.\r\nIs your country famous for its achievements in this kind of sport worldwide?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 560),
(70, NULL, 1, 'What is cooler, skydiving or bungee jumping? Why?\r\nWhat is more dangerous? Why?\r\nHave you ever tried any of these sports? If no, do you want to do it someday.\r\n', '', 'Describe what you see', 1, 'Answer the following questions:', 0, '', NULL, NULL, '', 1, 559),
(69, NULL, 1, 'Youâ€™ll recognize me easily when you enter. Iâ€™m wearing a green helmet and bright pink gloves.\r\nShe doesnâ€™t walk a tightrope as well as he does. She is still learning.\r\nHave you seen the score? What a shame! Our team is losing.\r\n\r\n\r\nSo many people are rushing to the entrance now, so Iâ€™ll wait for a while.\r\nWhy have they postponed the match? Is there an explosion hazard?\r\nHow long have you been warming up? Itâ€™s time to start the training properly.\r\nHockey is a tough game that requires protective elbow pads for safety.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 559),
(74, NULL, 1, 'So many people are rushing to the entrance now, so Iâ€™ll wait for a while.\r\nWhy have they postponed the match? Is there an explosion hazard?\r\nHow long have you been warming up? Itâ€™s time to start the training properly.\r\nHockey is a tough game that requires protective elbow pads for a safe time.\r\n\r\n\r\nYouâ€™ll recognize me easily when you enter. Iâ€™m wearing a green helmet and bright pink gloves.\r\nShe doesnâ€™t walk a tightrope as well as he does. She is still learning.\r\nHave you seen the score? Whatâ€™s the shame! Our team is losing.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 560),
(75, NULL, 1, 'What are you doing today? Make up 3 sentences using Present Continuous.\r\nWhat do you do every week? Make up 3 sentences using Present Simple.\r\n', '', 'Describe what you see', 1, 'Make up some sentences:', 0, '', NULL, NULL, '', 1, 560),
(76, NULL, 1, 'Imagine that you have to go to a deserted island. And you know there\'s no deserted island without danger! Be attentive, choose wisely and explain your choice.\r\nWho would you take with yourself?\r\nWhat things would you take with you?\r\nHow many days would you spend there?\r\n', '', 'Let\'s have fun!', 5, 'Ideas:', 0, '', NULL, NULL, '', 5, 561),
(77, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 561),
(78, NULL, 1, ' Do you keep money in your bank account?\r\nShould you beware of the fraud when dealing with large sums of money?\r\nDo you prefer to pay in cash or by credit card?\r\nHave you donated to charity organizations?\r\nDo you follow the exchange rate of different currencies?\r\nIs it good to help people if they are hard-up?\r\nHave you ever inherited money or property?\r\nDo you calculate the household budget?\r\nHow often do you use a cash machine?\r\nDo you usually use a credit card If the expenses exceed the limit?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 561),
(80, NULL, 1, 'You see 5 answers. But do you know the questions? Try and guess\r\nThe Amazon\r\nThe Pacific\r\nGreenland\r\nMadrid\r\nAnd now an unexpected answer â€“ tulips. What can it be? ;)\r\n', 'Keys:\r\nThe longest river\r\nThe largest ocean \r\nThe biggest island\r\nThe capital of Spain\r\nBulbs of tulips used to be a form of currency\r\n', 'Describe what you see', 1, 'Answers:', 0, '', NULL, NULL, '', 1, 561),
(79, NULL, 1, 'Last year I saved up enough money to buy a house. I had put 10% of my wages into a separate account each month before that.\r\nBy the end of the year they had calculated all the business expenses.\r\nRobert Taylor was over the moon because he had inherited his auntâ€™s estate.\r\nSomeone had robbed a bank of over $50000 before they managed to expose a fraud.\r\nThey had never exceeded the costs before. I have no idea why it happened last quarter.\r\nHad the player purchased the first card before he asked for an additional one?\r\nWhat did they undertake after they had calculated all the tax charges?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 561),
(81, NULL, 1, 'Make a list of the wealthiest people ever.\r\nDo you know their names?\r\nDo you think they are happy?\r\nDoes money ever make people sad?\r\nWhat about the unhappy rich people, do you know them?\r\n', '', 'Let\'s have fun!', 5, 'Rich people', 0, '', NULL, NULL, '', 5, 562),
(82, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 562),
(83, NULL, 1, ' Is mortgage a good idea for people who can\'t afford to buy real estate straight away?\r\nHave you ever been robbed?\r\nHow often do you withdraw money from your card?\r\nDo you owe money to someone at the moment?\r\nHad you saved up for something before you bought it?\r\nDo you leave tips when you pay a check in a cafÃ©?\r\nHave you ever been in a situation when you couldn\'t make ends meet?\r\nDo you think itâ€™s a good thing to use pension funds for your future savings?\r\nWhat payments do you make monthly?\r\nWhat kinds of welfare can people get in your country at the times of crisis?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 562),
(85, NULL, 1, 'Tell us about your last big shopping day. What did you buy?\r\nWere you happy with the things you had bought?\r\nImagine a large sum of money in your pocket and tell us about your dream shopping day.\r\n', '', 'Describe what you see', 1, 'Tell:', 0, '', NULL, NULL, '', 1, 562),
(84, NULL, 1, ' Last year I saved up enough money to buy a house. I had put 10% of my wages into a separate account each month before that.\r\nBy the end of the year they had calculated all the business expenses.\r\nRobert Taylor was over the moon because he had inherited his auntâ€™s estate.\r\nSomeone had robbed a bank of over $50000 before they managed to expose a fraud.\r\nThey had never exceeded the costs before. I have no idea why it happened last quarter.\r\nHad the player purchased the first card before he asked for an additional one?\r\nWhat did they undertake after they had calculated all the tax charges?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 562),
(86, NULL, 1, 'The USA is the country with the biggest number of prisoners.\r\nIn Ancient Egypt, there was a death punishment of killing a cow.\r\nIn 1994, Charles Scott Robinson was sentenced to 30,000 years in prison for six rapes.\r\nWildlife smuggling generates over 10 million dollars annually.\r\nRicky Jackson from Cleveland, Ohio was awarded $1 million for spending 39 years in jail for a crime that he did not commit.\r\nIn England, it costs about Â£18,000 per year to house one prisoner.\r\nThe word â€˜criminalâ€™ has been in the English language since around 1400 but â€˜policemanâ€™ arrived only in 1788 and â€˜detectiveâ€™ in 1843.\r\nIn 2003, Charles Ingram was given a prison sentence suspended for two years for cheating on â€œWho Wants to Be a Millionaireâ€.\r\nIn Utah marriage between cousins is against the law only if they are younger than 25.\r\nIn Arizona, it is unlawful to refuse a person a glass of water.\r\n\r\n\r\n', 'Keys:\r\nStatistics\r\nLies; for killing a cat\r\nstatistics\r\nlies; it generates 10 billion dollars\r\nstatistics\r\nlies about Â£83,000\r\nstatistics\r\nstatistics\r\nlies; if they are younger than 65\r\nstatistics', 'Let\'s have fun!', 5, 'Games:  \r\nLies or statistics?', 0, '', NULL, NULL, '', 5, 563),
(90, NULL, 1, 'If you face blackmail, donâ€™t pay up, but contact the police.\r\nIf you witness a kidnapping, try to remember all the details: car number, criminalâ€™s appearance and so on.\r\nIf you want to earn money, spill coffee on yourself in McDonaldâ€™s, and ask for a compensation.\r\nIf you find English exercises too difficult, ask for a compensation for moral damage.\r\n\r\n', '', 'Describe what you see', 1, 'Useful/useless advice. Which one is it?', 0, '', NULL, NULL, '', 1, 563),
(87, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 563),
(88, NULL, 1, ' What would you do if you faced some blackmail?\r\nWhy do people commit crimes? Is there any solution to stop crimes forever?\r\nIs there a bigger chance that a person becomes a criminal if he belongs to a certain social group?\r\nWhy are there more male criminals than female ones?\r\nWhat\'s the most interesting criminal case you\'ve ever heard about?\r\nHave you ever got any compensation for an unsatisfactory service?\r\nDo you think that a moral damage can be worse than an injury?\r\nWhat should a person do if he or she is kidnapped?\r\nHave you ever heard of child criminals?\r\nDo you think quite a lot of innocent people are sent to prison by mistake?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 563),
(89, NULL, 1, 'By that time yesterday Dylan had already questioned all the witnesses.\r\nI used to kill 20 criminals a year when I was younger, now I just kill 10.\r\nWere those prisoners enduring the punishment when you last saw them?\r\nA suspicious-looking man came to me yesterday and asked for help.\r\n\r\nThey used to get into the prison when they were teenagers.\r\n\r\nHe used to run a lot when he was a teenager.\r\n\r\nWhile they were looking for a perpetrator the murderer was really close.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 563),
(91, NULL, 1, 'Choose your accomplices from the list:\r\nDarth Vader\r\nThe Joker\r\nProfessor Moriarty\r\nLoki\r\nVoldemort\r\nAgent Smith\r\nFreddy Krueger\r\nMagneto\r\nPennywise from â€œitâ€\r\nRick from â€œRick and Mortyâ€\r\nOne of your relatives\r\n\r\nSo, what kind of crime are you going to commit?\r\nWhat functions will each of your henchmen perform?\r\nHow will you make sure that all of these cuties get along well and arenâ€™t going to betray you?\r\nHow will you get away with this crime?\r\nWhat kind of plan B will you make up in case something goes strong?\r\n', '', 'Let\'s have fun!', 5, 'Now letâ€™s imagine that youâ€™re the toughest super-villain of all times and youâ€™re going to commit a crime of such scope and impudence the whole Universe has never faced yet. Of course, for such crime, you will need the super-team of super-evil super-henchmen. So, who will have the honor to be your partner in crime?', 0, '', NULL, NULL, '', 5, 564),
(92, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 564),
(93, NULL, 1, 'Have you ever witnessed a crime?\r\nDo you think that a prison sentence can really change a person?\r\nAre you for or against a death penalty for a crime such as murder?\r\nDo you think that laws in your country are severe?\r\nHave you ever suspected anyone in a crime?\r\nWhat people seem suspicious to you?\r\nCan you give any examples of mugging?\r\nIs speeding common on the roads of your city?\r\nHave you ever tried to sue any company? Do you know any successful cases?\r\nHave you ever done anything illegal? If so, what did you do?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 564),
(95, NULL, 1, 'tell me what to do if I see something suspicious\r\ntell me what to do if I am suspected of a crime\r\ntell me what to do if I want to sue my company\r\n', '', 'Describe what you see', 1, 'Give advice:', 0, '', NULL, NULL, '', 1, 564),
(96, NULL, 1, 'The city of the future\r\nWhat will its population be?\r\nWhat means of transport will be there?\r\nWhere will people live: in houses or apartment buildings?\r\nWhat kind of entertainments will be in that city?\r\nWhat kinds of sports facilities will be there?\r\nWhat will the downtown look like?\r\nWhat ideas and suggestions do you have for the city of the future?\r\nWill it be safe to live in this city?\r\nHow will the city be protected from the natural disasters and catastrophes?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 565),
(94, NULL, 1, ' By that time yesterday Dylan had already questioned all the witnesses.\r\nI used to kill 20 criminals a year when I was younger, now I just kill 10.\r\nWere those prisoners enduring the punishment when you last saw them?\r\nA suspicious-looking man came to me yesterday and asked for help.\r\n\r\nThey used to get into the prison when they were teenagers.\r\n\r\nHe used to run a lot when he was a teenager.\r\n\r\nWhile they were looking for a perpetrator the murderer was really close.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 564),
(98, NULL, 1, 'How will the world alter in the future in your opinion?\r\nWhat are the consequences of different natural disasters?\r\nAre there any signs showing there will be an earthquake?\r\nWould you like to live in a beautiful but rather dangerous place in terms of natural disasters?\r\nWhat is the scariest natural disaster?\r\nDo you think scientists will find the solutions to prevent any natural disasters from happening?\r\nWhat kind of natural disaster will be the most common in future?\r\nDo you know anyone who has faced a natural disaster? How has it changed his or her life?\r\nDo you know safety tips for all kinds of dangerous situations?\r\nWhat natural disaster do you fear most of all?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 565),
(97, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 565),
(99, NULL, 1, 'Numerous species will get under the threat of extinction here in 5 yearsâ€™ time.\r\nCan you see that meteorite? Oh, no! it is going to hit our planet.\r\nAn earthquake may start any time tomorrow. You have to be ready!\r\nThey might not face all those difficulties during the trip next year.\r\nI am sure that molten lava flows will definitely damage everything in this area.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 565),
(101, NULL, 1, 'You see Tokyo in 1945 and now. Please, answer the following questions.\r\nIs the difference striking?\r\nDo you know any other cities that have changed greatly in a rather short period of time?\r\nIs it an example of a successful change?\r\nDo you like megacities?\r\nDo you think in future people will prefer smaller towns?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 566),
(100, NULL, 1, 'Are you afraid of cockroaches? Why or why not?\r\nDo you like disaster movies? Which is your favourite?\r\nWhat should we do if thereâ€™s an earthquake?\r\n', '', 'Describe what you see', 1, 'Questions:', 0, '', NULL, NULL, '', 1, 565),
(105, NULL, 1, 'Bite\r\nCry\r\nRun\r\nHunt\r\nSwim\r\n', '', 'Describe what you see', 1, 'Name the creatures thatâ€¦', 0, '', NULL, NULL, '', 1, 566),
(104, NULL, 1, ' Numerous species will get under the threat of extinction here in 5 yearsâ€™ time.\r\nCan you see that meteorite? Oh, no! it is going to hit our planet.\r\nAn earthquake may start any time tomorrow. You have to be ready!\r\nThey might not face all those difficulties during the trip next year.\r\nI am sure that molten lava flows will definitely damage everything in this area.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 566),
(102, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 566),
(103, NULL, 1, ' What is the major threat for the Earth in future?\r\nWhat is the most dangerous weapon nowadays?\r\nDo you know the difference between a hurricane and a tornado?\r\nWould you like to witness any natural disaster provided you are safe?\r\nWhich viral pandemics were the most dangerous in the history of the mankind?\r\nDo you think the government of the country takes enough measures to prevent terrorist attacks?\r\nHave you ever tried to imagine the end of the world? What will it be like in your opinion?\r\nDo you think migration is indeed a big problem of the modem world?\r\nDo you know why hurricanes have mostly female names?\r\nWhat are you looking forward to?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 566),
(106, NULL, 1, 'You\'re the owner of a profound company in IT sphere, usually strict and cold; nonetheless, your employees like and respect you. However, you have one little secret, you are highly engrossed in listening to k-pop music. Itâ€™s a lunch break and you\'re planning to Chili out and watch your favorite music videos on YouTube. You forget to plug in the headphones and the employees open door to wish you happy birthday. \"Oops\"... or not?\r\nWill this situation make you blush? Why?\r\nWhat could you do in this situation to gain authority again?\r\nWould you make your employees dance and sing with you?\r\nDo you know any tips and hacks on how to deal with it?\r\nHave you ever had any surprising occasions in your life?\r\nDoes lite always play nasty tricks on you? If it does, why do you think this happens?\r\nDo you think you have a good sense of humor? What is your favorite joke?\r\n', '', 'Let\'s have fun!', 5, 'K-pop Fan', 0, '', NULL, NULL, '', 5, 567),
(108, NULL, 1, ' What was the worst party you\'ve ever been to?\r\nAre you going to decorate your home for Christmas? And why?\r\nDo you prefer buying a cake or baking it at home? And why?\r\nWhat would you do if someone broke your favorite vase at your party in your house?\r\nDo you approve the modem party trend to make your hair glitter? And why?\r\nDo you know any tips on how to get rid of confetti on the floor?\r\nWould you mind if others got drunk at your party in your house?\r\nWhat can people do at a party that will definitely annoy you?\r\nIf youâ€™re invited to a party but you don\'t want to, what will you tell this person?\r\nWhich parties are better: in people\'s houses or in party halls and hotels? \r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 567),
(107, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 567),
(109, NULL, 1, 'The company is going to sponsor the New Yearâ€™s merrymaking for its employees.\r\nThe bus to Sydney leaves at midday. So, we could come at my parentâ€™s evening party on time.\r\nI am not going to be a scrooge! I can let you spend that money.\r\nAre you coming with us to the Larkins? They are giving a dinner party at Hakkasan tonight.\r\nHer birthday falls on a Sunday next year.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 567),
(110, NULL, 1, 'Iâ€™m getting married this weekend, so wish me something nice, please.\r\n', '', 'Describe what you see', 1, 'Wishes:', 0, '', NULL, NULL, '', 1, 567),
(111, NULL, 1, 'Everyone loves to party at some point in their lives. And most get sick of it and stop, but some of us can just never get enough of the music, cocktails, energy, and vibe. Already nodding your head in agreement? If you\'re still living in denial, here are a few things that\'ll make you realize that you\'re a party animal if you don\'t think you are already.\r\nYou can make anything a drinking game\r\nYou\'ve got the FOMO\r\nYou have contacts at almost every club\r\nYour friends avoid your calls during weekdays\r\nYou\'re used to getting home at the same time as the milkman\r\nYou\'re the admin of your \"Weekend Plans\" group\r\nYou have a backup plan for your backup plan\r\nParty hard drivers & alcohol delivery services are on your speed dial\r\nYou love drinking in the day\r\nYou just need an excuse\r\n', 'If you can relate to even a few of the above, chances are, you\'re a party lover. And hey, there\'s nothing wrong with that. In fact, you\'re the one who everyone counts on over the weekend. You should be proud!\r\n', 'Let\'s have fun!', 5, 'Quiz:', 0, '', NULL, NULL, '', 5, 568),
(112, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 568),
(114, NULL, 1, ' The company is going to sponsor the New Yearâ€™s merrymaking for its employees.\r\nThe bus to Sydney leaves at midday. So, we could come at my parentâ€™s evening party on time.\r\nI am not going to be a scrooge! I can let you spend that money.\r\nAre you coming with us to the Larkins? They are giving a dinner party at Hakkasan tonight.\r\nHer birthday falls on a Sunday next year.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 568),
(113, NULL, 1, ' What are polite and impolite excuses to give for not going to a party?\r\nWhat party games are you planning to play next time?\r\nDo you prefer going to dinner parties or giving dinner parties? And why?\r\nHave you ever been to a party in another country? Was it different to parties in your country?\r\nWhat music is the best choice for a party rocking? And why?\r\nWhat food would you cook for a New Year party? And why?\r\nWould you like to take part in a pageant some day? And why?\r\nWhat decorations would you choose for a Halloween party? And why?\r\nDo you consider yourself a sociable or reserved person? And why?\r\nAre you not afraid of being in the limelight? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 568),
(116, NULL, 1, 'Make a list of 10 rules on how to deal with a 7-year-old daughter of your best friend, knowing that sheâ€™s a prankish kid. Use the following words: batter, claim, should/shouldnâ€™t. here are some clues:\r\nWhat tricks would you choose?\r\nWould you buy some treats for that girl?\r\nAre you going to play games with her?\r\nWould you pay your attention to her hobbies and likes?\r\nAre you planning to read a fairy tale before she goes to sleep?\r\n', '', 'Let\'s have fun!', 5, 'Naughty child:', 0, '', NULL, NULL, '', 5, 569),
(115, NULL, 1, 'Miracle \r\nTinsel\r\nmerrymaking\r\n', '', 'Describe what you see', 1, 'Make three sentences with the following words:', 0, '', NULL, NULL, '', 1, 568),
(117, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 569),
(118, NULL, 1, ' Do you know any rules people should follow while dealing with rude people?\r\nAre parents allowed to batter their children anytime? And why?\r\nShould people take things that donâ€™t belong to them? And why?\r\nWhat would you do, if you found a purse? And why?\r\nWhat are the advantages and disadvantages of being a cheeky person?\r\nDo you think it\'s better to be honest or polite? And why?\r\nWhat do you understand under the word \"considerate\"? Is it important to be so?\r\nWho should pay on a first date in a restaurant: a man or a woman?\r\nWhat would you do if your beloved one had an accident?\r\nWhat kind of people seems to you trustworthy? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 569),
(121, NULL, 1, 'Who are these angels and demons creatures? Any ideas?\r\nWhat do these guys have in common?\r\nWhose influence is more powerful on you? Why?\r\nWhat would you choose: pleasure in hell or enlightenment in heaven?\r\nShould a person always choose a good side? Why?\r\nWho do you think is crueller: angels or demons?\r\nHave you ever heard of the 9 Circles of Hell? Whatâ€™s that?\r\nIs using Torrent a modern way of breaking moral rules similar to larceny?\r\n', '', 'Let\'s have fun!', 5, 'Angels and Demons:', 0, '', NULL, NULL, '', 5, 570),
(120, NULL, 1, 'Are you brave enough to read these tongue twisters?\r\nLuke Luck likes lakes.\r\nLukeâ€™s duck likes lakes.\r\nLuke Luck licks lakes.\r\nLuckâ€™s duck licks lakes.\r\nDuck takes licks in lakes Luke Luck likes.\r\nLuke Luck takes licks in lakes duck likes.\r\n', '', 'Describe what you see', 1, 'Twist :', 0, '', NULL, NULL, '', 1, 569),
(119, NULL, 1, 'I can work extra hours. I used to do it before.\r\nShould they come earlier?\r\nMay I ask you to refuse to give evidence?\r\nYou should adhere strictly to your own plan.\r\nAll applicants must undergo a means test.\r\nAlthough I might know someone who knows.\r\n\r\n\r\nTo all appearances I will have to join the dole queue.\r\nThe chief has to free his employees from some of their chores.\r\nKylie is not allowed to be considerate to her subordinate.\r\nWill you be able to come over to the council house?\r\nWill you be able to come over to the council house?\r\nPassengers mustnâ€™t undo the seat belt during the take-off.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 569),
(123, NULL, 1, 'Can anyone lose their self-control from time to time? And why?\r\nIf you had small children, would you spoil them? And why?\r\nShould human beings surrender to any temptation? And why?\r\nWhat things aren\'t permissible for parents in your country? And why?\r\nWhat do you think about people who abandon their own children?\r\nWhat five adjectives would you choose to describe a moral person?\r\nDo you think you are a stubborn person who\'s complicated to deal with?\r\nWhy are there plenty of stray animais in the Street? What can we do?\r\nWhat do you understand under the word \"morality\"? Any ideas?\r\nWhat do you think makes human beings moral or immoral?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 570),
(122, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 570),
(124, NULL, 1, ' I can work extra hours. I used to do it before.\r\nShould they come earlier?\r\nMay I ask you to refuse to give evidence?\r\nYou should adhere strictly to your own plan.\r\nAll applicants must undergo a means test.\r\nAlthough I might know someone who knows.\r\n\r\n\r\nTo all appearances I will have to join the dole queue.\r\nThe chief has to free his employees from some of their chores.\r\nKylie is not allowed to be considerate to her subordinate.\r\nWill you be able to come over to the council house?\r\nWill you be able to come over to the council house?\r\nPassengers mustnâ€™t undo the seat belt during the take-off.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 570),
(126, NULL, 1, 'Be addicted\r\nChannel hopping\r\nClassified ad\r\nCue card\r\nDocu-drama\r\nEntitle\r\nLive coverage\r\nNauseate\r\nNewsflash\r\nnonsense\r\n', '', 'Let\'s have fun!', 5, 'Choose 3 words or word combinations from the following list. Give definitions for these words without naming them and let your teacher guess them.', 0, '', NULL, NULL, '', 5, 571),
(125, NULL, 1, 'Who is cooler, Mahatma Gandhi or Abraham Lincoln?\r\nWhat do you know about these people?\r\nIn your opinion, who had a greater impact on the history of human rights and freedoms?\r\nWhat other inspirational leaders do you know?\r\n', '', 'Describe what you see', 1, 'Choice:', 0, '', NULL, NULL, '', 1, 570),
(127, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 571),
(128, NULL, 1, ' If you could make up a new TV show to boost ratings, what show would it be?\r\nDo you prefer watching entertaining shows or docu-dramas? And why?\r\nDo classified ads in magazines drive you crazy? And why?\r\nHave you ever watched any quiz shows?\r\nWhat channel is your favorite one? And why?\r\nDo people who are keen on frequent channel hopping irritate you?\r\nAre cue cards and an autocue important for a TV announcer?\r\nDo you think weather forecast is always reliable?\r\nWhat is the key point of TV show success?\r\nWould you participate in a talk show if you were invited?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 571),
(131, NULL, 1, 'You are going to visit the world of â€œGame of Thronesâ€.\r\nWho will accompany you on this journey? Why?\r\nYou know that winter is coming. So, what clothes will you choose?\r\nThis place is utterly dangerous due to the White Walkers. What weapons will you take?\r\nWhat appliances or gadgets would be really useful in this adventure?\r\nDo you think that this blonde in the picture is a great queen?\r\nWould you risk your life to become a king/queen of the Iron Throne?\r\nAre you brave enough to fly a dragon? Are you afraid of heights?\r\n', '', 'Let\'s have fun!', 5, 'Dragons and stuff:', 0, '', NULL, NULL, '', 5, 572),
(129, NULL, 1, 'The old king was portrayed as a narcissistic arrogant man.\r\nThe report will be entitled â€œMeasures to eliminate international terrorismâ€ and will appear ont the screen next month.\r\nHe was addicted to reading and could pore over the book he liked for weeks.\r\nThe milestone wonâ€™t be attained unless they give it some welly.\r\nPeople were urged to believe this politician and vote for him.\r\nWhen will the program of reform be initiated in this region?\r\nWe werenâ€™t urged forward and we were quietly keeping on filming.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 571),
(130, NULL, 1, 'Tell about the last movie you watched.\r\nWhat was it about?\r\nDid you like it? Why?\r\n', '', 'Describe what you see', 1, 'Your last movie:', 0, '', NULL, NULL, '', 1, 571),
(132, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 572),
(133, NULL, 1, 'Do you agree that watching TV can kill communication with your family members? Do you think violence on TV affects young generation?\r\nWhat recent events in the world were announced in the news?\r\nCan you imagine your life without watching TV every day?\r\nDo you consider yourself a TV series addict? And why?\r\nWhat pleases you more: going to the cinema or watching a film at home?\r\nDo you agree that watching TV is partly responsible for rapid stupidity?\r\nHave you ever tended to be a stuntman? Is this occupation dangerous?\r\nWhat in your opinion urges people to watch soap operas?\r\nDo TV channels always portray a healthy lifestyle or not?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 572),
(134, NULL, 1, 'The old king was portrayed as a narcissistic arrogant man.\r\nThe report will be entitled â€œMeasures to eliminate international terrorismâ€ and will appear ont the screen next month.\r\nHe was addicted to reading and could pore over the book he liked for weeks.\r\nThe milestone wonâ€™t be attained unless they give it some welly.\r\nPeople were urged to believe this politician and vote for him.\r\nWhen will the program of reform be initiated in this region?\r\nWe werenâ€™t urged forward and we were quietly keeping on filming.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 572),
(135, NULL, 1, 'â€œLife doesnâ€™t imitate art, it imitates bad televisionâ€.\r\nDo you agree with it?\r\nDo you know whom it belongs to?\r\nDoes your life sometimes look like itâ€™s some kind of TV series? If so, what genre is the closest to the way you live?\r\nWould you like to watch some series or movie based on your life?\r\n', '', 'Describe what you see', 1, 'Read the following quote:', 0, '', NULL, NULL, '', 1, 572),
(136, NULL, 1, 'Look at the colors above and put them in the order which appeals to you the most from 1 to 8.\r\nRed â€” passion and energy. In the 1 st position means you are impulsive and have will to win. You\'re a good leader. Red if chosen in 7th or 8th position means your desire for life has become less.\r\nGreen â€” not wanting to change. In the first place, you\'re selfish and want to have a lot of things like money. If green is a later choice, you have become stubborn and critical.\r\nBlue â€” calmness and loyalty. If you choose blue first, it means youâ€™re happy with your life. You strongly desire a comfortable life. If you choose blue at the end, you\'re not satisfied with life.\r\nGray in the first position means you like being alone. You\'re not interested in joining a group. People who choose grey in 8th position are the opposite. They\'ll try anything to achieve their goals.\r\nYellow â€” happiness and relaxation. 2nd, 3rd or 4th positions â€” optimistic. In the 1st place means you\'re ambitious. When ifs chosen towards the end it shows disappointment.\r\nViolet â€” a magical and wonderful relationship. They live in a dream world of fantasy. If violet is chosen at the end, it shows mature and a realistic view of the world.\r\nBlack â€” \"No\". Anyone who chooses it in 1 st position is in revolt against their fate. Chosen 2nd, it means you\'re prepared to give up everything to achieve what you want. 7th or 8th places represent control of one\'s destiny and a balanced outlook.\r\nBrown â€“ health. People who are sick usually put brown in the beginning. Brown in 4th or 5th position means that youâ€™re most likely in good health. Brown put in 8th place shows a lack of concern for oneâ€™s health.\r\nDo you agree with the results? Why?\r\nDo you believe that color test can tell a lot about your personality?\r\nDo you think this test is a great way to have fun? Why?\r\n', '', 'Let\'s have fun!', 5, 'Which color is yours?', 0, '', NULL, NULL, '', 5, 573),
(137, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 573),
(138, NULL, 1, ' If you were a screenwriter, what would your movie be about?\r\nDo you know any movie based on real-life events?\r\nWhat movies are the most popular among the youth today?\r\nWho are your favorite film celebrities? And why?\r\nDo scenes with a car chase keep you in suspense?\r\nDo you know any actors who don\'t use understudies?\r\nDo you like watching movies in English?\r\nWhatâ€™s the most disgusting movie youâ€™ve ever seen?\r\nIf you could be a movie badass, which one would you be? Why?\r\nDo you know any tips on how to start a short film project?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 573),
(140, NULL, 1, 'Hereâ€™s the first and the last sentence of the story. Read them and make up the rest of it.\r\nOne day I decided to go to the cinema with my friends.\r\nAnd thatâ€™s when I realized that I was a character in the movie the whole time.\r\n', '', 'Describe what you see', 1, 'Make up a story:', 0, '', NULL, NULL, '', 1, 573),
(139, NULL, 1, 'The film is being cut right now. You are going to see it on the screen not earlier than in 3 months.\r\nThe actions were being described so vividly that we could even imagine ourselves presented there.\r\nThe cartoon originally shot in French will be dubbed into English tomorrow while we will be staying in the studio.\r\nThe film director wonâ€™t be obsessed with thoughts of death any more. Itâ€™s done.\r\nWas the last scene being retaken when I entered the film studio?\r\nThe drama is currently being reviewed by a famous film critic. Take your time! Youâ€™ll read about it later!\r\nAll day long yesterday a short filmed in German was being dubbed into English for its American release.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 573),
(141, NULL, 1, 'Make a catchy story paying your attention to the pictures above (not less than 10 sentences). Use the following words:\r\nmisfortune\r\nscreenplay\r\nsuspense\r\ncroissant\r\ntouching\r\nThese questions will help you as well:\r\nWhat was the morning when you woke up that day?\r\nWhat was the name of the movie you chose to watch?\r\nWhat was inside the box your darling gave to you?\r\nWhy was your heart beating furiously at that moment?\r\nWhat did you feel at the end of the romantic date?\r\n', '', 'Let\'s have fun!', 5, 'Your story:', 0, '', NULL, NULL, '', 5, 574),
(143, NULL, 1, ' What would you choose: a fantasy movie or a film that reflects real life?\r\nDo you agree that any films should never be censored? And why?\r\nSome Hollywood stars are paid $15 million per movie. Is this too much?\r\nWho\'s your favorite screenwriter? Why do you like them?\r\nWhat\'s the scariest movie you have ever seen? What was it about?\r\nWhat old-fashioned films would you like to rewatch? And why?\r\nWhy are people all over the world obsessed with Marvel films?\r\nDo soundtracks play an important role in filmmaking? And why?\r\nDo you agree that comedies spice up our gloomy life? Why?\r\nAre minor characters worth paying your attention to? And why? \r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 574),
(142, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 574),
(144, NULL, 1, ' The film is being cut right now. You are going to see it on the screen not earlier than in 3 months.\r\nThe actions were being described so vividly that we could even imagine ourselves presented there.\r\nThe cartoon originally shot in French will be dubbed into English tomorrow while we will be staying in the studio.\r\nThe film director wonâ€™t be obsessed with thoughts of death any more. Itâ€™s done.\r\nWas the last scene being retaken when I entered the film studio?\r\nThe drama is currently being reviewed by a famous film critic. Take your time! Youâ€™ll read about it later!\r\nAll day long yesterday a short filmed in German was being dubbed into English for its American release.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 574),
(145, NULL, 1, 'What would you choose, if you went to the cinema?\r\nWhat is your favourite brand of chips? And why?\r\nDo you consider popcorn fast food? And why?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 574),
(148, NULL, 1, ' Where do you get your news from?\r\nDo publishing houses sometimes tell lies to make a story more sensational?\r\nTo what extent do the various news items engage you, interest you and captivate you? Why?\r\nDo you prefer reading gutter press? And why?\r\nWhat is the most reliable source of information: the Internet, newspapers or TV?\r\nWould you ever consider getting a job in the news industry?\r\nHow has technology changed the way we consume news? How has it changed how the news is reported?\r\nWhat news usually troubles you a lot?\r\nWhy should news headlines be eye-catching?\r\nDo you have any profound newsmen who draw your attention?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 575),
(147, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 575),
(146, NULL, 1, 'Can you give an example of such news?\r\nWhat kind of good news would you like to read in your daily newspaper?\r\n', '', 'Let\'s have fun!', 5, 'Imagine a newspaper with good news only.', 0, '', NULL, NULL, '', 5, 575),
(149, NULL, 1, 'Their marriage had been announced before they explained everything to their parents.\r\nWe have just been drawn into the dispute. How could they do that?\r\nWill you have been interviewed by 2 p.m. tomorrow?\r\nAfter Evanâ€™s decision had been protested he swore not to interfere in otherâ€™s matters.\r\nThousands of civilians have already been involved in the armed conflict.\r\nWhy have you been troubled lately? A professional disagreement?\r\nAll of the five nuclear-weapon states will have been involved in this process by the end of the next year.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 575),
(151, NULL, 1, 'Who is the most famous character on the New Yorker cover?\r\nWhy is American social media allowed to make fun of politicians?\r\nWould you lie to draw a caricature of somebody someday?\r\nWhat politician always makes you laugh out loud? And why?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 576),
(150, NULL, 1, 'There are two sentences: the first one and the last one.\r\nUse your imagination and complete the full story.\r\nMy dream was to be a profound editor in the sphere of fashion.\r\nI am working at Cosmopolitan now.\r\n', '', 'Describe what you see', 1, 'Finish:', 0, '', NULL, NULL, '', 1, 575),
(152, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 576),
(153, NULL, 1, ' Do you think that the news is necessary? Why or why not?\r\nHow much freedom in your opinion should the press be allowed by law?\r\nDo you think that TV programme content should be censored? And why?\r\nDo reporters and photographers respect the private lives of famous people in your country?\r\nWhat sensational news have you heard recently? What do you think about it?\r\nWhat subject matters haven\'t been openly discussed in mass media yet? Why?\r\nDo mass media affect our daily life powerfully? In what way?\r\nIs it important nowadays to follow modern trends or not? And why?\r\nWhat national magazines are popular in your country? And why?\r\nDo you think your government is doing enough to protect children from violent images?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 576),
(154, NULL, 1, ' Their marriage had been announced before they explained everything to their parents.\r\nWe have just been drawn into the dispute. How could they do that?\r\nWill you have been interviewed by 2 p.m. tomorrow?\r\nAfter Evanâ€™s decision had been protested he swore not to interfere in otherâ€™s matters.\r\nThousands of civilians have already been involved in the armed conflict.\r\nWhy have you been troubled lately? A professional disagreement?\r\nAll of the five nuclear-weapon states will have been involved in this process by the end of the next year.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 576),
(156, NULL, 1, 'Name 3 words to describe the style of each age.\r\nStyle of which age do you like best? And why?\r\nStyle of which age do you like least? And why?\r\nDo you know any interesting facts about how the beauty standards changed over the human history? If so, tell them to your teacher.\r\nWhat style do you prefer in your regular life?\r\nWhat beauty and fashion trends are popular nowadays? What tendencies in this field have you noticed?\r\nIf you had a chance, which age from the picture would you choose to live in for some time? Explain your choice.\r\n', '', 'Let\'s have fun!', 5, 'Compare the women in the picture:', 0, '', NULL, NULL, '', 5, 577),
(155, NULL, 1, 'Name three magazines for women.\r\nWhy do you think they are so popular?\r\nCan men read them too? And why?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 576),
(157, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 577),
(158, NULL, 1, ' What is more important: beauty or health?\r\nAre you keen on the modem trend to wear much makeup?\r\nHow often do you have your hairstyle changed?\r\nWhat anti-aging remedies do you use?\r\nWhy do people have their teeth bleached?\r\nWhat colors have you had your hair dyed?\r\nDo you think beautiful people are more successful in life?\r\nAre beautiful people always vain?\r\nWhat do you do to have shiny and healthy skin?\r\nWhat would you choose: dreadlocks or a cropped hairstyle? Why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 577),
(159, NULL, 1, 'She is having her hair dyed right now. Donâ€™t bother her!\r\nWhen will you have your fringe cut? Itâ€™s too long covers the eyes.\r\nMark had his bandage removed a week after the operation.\r\nAfter Chase had had his stubble shaved he could appear in public.\r\nCan I have my forehead wrinkles smoothed out as soon as possible?\r\nIf you want to try out the look on your hair, come and have temporary dreadlocks made.\r\nMy friend is blading and wants to have his head shaved.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 577),
(160, NULL, 1, 'Name five words that start with letter L\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 577),
(161, NULL, 1, 'What do you see in the picture?\r\nHow can you describe this style?\r\nWhat do you think of it?\r\nIn your opinion, how will people dress in 50 years? Why do you think so?\r\nWill the fashion of the future be more practical or fancier? Why?\r\nThe clothes in this pic are made with a 3D printer. What other items do people make with it nowadays?\r\nWhat pros and cons might the 3D printed clothes have?\r\nWould you try wearing the 3D printed clothes?\r\nWill 3D printed clothes be trendy in the future? Why?\r\n', '', 'Let\'s have fun!', 5, 'And now let\'s talk about the fashion of the future:', 0, '', NULL, NULL, '', 5, 578),
(164, NULL, 1, ' She is having her hair dyed right now. Donâ€™t bother her!\r\nWhen will you have your fringe cut? Itâ€™s too long covers the eyes.\r\nMark had his bandage removed a week after the operation.\r\nAfter Chase had had his stubble shaved he could appear in public.\r\nCan I have my forehead wrinkles smoothed out as soon as possible?\r\nIf you want to try out the look on your hair, come and have temporary dreadlocks made.\r\nMy friend is blading and wants to have his head shaved.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 578),
(162, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 578),
(163, NULL, 1, 'Have you ever heard about the modern trend called Body Positive?\r\nWhat is more important: physical or internal beauty? And why?\r\nDo you know any hacks on how to be trendy and not spend much money?\r\nWould you have a plastic surgery done if you had a chance? And why?\r\nWhy do women with straight hair have curly hair made and vice versa? What\'s the purpose?\r\nWhat do you understand under the proverb: \"beauty is in the eye of the beholder (observer)?\"\r\nDo you consider people with tattoos and piercings beautiful? And why?\r\nHave you ever stopped doing something for your health? What was that?\r\nDo you agree that going to the gym once per week means a healthy lifestyle?\r\nHave you ever wanted to connect your further life with fitness or sport? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 578),
(167, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 579);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(168, NULL, 1, ' Is unemployment one of the pressing problems in your country?\r\nIf you had a chance what international laws would you adopt?\r\nWhat social issues are we facing up nowadays?\r\nAre people in your country satisfied with the level of their wages?\r\nDo you know the history of slavery in your country?\r\nIf you were a president what reforms would you suggest?\r\nHave you ever taken part in any protest march? And why?\r\nDo you think the restriction on human freedom is unjustifiable?\r\nWhat do you think about why some people resort to violence?\r\nDo you know any famous suffragettes of your nation?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 579),
(165, NULL, 1, 'Ask me five questions about beauty and health tips.\r\nThe picture above will help you to make them up.\r\n', '', 'Describe what you see', 1, 'Question:', 0, '', NULL, NULL, '', 1, 578),
(166, NULL, 1, 'Pringles once had a lawsuit trying to prove that they weren\'t really potato chips. This must have been funny!\r\nLouis XIX was the king of France for just 20 minutes. How did they get this information?!\r\nIn France, you can marry a dead person. Does it really work?\r\nShampooing is an Indian concept. So, why are these guys still so negligent?\r\nFrogs come in all sorts of colors. Are these cuties experts in fashion?\r\nThe fear of cooking is known as Mageirocophobia and is a recognized phobia. Do you still want to bake a cake?\r\nThe \"57\" on the Heinz ketchup bottle represents the number of pickle types the company once had. Are these guys so scrupulous?\r\n', '', 'Let\'s have fun!', 5, 'Read the following funny facts:', 0, '', NULL, NULL, '', 5, 579),
(170, NULL, 1, 'Children\r\nAdopt\r\nFamily\r\nHome\r\ndreams\r\n', '', 'Describe what you see', 1, 'Make a story using the following words:', 0, '', NULL, NULL, '', 1, 579),
(169, NULL, 1, 'If my foster parents were more supportive, I would feel more confident.\r\nWhen their country gains independence, what changes will wait for them?\r\nAs a rule, if childrenâ€™s rights are not respected, it is criminalized.\r\nMore and more teenagers will face a risk of drug addiction unless the war on drug dealers is declared.\r\nHow many members would vote on the housing question if it were presented for vote tomorrow?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 579),
(171, NULL, 1, 'Here are 10 words: \r\nunjustifiable, volunteer, orphanage, pets, permission, violence, home, safety, kind, food\r\nMake a catchy story using these words.\r\nSay â€œblipâ€ instead of these words.\r\nMake your teacher find them out.\r\n', '', 'Let\'s have fun!', 5, 'Sitgame\r\n', 0, '', NULL, NULL, '', 5, 580),
(172, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 580),
(173, NULL, 1, 'Do you agree that children must meet all their parents\' expectations? And why?\r\nWould you like to have a job that involves addressing social issues?\r\nWhat do you think is the most serious problem in the world nowadays?\r\nDo you believe in the individuals right to own firearms?\r\nWhat do you understand under the following phenomenon \"positive discrimination\"\r\nIf you had a chance, would you be a volunteer in a hospital? And why?\r\nDo you agree that violence always leads to violence? What can we do then?\r\nShould teachers use corporal punishment as a means of discipline?\r\nWhy do some people think graffiti is a problem for society?\r\nWhat messages do you see? i.e. political, love messages, funny, personal, poetic?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 580),
(176, NULL, 1, 'Acquire (have; get; buy)\r\nBoost (increase; higher; raise)\r\nBreakthrough (achievement; success; contribution)\r\nEnsure (provide; give; make sure)\r\nFlunk (fail; lose; mess up)\r\nHandle (overcome; hurdle; deal with)\r\nIntend (want; wish; desire)\r\nCan you make up a short story with these words?\r\n', '', 'Let\'s have fun!', 5, 'Give definitions to these words without using the words in brackets:', 0, '', NULL, NULL, '', 5, 581),
(174, NULL, 1, ' If my foster parents were more supportive, I would feel more confident.\r\nWhen their country gains independence, what changes will wait for them?\r\nAs a rule, if childrenâ€™s rights are not respected, it is criminalized.\r\nMore and more teenagers will face a risk of drug addiction unless the war on drug dealers is declared.\r\nHow many members would vote on the housing question if it were presented for vote tomorrow?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 580),
(179, NULL, 1, ' Do you know any useful tips on how to boost your confidence?\r\nWhat role does leadership play in your life? And why?\r\nWhat are the pros and cons of being an ambitious human being?\r\nWhat hacks would you suggest to handle failures? And why?\r\nWhat breakthroughs have you already had in your life?\r\nWhat knowledge and skills would you like to acquire? And why?\r\nDo you consider yourself as a great specialist who doesn\'t have any competitors? Why?\r\nDo you agree with the statement: \"never stop learning, \'cause learning never stops\"? And why?\r\nAre you aware of any tricks on how to stay motivated every day?\r\nDo you think that sticking to a diet can be considered a challenge as well?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 581),
(175, NULL, 1, 'Give three pieces of advice on how to get over unemployment.\r\n', '', 'Describe what you see', 1, 'Explain:', 0, '', NULL, NULL, '', 1, 580),
(178, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 581),
(180, NULL, 1, 'If molly had been a woman of great ambition in her thirties, she could have achieved much more.\r\nYou would have easily entered the University if you hadnâ€™t flunked History.\r\nWhat would you have done at the meeting yesterday if Isabel had outlined the situation in a wrong way?\r\nIf they hadnâ€™t overrated their abilities last time, they would have done it better.\r\nThere would have been no solution for this problem then if they had lost the papers.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 581),
(181, NULL, 1, 'Name five things you can do with a gold medal.\r\n', '', 'Describe what you see', 1, 'Tell:', 0, '', NULL, NULL, '', 1, 581),
(183, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 582),
(182, NULL, 1, 'Which is better: to be a leader or to be led? And why?\r\nWhat should you do to become the best leader for your employees?\r\nWhat spheres of life will you have to sacrifice? What for?\r\nWhat responsibilities do you have to take? And why?\r\nWhat are the advantages and disadvantages of being the led? And why?\r\nWhich position seems to be more stressful? And why?\r\nWhat character traits should a leader have? And why?\r\nWhat would you do to make a friendly atmosphere?\r\nDoes courage play an urgent role? And why?\r\n\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 582),
(184, NULL, 1, 'What are the pros and cons of any work obsession?\r\nDo you agree that success can ruin your personal life?\r\nWhat targets would you like to realize in the future? What for?\r\nWhat would you do to alleviate tension between colleagues if it happened?\r\nShould people overcome their vices or not? And why?\r\nWill you be satisfied with your life, if you sum up all highs and lows?\r\nIs it important to monitor your progress or not? And why?\r\nWhat do you do not to overestimate yourself?\r\nDo you know any tips on how to release burden from your soul?\r\nDoes the young generation have more prospects in comparison with yours?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 582),
(185, NULL, 1, ' If molly had been a woman of great ambition in her thirties, she could have achieved much more.\r\nYou would have easily entered the University if you hadnâ€™t flunked History.\r\nWhat would you have done at the meeting yesterday if Isabel had outlined the situation in a wrong way?\r\nIf they hadnâ€™t overrated their abilities last time, they would have done it better.\r\nThere would have been no solution for this problem then if they had lost the papers.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 582),
(186, NULL, 1, 'What is your favourite story of success?\r\nWhy does this person inspire you?\r\nAre you brave enough to overcome hurdles?\r\n', '', 'Describe what you see', 1, 'Answer:', 0, '', NULL, NULL, '', 1, 582),
(187, NULL, 1, 'What do you see in the picture?\r\nWho are these women?\r\nWhat are they doing?\r\nDo you like this picture?\r\nDoes it make you joyful or sad?\r\nWould you consider these women as role models?\r\nDo you know any stories about seniors who life a full life?\r\nWill you be cheerful when you are a senior?\r\n', '', 'Let\'s have fun!', 5, 'Picture:', 0, '', NULL, NULL, '', 5, 583),
(188, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 583),
(189, NULL, 1, 'Do you remember a lot about your childhood?\r\nDid you cook up a lot of stories when you were a child?\r\nDid you have imaginary friends when you were a child?\r\nWhich phase of life is the best?\r\nDo you like to be a teen/adult? Why?\r\nDo you miss your childhood?\r\nDo you have a lot of relatives?\r\nHow can you describe your grandparents?\r\nWhere did you spend your summer holidays when you were a child?\r\nHow can we make life of seniors better?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 583),
(190, NULL, 1, 'I wish they hadnâ€™t hidden out from the police!\r\nIf only we could expand the existing customer base!\r\nIf only people would cheat less!\r\nI wish you didnâ€™t distress yourself and would speak your mind!\r\nIf only she hadnâ€™t cooked up that excuse then!\r\nI wish the doctor had emphasized how little he knew about that disease!\r\nI wish my business would expand to serve all the country!\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 583),
(191, NULL, 1, '- You do agree with this saying?\r\n- Did you like fairy tales when you were a child?\r\n- Are you old enough to read fairy tales and watch cartoons again?\r\n', '', 'Describe what you see', 1, 'â€œ Someday you will be old enough to start reading fairy tales again.â€ \r\nC.S. Lewis', 0, '', NULL, NULL, '', 1, 583),
(192, NULL, 1, 'What would it include? Money and luxury? Or maybe all you need is love?\r\nWould there be traveling and adventures? What people would you like to have around?\r\nWhat is happiness for you?\r\nUse the words\r\nReveries\r\nStargaze\r\nSpeculate\r\nHeyday\r\nemphasize\r\n', '', 'Let\'s have fun!', 5, 'Talk about a perfect life for you', 0, '', NULL, NULL, '', 5, 584),
(193, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 584),
(194, NULL, 1, ' How often do you regret about something?\r\nAre regrets a waste of time?\r\nIf you had a chance, would you change anything in your past?\r\nDo you know people who always moan about their life?\r\nDo you have any pipe dreams?\r\nIs it important to have dreams or goals?\r\nHow often do you stargaze?\r\nDo you tend to speculate every action or are you a spontaneous person?\r\nDid you have a turning point in your life?\r\nIs it possible to be responsible for all your actions?\r\n\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 584),
(197, NULL, 1, 'Here\'s the list of 20 jobs. Some of them are real and some are fake.\r\nWhich of them do really exist?\r\nExplain your choice.\r\nCheck the answers. Are you surprised?\r\nHave you ever heard of any of them?\r\nWhat job would you like to try? Why?\r\nWhat job would you never try? Why?\r\n\r\ngum buster\r\ndog breath sniffer\r\nash portrait artist\r\nprofessional apologizer\r\npigeon coach\r\nhuman scarecrow\r\nprofessional iceberg mover\r\ncorpse eater\r\nprofessional ear cleaner\r\nostrich babysitter\r\ngender equality consultant\r\npug hugger\r\nprofessional snuggler\r\nalien hunter\r\nduck master\r\nprofessional sleeper\r\nchicken sexer\r\nbaseball prayer\r\nprofessional elephant dresser\r\nbed warmer\r\n', 'Keys: 1. yes 2. yes 3. yes 4. yes 5. no 6. yes 7. yes 8. no 9. yes 10. yes 11. yes 12. no 13. yes 14. no 15. yes 16. yes 17. yes 18. no 19. yes 20. yes\r\n\r\n\r\n', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 585),
(196, NULL, 1, 'Are you an old turtle or an energetic tiger?\r\nExplain your choice.\r\nWho is better to be?\r\n', '', 'Describe what you see', 1, 'Choice:', 0, '', NULL, NULL, '', 1, 584),
(198, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 585),
(199, NULL, 1, ' Do you mope when you don\'t have a job?\r\nIs it important to you to do something useful for other people?\r\nDo you have anyone in charge of you now?\r\nDo you prefer to be your own boss or work for other people?\r\nwhat is better: a remote job or an office one?\r\nAre you satisfied with your current job?\r\nAre you going to change your professional field?\r\nWhat unusual jobs do you know?\r\nWould you like to have an unusual job? If yes, which one?\r\nDo you know any means to make money without working? Which ones?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 585),
(195, NULL, 1, ' I wish they hadnâ€™t hidden out from the police!\r\nIf only we could expand the existing customer base!\r\nIf only people would cheat less!\r\nI wish you didnâ€™t distress yourself and would speak your mind!\r\nIf only she hadnâ€™t cooked up that excuse then!\r\nI wish the doctor had emphasized how little he knew about that disease!\r\nI wish my business would expand to serve all the country!\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 584),
(201, NULL, 1, 'Do youâ€¦?\r\nDo you like yourâ€¦?\r\nWhat is an idealâ€¦?\r\nIs it hard toâ€¦?\r\nDo you know anyâ€¦?\r\n', '', 'Describe what you see', 1, 'Finish the questions:', 0, '', NULL, NULL, '', 1, 585),
(202, NULL, 1, 'Choose a word from the list and make several sentences with it. But instead of the chosen word say the word â€œblipâ€ and make your partner guess the word.\r\n\r\nOdd job\r\nProtest\r\nSack\r\nWarn\r\nRemind\r\nMope \r\nAlias\r\nBlame\r\nApologize\r\nadvise\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 586),
(200, NULL, 1, 'The manager said that he wouldnâ€™t insist on her sack.\r\nThey told us that a new director might enter soon upon the responsibilities of the office.\r\nOur accountant said that he had already explained everything to the boss.\r\n\r\n\r\n\r\n\r\nThe cashier told me that he had been threatened with a gun one day.\r\n\r\nShe said that she wasnâ€™t going to apologize for her behaviour then.\r\n\r\nMy friend told me that he would remind me to call him the next day.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 585),
(204, NULL, 1, ' Do you often feel nervous before or during a job interview?\r\nWhy do people feel nervous during job interviews?\r\nHas anyone asked you strange questions at job interviews?\r\nDo you know what extreme interviews are?\r\nWhat is an odd job?\r\nHave you ever been redundant?\r\nWhat are the core skills which make you a good employee?\r\nDo you know any examples of turning a hobby into a job?\r\nAre you a social climber?\r\nWhat would you prefer: a pleasant coffee-and-cake-job or an exhausting well-paid job?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 586),
(206, NULL, 1, 'Give an example of a successful person\r\nWhy do you think so?\r\nAre you a successful person?\r\n', '', 'Describe what you see', 1, 'Example:', 0, '', NULL, NULL, '', 1, 586),
(205, NULL, 1, ' The manager said that he wouldnâ€™t insist on her sack.\r\nThey told us that a new director might enter soon upon the responsibilities of the office.\r\nOur accountant said that he had already explained everything to the boss.\r\n\r\n\r\n\r\n\r\nThe cashier told me that he had been threatened with a gun one day.\r\n\r\nShe said that she wasnâ€™t going to apologize for her behaviour then.\r\n\r\nMy friend told me that he would remind me to call him the next day.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 586),
(203, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 586),
(208, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 587),
(209, NULL, 1, 'Do you often encourage your friends?\r\nDo you sometimes criticize other people?\r\nIs it easy for you to convince someone?\r\nAre you an impressionable person?\r\nAre you fond of disputes?\r\nWhat are debates?\r\nDo other peopleâ€™s opinions matter to you?\r\nShould people have strong opinions?\r\nIs it possible to live without having opinions?\r\nWhat is the most exciting topic for you?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 587),
(207, NULL, 1, 'One regular day you wake up, go to work and do everything as usual when suddenly you realize, while talking to your colleagues, that you can convince anybody in everything and make them do everything you want. You check it several times and it works. You don\'t know why it happened, but it\'s like you have some kind of God\'s voice, or you\'re like kinda friggin\' Jedi or something. The world suddenly seems to you full of possibilities and the more you think of it the more you become excited. Or frightened?\r\nSo, your actions?\r\nFirst of all, how would you feel in such kind of situation?\r\nWhat would you do in the first place?\r\nWould you think that you\'re destined for great things and make up an ambitious plan?\r\nWould you try to find out why it happened?\r\nWhat would you use this ability for?\r\nWould you try to make the world a better place or the opposite?\r\nWould you use this ability on your relatives and friends?\r\nIf you could do only one thing with this kind of superpower, what would you do?\r\nWould you like to have such kind of ability IRL? Explain your opinion.\r\n\r\nTry to make up an exciting and epic ending for this story.\r\n', '', 'Let\'s have fun!', 5, 'Imagine the following situation:', 0, '', NULL, NULL, '', 5, 587),
(211, NULL, 1, 'Try to spell the word â€œencourageâ€\r\nWhat does it mean?\r\nWhat letters are not pronounced?\r\nGive examples of other words containing letters that are not pronounced.\r\n', '', 'Describe what you see', 1, 'Puzzle:', 0, '', NULL, NULL, '', 1, 587),
(210, NULL, 1, 'They asked if the chairman had informed us about the audit results.\r\nMy boss told me to report on last week negotiation.\r\nShe asked how soon she would be confirmed in her position as marketing director.\r\nOliver asked not to mention his name any more.\r\nThe teacher asked if he could encourage the best students with some bonus.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 587),
(213, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 588),
(214, NULL, 1, ' Do you often quarrel with other people?\r\nWhy do people quarrel about trifles?\r\nDo you like instructing other people?\r\nAre you open to new opinions and ideas?\r\nIs it difficult for you to change your opinion?\r\nAre you a pessimist or an optimist?\r\nIs it hard to keep the optimistic attitude to life?\r\nDo you feel irritated when something doesn\'t go your way?\r\nDo you feel in control of your life?\r\nDo you know anybody who thinks the same way as you?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 588),
(212, NULL, 1, 'What 5 items would you choose to tell aliens about people?\r\nExplain your choice.\r\nHow would you explain to them who people are?\r\nHow would you explain that people are different?\r\nWhat could represent the best qualities of people?\r\nAnd what could represent the worst qualities?\r\nWhat do you find the most amazing about people?\r\nWhat would utopian future society look like?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 588),
(215, NULL, 1, ' They asked if the chairman had informed us about the audit results.\r\nMy boss told me to report on last week negotiation.\r\nShe asked how soon she would be confirmed in her position as marketing director.\r\nOliver asked not to mention his name any more.\r\nThe teacher asked if he could encourage the best students with some bonus.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 588),
(217, NULL, 1, 'Answer the following questions:\r\n\r\nDo you agree that breakfast is really your most important meal? Why?\r\nWhat do you usually cook and eat for breakfast? And why?\r\nWhat would you choose: a cup of tea or coffee or a glass of juice? Why?\r\nDiscuss the following facts:\r\nBananas help overcome depression due to high levels of tryptophan.\r\nEat two bananas before a strenuous workout to pack an energy punch and sustain your blood sugar.\r\nQuitting smoking? Bananas contain high levels of B-vitamins to speed recovery from the effects of withdrawal.\r\n\r\n\r\n', 'Answer: sticker, hole, pinch of cinnamon', 'Let\'s have fun!', 5, 'Spot the difference between the panels presented above.', 0, '', NULL, NULL, '', 5, 589),
(216, NULL, 1, 'Ask me 5 questions using past tenses.\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 588),
(220, NULL, 1, 'Iâ€™d like a new briefcase and several pairs of gloves.\r\nShe put the briefcase on the table, took her gloves off and greeted everybody.\r\nIs there any mustard on your table? My meat is tasteless.\r\nBoth satin and velvet could be used for your dress.\r\nHow much ginger did you use to add to your biscuits?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 589),
(218, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 589),
(219, NULL, 1, ' Do you consider any of your friends a shopaholic? And why?\r\nWhy are lots of people obsessed with window shopping?\r\nHave you ever bought something on impulse and then regretted it?\r\nAre you a bargain-hunter? Do you tend to wait for the sales before buying things?\r\nWhen you go shopping what influences you more: price, quality or the layout of the shop?\r\nHow safe do you think it is to shop online? Do you worry about credit card fraud?\r\nDo you agree that shopping can help you handle stress? And why?\r\nHave you ever visited any cash-and-carries in your country? What were they?\r\nWhat well-known chain stores do you know? Would you like to visit them?\r\nWhat makes people do so much online shopping these days?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 589),
(222, NULL, 1, 'Who will keep you company on this journey? And why?\r\nWhat presents would you buy for Mrs. Hudson? And why?\r\nAre you planning to take part in their adventures?\r\nWhat weapons would you take to struggle against criminals?\r\nWhat is your favorite short story of Sherlock Holmes? And why?\r\nDo you agree that 221B Baker Street is a symbol of London like Big Ben? Why?\r\nHave you ever dreamt to be a private detective? And why?\r\n', '', 'Let\'s have fun!', 5, 'You are going to meet Sherlock Holmes and Dr. Watson.', 0, '', NULL, NULL, '', 5, 590),
(221, NULL, 1, 'Supermarket\r\nCracker\r\nshopaholic\r\n', '', 'Describe what you see', 1, 'Explain the following words:', 0, '', NULL, NULL, '', 1, 589),
(224, NULL, 1, 'Have you ever bought anything from a catalog or shopped online? What did you buy?\r\nWhere would you go to buy natural food: to a market or supermarket? And why?\r\nHave you ever bought anything from a door-to-door salesman or a street vendor?\r\nWhat would you choose: to bring old clothes to a thrift shop or throw them away? Why?\r\nDo you prefer shopping in well-known chain stores or in little boutiques? And why?\r\nHave you ever haggled (dispute over the cost) anywhere? How successful were you?\r\nDo you prefer cooking by yourself or buying convenience (prepared) food? And why?\r\nDo you pay your attention to customerâ€™s reviews when you\'re planning to buy appliances?\r\nWhat clothes do you usually buy for yourself? Where do you go shopping?\r\nDo you think the way we shop will change over the next few years?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 590),
(226, NULL, 1, 'Give us some simple tips that will help us shop smarter.\r\n', '', 'Describe what you see', 1, 'Give advice:', 0, '', NULL, NULL, '', 1, 590),
(223, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 590),
(225, NULL, 1, ' Iâ€™d like a new briefcase and several pairs of gloves.\r\nShe put the briefcase on the table, took her gloves off and greeted everybody.\r\nIs there any mustard on your table? My meat is tasteless.\r\nBoth satin and velvet could be used for your dress.\r\nHow much ginger did you use to add to your biscuits?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 590),
(227, NULL, 1, 'How many keys does a piano have?\r\nWhich instrument made Vanessa-Mae popular?\r\nReleased in March of 1963, what is the title of the Beatles\' first album?\r\nHow many instruments would accompany someone who was singing a cappella music?\r\n\"La Scala\" is an opera house in which Italian city?\r\nWho is Marshall Mathers better known as?\r\nHow many operas did Ludwig van Beethoven compose during his life?\r\nWhich composer\'s heart was buried in Poland, but his body buried in France?\r\nWhat is English singer-songwriter Adele\'s last name?\r\nFormed in Stockholm in 1972, which band members included Agnetha Faltskogand Benny Anderson?\r\nOn which instrument is a \"Nocturne\" usually played?\r\nWhich singer released the album titled \"Katy Hudson\"?\r\nWith what song did Britney Spears make her breakthrough in 1998?\r\nWhat is English musician David Bowie\'s real last name?\r\nWhat is the name of the male voice that lies between Bass and Tenor?\r\n\r\n\r\n\r\n', 'Keys:\r\n88\r\nViolin\r\nPlease please me\r\n0\r\nMilan\r\nEminem\r\n1\r\nChopin\r\nAdkins\r\nAbba\r\nPiano\r\nKaty Perry\r\nBaby one more time\r\nJones\r\nbaritone', 'Let\'s have fun!', 5, 'Quiz - Facts quiz:', 0, '', NULL, NULL, '', 5, 591),
(231, NULL, 1, 'Whoâ€™s this person?\r\nDo you know any of his masterpieces?\r\nDid you know that Beethoven often dipped his head in cold water before composint?\r\n', '', 'Describe what you see', 1, 'Tell â€“ Talk about this person:', 0, '', NULL, NULL, '', 1, 591),
(228, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 591),
(229, NULL, 1, 'Do you think it\'s possible to tell a lot about the personality based on the music preferences?\r\nDo you listen to music while doing something else like working on your computer or cleaning the house? Can you stay concentrated on your work while listening to music?\r\nDo you think the music which is popular now could become classics for further generations?\r\nDo you follow your favorite singers and bands on social networks?\r\nIf you like a song in English, but don\'t understand the lyrics, do you usually search for them?\r\nDo you try to influence the music preferences of people who are close to you?\r\nDo you often have earworms? What catchy songs have already bothered you?\r\nIs there any kind of music that you can\'t stand?\r\nIs a soundtrack to a movie important for you?\r\nHave you heard about music therapy? Do you think music can relieve pain?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 591),
(232, NULL, 1, 'Rule: describe music styles without using the words in brackets:\r\n\r\nPop music (musty, catchy, jaunty)\r\nRock music (heavy, madman, loud)\r\nJazz (jazzy, improvisation, saxophone)\r\nClassical (tuneful, minor key, clavier)\r\nFolk (in a singsong, tradition, people)\r\n', '', 'Let\'s have fun!', 5, 'Sitgame:', 0, '', NULL, NULL, '', 5, 592),
(230, NULL, 1, 'The performer who collaborated with them asked more money for his work!\r\nDo you know well the person who composed such a terrible thing?\r\nWe are going to invite the performer that we used to work with.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 591),
(234, NULL, 1, ' Do you have a musical ear or not? How do you know it?\r\nCan you spot if a musician plays out of tune?\r\nDo you prefer music in a major key or in a minor key?\r\nWhat\'s the most inspiring song you\'ve ever heard?\r\nIs it possible to start singing well if you take up music classes as a grown-up?\r\nWhich musical instrument sounds the best?\r\nWhat kind of music can you call left-field?\r\nDo you think nowadays there are too many musty songs?\r\nDo you like improvisations in music?\r\nDo you think genius composers are always madmen in some sense?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 592),
(233, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 592),
(235, NULL, 1, ' The performer who collaborated with them asked more money for his work!\r\nDo you know well the person who composed such a terrible thing?\r\nWe are going to invite the performer that we used to work with.\r\n\r\n\r\nItâ€™s rather difficult to improvise with the bagpipe that you play for the first time.\r\nThe bagpipe music which I perform always makes people applaud.\r\nHe is currently looking for the whistle which he lost while moving last week.\r\nLast year he took up music history that he had been always interested in\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 592),
(237, NULL, 1, 'The weirdest hobby\r\nThe most dangerous hobby\r\nThe most expensive hobby\r\nThe cheapest hobby\r\nThe most boring hobby\r\nThe most exciting hobby\r\nSome old-fashioned hobby\r\nThe hobby which is becoming more and more trendy nowadays\r\nThe hobby which you want to try most\r\n', '', 'Let\'s have fun!', 5, 'Tell your teacher about (and donâ€™t forget to explain your opinion):', 0, '', NULL, NULL, '', 5, 593),
(236, NULL, 1, 'My motto is: ..................................................\r\nWrite a motto forâ€¦\r\na left-field music band\r\na tone-deaf person who adores karaoke\r\na singer who acts like a madma\r\n\r\n', '', 'Describe what you see', 1, 'Answer :', 0, '', NULL, NULL, '', 1, 592),
(238, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 593),
(239, NULL, 1, ' Do you know anyone who has an extraordinary hobby? If so, which one?\r\nDo you think it is important to have common hobbies with your friends?\r\nAre you an adrenaline junkie? Have you ever tried something like bungee jumping or skydiving?\r\nWhat is your attitude towards hunting? How do you feel about killing animals just for fun?\r\nDo you think nowadays people have fewer hobbies because they spend their free time online?\r\nDo you have a long-lasting hobby or do you prefer to often change activities?\r\nHave you ever earned money thanks to your hobby?\r\nWhat is studying English for you: a hard work or a hobby?\r\nIs it important to keep balance between work and personal life?\r\nDo you think that having a lot of free time might be boring? Or a person can always find something interesting to\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 593),
(241, NULL, 1, 'Do you agree? Why (not)?\r\nI really want to lose weight, but I donâ€™t want to go to the gym.\r\nI really want to lose weight, but I donâ€™t want to change my eating habits.\r\nI really want to lose weight, but I canâ€™t afford healthy eating.\r\n', '', 'Describe what you see', 1, 'Phrase:', 0, '', NULL, NULL, '', 1, 593),
(240, NULL, 1, 'My parents detest having rest at the same place every year.\r\nWhy not to imagine being on the beach now and not in the stuffy office?\r\nThe rule forbids drinking alcohol drinks here.\r\n\r\n\r\n\r\nAre you really proud of offending those who are weaker than you?\r\nLast time my friends blamed me for avoiding them.\r\nDoes Alison always insist on buying cheap things?\r\nI finally succeeded in playing backgammon. It was like a challenge for me.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 593),
(242, NULL, 1, 'Living without hobbies\r\nShould every person have a hobby?\r\nIs it bad not to have a hobby?\r\nIs it good to have a lot of hobbies?\r\nIs it good to work hard?\r\nIs it bad to consider work to be your hobby?\r\nWhat\'s the worst hobby you\'ve ever heard about?\r\nWhy do some people choose dangerous hobbies such as train surfing?\r\nWhat other dangerous hobbies do you know?\r\nCould you take up a hobby that requires a lot of patience like tree shaping?\r\n\r\n', '', 'Let\'s have fun!', 5, 'Compare - Good or bad:', 0, '', NULL, NULL, '', 5, 594),
(243, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 594),
(244, NULL, 1, ' Is there anything you madly want to try doing?\r\nWhat\'s better: having one hobby and spending all your time on it or having many hobbies but spending less time on each?\r\nWhat is the weirdest hobby you\'ve ever heard of?\r\nWould you like to make a profit out of your hobbies?\r\nCan a job you love substitute all the hobbies and become your only occupation?\r\nDo you usually thoroughly plan your free time or do you prefer being spontaneous?\r\nDo you watch variety shows on TV?\r\nCan a hobby change your personality?\r\nAre there good places for rollerblading and skateboarding in your town?\r\nWhat would you recommend to a person who can\'t find enough free time for hobbies?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 594),
(248, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 595),
(245, NULL, 1, ' My parents detest having rest at the same place every year.\r\nWhy not to imagine being on the beach now and not in the stuffy office?\r\nThe rule forbids drinking alcohol drinks here.\r\n\r\n\r\n\r\nAre you really proud of offending those who are weaker than you?\r\nLast time my friends blamed me for avoiding them.\r\nDoes Alison always insist on buying cheap things?\r\nI finally succeeded in playing backgammon. It was like a challenge for me.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 594),
(247, NULL, 1, 'Can you find the six words hidden in the picture?\r\n- Can you find the word â€˜Readâ€™?\r\n- Can you find the word â€˜Novelâ€™?\r\n- Can you find the word â€˜Bookâ€™?\r\n- Can you find the word â€˜Storyâ€™?\r\n- Can you find the word â€˜Wordsâ€™?\r\n- Can you find the word â€˜Pageâ€™?\r\n', 'Keys:\r\n1- Read (dogâ€™s ear)\r\n2- Novel (arm chair)\r\n3- Book (manâ€™s glasses)\r\n4- Story (woman)\r\n5- Words (tree)\r\n6- Page (boy)', 'Let\'s have fun!', 5, 'Picture', 0, '', NULL, NULL, '', 5, 595),
(246, NULL, 1, 'USA vs Canada\r\nWhich country is larger?\r\nWhich country is more populated?\r\nWhich country is richer?\r\nWhich one do you want to visit more, if any?\r\n', '', 'Describe what you see', 1, 'Choice:', 0, '', NULL, NULL, '', 1, 594),
(249, NULL, 1, '1. What was the most interesting exhibition you&#39;ve ever visited?\r\n2. A lot of museums now have all their collections online. Do you think browsing an e-collection\r\nis a good alternative to visiting a museum?\r\n3. What is more entertaining for you: a movie or a theatrical performance? Explain why.\r\n4. Do you think you have enough entertainment in your life?\r\n5. Have you ever been to a concert of your favorite singer or band?\r\n6. Does the place where you live offer a lot of different entertainments?\r\n7. Have you ever tried gambling? Do you think it&#39;s easy to get addicted to gambling?\r\n8. Would you rather spend money on entertainment or buy something like a new outfit or a\r\nhousehold appliance?\r\n9. Are there any types of entertainment that you find boring?\r\n10. What is your brightest memory of the entertainment?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 595),
(251, NULL, 1, '- I go to exhibitions becauseâ€¦\r\n- Iâ€™m giggling becauseâ€¦\r\n- I like/donâ€™t like boiling weather becauseâ€¦\r\n- I find spiders hideous/cute becauseâ€¦', '', 'Describe what you see', 1, 'Explain', 0, '', NULL, NULL, '', 1, 595),
(250, NULL, 1, '- I want to know who the crowd booed during the match yesterday.\r\n- Could you tell me why she always giggles over her jokes?\r\n- I would like to know if you are going to consent to his proposal.\r\n- I want to know if where your child is peeping into right now.\r\n- I want to know if my family wearied you with their questions.\r\n- Could you tell me whether he often chuckles in that way?\r\n- Could you tell me when they will finally consent to that?', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 595),
(252, NULL, 1, '1. What\'s the best pastime you can imagine?\r\n2. What kind of activity can easily weary you?\r\n3. What is the most superb place you\'ve ever been to?\r\n4. Do you know any interesting stories about famous artists and their masterpieces?\r\n5. What kind of art is the most thrilling?\r\n6. Do you enjoy visiting exhibitions if they are packed?\r\n7. Can you think of some famous masterpieces that are actually horrid and filthy?\r\n8. Would you like to see a knight tournament?\r\n9. Do you think a person can be spotless? If so do you have any examples?\r\n10. Are there more and more obese people nowadays? What are the reasons?', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 596),
(253, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 596),
(254, NULL, 1, '1. What&#39;s the best pastime you can imagine?\r\n2. What kind of activity can easily weary you?\r\n3. What is the most superb place you&#39;ve ever been to?\r\n4. Do you know any interesting stories about famous artists and their masterpieces?\r\n5. What kind of art is the most thrilling?\r\n6. Do you enjoy visiting exhibitions if they are packed?\r\n7. Can you think of some famous masterpieces that are actually horrid and filthy?\r\n8. Would you like to see a knight tournament?\r\n9. Do you think a person can be spotless? If so do you have any examples?\r\n10. Are there more and more obese people nowadays? What are the reasons?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 596),
(255, NULL, 1, '- I want to know who the crowd booed during the match yesterday.\r\n- Could you tell me why she always giggles over her jokes?\r\n- I would like to know if you are going to consent to his proposal.\r\n- I want to know if where your child is peeping into right now.\r\n- I want to know if my family wearied you with their questions.\r\n- Could you tell me whether he often chuckles in that way?\r\n- Could you tell me when they will finally consent to that?', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 596),
(256, NULL, 1, 'Give examples of sentences with these words\r\n- Hilarious, ridiculous\r\n- Sculptor, superb\r\n- Pastime, weary', '', 'Describe what you see', 1, 'Example', 0, '', NULL, NULL, '', 1, 596),
(257, NULL, 1, 'Answer â€œyesâ€ or â€œnoâ€ to the following questions:\r\n\r\nï‚· You have broken your smartphone and you donâ€™t have money right now, so your friend\r\ngives you an old creepy phone. Will you use it?\r\n\r\nï‚· Have you ever bought a fancy device which you havenâ€™t used later?\r\n\r\nï‚· Have you ever bought 3 or more devices from the same brand?\r\nï‚· You want to buy a new tablet but in order to save money, you will have to eat only instant\r\nnoodles for 2 weeks. Will you do it?\r\nï‚· Are half or more of your clothes made by some famous expensive brands?\r\nï‚· Your friend has decided to quit Instagram, Twitter, Facebook and all other social\r\nnetworks. Will you think that he/she is out of his/her mind?\r\nï‚· Your friend says that your favorite brand is a piece of garbage. Will you quarrel with\r\nhim/her?\r\nï‚· You don&#39;t like some brand but suddenly you see a commercial of this brand&#39;s new device with\r\nyour favorite actor. Will you change your mind?\r\nï‚· You want to buy a new iPhone, so you come to the shop on the first day of Its sales but you\r\nsee a huge queue to the shop entrance and the same situation is in all the nearest shops.\r\nAre you going to stand in the queue for at least 2 hours?\r\n', 'Keys:\r\n7-9 - (yes);   answers - perhaps, you should talk to somebody about your\r\nindividuality problems.\r\n4-6 (yes); answers - you\'re almost ok. congrats!\r\n1-3(yes)t; answers - maybe you\'re just old.\r\n0 â€œyesâ€ answers â€“ who are you? An alien?', 'Let\'s have fun!', 5, 'Are you a brand addict?\r\n', 0, '', NULL, NULL, '', 5, 597),
(258, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 597),
(259, NULL, 1, '1. Do you have favorite brands that you always buy? Or do you prefer to try different\r\nproducts each time?\r\n2. Are you easily attracted by beautiful packaging?\r\n3. Do you watch advertisements on TV or in YouTube videos?\r\n4. In your opinion, what type of products needs a better or more frequent advertisement\r\ncompared to others?\r\nS. Do you think that advertisements are often misleading? Have you ever been disappointed by a\r\nproduct that had a great advertisement?\r\n6. Do you trust word-of-mouth? Do you read comments and reviews of the customers\r\nbefore purchasing anything?\r\n7. What kind of ads do you find the most annoying, if any?\r\n8. Have you ever had to advertize or promote anything?\r\n9. Would you work in a company that has a bad reputation provided the job offer is very good?\r\n10. Do you think people buy a lot of things they don&#39;t need because they are influenced by the ads?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 597),
(263, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 598),
(261, NULL, 1, '- Try to spell the word â€œpersuasiveâ€\r\n- What does it mean?\r\n- What letters are not pronounced?', '', 'Describe what you see', 1, 'Puzzle', 0, '', NULL, NULL, '', 1, 597),
(260, NULL, 1, '- Those companies need less advertising and more marketing.\r\n- Few customers come to them on TV ads.\r\n- But the fewest customers visit their shop on leaflets.\r\n- Theyâ€™ve found a lot of brand labels inside.\r\n- Even more labels were sewed in the right sleeve.\r\n- And it was the most labels they have ever seen.\r\n- As a rule manufacturers tend to use fewer brand labels.', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 597),
(270, NULL, 1, '- Who has brushed up Polish recently?\r\n- What are you going to swot up tonight?\r\n- When will your students memorize these rules?', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 599),
(262, NULL, 1, 'ï‚· Make up as many words as you can from a slogan *Melts in Your Mouth, Not in Your Hands*\r\nï‚· Whose slogan is it?\r\nï‚· Do you know any other catchy slogans?\r\nï‚· Make up your own catchy slogan to any product.\r\nï‚· Why do advertizing slogans stick in our mind?\r\nï‚· What attributes should a good slogan have?\r\nï‚· Do you remember the worst slogan you\'ve ever heard/seen?', '', 'Let\'s have fun!', 5, 'Sitgame', 0, '', NULL, NULL, '', 5, 598),
(268, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 599),
(269, NULL, 1, '1. Do you think students should be able to choose subjects they want to study?\r\n2. What is more efficient for you: studying in a group or personal lessons with the tutor?\r\n3. Have you ever failed an exam? If so, what was the reason?\r\n4. Have you ever taken a crash course of English or any other language? If so, was it\r\nefficient?\r\nS. Do you think strict teachers make their students obtain better results?\r\n6. Did you make crib sheets? What was the best way to make a crib sheet that a teacher\r\nwouldn\'t be able to notice?\r\n7. Do you have any rituals before an exam?\r\n8. Do you memorize things easily? Are you a visual, auditory or kinesthetic memory type?\r\n9. What\'s your attitude to bookworms? Do you think they are interesting people or they are\r\ntoo nerdy?\r\n10. Do you have any tips to get down working easily and stay focused for a long time? How\r\ndo you avoid', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 599),
(267, NULL, 1, '- Choose 2-3 pictures that represent you. Why?\r\n- What is the difference between typical A and D students?\r\n- What types of students can you distinguish?\r\n- Are you good at studying?\r\n- Do you know what the words â€œnerdâ€ and â€œgeekâ€ mean?\r\n- Is it important to study hard?', '', 'Let\'s have fun!', 5, 'Picture', 0, '', NULL, NULL, '', 5, 599),
(265, NULL, 1, '- Those companies need less advertising and more marketing.\r\n- Few customers come to them on TV ads.\r\n- But the fewest customers visit their shop on leaflets.\r\n- Theyâ€™ve found a lot of brand labels inside.\r\n- Even more labels were sewed in the right sleeve.\r\n- And it was the most labels they have ever seen.\r\n- As a rule manufacturers tend to use fewer brand labels.', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 598),
(266, NULL, 1, '- Ask me 5 questions using comparatives', '', 'Describe what you see', 1, 'Question', 0, '', NULL, NULL, '', 1, 598),
(271, NULL, 1, '- Bookworm\r\n- Crash course\r\n- Deep end\r\n- Imaginative\r\n- Inside out', '', 'Describe what you see', 1, 'Try to guess the meaning of these words:', 0, '', NULL, NULL, '', 1, 599),
(264, NULL, 1, '1. Do you buy only top-quality products?\r\n2. Do you always look at the price of the thing you&#39;re going to buy?\r\n3. Do you like funny commercials?\r\n4. Do you have any favorite commercial? Which one?\r\n5. Is there too much advertizing nowadays?\r\n6. Do you sometimes buy second-hand clothes or used books?\r\n7. Are people too obsessed with brands nowadays?\r\n8. Do you know what 5MM is?\r\n9. What is the most important part in a successful commercial?\r\n10. Do you know who body advertisers are?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 598),
(272, NULL, 1, 'ï‚· What 5 items would you put in a time capsule to tell future generations about learning\r\nnowadays? Why?\r\nï‚· Will people of the 22nd century study the same way as we do?\r\nï‚· Will they attend schools? Read books? Do homework?\r\nï‚· What inventions can you imagine that would change the way of studying?\r\nï‚· What 5 items would you choose to tell about the whole history of learning?\r\nï‚· What was the most important invention in the field of education?\r\nï‚· How would you explain the word - teacher to the people who don&#39;t have teachers at all?', '', 'Let\'s have fun!', 5, 'Compare', 0, '', NULL, NULL, '', 5, 600),
(274, NULL, 1, '1. Do you consider yourself a knowledgeable and intelligent person?\r\n2. Do you always do your best to pass an exam?\r\n3. Are exams stressful for you?\r\n4. Do you know any ways to memorize new English words better?\r\n5. Do you agree that studying hard provides you a good life?\r\n6. Were you an A student at school?\r\n7. What school subjects were the most difficult for you?\r\n8. And what were your favorites?\r\n9. Did you enjoy studying at school? And at University or college?\r\n10. What qualities should an ideal teacher have?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 600),
(280, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 601),
(281, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 601),
(276, NULL, 1, '- What does the abbreviation Ph. D. mean?\r\n- Is it cool to be a Ph.D.?\r\n- Do you know anybody who has a Ph.D. degree? In what field?', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 600),
(275, NULL, 1, '- Who has brushed up Polish recently?\r\n- What are you going to swot up tonight?\r\n- When will your students memorize these rules?', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 600),
(273, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 600),
(284, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 602),
(285, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 602),
(286, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 602),
(287, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 603),
(288, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 603),
(277, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 601),
(278, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 601),
(279, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 601),
(292, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 604),
(293, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 604),
(282, NULL, 0, '0', NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 602),
(283, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 602),
(296, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 604),
(297, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 605),
(298, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 605),
(299, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 605),
(300, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 605),
(294, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 604),
(295, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 604),
(289, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 603),
(290, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 603),
(291, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 603),
(307, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 607),
(314, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 608),
(308, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 607),
(301, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 605),
(302, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 606);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(303, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 606),
(304, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 606),
(305, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 606),
(306, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 606),
(338, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 613),
(339, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 613),
(333, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 612),
(326, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 611),
(327, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 611),
(328, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 611),
(329, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 611),
(330, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 611),
(331, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 612),
(332, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 612),
(318, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 609),
(319, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 609),
(320, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 609),
(321, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 609),
(322, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 610),
(323, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 610),
(324, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 610),
(325, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 610),
(315, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 608),
(316, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 608),
(317, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 609),
(309, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 607),
(310, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 607),
(311, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 607),
(312, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 608),
(313, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 608),
(342, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 614),
(334, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 612),
(335, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 612),
(336, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 613),
(337, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 613),
(344, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 614),
(345, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 614),
(346, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 615),
(347, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 615),
(348, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 615),
(349, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 615),
(340, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 613),
(341, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 614),
(353, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 616),
(354, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 616),
(355, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 616),
(356, NULL, 1, 'cold\r\na cough\r\ncure\r\ndangerous\r\nfeel\r\nfever\r\nflu\r\nill\r\na headache\r\nrunning nose\r\nWatch out! That\'s a set of the rules:\r\nMake a catchy story using these words. Say \"blip\" instead of the words above.\r\nMake your profound teacher find them out.\r\n', '', 'Let\'s have fun!', 5, 'Ok, mate, here are 10 words:', 1, 'https://drive.google.com/uc?export=view&id=12oUjhGnFAGxjmACwGNZndGX2eUIBI1-M', NULL, NULL, '', 5, 617),
(343, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 614),
(351, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 616),
(352, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 616),
(350, NULL, 0, '', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 615),
(357, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/17GrPDnYt6E', 4, 617),
(358, NULL, 1, 'What do you do when you have a cold?\r\nDo you believe in alternative medicine?\r\nWhat can people do to avoid a heart attack?\r\nWhen was the last time you had a temperature?\r\nIs it dangerous to take pills without any prescription?\r\nDo you feel pain in your neck after a hard-working day?\r\nHow long does it take you to recover after a cold or the flu?\r\nDo you go to work or college if you have a runny nose?\r\nDo you consult a doctor if you have a headache?\r\nHow often do you have a stomach ache?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1TBL-yBHlgQhWNaQZ_Ci-OYNCrqOoZVsU', NULL, NULL, '', 3, 617),
(360, NULL, 1, 'During a sneeze, all of your bodily functions stop for a moment, even your heart.\r\n', '', 'Describe what you see', 1, 'Is it true that....', 1, 'https://drive.google.com/uc?export=view&id=1SxrZ_j-B8flWIr97Z-56bJNcUx_82lPv', NULL, NULL, '', 1, 617),
(359, NULL, 1, 'I had a toothache yesterday.\r\nHe had some medicines a week ago.\r\nThey did not have a runny nose last weekend.\r\nWe did not have many pills a month ago.\r\nShe had a dangerous illness in the past.\r\nMy friend had a fever yesterday.\r\nYou did not have a cough 2 days ago.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=10Xk5Mv29lrIBlBMX-wbhiUzq08qHNdh_', NULL, NULL, '', 2, 617),
(361, NULL, 1, 'When I have a â€œblipâ€ Iâ€™m not happy at all. With a â€œblipâ€, I feel terrible. But when I take a pill, it usually gets better and I have no more â€œblipâ€.\r\nThe missing word is â€œa headacheâ€.\r\nNow you try! Explain the word using â€œblipâ€ instead of it.\r\nDoctor\r\nWater\r\nBed\r\nFever\r\nnose\r\n', '', 'Let\'s have fun!', 5, 'Itâ€™s time for a Blip game! Try to guess the word.', 1, 'https://drive.google.com/uc?export=view&id=1kvChsgwF8x3zoNhpDnaQ1qW_qB9jhsT5', NULL, NULL, '', 5, 618),
(362, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1K2_IqidGcuIXdXk7MRsNowLJGvc6_jVW', NULL, NULL, '', 4, 618),
(363, NULL, 1, 'What do you do when you have a sore throat?\r\nDo you often take pills?\r\nDo you try not to talk to people who have the flu or a cold?\r\nIs a cold dangerous? Do you always take medicine to recove\r\nWhat do you do to keep fit and healthy?\r\nHow often do you visit a doctor?\r\nHow terrible is it to have a toothache?\r\nDoes your neck hurt when you sit a lot?\r\nIs a runny nose a problem for you?\r\nDo you try to recover completely before you go to work?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1lqWA9eOAnkFNEbUbp3hcfwkA70GQ1gS7', NULL, NULL, '', 3, 618),
(365, NULL, 1, 'I buy some basic pills just to have them at home, becauseâ€¦\r\n', '', 'Describe what you see', 1, 'Finish the sentence below:', 1, 'https://drive.google.com/uc?export=view&id=1-wsdJGWrqwmVu-wf9c8jKAze2BuQgvd6', NULL, NULL, '', 1, 618),
(364, NULL, 1, 'I had a toothache yesterday.\r\nHe had some medicines a week ago.\r\nThey did not have a runny nose last weekend.\r\nWe did not have many pills a month ago.\r\nShe had a dangerous illness in the past.\r\nMy friend had a fever yesterday.\r\nYou did not have a cough 2 days ago.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1QjnWNoRHVZzeaKNxnkk7A2z9Z_d-RA0V', NULL, NULL, '', 2, 618),
(366, NULL, 1, 'Make a list of\r\nthe most unusual / most casual decorations for Easter,\r\nthe most unexpected / most expected presents for a wedding,\r\nthe most strange / funniest traditions of celebrating holidays in your country,\r\nthe tastiest / traditional dishes for Easter,\r\nthe most common/ strangest place of celebrating Easter.\r\n', '', 'Let\'s have fun!', 5, 'Sitgame', 1, 'https://drive.google.com/uc?export=view&id=1wjojZahsIkM2ZnJCXdZrXDhZXYiouQnz', NULL, NULL, '', 5, 619),
(367, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 619),
(368, NULL, 1, 'When did you last see fireworks?\r\nDo you cook traditional dishes at Christmas?\r\nDo you like making decorations for a party?\r\nHow many guests were there on your last birthday?\r\nWhat do you prefer - a romantic date or a noisy party?\r\nDo you have festivals in your hometown?\r\nDo you still send greeting cards or prefer an email?\r\nDid you have last Christmas with your family?\r\nIs a flower bunch a good present?\r\nDo you give each other gifts at work or college?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1wDxkiNyv2Ydltda8fpmSs24y0SgEUnyR', NULL, NULL, '', 3, 619),
(369, NULL, 1, 'Did you have a dream 10 years ago? â€“ Yes, I did.\r\nDid they have many candles at the party?\r\nDid he have a date last week? â€“ No, he did not.\r\nDid your guests have any gifts last Saturday?\r\nDid Mary have a firework at the party?\r\nDid we have a date yesterday? â€“ Yes, we did.\r\nDid she have a greeting card yesterday? â€“ Yes, she did.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 619),
(370, NULL, 1, 'Give an example of a holiday when people use candles.\r\nGive an example of your favourite holiday where you blow out candles.\r\nGive an example of the best candle for a wedding cake.\r\nGive an example of decorations with candles.\r\nGive an example of wishes people say when they blow out candles on their birthday cake.\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1G9W4JSG0DBSZy2Z-D8FUcWN0IV1bA_eC', NULL, NULL, '', 1, 619),
(371, NULL, 1, '-If you have five mangoes and two bananas in one hand and two mangoes and four bananas in the other hand. What will you have?\r\n-Why is 6 so much afraid of 7?\r\n-Triplets (Neha, Bandini & Shivani) were born in August but their birthday is in December. How come?\r\n-\"Two\'s a company, and three\'s a crowd\'. Then what\'s four and five?\r\n-Why do Indian men eat more rice than Irish men do?\r\n-Ten men were in a boat on the river Ganga. The boat turns over, and all men sink to the bottom of the river, yet not a single man got \r\n  wet!\r\n-Why did the beautiful girl throw the butter out of the window?\r\n', 'Keys:\r\nVery large hands\r\nBecause seven was hungry and, seven ate nine (7â€™8â€™9â€™)\r\nAugust is a city\r\nNine\r\nThere are more Indian men than Irish men\r\nBecause they were all married and no single\r\nBecause she wanted to see the butterfly (butter+fly)\r\n', 'Let\'s have fun!', 5, 'Ideas:', 1, 'https://drive.google.com/uc?export=view&id=1QjnWNoRHVZzeaKNxnkk7A2z9Z_d-RA0V', NULL, NULL, '', 5, 620),
(372, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1BSBVmZPZmoXSd6ldaDTcGKFgtSZ7GRhQ', NULL, NULL, '', 4, 620),
(373, NULL, 1, 'Did you have a lot of greeting cards for your last birthday?\r\nHappiness. What does it mean for you?\r\nDid you have a traditional Christmas celebration last year?\r\nWere people more romantic some years ago?\r\nDid you have an invitation to a party with celebrities last month?\r\nWhen did you have a rest yesterday?\r\nDid you have a drink with your friends last birthday?\r\nDid you have fun last English lesson? What did you do?\r\nDid you have a good time in a noisy cafe last summer? Did you like it?\r\nWhere did you have a meal last Sunday?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1IkZ20ta9CMnIwVrHV9os9ewaSVAJR-uf', NULL, NULL, '', 3, 620),
(374, NULL, 1, 'Did you have a dream 10 years ago? â€“ Yes, I did.\r\nDid they have many candles at the party?\r\nDid he have a date last week? â€“ No, he did not.\r\nDid your guests have any gifts last Saturday?\r\nDid Mary have a firework at the party?\r\nDid we have a date yesterday? â€“ Yes, we did.\r\nDid she have a greeting card yesterday? â€“ Yes, she did.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1dKqau4e7tOpJTrK51b77UtZvNRIpw6Sj', NULL, NULL, '', 2, 620),
(376, NULL, 1, 'Does Rwicha sing \"Nassi Nass\"?\r\nWho did Rihanna sing with in \"Love the way you lie?\"\r\nDoes Rihanna have only 1 hair color?\r\nWho wore a dress made out of raw meat?\r\nWho sings the song \"Casafonia\"?\r\nWhere did Aziz Dadas play the main role?\r\nWho is the funniest American comedian ? \r\n\r\n7-6 points: Hot & fabulous celebrity genius!\r\n5-3 points: A little knowledge never hurts!\r\n2-1 points: Underachiever and proud of it!\r\n', 'True\r\nEminem\r\nFalse\r\nLady gaga\r\nDizzy Dros\r\nRoad to Kabul\r\nKevin Hart(depends on students)\r\n', 'Let\'s have fun!', 5, 'Quiz: \r\nHow Well Do You Know Your Celebrities?\r\n\r\n\r\n', 1, 'https://drive.google.com/uc?export=view&id=1J1XM1N53VV5YG55w56t203jDDJuesuZM', NULL, NULL, '', 5, 621),
(375, NULL, 1, 'Why do they have holiday decoration?\r\nWhy are they so happy?\r\nWhy is it dark in the picture?\r\nWhy do they have drinks?\r\n', '', 'Describe what you see', 1, 'Answer the questions below:', 1, 'https://drive.google.com/uc?export=view&id=1qNdLS23rns0Pki9QrRR7ZcumtNuIrL0N', NULL, NULL, '', 1, 620),
(377, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/OmLrIwjwTNk', 4, 621),
(379, NULL, 1, 'I lived there 2 years ago.\r\nHe talked to me yesterday.\r\nThey stayed at home last weekend.\r\nShe broke her leg last summer.\r\nMy relatives went to Greece last year.\r\nI saw him the day before yesterday.\r\nHe lost his keys last weekend.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1dKqau4e7tOpJTrK51b77UtZvNRIpw6Sj', NULL, NULL, '', 2, 621),
(378, NULL, 1, 'Do you agree with the statement that winners write the history? Why?\r\nDo you think that people know a lot about the true history of our country and world?\r\nDid you like History at school?\r\nWhat was the most awful historical event?\r\nCan a single person change the history?\r\nWho were the most important people in world history?\r\nAre you interested in biographies of famous people?\r\nDo you want to meet any famous person from the past? Who?\r\nDo you feel lucky to live nowadays?\r\nDo you want to live in any other historical period? In which one?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1-RUp4lasUJs64POtagjKlpLv5OhDotWG', NULL, NULL, '', 3, 621),
(381, NULL, 1, 'Why is it called lipstick if you can still move your lips?\r\nWhat if Batman gets bitten by a vampire?\r\nWhy is the word dictionary in the dictionary?\r\nWhy is a person who plays the piano called a pianist, but a person who drives a race car not called a racist?\r\nWhy is \"abbreviated\" such a long word?\r\nWhy is the alphabet in that order? Is it because of that song?\r\nWhy isn\'t chocolate considered a vegetable, if chocolate comes from cocoa beans, and all beans are vegetable?\r\n', '', 'Let\'s have fun!', 5, 'Ideas', 1, NULL, NULL, NULL, '', 5, 622),
(380, NULL, 1, 'What do they have in common?\r\nWho is much lazier a cat or a sloth?\r\nWho do you like most? And why?\r\n', '', 'Describe what you see', 1, 'Answer the following questions:', 1, 'https://drive.google.com/uc?export=view&id=1UgiXZlHEIxoDnxsqnuvvzcg0wiBhuxtr', NULL, NULL, '', 1, 621),
(384, NULL, 1, 'I lived there 2 years ago.\r\nHe talked to me yesterday.\r\nThey stayed at home last weekend.\r\nShe broke her leg last summer.\r\nMy relatives went to Greece last year.\r\nI saw him the day before yesterday.\r\nHe lost his keys last weekend.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1Z89rJhDPJF7Lz81VL6TCAhT_O-jqeDk5', NULL, NULL, '', 2, 622),
(382, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, ' https://www.youtube.com/watch?v=J5NxNvb0KCU&ab_channel=BuzzFeedVideo', 4, 622),
(383, NULL, 1, 'Who is your favorite historical figure? And why?\r\nWhat was the brightest historical period in your country?\r\nDo you absolutely trust historical books?\r\nDo you think history repeats itself?\r\nDo you like to read historical novels? And why?\r\nWhat is the main purpose of studying world history?\r\nWhat historical event do you want to take part in? And why?\r\nWhat period in history was associated with art? And why?\r\nIs it difficult to be a historian?And why?\r\nHow much do you know about Leonardo da Vinci?\r\n', '', 'Time to talk', 3, '', 1, NULL, NULL, NULL, '', 3, 622),
(385, NULL, 1, 'Do you know the answer to the famous Sphinx riddle?\r\nWhat goes on the four legs in the morning, on two legs at noon, and on three legs in the evening?\r\nWhat is the meaning of this riddle?\r\n', 'Answer\r\nA human. Humans crawl on hands and knees (â€œfour legsâ€) as a body, walk on two legs in mid-life (representing â€œnoonâ€) and use a walking stick or cane (â€œthree legsâ€) in old age.\r\n', 'Describe what you see', 1, 'Ancient history time!', 1, 'https://drive.google.com/uc?export=view&id=1dUT3SbYJBYkOXH_X-2Uy9MlLlCnCTWPl', NULL, NULL, '', 1, 622),
(387, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, ' https://www.youtube.com/watch?v=PF7EpEnglgk&t=105s&ab_channel=REACT', 4, 623),
(386, NULL, 1, 'You decided to send a time capsule to the future (in about 100 years).\r\nWhat 5 modern devices do you put in there? Explain your choice.\r\nWhat will be the most useful or important device in this capsule? Why do you think so?\r\nWhich devices/inventions will people use in 100 years?\r\nWhich devices/inventions were popular 100 years ago?\r\nWhich one thing do you really anticipate to be invented in the future?\r\n', '', 'Let\'s have fun!', 5, 'Compare\r\n', 1, NULL, NULL, NULL, '', 5, 623),
(388, NULL, 1, 'Are you interested in science?\r\nDo you have friends, who work as scientists or invented something?\r\nDid you try to invent or discover anything yourself?\r\nWhat inventions of Nikola Tesla do you know?\r\nWhat is the most harmful invention?\r\nIs scientific and technical progress mostly useful or harmful? Why?\r\nWhat was the most important breaking point in science? Why?\r\nHow did the invention of the Internet change people\'s life?\r\nCan you imagine your life without all the modern inventions?\r\nWhat important things did people invent in the 20th century?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1NzLmXj7_1lT3k3rdVgFfIek7N0XeE7zL', NULL, NULL, '', 3, 623),
(389, NULL, 1, 'I did not forget about your research last time.\r\nHe did not discover a new planet last year.\r\nDid you know about it 2 days ago? â€“ Yes, I did.\r\nThey did not change the world last century.\r\nDid she tell you the news yesterday? â€“ No, she did not.\r\nDid your friend agree with you then? â€“ Yes, he did?\r\nWe did not hear about this last week.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=12-pBk3b4inr8bevW3poRPKoIRzh9aD6I', NULL, NULL, '', 2, 623),
(391, NULL, 1, 'Ok, mate, here are 10 words:\r\nKnow\r\nKeep\r\nResearch\r\nShow\r\nStop\r\nThink\r\nUnderstand\r\nTry\r\nAgree\r\nUse\r\nWatch out! Thatâ€™s a set of the rules:\r\nMake a catchy story using these words.\r\nSay â€œblipâ€ instead of the words above.\r\nMake your profound teacher find them out.\r\n', '', 'Let\'s have fun!', 5, 'Watch out! Thatâ€™s a set of the rules:\r\nMake a catchy story using these words.\r\nSay â€œblipâ€ instead of the words above.\r\nMake your profound teacher find them out.', 1, NULL, NULL, NULL, '', 5, 624),
(390, NULL, 1, 'What is your favourite gadget?\r\nHow often do you use it? And what for?\r\nWhat inventions canâ€™t people live without?\r\n', '', 'Describe what you see', 1, 'Answer the questions below:', 1, NULL, NULL, NULL, '', 1, 623),
(395, NULL, 1, 'Yes, itâ€™s really easy to use. I like it!\r\nNot often. Iâ€™m not obsessed with modern technology.\r\nHonestly, I donâ€™t know. My dad bought it for me.\r\n', '', 'Describe what you see', 1, 'Ask  some questions, using the answers:', 1, 'https://drive.google.com/uc?export=view&id=1gsEK6vqwmBPxJDhSdp85Qc2o1HqG8RjO', NULL, NULL, '', 1, 624),
(392, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/Giiz81_uzK8', 4, 624),
(393, NULL, 1, 'What was the greatest invention of your country?\r\nWho is the most famous inventor of the 21st century?\r\nHow was the world different before the wheel was invented?\r\nWhat modern inventions do you like most? And why?\r\nDo you know anything about the Leonardo Al Zahrawi\'s inventions?\r\nWhat do you want to invent? And why?\r\nAt what age did you get your first mobile phone?\r\nWhat do you think about human cloning?\r\nIs aging the problem we cannot fight?\r\nHow much time can you not use your gadgets?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1I1xle8TumBHnF_ASsoDa9gEQcY0j9JPR', NULL, NULL, '', 3, 624),
(394, NULL, 1, 'I did not forget about your research last time.\r\nHe did not discover a new planet last year.\r\nDid you know about it 2 days ago? â€“ Yes, I did.\r\nThey did not change the world last century.\r\nDid she tell you the news yesterday? â€“ No, she did not.\r\nDid your friend agree with you then? â€“ Yes, he did?\r\nWe did not hear about this last week.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1B4LeFopWUdPzxrQrKvuEOUEV_NGiHKo8', NULL, NULL, '', 2, 624),
(396, NULL, 1, 'What is the weather in the picture?\r\nCan you guess what degree is in the picture?\r\nWhy does the young man wear light clothing?\r\nWhat clothes does the young man wear?\r\nDoes he look determined?\r\nWhat does the young man have in his hands?\r\nWhere will the young man go?\r\nWhat do people think about him?\r\nDo you prefer to look cool or to wear warm clothing?\r\n', '', 'Let\'s have fun!', 5, 'Picture:', 1, NULL, NULL, NULL, '', 5, 625),
(398, NULL, 1, 'Do you often talk about the weather?\r\nIs weather important for you?\r\nDo you like the weather in your region?\r\nDo you often see the rainbow in the sky?\r\nDo you want to live in a warm country during the winter?\r\nWhat is the rainiest season in your country?\r\nDo you watch or read weather forecasts?\r\nWhat is the worst kind of weather for you?\r\nWill it be cold and snowy tomorrow?\r\nWhere is the most ideal weather for you?\r\n', '', 'Time to talk', 3, '', 1, NULL, NULL, NULL, '', 3, 625),
(399, NULL, 1, 'I will be brave next time.\r\nIt will be sunny next week.\r\nWe will not be modest at the next lesson.\r\nWill it be foggy tomorrow? â€“ No, it will not.\r\nHe will not be stubborn next week.\r\nWill it be warm next weekend? â€“ Yes, it will.\r\nMy friend will be mysterious next time.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1GIO9FlF4CQh1_MCdryOKhFsUXUpB5aAq', NULL, NULL, '', 2, 625),
(400, NULL, 1, 'Brave\r\nDetermined\r\nFoggy\r\nCold\r\nmysterious\r\n', '', 'Describe what you see', 1, 'Make a story using words:', 1, 'https://drive.google.com/uc?export=view&id=1oAx_98iw2voy9PwV3dR58F27qEWVemOu', NULL, NULL, '', 1, 625),
(397, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/nPL30dIHoY&', 4, 625),
(401, NULL, 1, 'What does he/she look like?\r\nHow does he/she usually behave?\r\nWhat good or bad character traits does he/she have?\r\nIs he/she a person you can freely rely on?\r\nShould a perfect boyfriend/girlfriend be a perfect as well?\r\nWhat canâ€™t he/she do? And why?\r\nIs he/she a smarter and has a higher IQ than you? And why?\r\nIs he/she a couch potato who is fond of Netflix?\r\nDoes he/she have the same interests as you? And why?\r\n', '', 'Let\'s have fun!', 5, 'Describe a perfect boyfriend/girlfriend and answer the questions below:', 1, 'https://drive.google.com/uc?export=view&id=1XT1Q1l5fCRsED88pWjIegPHVrJgC5MBn', NULL, NULL, '', 5, 626),
(402, NULL, 0, '', '', 'Watch the video', 4, 'Put words to gap', 1, 'https://drive.google.com/uc?export=view&id=1OhDRRZriSd5OnhHCmH1XSUeYaIB8SlPB', NULL, NULL, '', 4, 626),
(403, NULL, 1, 'Did you have an imaginary friend when you were a child?\r\nHow many best friends does a person usually have?\r\nWhat traits of character are important for the best friend? And why?\r\nDo you believe in friendship between a man and a woman,\r\nDo you think that you are a reliable friend?\r\nWhat do you think about people who donâ€™t have any friends?\r\nWhat actions are normal for the best friend?\r\nDoes friendship always mean happy moments?\r\nWhy do people need friends?\r\nWhat associations do you have with a â€œperfect friendâ€?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1nLlfx7D6LP3tLcEMVRBGmKnPiwQg5C7M', NULL, NULL, '', 3, 626),
(404, NULL, 1, 'I am totally right.\r\nShe was really hard-hearted then.\r\nWill they be wiser next time?\r\nHe is really polite all the time?\r\nWe were not so far yesterday.\r\n\r\n\r\nAre you a reliable person?-Yes, I am.\r\nWhy are they so reserved?\r\nShe will not be so chatty next time.\r\nWas it pleasant for them?\r\nHow long will he be honest with her?\r\n\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1yA-2v2rYpHR44oMY1xKhbSvFy5Izp2m_', NULL, NULL, '', 2, 626),
(406, NULL, 1, 'minion\r\nrude\r\nworkaholic\r\ncouch potato\r\nHulk\r\nsaxophone\r\nparty animal\r\nhard-hearted\r\npizza\r\n', '', 'Let\'s have fun!', 5, 'Explain the following in your own words:', 0, '', NULL, NULL, '', 5, 627),
(407, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 627),
(408, NULL, 1, 'How does a friend become a friend?\r\nWhat do best friends feel about each other?\r\nWhat should good friends do for each other? And why?\r\nDoes a perfect friend have to be the same as you or not? And why?\r\nWhat are the advantages of having friends of all ages?\r\nShould we get acquainted with people that are different from ourselves?\r\nWhat is the most valuable thing you have to offer as a friend?\r\nIf you can choose any friend in the world, who will it be?\r\nAre your childhood mates those you have the strongest bonds with?\r\nDo you think it\'s possible to live fully without friends?\r\n \r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 627),
(405, NULL, 1, 'Iâ€™m an arrogant person who doesnâ€™t trust people at all.\r\nAll my best friends are really committed and polite people.\r\nIâ€™m a couch potato who is fond of yummy food and proud of that.\r\n', '', 'Describe what you see', 1, 'Is this about you?', 1, 'https://drive.google.com/uc?export=view&id=1SPw_TApRYA0EeOhYYMtjDsK76etsGMbg', NULL, NULL, '', 1, 626),
(409, NULL, 1, 'I am totally right \r\n- She was really hard-hearted then.\r\n - She will not be so chatty next time. . \r\n-He is really polite all the time. \r\n-  We were not so fair yesterday\r\n\r\n\r\n- Are you a reliable person? - Yes,I am. \r\n- are they so reserved? \r\n- Will they be wiser flat time? \r\n- Was it pleasant for them? \r\n- How long will he be honest with her? -\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 627),
(411, NULL, 1, 'smartphone\r\nlaptop\r\nfridge\r\ntablet\r\nair conditioner\r\nelectric kettle\r\nmicrowave\r\nhairdryer\r\nfan\r\ne-cigarettes\r\n\r\n\r\nWhich of these gadgets do you use most often? Why?\r\nAnd which of them do you rarely use (or maybe ever never)? Why?\r\nChoose one gadget from the list which you consider the most crucial for you. Explain your choice.\r\n', '', 'Let\'s have fun!', 5, 'Good or bad?\r\nHere\'s the list of some modern gadgets and appliances. What pros and cons do they have? Try to think of at least 3 advantages and 3 disadvantages for each Item.', 0, '', NULL, NULL, '', 5, 628),
(410, NULL, 1, 'In the cookie of life friends are the chocolate chips:\r\nDo you agree with it?\r\nDo you like cookies with chocolate chips?\r\nNow replace the cookies&chips with your favorite food and make your own quote: E.g. In the pizza of life friends are the cheese.\r\n', '', 'Describe what you see', 1, 'Read the following phrase and answer questions below:', 1, 'https://drive.google.com/uc?export=view&id=18TPfT7PW59sqA573IlfD17Ewc6R5O28F', NULL, NULL, '', 1, 627),
(412, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 628),
(413, NULL, 1, 'What\'s your favorite home gadget?\r\nDo you have an addiction to modern devices?\r\nHow many hours do you spend in front of your computer?\r\nWhat are the advantages & disadvantages of modern TV-sets?\r\nWhat\'s the main purpose of using new appliances nowadays?\r\nWhat are the most popular gadgets among teenagers nowadays? And why\r\nwhat do you think about people who don\'t watch television?\r\nDo you have PlayStation or Xbox? Which console is better?\r\nDo you have any favorite applications on your smartphone?\r\nWhat do you think is one device the world needs the most these days?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 628),
(415, NULL, 1, 'My alarm Clock rings at ...\r\nI would like to have a lie-in but ...\r\nThen I take a shower and ...\r\nI switch on an electric kettle to ...\r\nMy favorite breakfast is ...\r\n', '', 'Describe what you see', 1, 'Finish the sentences:', 0, '', NULL, NULL, '', 1, 628),
(414, NULL, 1, '-I have a modern freezer. \r\n-He had a heater yesterday. \r\n-They will have this application soon.\r\n-I have a good webcam.\r\n-He does not have any modern gadgets.\r\n-Did they have a torch last time? \r\n-Will we have many Afferent devices soon?\r\n- Do you have any special equipment? \r\n-Did Sam have a heater yesterday? Yes, he did. \r\n- When will you have a new iron? \r\n\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 628),
(416, NULL, 1, 'Can a man go eight days without sleep?\r\nWhat is the best thing to put on a delicious cake?\r\nCan you lift an elephant with one hand?\r\n Is it legal for a man to marry his widow\'s sister?\r\nWhat goes up and never comes down?\r\nWhat is the difference between here and there?\r\nHow many months have 28-29 days?\r\nWhat are the two animals that live in a polar region?\r\nLamp dad has 5 sons named Ten, Twenty, Thirty, Forty. What\'s the name of the fifth?\r\nIf you throw a red stone into the blue sea what will it become?\r\n', '', 'Let\'s have fun!', 5, 'You have only 5 minutes. Try to answer as many questions as you can. Ready, steady, go!', 0, '', NULL, NULL, '', 5, 629),
(418, NULL, 1, 'Do you think modern technology affects our health?\r\nDo you know any tips that help to spend less time in front of PC?\r\nWhat do old people think of modern technology?\r\nWhat things will you never replace with the up-to-date technology?\r\nWhat are the benefits of online communication?\r\nDo you believe that scientists will invent Al (Artificial Intelligence) that will replace teachers soon?\r\nWhat do you think about the concept of designer babies (genetically modified embryos)?\r\nDo you want to try virtual reality glasses?\r\nWhat problem should scientists tackle in the first place?\r\nWill robots replace human beings in the Mute?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 629),
(420, NULL, 1, 'What will you choose: a book or an e.book? Why?\r\nWhat is more convenient? And why?\r\nWhat are the pros and cons of an e-book?\r\n', '', 'Describe what you see', 1, 'Make your choice:', 0, '', NULL, NULL, '', 1, 629),
(419, NULL, 1, '- I have a modern freezer. \r\n-He had a heater yesterday. \r\n-They will have this application soon.\r\n- I have a good webcam.\r\n-  He does not have any modern gadgets.\r\n\r\n\r\n-I have a modern freezer. \r\n- He had a heater yesterday. \r\n- They will have this application soon-\r\n- I have a good webcam. \r\n- He does not have any modern gadgets.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 629),
(417, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 629),
(421, NULL, 1, 'what pictures represent you well? And why?\r\nwhat pictures represent your best friend? And why?\r\nWhy do people chill out on holidays? What\'s the purpose?\r\nDo you think the girl likes the flowers? Why?\r\nDo you go to the gym on vacation? Why?\r\nWhich picture shows a lovey-dovey date? Do you like it?\r\nDo you think holidays must be always humorous?\r\nIs it better to spend time with a family, friends or alone?\r\nIs it ok to sleep with your dog?\r\nwhat are the ideas? What those two with balls think about?\r\nWhich picture shows a holiday where you can drink alcohol and eat as much as possible?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 630),
(422, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 630),
(423, NULL, 1, ' 1. What holidays did you celebrate when you were a kid?\r\n 2. What do you usually do on holidays?\r\n 3. What do you think about people who don\'t celebrate their birthdays?\r\n 4. What is the traditional food on Easter Day in your country?\r\n 5. Why do the youth take part in Halloween celebration worldwide? \r\n 6. What traditions of St. Valentine\'s Day do you know? \r\n 7. On what occasions can you and your family go to church?\r\n 8. What American/British customs are you totally interested in?\r\n 9. How do people all over the world celebrate Christmas?\r\n 10.Is hospitality one of the best traits of your nation?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 630),
(424, NULL, 1, '\r\n He felt bad yesterday. \r\nThey will bake a cake tomorrow. refuse his offer all the time.\r\n He orders the tickets by phone as I won\'t hide all the time.\r\n He  didn\'t order pizza yesterday. \r\n\r\nWhen did she recall it yesterday exactly? \r\nWhy does he seek problems all the time? \r\nHow long will you hide?\r\nDid they support you then?\r\nYes, they did Why do you annoy me all the time? -\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 630),
(426, NULL, 1, 'The average person produces enough saliva (watery liquid in the mouth) in their lifetime to fill up two swimming pools.\r\nExcept for identical twins, every person on earth has a unique smell.\r\nThere are more fake flamingos in the world than real ones.\r\nWomen always apply mascara (eyelashes cosmetic) with an open mouth.\r\nThe elephant is the only mammal that can\'t jump.\r\nA bride is lucky if she wears old shoes.\r\nYou canâ€™t tickle  yourself\r\nA banana is a berry', '', 'Let\'s have fun!', 5, 'Prove the following facts:', 0, '', NULL, NULL, '', 5, 632),
(425, NULL, 1, 'â€¢ How can you drop a raw egg onto a concrete floor without cracking it?', '', 'Describe what you see', 1, 'Answer the question below:', 0, '', NULL, NULL, '', 1, 630),
(429, NULL, 1, ' I am still replacing these boxes with new ones.\r\n You are not staying up at this moment. \r\n They are leading a meeting now. \r\n Is it happening now? - Yes, it is.\r\n Are you still creating that model? - I am not.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 632),
(427, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 632),
(428, NULL, 1, 'What do you like most about special occasions?\r\nDo you like to organize surprise parties for your family members or friends?\r\nWhat is the perfect party like?\r\nWhat do you usually eat and drink at the parties?\r\nWhat do you think is the most important thing in a celebration?\r\nWhat was the last event you celebrated?\r\nAre you attending any birthday-parties this month?\r\nDo you exchange presents with anybody on Easter Day?\r\nAre you fond of decorating the living room for Christmas Eve?\r\nWhat is the main purpose of merrymaking?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 632),
(431, NULL, 1, 'On which occasions do people buy a bunch of flowers?\r\nDo you think women are fond of red roses?\r\nwhat was the most romantic date in your life?\r\nDid you really like it? Explain why?\r\n', '', 'Let\'s have fun!', 5, 'Find six differences between these panels.\r\nAnswer the questions below:', 0, '', NULL, NULL, '', 5, 633),
(430, NULL, 1, 'I\'m tall when I\'m young,\r\nI\'m short when I\'m old,\r\nand every Halloween I stand up Inside Jack-O-Lanterns. What am I?\r\n', '', 'Describe what you see', 1, 'Solve the riddle', 0, '', NULL, NULL, '', 1, 632),
(435, NULL, 1, 'We are having a baby shower party.\r\nIts a party for the future mother.\r\nIts called so because the mother is showered with gifts.\r\nYes, its a very popular custom in the USA\r\nI feel extremely happy!\r\n\r\n', '', 'Describe what you see', 1, 'Make up questions to the following answers:', 0, '', NULL, NULL, '', 1, 633),
(432, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 633),
(433, NULL, 1, 'On what occasions do people in your country eat a lot of food?\r\nAre you preparing a costume for a Halloween party this year?\r\nHow do you feel about attending crowded festivals?\r\nWhat funny and cool party games do you know?\r\nAre you going to play twister some day?\r\nDo you know any tips on how to spend less money on celebration?\r\nWhat do you think about people who celebrate their pets\' birthday?\r\nWhy are so many people fond of pancakes?\r\nAre there any holidays that you really hate?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 633),
(434, NULL, 1, '  I am still rep/acing these boxes with new ones.\r\n You are not staying up at this moment. \r\n They are leading a meeting now. \r\n Is it happening now? - Yes, it is.\r\n Are you still creating that model? - I am not.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 633),
(436, NULL, 1, 'What do you see in the picture? Describe it:\r\nWho are these women?\r\nWhat are they doing?\r\nWhy do you think they are doing it?\r\nHow are they dressed?\r\nWhere does the action take place?\r\nWhat objects do you see there?\r\nDo you use Instagram? If so, how often do you post photos there?\r\nDo most people post photos reflecting their real life or do they try to paint a rosy picture of it? Explain your opinion.\r\nDo you know any hacks on how to make your snapshots look better?\r\nWhy Is it important for us to show other people that we live a happy and fulfilled Iife?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 634),
(438, NULL, 1, 'What\'s the main purpose of social networks?\r\nDo you suffer from social networks obsession?\r\nHow much time per day do you usually spend on social networks?\r\nCan you find a good friend online?\r\nWhat social network interface do you like the most? And why?\r\nWhat emojis are getting popular among young people nowadays?\r\nWhat are your favorite sites besides social networks? And why?\r\nDo you have a bin? What\'s it mainly about?\r\nHow often do you update your accounts on Twitter, Instagram, Facebook ea?\r\nDo you use long and difficult or short and simple passwords on social networks? And why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 634),
(437, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 634),
(439, NULL, 1, 'I usually download tracks from this site.\r\nI am downloading one track right now. \r\nThe app deletes everything automatically. \r\nToday he is deleting everything manually. The app is out of order. -\r\nI never add photos to my account. \r\nI am adding some new photos to my account this week. .Watch them! \r\nI hear you well now. Don\'t shout please! \r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 634),
(440, NULL, 1, 'delete\r\ndownload\r\nlog in\r\ninbox\r\napprove\r\n', '', 'Describe what you see', 1, 'Give an opposite to the following words:', 0, '', NULL, NULL, '', 1, 634),
(441, NULL, 1, 'What is the most popular kind of an online self-portrait in the world?\r\nWhat would you choose: a duck face or a normal portrait? Why?\r\nWhy is a duck face still so utterly popular among people?\r\nDo you approve of this trend? Explain why?\r\nDo your friends have duck face photos?\r\nDo you know the origin of the word \"selfie\"?\r\nMen are trolling and parodying women on Instagram. Why?\r\nWhat selfie social networks do you know? Do you use them?\r\n', '', 'Let\'s have fun!', 5, 'Answer the following questions:', 0, '', NULL, NULL, '', 5, 635),
(442, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 635),
(443, NULL, 1, ' How often do your friends take selfies?\r\nDo you know any tips on how to restore your personal data?\r\nHow many people are signing in on Twitter at the moment? Why?\r\nWhy is TikTok getting more and more popular now?\r\nWhat\'s the main theme of pits on Pinterest? And why?\r\nHow different was our life without social networks?\r\nWhy gossiping and bullying are occurring more often online now?\r\nWhat is better Google Search or Yandex Search? Why?\r\nWhat options and possibilities does lnstagram give us?\r\nWhy are many celebrities getting obsessed with Snapchat?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 635),
(445, NULL, 1, '-Give an example of Present Simple and Present Continuous\r\n-Explain how they are formed\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 635),
(446, NULL, 1, 'She/he\r\nHis/her name\r\nHis/her hobby\r\nHer/his temper\r\nHer/hisâ€¦skills useful for the space camping\r\nWe are going toâ€¦with her/him in the space camping\r\n', '', 'Let\'s have fun!', 5, 'Talk about a person who are going to take with you to the space camping:', 0, '', NULL, NULL, '', 5, 636),
(444, NULL, 1, 'I usually download tracks from this site.\r\nI am downloading one track right now. \r\nThe app deletes everything automatically. \r\nToday he is deleting everything manually. The app is out of order. -\r\nI never add photos to my account. \r\nI am adding some new photos to my account this week. .Watch them! \r\nI hear you well now. Don\'t shout please! ', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 635),
(449, NULL, 1, 'I am going to set off in an hour.\r\nShe is going to knit tonight.\r\nWe are not going to discuss it anymore.\r\nAre you going to attend his classes? - Yes, I am.\r\nWhen is he going to rent a new flat?\r\nEverybody is going to look for him.\r\nThey are not going to discuss this problem with you.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 636),
(447, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 636),
(448, NULL, 1, 'Are you looking forward to getting back to work after your days off?\r\nWhat would your ideal day off be like?\r\nDo you prefer indoor or outdoor activities on weekends?\r\nWhat was your most interesting weekend?\r\nHow many days off would you prefer to have?\r\nDo you like the idea of camping/travelling on weekends?\r\nHow do you spend long weekends?\r\nDo you usually plan your weekends?\r\nIs it difficult for you to get back to work after weekends?\r\nHow will you spend your weekends after you retire?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 636),
(451, NULL, 1, 'Who are you going to rent an apartment with and why?\r\nWho do you think you will get along well with? Why?\r\nWho do you think you won\'t get along well with? Why?\r\nWho is going to be the most boring flatmate? Why?\r\nWho is going to be the most outgoing flatmate? Why?\r\nWhat are you going to do as flatmates in the new country?\r\nA List of People:\r\nNeo (\"The Matrix\')\r\nMr. Smith rhe Matrix\')\r\nBatman\r\nSuperman\r\nHermione Granger\r\nDraco Malfoy\r\nJack the sparrow (â€œPirates of the Caribbeanâ€)\r\nThe Minions\r\nLegolas (â€œThe Lord of the Ringsâ€)\r\nWednesday Addams (â€œThe Family Addamsâ€)\r\n', '', 'Let\'s have fun!', 5, 'You are going to set off on your journey and to stay several weeks in a new country.', 0, '', NULL, NULL, '', 5, 637),
(450, NULL, 1, 'I am going to shoot waves.\r\nYes, people will be convinced that my photography is art.\r\nIt  is dangerous\r\nI am not going to shoot great pictures without diving.\r\nNo, Iâ€™m not going to take photos indoors in the near future.\r\n', '', 'Describe what you see', 1, 'Ask each other questions using answers:', 0, '', NULL, NULL, '', 1, 636),
(453, NULL, 1, 'How do you spend your weekends in winter?\r\nHow do you spend your working days in summer?\r\nHow do you spend your vacation?\r\nHow do you spend your New Year or Christmas long weekend?\r\nWhat outdoor activities are the best for days-off?\r\nWhat indoor activities are the best for days-off?\r\nWhat are you going to do on your vacation?\r\nAre you going to set off on a solo journey one day?\r\nWhat is the most extreme activity that you are going to do on some weekend?\r\nAre you happy about having a two-day weekend?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 637),
(452, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 637),
(455, NULL, 1, 'Tell about the upcoming weekend.\r\nAre you planning something special for this weekend?\r\nAre you going to spend it indoors or outdoors?\r\nWhat are you going to do?\r\nWho are you going to spend your weekend with?\r\n\r\n', '', 'Describe what you see', 1, 'Tell:', 0, '', NULL, NULL, '', 1, 637),
(457, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/3PyrgGTFp0E', 4, 638),
(456, NULL, 1, '-	Good-natured\r\n-	Fun-loving\r\n-	Apprehensive\r\n-	Classy\r\n-	Homesick\r\n-	Miraculous\r\n-	Irreversible\r\n-	Immortal\r\n-	Outgoing\r\n-	Cold fish\r\n', '', 'Let\'s have fun!', 5, 'Make a story about a guy who went to Mars and spent 10 years. Try to provide as many details as you can using the following words.', 0, '', NULL, NULL, '', 5, 638),
(454, NULL, 1, ' I am going to set off in an hour.\r\nShe is going to knit tonight.\r\nWe are not going to discuss it anymore.\r\nAre you going to attend his classes? - Yes, I am.\r\nWhen is he going to rent a new flat?\r\nEverybody is going to look for him.\r\nThey are not going to discuss this problem with you.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 637),
(458, NULL, 1, '1.	Do you have any hobbies? Describe them, please.\r\n2.	How often do you visit other countries?\r\n3.	What are your favorite ones?\r\n4.	Who do you love traveling with?\r\nS. What do you usually do on vacation?\r\n6.	Do you travel to hot countries in winter and cold ones in summer?\r\n7.	Where is your dream city or place located?\r\n8.	Is there a place you would never go to? Why?\r\n9.	Name three most popular vacation destinations for the people of your country.\r\n10.	Have you had your vacation this year yet? If not, what are the plans?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1t3sfdXIJ5jvpSQpHJKOA25gisRiKDSnW', NULL, NULL, '', 3, 638),
(460, NULL, 1, '-	What do you like more: a cinema or theatre? Why?\r\n-	What was the last movie that you saw? Did you like it?\r\n-	When did you go to the theatre last time? what kind of performance was that?\r\n-	Was it good or bad? Why?\r\n', '', 'Describe what you see', 1, '', 1, NULL, NULL, NULL, '', 1, 638),
(459, NULL, 1, '-	He has been limping for two weeks already.\r\n-	I was working at the same moment yesterday and I am working now.\r\n-	I will be working tomorrow at the same time.\r\n-	I will have finished my work by midday. I will be really happy then!\r\n-	I will have been working for 5 hours by midday.\r\n-	I was tired yesterday. I had been doing shopping for the whole day.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1i1nJptP1bMmc9i5FJ-REgjqBMAB9JeEZ', NULL, NULL, '', 2, 638),
(461, NULL, 1, 'â€¢	Did that song make you cry?\r\nâ€¢	Do you know the lyrics? Can you sing it?\r\nâ€¢	Have you ever been emotionally drained after singing?\r\nâ€¢	Could you describe the main idea of the song shortly?\r\nâ€¢	Is this song the most inspiring and powerful to you? Why?\r\nâ€¢	Do you consider yourself a melomaniac? What are your favorite music genres?\r\nâ€¢	What do you think are the advantages and disadvantages of music festivals?\r\n', '', 'Let\'s have fun!', 5, 'Tell about a perfect song you\'ve ever listened to in your life.', 1, 'https://drive.google.com/uc?export=view&id=1HVx_4mIVEjzkXJFW3dP4tvV3qb_1OH5J', NULL, NULL, '', 5, 639),
(462, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/M9i2HAE-ZSw', 4, 639);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(463, NULL, 1, '1.	Do you know any tips on how to produce a good impression on your prospective employer?\r\n2.	Have you ever met someone who you hated right away even though you didn\'t know them?\r\n3.	Do you prefer forming first impressions based on what people wear?\r\n4.	Have you ever tried to pretend to be a good-natured person but completely messed it up? S. Have you ever been love-struck at first sight? What did you feel then?\r\n6.	Do you agree that sometimes flattering remarks can solve some problems pertaining to relationships?\r\n7.	What was the first creepy-crawly movie that made you feel terrified? What was it about?\r\n8.	What do you think is better to be an outgoing or laid-back person? And why?\r\n9.	What are the advantages and disadvantages of being a hypocrite? And why?\r\n10.	When and where did you meet most of your good friends for the first time?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1W4nUqQ7MsVAGwl6pvhTKNijib3UHAaiE', NULL, NULL, '', 3, 639),
(464, NULL, 1, '-	 He has been limping for two weeks already.\r\n-	I was working at the same moment yesterday and I am working now.\r\n-	I will be working tomorrow at the same time.\r\n-	I will have finished my work by midday. I will be really happy then!\r\n-	I will have been working for 5 hours by midday.\r\n-	I was tired yesterday. I had been doing shopping for the whole day.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1VBfkbcpr0dD7kj_hXCeFhmXZV5D28PPL', NULL, NULL, '', 2, 639),
(465, NULL, 1, 'Have you heard this quote by Andrew Grant, â€œyou never get a second chance to make a first impressionâ€?\r\nWhat do you think?\r\nDoes the first impression really matter?\r\nDo you trust your first impression?\r\n', '', 'Describe what you see', 1, 'Answer the following questions?', 1, 'https://drive.google.com/uc?export=view&id=1tmMkqKoO1YrLGj5O1cipppAYr4g9tf2g', NULL, NULL, '', 1, 639),
(468, NULL, 1, '1.	Do you consider yourself a risk-taker? What are the pros and cons of that?\r\n2.	Are you aware of any useful hacks on how to be less Insecure?\r\n3.	What drives you crazy more: cowards or fibbers (liars)? And why?\r\n4.	Do you agree that night owls tend to be more creative?\r\nS. What would our world look like if all human beings were total wimps?\r\n6.	What kind of people can easily make you upset to tears?\r\n7.	Do you agree: emotions are the slaves to your thoughts, and you\'re the slave to emotions?\r\n8.	What was the most useful book that taught you to look on the bright side?\r\n9.	Do bright flowers and plants affect our mood and feelings powerfully? And why?\r\n10.	Are Individuals who make others hot under the collar simply not satisfied with their own life?\r\n', '', 'Time to talk', 3, '', 1, NULL, NULL, NULL, '', 3, 640),
(466, NULL, 1, 'The student looks at the picture to choose some object and announce it by saying, â€œI spy with my little eye (something)â€¦ â€œAnd describes any feature (a color, shape or anything else) of the object. The teacher then asks any â€œyesâ€ or â€œnoâ€ question. Once the teacher guesses what the object is, the roles change. Have fun!\r\n', '', 'Let\'s have fun!', 5, 'I spy with my little eyeâ€¦', 0, '', NULL, NULL, '', 5, 640),
(467, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/eK0NzsGRceg', 4, 640),
(469, NULL, 1, '-	 He has been limping for two weeks already.\r\n-	I was working at the same moment yesterday and I am working now.\r\n-	I will be working tomorrow at the same time.\r\n-	I will have finished my work by midday. I will be really happy then!\r\n-	I will have been working for 5 hours by midday.\r\n-	I was tired yesterday. I had been doing shopping for the whole day.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1S-cRVfG6hJh1NMKqCR4QA24p78GjcfBC', NULL, NULL, '', 2, 640),
(470, NULL, 1, '-	A wife complains to her husband: â€œJust look at that couple down the road, how lovely they are. He keeps holding her hand, kissing her, holding the door for her, why canâ€™t you do the sameâ€? \r\n-	The husband: â€œAre you mad?! I barely know that woman!â€\r\n', '', 'Describe what you see', 1, 'Itâ€™s difficult to be lovey-dovey, isnâ€™t it?', 1, 'https://drive.google.com/uc?export=view&id=1s7e88wCYZSLNOKjuM0-Ly3Eb6rVwb_oM', NULL, NULL, '', 1, 640),
(471, NULL, 1, 'â€¢	Do you agree that if you want to be fashionable you got to Nye a tiny dog?\r\nâ€¢	What could you say about the fashion today?\r\nâ€¢	Why do you think some people are so addicted to fashion?\r\nâ€¢	Do you think you could create a new brand of stylish clothes?\r\nâ€¢	Can you say that you always wear what you want?\r\nâ€¢	Can you say 5 words that relate to fashion the most?\r\nâ€¢	What do you think are the benefits of being fashionable?\r\n', '', 'Let\'s have fun!', 5, 'Life\'s too short to wear boring clothes', 1, 'https://drive.google.com/uc?export=view&id=1QQc-E9PYXf-7NXeYvF80cMWftRgF58js', NULL, NULL, '', 5, 641),
(475, NULL, 1, '-	I reckon that bullyingâ€¦\r\n-	We all can have an influenceâ€¦\r\n-	You should alwaysâ€¦\r\n', '', 'Describe what you see', 1, 'Finish the following statements:', 1, 'https://drive.google.com/uc?export=view&id=1h2Z1QqULxqQJBeVpiae5ZtGFKG29I87O', NULL, NULL, '', 1, 641),
(472, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/FYVvE4tr2BI', 4, 641),
(473, NULL, 1, '1.	Have your nearest and dearest or you ever been bullied at school? What for?\r\n2.	What would you feel if your colleagues gossiped about you instead of coming out flatfooted?\r\n3.	Are the hottest places in hell reserved for those who in time of crisis preserve their neutrality?\r\n4.	Do you get worked up when you have to start up a conversation with people you don\'t know? S. Why are the most widespread modern ailments social apathy and social anxiety?\r\n6.	Do you like being in the limelight?\r\n7.	Have you ever accused anybody of doing something without any evidence?\r\n8.	What piece of advice could you give a person who\'s going to appeal to the public?\r\n9.	What character traits should you have to be an eloquent speaker? And why?\r\n10.	Are you aware of tips on how to object to a proposal peacefully?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1eeA7KWDOugqL_eqHPU26LJiBKQ2pcQAW', NULL, NULL, '', 3, 641),
(474, NULL, 1, ' The words were said several minute ago.\r\nTheir projects arenâ€™t usually approved.\r\nWhen will it be done?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1RzluDPPJUeFS4ps1SLM1qq6I5IZa5j8I', NULL, NULL, '', 2, 641),
(476, NULL, 1, '1. What is the color of a mirror?\r\n 2. How much of our brain do we use?\r\n 3. Where do permanently deleted files go?\r\n 4. What is the resolution of the human eye? \r\n5. Does sunlight weigh anything?\r\n 6. Where is the center of the universe?\r\n 7. Which came first: the egg or the chicken?\r\n 8. What if everyone on Earth jumped at once?\r\n 9. Can you fire a gun in space? \r\n10. How much money is there in the world? \r\n11. What If the Earth stopped rotating?\r\n 12. Is time travel actually possible?\r\n', '', 'Let\'s have fun!', 5, 'Mastermind \r\nLet\'s figure out how smart you are. You got 5 minutes to answer as many questions as you can. Let\'s go! ', 1, 'https://drive.google.com/uc?export=view&id=1HxgR5LtrCcze2tuGtnx406LS2a1Uk7YL', NULL, NULL, '', 5, 642),
(477, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/gCfzeONu3Mo', 4, 642),
(478, NULL, 1, ' Have you ever pretended to be a better person than you really are? Why?\r\nIs it possible to believe those people whose plans are reconsidered every day?\r\nIt\'s believed that yelling at somebody isn\'t a good idea that can lead to conciliation. So why do people do that?\r\nWould you give up hope, if there was a desperate situation? And why?\r\nWhat can help you to learn the main rules of communication: books or socializing?\r\nDo you consider that yelling Is a form of communication or an emotional boom? Why?\r\nWhat makes people be engrossed in dissemination of lies and slander?\r\nWhat are the advantages and disadvantages of being interviewed online?\r\nWhen should we lend an attentive ear to our mind or heart? And why?\r\nDo you agree that due to the rapid speed of technology development we communicate less?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1qFGHrAxfrVarEvtnF8waLiK19hxY_ShF', NULL, NULL, '', 3, 642),
(481, NULL, 0, '', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=1LEj8eXkFjwbsvWDg4slkUqxeIvLE2_Fl', NULL, NULL, '', 5, 643),
(479, NULL, 1, ' The words were said several minute ago.\r\nTheir projects arenâ€™t usually approved.\r\nWhen will it be done?\r\n\r\n\r\n\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1RzluDPPJUeFS4ps1SLM1qq6I5IZa5j8I', NULL, NULL, '', 2, 642),
(480, NULL, 1, 'What do you like more: pea or corn? And why?\r\nWhat does the idiom â€œlike two peas in a podâ€ mean?\r\nWhat yummy dishes could you cook with corn?\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1ezo44cjLRdHHZpyn_2eKFS7jI7FqkfVY', NULL, NULL, '', 1, 642),
(483, NULL, 1, 'Do you believe that our dreams have a special meaning? Why?\r\nHas something that you dreamt of ever come true?\r\nDo you agree that our dreams can help to foretell our further life? Why?\r\nHave you ever woken up to find out you are still in your dream?\r\nCould dreams be an indispensable part of our well-being?\r\nWhat would you advise to make a cherished dream come true?\r\nDo you agree that a dream doesn\'t become reality through magic and it takes hard work?\r\nDo you think that all dreamers are people who look at this life through rose-tinted glasses?\r\nDo you consider yourself a daydreamer or a hardheaded realist? Why?\r\nDo you think animals dream?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1b8-YxaNs3YDbb9LoNLTMSc4g0cVLH1Sv', NULL, NULL, '', 3, 643),
(482, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/sI8NsYIyQ2A', 4, 643),
(484, NULL, 1, 'They are totally dirty now. They have been cleaning their garage today.\r\nPolly has a running nose. She has been walking outside with no hat in cold weather.\r\nI have lost my last hope today.\r\n\r\n\r\n\r\n\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1z3XOMa_JmZZgX9Te9gBmp95vnvnVMLZM', NULL, NULL, '', 2, 643),
(486, NULL, 0, '', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=16NH6Ow7uEBPRhalG1afsHwQypDXfyjRr', NULL, NULL, '', 5, 644),
(487, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/2W85Dwxx218', 4, 644),
(485, NULL, 1, 'Use the following sentences as the first and the last one:\r\nOne day I felt homesick and saddled up my giant sail to ride home.\r\nAnd then we all had an awesome party on the other side of the Mooncake.\r\n', '', 'Describe what you see', 1, 'Use your imagination to the fullest and make up a funny story about a weird dream you could have one night.', 1, 'https://drive.google.com/uc?export=view&id=1vbnZTEt40g1Pa1k5AGMYJPB53Ph_J4IY', NULL, NULL, '', 1, 643),
(488, NULL, 1, 'How could you explain: \"The biggest adventure you can take is to live the life of your dreams\"?\r\nDo you have any idea why some people remember their dreams and others don\'t?\r\nDo you agree that we live in a world of illusion and that it is a great task in life to find reality?\r\nWhat did you use to dream about when you were a kid?\r\nCan the same recurring dreams be considered prophetic? Why?\r\nWhat associations do you have when you hear the phrase \"sweet dreams\'?\r\nDoes the future belong to those who believe in the beauty of their dreams?\r\nCan all our dreams come true if we have the courage to pursue them?\r\nWhich things make any dream Impossible to achieve?\r\nHave you ever had a nightmare? What was it about?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1gAwyoay0ECW5ymCkl6e63kUyOX_S5vKU', NULL, NULL, '', 3, 644),
(490, NULL, 1, 'Have you ever had a dream that foretold the future?\r\nDo you usually have different dreams or they are mostly similar?\r\nDo you tell your friends or family about your dreams? \r\n', '', 'Describe what you see', 1, 'Answer the following yes or no questions:', 1, 'https://drive.google.com/uc?export=view&id=1-3H1trbseOEthA3xsKawdwKxu1wsrt99', NULL, NULL, '', 1, 644),
(489, NULL, 1, ' They are totally dirty now. They have been cleaning their garage today.\r\nPolly has a running nose. She has been walking outside with no hat in cold weather.\r\nI have lost my last hope today.\r\n\r\n\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1z3XOMa_JmZZgX9Te9gBmp95vnvnVMLZM', NULL, NULL, '', 2, 644),
(491, NULL, 1, 'Human thighbones are stronger than concrete.\r\nEarth is the only planet that is not named after a god.\r\nMost dust particles in your house are made from dead skin.\r\nBlue-eyed people tend to have the highest tolerance for alcohol.\r\nIce cream is the only thing on our planet you care about melting.\r\nPirates wore earrings because they believed it improved their eyesight\r\nIt is considered good luck In Japan when a sumo wrestler makes your baby cry.\r\nDonald Duck comics were banned from Finland because he doesn\'t wear pants.\r\n\r\n\r\n', 'All of the answers are true (yes, even about ice cream).', 'Let\'s have fun!', 5, 'Which of the following facts are true?', 1, 'https://drive.google.com/uc?export=view&id=1wvLoJdzPbdK7PTj2L12MtmZc5XrmxNkG', NULL, NULL, '', 5, 645),
(492, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/GibiNy4d4gc', 4, 645),
(493, NULL, 1, ' What comes to your mind when you hear the word \"life\"? And why?\r\nDo you reckon there is a life after death? Is this life better? And why?\r\nWhat are the advantages and disadvantages of immortality?\r\nDo you agree \"life is like a box of chocolates and you never know what you\'re going to get\"? S. If you had a chance would you like to live the same life all over again? What for?\r\nWhat five pros and cons of being an adult could you name? And why?\r\nWhat would you choose solitude and Immortality or passion and mortality? Why? 13. If there was a life manual what information would It contain? And why?\r\nWhat in your opinion does life taste, smell, feel, look and sound like?\r\nWhat life stage is full of vivid memories: childhood, youth or maturity? And why?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1x8mlhq8K8CwG9ZSn_3PLHLg0QYW2ZcY7', NULL, NULL, '', 3, 645),
(494, NULL, 1, 'I explain grammar rules every day. And I have already explained them to hundreds of students.\r\nI am explaining some grammar to you at this very moment. I have been doing it for an hour already.\r\nSome grammar is being explained to you now. Be attentive, please!\r\nThey carefully execute all their plans. And I never execute what is planned, unfortunately.\r\nI have been working since morning! And I have already explained a lot of rule to you.\r\nAnd you? Have you learned any new grammar material recently?\r\nSo, a lot of rules have already been explained since that time.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1688MmPSBrFRCDAzC5Gza4lPmV8tcoJX_', NULL, NULL, '', 2, 645),
(497, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/5c6C3rHOdf8', 4, 646),
(495, NULL, 1, 'Everyone wants more of it to feel special, yet the more you have of it the less special you feel.\r\n', '', 'Describe what you see', 1, 'Answer this riddle and you will find the answer to life', 1, 'https://drive.google.com/uc?export=view&id=1IqQH9RLMMIwP7T12jxKtu-BUVMdBmbbv', NULL, NULL, '', 1, 645),
(496, NULL, 1, 'Answer the questions below:\r\nWhat life stages do you see in the pictures above?\r\nWhat games did you use to play when you were a kid?\r\nWhat person in the picture is upset and disappointed? Why?\r\nAre photos the best way to save bright moments in your memory?\r\n\r\n', 'Answers: bird, cap, running girl, statue, bag, glasses, tree, cup, paper in the pocket, dogâ€™s leash', 'Let\'s have fun!', 5, 'Find 10 differences in these 2 pictures.', 1, 'https://drive.google.com/uc?export=view&id=1g1CgEz1gIHPsw9e67aEK5URxChXi-Sxs', NULL, NULL, '', 5, 646),
(498, NULL, 1, '1s it difficult to suppress the feelings of envy, gluttony, lust, anger, greed, pride or sloth?\r\nThe greatest loss in life isn\'t death but what dies inside us while we live. Do you agree?\r\nIf you could choose to live someone else\'s life, whose would It be and why?\r\nHave you ever felt like you have already wasted all your life? Why? S. What do you guess is the biggest goal of our life? Why?\r\nDo you know any tips on how to enjoy life fully and completely?\r\nWhat would you do if you had only 24 hours to live? And why?\r\n Is painless and quiet life the only life that is worth living? Why?\r\nDo you agree that there is only one happiness in this life â€” to love and be loved?\r\nDo you think that we should do all our best, so that we can\'t blame ourselves for anything?\r\n \r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1p1VgtyiulYa-i46NFXK3ohp0rDV6XtUB', NULL, NULL, '', 3, 646),
(499, NULL, 1, ' I explain grammar rules every day. And I have already explained them to hundreds of students.\r\nI am explaining some grammar to you at this very moment. I have been doing it for an hour already.\r\nSome grammar is being explained to you now. Be attentive, please!\r\nThey carefully execute all their plans. And I never execute what is planned, unfortunately.\r\nI have been working since morning! And I have already explained a lot of rule to you.\r\nAnd you? Have you learned any new grammar material recently?\r\nSo, a lot of rules have already been explained since that time.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1688MmPSBrFRCDAzC5Gza4lPmV8tcoJX_', NULL, NULL, '', 2, 646),
(500, NULL, 1, 'Name five adjectives that describe your granny perfectly?\r\nWhat are her favourite hobbies or occupations? And why?\r\nWhat role does this person play in your life?\r\n', '', 'Describe what you see', 1, 'Talk about your grandma.', 1, 'https://drive.google.com/uc?export=view&id=1cCumcvkvlRFGnYQqBO8uc9rsSvfD1nyz', NULL, NULL, '', 1, 646),
(502, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/mk48xRzuNvA', 4, 647),
(501, NULL, 1, 'Sir Winston Churchill was a heavy smoker. How many cigarettes did he smoke a day?\r\nNapoleon Bonaparte designed one of the national flags of Europe. Which one?\r\nThis famous composer didn\'t go to school. Who was It?\r\nHow much did Steve Jobs get as a CEO of Apple?\r\nS. Tom Hanks collects vintage objects. What are they?\r\nOne of the most famous English writers had pierced ears. That was not typical for the certain historical period. Who was \r\n  that?\r\nDaniel Radcliffe got allergic during the Harry Potter shooting. What was the reason?\r\nThis writer was the first one to earn Si billion. Can you believe it? What\'s the name of the writer?\r\nDrew Barrymore happened to host Saturday Night Live at a very small age. How old was she?\r\nThere are three western names best known in China: Jesus Christ, Richard Nixon and... Who Is the third one?\r\n\r\n\r\n', '51\r\nItaly \r\nMozart\r\n1$\r\nTypewriter\r\nShakespeare\r\nThe first set of glasse for harry potter\r\nJ.K Rowling\r\n7 years old\r\nElvis Persley', 'Let\'s have fun!', 5, 'Famous people still remain people with their special traits. How much do we know about them? Some facts of celebs\' life can be quite surprising or even astonishing. Let\'s find out what is/was special in their lifestyle.', 1, 'https://drive.google.com/uc?export=view&id=1ydYlcnYZ0S1TNL8qgmV1PXmqE4-2tHO_', NULL, NULL, '', 5, 647),
(503, NULL, 1, ' Do you think it is harder to get a good job for forgetful people?\r\nAre you a couch potato or do you prefer a more active lifestyle?\r\nHow do you react if you come across snobbish people?\r\nWould you rather win an argument or avoid conflict?\r\nS. What is the difference between a whiz and know-It-all?\r\nDo you like people with freckles? Some people think they are sun-kissed..\r\nParents generally want their children to be docile. Is it always a good thing?\r\nDown-to-earth people sometimes take it too seriously and start saving every penny and reusing all kind of things. Should there be a limit to being practical-minded?\r\nChubby children may become really nice people in their teens. And if not? What would you say to comfort one?\r\nIs It possible to remain Impartial if you work with your family members?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1C0MRjNTmudh9xN-G6lzvSsfDcWp4S3DY', NULL, NULL, '', 3, 647),
(504, NULL, 1, 'While my friend was telling a joke, somebody called him.\r\nWhile the joke was being told, somebody called.\r\nWhile he was telling a joke, his phone was ringing.\r\nI heard only the end of his joke yesterday. But I know he had been telling it for an hour before.\r\nAfter he had told the joke, everybody laughed.\r\nHe had finished telling his joke by the moment I came.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1_DsAOL42GR2oSS1pOlBFaoy0rwWa_aeF', NULL, NULL, '', 2, 647),
(505, NULL, 1, 'Can you give a couple of synonyms of the word â€œfunnyâ€?\r\nGreat! Now letâ€™s try â€œkindâ€.\r\nAnd what about â€œsadâ€?\r\n\r\n\r\nOk thatâ€™s it for now!\r\n', '', 'Describe what you see', 1, 'Letâ€™s think about the words we could describe our character and mood with.', 1, 'https://drive.google.com/uc?export=view&id=15ZctzJhQL93O5qinUjDpDtqRmAv9N7sk', NULL, NULL, '', 1, 647),
(506, NULL, 1, 'Did you know that the oldest diver in the world is ninety WO And that the shortest woman is only 62,8 cm?\r\nThese people are famous, but do they have a happy life? Remember, that some of them have inborn unique traits, but others try hard to set a record.\r\nAre all the Guinness records healthy? Is there actually any use of setting records at all? What\'s the benefit?\r\nIf you know something about unusual people, please, tell us. They may have a range of abilities. Keep In mind that we are all unique and may be considered unusual. So, you gotta know a couple of unique guys for sure!\r\n\r\n', '', 'Let\'s have fun!', 5, 'Guinness Records\r\nThere are a lot of really amazing people in this world! Just think of those hundreds in the Guinness book! ', 1, 'https://drive.google.com/uc?export=view&id=11qPDrpSE4ORoGzgcZeUaFyyQWDFtk56O', NULL, NULL, '', 5, 648),
(507, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/vGuVxZdXXYo', 4, 648),
(508, NULL, 1, ' Do you think humble people can become open-minded and easy-going with the age?\r\nIf you had a special talent would you do your best to work on it or just neglect it?\r\nMany famous people were considered to be oddballs. Is talent bonded to strange behavior?\r\nMany celebrities with pretty much money are really pushy. Do you agree?\r\nS. Do you believe that artists are touchy because of the particularities of their psychology?\r\nPeople think one needs to be two-faced to get into the show-biz or politics. Is it true?\r\nDo you think it\'s harder for whiz kids to socialize with their peers?\r\nMany celebrities are family people. But still, a lot of them are womanizers. Who, do you think. prevails?\r\nPoliticians are rather thick-skinned, aren\'t they?\r\nICs a common story when young pimply guys become famous celebs. Could you give a couple of examples?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=19a6rT-dekdEs96uVOu_J4kwG12w2fJzl', NULL, NULL, '', 3, 648),
(509, NULL, 1, ' While my friend was telling a joke, somebody called him.\r\nWhile the joke was being told, somebody called.\r\nWhile he was telling a joke, his phone was ringing.\r\nI heard only the end of his joke yesterday. But I know he had been telling it for an hour before.\r\nAfter he had told the joke, everybody laughed.\r\nHe had finished telling his joke by the moment I came.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1_DsAOL42GR2oSS1pOlBFaoy0rwWa_aeF', NULL, NULL, '', 2, 648),
(510, NULL, 1, 'Are you a fan of an actor or a sport player? If so, you might know whatâ€™s going on in their life. Please, give us some information about what happened to your favourite star last year. Donâ€™t forget to use Past Simple!\r\n\r\nYou are not a fan and you have you own cool vibe? So, tell us about the amazing events in your life that took place last year. And again, please, remember to use Past Simple!\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1S07ij0xW9_OAoygVemN2A6iUasElgbUQ', NULL, NULL, '', 1, 648),
(512, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/aGedUxTAfBk', 4, 649),
(511, NULL, 1, 'What roles are these characters above best known for?\r\nWho could be the best doctor, soldier, cook, and scientist?\r\nWho is your favourite character from the pairs below?\r\nTry to make a perfect superhero using one special trait of each of the guys below.\r\nHarry Potter or Hermione Granger (â€œHarry Potterâ€)\r\nSuperman or Batman (â€œBatman vs. Supermanâ€)\r\nFrodo Baggins or Sam Gamgee (â€œThe Lord of the Ringsâ€)\r\nSherlock Holmes or Dr.Watson (â€œSherlockâ€)\r\nHan or Chewbacca (â€œStar Warsâ€)\r\n', '', 'Let\'s have fun!', 5, 'Best partners', 1, 'https://drive.google.com/uc?export=view&id=1lWNs2npi7ISnvvX1R0jSLX5g-i57Rig_', NULL, NULL, '', 5, 649),
(513, NULL, 1, 'Do you believe in the concept of friendship forever?\r\nDo you think you can find eternal friendships through the Internet?\r\nCan you confirm that it used to be easy to think of friendship as forever lasting in your childhood than now?\r\nWould you be able to live without friends?\r\nWhat would you prefer: to have one true friend or many superficial friends?\r\nHow do you understand the proverb \"A friend in need is a friend indeed\"?\r\nWhom would you prefer to have as a friend super brainy, super brainless, or super bizarre friend? Why?\r\nWhat is the most disturbing thing in your friends\' temper which took you a lot of time to get used to?\r\nWhat can you do with a misunderstanding with your friends?\r\nWhat is the best friendship for you?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1tH06dIfGPvh8naCCgcA4XKR1HYjP1NQm', NULL, NULL, '', 3, 649),
(514, NULL, 1, 'Did you use to meet very often when you were younger?\r\nI am used to working a lot and sleeping very little. Bad, but it happens.\r\nI am getting used to drinking coffee less now, and I hope soon I will be used to doing it.\r\nI got used to my new friendâ€™s character quite fast. Now, I am used to having no problems with him.\r\nI used to go to the library when I did not have Internet at home.\r\nWhen I was young, I would visit my grandmother every summer.\r\nAfter dinner we all would sit in the drawing room and chat.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1jxMkOLF_MeFy_JvHI6E7seYhrCstqREM', NULL, NULL, '', 2, 649),
(516, NULL, 1, 'You are planning a trip around the world.\r\nWho would you take with you? Why?\r\nWhat kinds of equipment and food would you take with you?\r\nWho would you never think of taking with you? Why?\r\nTry to find a role for each of the characters below and explain your choice:\r\nBlack cat\r\nChristopher Columbus\r\nRobocop	^\r\nRobert De Niro\r\nWilliam Shakespeare\r\nElisabeth II\r\nDonald Trump\r\nRihanna\r\nSpiderman\r\n\r\n', '', 'Let\'s have fun!', 5, 'Worldwide trip', 1, 'https://drive.google.com/uc?export=view&id=1tp-nP-tMjW-811tyv319-_UNkTr62ZLa', NULL, NULL, '', 5, 650),
(517, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=146giN06RpV5NmlB8HOHoQ78Nv8ISfDiv', NULL, NULL, '', 4, 650),
(515, NULL, 0, '', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1H_7lLbBmarQtETCpEoa2yX3xCqoVguTd', NULL, NULL, '', 1, 649),
(518, NULL, 1, ' How well do you get along with people?\r\nHow do you cope with sprung up conflict situations?\r\nHow did you use to cope with conflicts when you were a kid?\r\nWhat does it mean to have good communication skills?\r\nWould you choose to become close friends or have formal relationships with your colleagues?\r\nWhat does it mean to be a good friend?\r\nDo you believe in a long-distance friendship?\r\nWhat would you need to keep friendship at a long-distance?\r\nDid you use to isolate yourself from your friends?\r\nHow easily would you get used to a difficult character?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1xmOOQKkvvD4oRZUpVBVZAb8GMHDPjCvX', NULL, NULL, '', 3, 650),
(519, NULL, 1, ' Did you use to meet very often when you were younger?\r\nI am used to working a lot and sleeping very little. Bad, but it happens.\r\nI am getting used to drinking coffee less now, and I hope soon I will be used to doing it.\r\nI got used to my new friendâ€™s character quite fast. Now, I am used to having no problems with him.\r\nI used to go to the library when I did not have Internet at home.\r\nWhen I was young, I would visit my grandmother every summer.\r\nAfter dinner we all would sit in the drawing room and chat.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1jxMkOLF_MeFy_JvHI6E7seYhrCstqREM', NULL, NULL, '', 2, 650),
(520, NULL, 1, 'How could you describe your bestie?\r\nHow do you get along?\r\nIn case of a conflict situation, would you ponder and think over your words?\r\n', '', 'Describe what you see', 1, 'Tell', 1, 'https://drive.google.com/uc?export=view&id=1OZtB6gfaA3UB1FQ36JbIqt3mifsoArKL', NULL, NULL, '', 1, 650),
(522, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/a7VJJfN1CN0', 4, 651),
(521, NULL, 1, 'IT directors report the highest level of dissatisfaction with their jobs, far surpassing that of any waitress, janitor, or bellhop.\r\nSales directors are the most dissatisfied with their jobs. In the surveys, they usually say that they have always hated sales.\r\n    Dangerous:\r\nThe most dangerous job Is a truck driver. 70% of their deaths occur to reckless driving.\r\nThe most dangerous job is a lumberjack. It is really surprising how many trees fall on these poor guys each year. Common:\r\nThe most common job in the USA is a cashier. Quite predictable, isn\'t it?\r\nThe most common job in the USA is a retail salesperson.\r\nHighest paid:\r\nThe highest paid position is an aircraft pilot. They get about 116 320 pounds a year.\r\nThe highest paid position is the head of a major orgi^ization. The highest average is about 114 450 pounds a year. \r\n    Lowest paid:\r\nThe lowest paid job in the USA is a counter attendant in the foodservice industry. They get around $19 448 a year.\r\nThe lowest paid job in the USA is a roadkill cleaner. They earn almost nothing and do it mostly for pleasure.\r\n-  Have you ever worked or wanted to hold any of the positions?\r\nWhat job do you find the best/ the worst?\r\nWould you agree to have some boring/ dangerous job providing that it pays well?\r\nWhat kind of job is the most unfairly paid for (both high and low)? Explain your choice.\r\nCheck the answers. Are you surprised by any of the facts?\r\n', 'Keys:\r\nA\r\nA\r\nB\r\nB\r\nA\r\n\r\nAre you surprised by any of the facts?\r\n', 'Let\'s have fun!', 5, 'Dream job\r\nHere is a list of statements. You should choose which statement (a or b) is right for each fact and explain your choice.\r\nDisappointing:', 1, 'https://drive.google.com/uc?export=view&id=10TJAXp8Z-pQ_ABAZZU8c5DrmAz8Shgiq', NULL, NULL, '', 5, 651),
(523, NULL, 1, ' Is it easy for you to calm down if anger or other feelings boil over?\r\nDo you know what the word \"end-user\" means?\r\nDo you know anybody who is on welfare? If so, tell his/her story.\r\nIs it hard for you to meet deadlines? Are you good at workload distribution or do you save everything for the last moment?\r\nHave you ever tried conducting people at work? If so, did you like it?\r\nWhat is \"team building\"? Do you know any good examples?\r\nWhat does a good binding agreement look like? What should it consist of?\r\nWhat\'s your attitude to big shots? Would you like to be one of them?\r\nHave you ever quit your job? If so, did you regret it?\r\nHave you ever been unemployed? If so, how did you feel?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1IEu3r5vGGhVFfDqkeJvFm22DagR3wUwA', NULL, NULL, '', 3, 651),
(524, NULL, 1, 'Will I become a big shot in my company? â€“ I hope I will. I think I will.\r\nI might become a big shot one day. Why not?\r\nLook at those clouds â€“ itâ€™s going to rain.\r\nI suppose one day I may conduct our work.\r\n\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=19sN6EEgsj2RKSA9pcI5DUY7fMQvZQn7j', NULL, NULL, '', 2, 651),
(526, NULL, 1, 'Jobs\r\nThings you need to work\r\nGood qualities for your CV\r\nBig companies\r\nFamous entrepreneurs\r\n\r\n', '', 'Let\'s have fun!', 5, 'Name fiveâ€¦', 1, 'https://drive.google.com/uc?export=view&id=1oJ1B8zcmRO4CFzCyORhgq4kDcZchu1-H', NULL, NULL, '', 5, 652),
(525, NULL, 1, 'A good sleep not only makes your life longer but your workday shorter. \r\n', '', 'Describe what you see', 1, 'Phrase of the day ', 1, 'https://drive.google.com/uc?export=view&id=1hl7ZLa_TNgaGqy1zZUqfUkc4RQ_2tvZS', NULL, NULL, '', 1, 651),
(527, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/DvOb7_eZKE4', 4, 652),
(528, NULL, 1, 'Have you ever had your own moneymaker? If so, tell about it.\r\nHave you ever moved anywhere because of a job?\r\nWill you move to a place you don\'t like providing it gives you a dream job?\r\nDo you sometimes do business trips? If so, how much time does it usually take? What places have you been to?\r\nHave you ever worked night shifts? If so, was it hard for you?	Â£>\r\nHave you ever made startups? If so, were they successful?\r\nDo you know any people who became rich and successful instantly? If so, how did that happen?\r\nCan you think of any fresh business idea which may lead to success?\r\nIn your opinion, what was the best business idea ever?\r\nDo you know what \"office shark\" means?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1s6GA85rT2bmY8ACJjoVpE96woj0x9aJK', NULL, NULL, '', 3, 652),
(529, NULL, 1, ' Will I become a big shot in my company? â€“ I hope I will. I think I will.\r\nI might become a big shot one day. Why not?\r\nLook at those clouds â€“ itâ€™s going to rain.\r\nI suppose one day I may conduct our work.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=19sN6EEgsj2RKSA9pcI5DUY7fMQvZQn7j', NULL, NULL, '', 2, 652),
(530, NULL, 1, 'I am unemployed. Give me some advice on how to get a job.', '', 'Describe what you see', 1, 'Explain', 1, 'https://drive.google.com/uc?export=view&id=1mwyBavLLMUd1CQm5pXlpU-3n9HepaYHP', NULL, NULL, '', 1, 652),
(531, NULL, 1, 'Which words come to your mind when you hear the word â€œambitionâ€?\r\nWhich words would you add to this picture?\r\nWhat prevents you from thinking big? Or do you think that way?\r\nWhat helps you be more ambitious?\r\nWho inspires you? Can you give examples of the people you admire?\r\nHow can you make your life and other peopleâ€™s lives better?\r\nWhat qualities canâ€™t you be successful without?\r\n', '', 'Let\'s have fun!', 5, 'Describing ambition', 1, 'https://drive.google.com/uc?export=view&id=1SeoUEPLTHrSFhVCd463pNiBPKmjusFb6', NULL, NULL, '', 5, 653),
(532, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/LXsPxaTLSCY', 4, 653),
(533, NULL, 1, ' Do you prefer easy or challenging goals?\r\nHow can you define a go-getter? Is it possible to become a go-getter or is this a trait one is born with?\r\nDo you blame yourself for losing control of your temper? How can we stop blaming ourselves?\r\nDo you believe in positive thinking? Do you think that our thoughts can be materialized?\r\nShould parents force their children to do different activities like studying languages or doing sports if they don\'t want to do it?\r\nWhat do you do when you run into difficulties? How do you overcome them?\r\nAre you eager to try something new in life? Are you afraid of taking the first step towards your goal?	^\r\nHow do you understand the word â€œcommitted\'?\r\nDo you tend to put things off often? How can you stop doing that and start acting?\r\nAre you goal-oriented? How many times have you achieved things you were really proud of?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1AVfUOyGF0CHE5x5GengXCy0utB3A7ZXe', NULL, NULL, '', 3, 653),
(538, NULL, 1, ' Is it good or bad to be self-assured? Why?\r\nHow can people who have unjustifiably low self-esteem make it higher?\r\nWhat is the best way to boost your self-esteem?\r\nIs it worth struggling hard to reach your goals? Is there a moment when it\'s better to give up?\r\nIs it possible to believe in yourself when no one else does?\r\nWhat personality traits did you take after your parents? What traits did you wish you\'d take after them?\r\nHave you ever lost control? Do you know how to avoid such situations?\r\nAre you easily demotivated? How can one stay motivated most of the time?\r\nWhat does self-appraisal depend on? Is it our inner feeling or the way others treat us?\r\nWhat does \"to stand out\" mean to you? Is It good to stand out or is it better to be like everyone else?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1TxXIPq8IXV9_L_gM-n1OHHBqnrQPZvFD', NULL, NULL, '', 3, 654),
(537, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/LDVzasWZ0xc', 4, 654),
(536, NULL, 1, 'Compare modern youth and those who were young in the \'90s:\r\n\r\nWhat ways of self-restraint do young people have nowadays?\r\nWhat ways of self-restraint did young people have back in the â€™90s?\r\nDo you think young people are more self-assured nowadays? Why?\r\nDo you think nowadays young people have higher self-esteem?\r\nWas it easier to stand out then or is it easier now?	^\r\nDo modern youngsters have to struggle more to find their place in life?\r\nDo modern young people take a lot from their parents or are these generations very different?\r\nHow do you think young people will change in another 40 years?\r\n\r\n', '', 'Let\'s have fun!', 5, 'The youth of the nation', 1, 'https://drive.google.com/uc?export=view&id=19lX95oKiQ-GE8_LP3kHL4MGPhHnJdi0d', NULL, NULL, '', 5, 654),
(535, NULL, 1, 'How can we stop putting off things and start doing them?\r\nHow can we become more goal-oriented?\r\nWhat can we do in case we run into some obstacles on the way to achieving our goals?\r\n', '', 'Describe what you see', 1, 'Answer the questions', 1, 'https://drive.google.com/uc?export=view&id=12Q8glKfum0G1esYAeJI_W8dZziiMF55x', NULL, NULL, '', 1, 653),
(534, NULL, 1, 'By midday, I will have been conducting a lesson for 2 hours.\r\nI will have done it by midday.\r\nBy midday, I will have been doing it for 2 hours already.\r\nWe will have owned that house for 2 years by that moment.\r\nI will have done it by the moment he comes.\r\nI wonâ€™t have done it until he comes.\r\nThey wonâ€™t have finished the project till next month.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1p9qZslBz4S1gPMZWcpBAz8CSaBDN_PyJ', NULL, NULL, '', 2, 653),
(540, NULL, 1, 'May increase oneâ€™s self-esteem\r\nDescribe ambitious people\r\nLead to failure\r\n', '', 'Describe what you see', 1, 'Say all the words thatâ€¦', 1, 'https://drive.google.com/uc?export=view&id=1zOWbckS2WZbdA0IC1igRTRLH73X8n4XK', NULL, NULL, '', 1, 654),
(539, NULL, 1, ' By midday, I will have been conducting a lesson for 2 hours.\r\nI will have done it by midday.\r\nBy midday, I will have been doing it for 2 hours already.\r\nWe will have owned that house for 2 years by that moment.\r\nI will have done it by the moment he comes.\r\nI wonâ€™t have done it until he comes.\r\nThey wonâ€™t have finished the project till next month.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1p9qZslBz4S1gPMZWcpBAz8CSaBDN_PyJ', NULL, NULL, '', 2, 654),
(541, NULL, 1, 'Rules: a student says a simple statement about what he/she has never done before starting with \"Never have I everâ€. \r\nIf a teacher at some point in his/her life has done that action, then a student gets one point. If not â€” a teacher gets it. The game then goes in circles, and a teacher makes a statement. The first person to get 5 points wins.\r\n\r\nExample\r\nS: Never have I ever eaten octopus.\r\nT: I have.\r\nS gets 1 point.\r\n\r\n', 'Be honest.\r\nEnjoy getting to know each other!', 'Let\'s have fun!', 5, 'Never have I ever', 1, 'https://drive.google.com/uc?export=view&id=1_o_ZrOd_NA1UErM6IaeSDSRermkBdE6E', NULL, NULL, '', 5, 655),
(543, NULL, 1, ' Can human beings do anything to prevent bad things from happening? Why?\r\nDo you agree with the statement â€œonly a person who risks is free\"? Explain, please.\r\nIf you invested money, would you be cautious or be adventurous?\r\nDo you believe some numbers, days or dates bring luck or misfortune? Why?\r\nHow do risks in our life alter as we move through childhood to old age?\r\nIs the only strategy that leads to failure not taking any risks?\r\nHave you ever won a lot of money by chance?\r\nWhat five words would you choose to describe a feeling that you get when taking risks?\r\nIs learning any foreign language considered risky and perilous? Why?\r\nWould you run risks if the advantages outweighed the disadvantages? Why?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1BZaQG8fpIisAACR94pqbpO9gaYF3la6k', NULL, NULL, '', 3, 655),
(542, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/GuyWk582Bj8', 4, 655),
(544, NULL, 1, 'I risk a lot. And if I am offered to risk, I will definitely risk.\r\nIf he risked next time, he would win.\r\nI will win this battle tomorrow if I fight to the end.\r\nIf my friend were braver, we would risk more often with him.\r\nIf we risked more often, we would win more money.\r\nWe would live in Australia if we had more money.\r\nIf I had risked a year ago, I would have won a lot of money.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=18M6gkWPQeNuRSvJkqr6Oo88BhbSq_k5O', NULL, NULL, '', 2, 655),
(546, NULL, 1, 'The rules: a student would look at the picture and choose an object or a person. Then announce it by saying â€œI spy something with my little eyeâ€¦â€ then he/she has to describe a quality (a color, shape etc.) of a chosen object. A teacher can ask any â€œyesâ€ or â€œnoâ€ question. \r\nOnce he guesses an object, the roles change.\r\n', '', 'Let\'s have fun!', 5, 'I spy with my little eye', 1, 'https://drive.google.com/uc?export=view&id=1ncQ5LJoXr2WQM3khqiB-EB8opXyf1Agn', NULL, NULL, '', 5, 656),
(547, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/uLwFA7Sc_ug', 4, 656),
(545, NULL, 1, 'Your bestie is going into business and opening a coffee house.\r\nLetâ€™s show some lavish praise for her in 3 sentences.\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1QSIS5ajGcRTfonI-Ep9MQgJ7E95q3jwv', NULL, NULL, '', 1, 655),
(548, NULL, 1, ' Would you agree to commit a petty theft for a bet? And why?\r\nHow do you understand \"nothing ventured, nothing gained\"?\r\nHow would you comfort a person who suffers misfortunes?\r\nWould you prefer to live in a world where nobody would have to venture?\r\nHave you ever wanted to take part in a bull running? What for?\r\nWhat are the advantages and disadvantages of rafting? Do you want to try someday?\r\nWhy do some people become obsessed with gambling machines?\r\nDo you agree that risk-taking can be considered a disease? Why?\r\nWhat would you do if a ghost talked to you through a spirit board? Would you be scared?\r\nAre you brave enough to take every risk and drop every fear?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1ZVeNyILflRyI6cy6_SCIqBNeXSfGsD_D', NULL, NULL, '', 3, 656),
(549, NULL, 1, ' I risk a lot. And if I am offered to risk, I will definitely risk.\r\nIf he risked next time, he would win.\r\nI will win this battle tomorrow if I fight to the end.\r\nIf my friend were braver, we would risk more often with him.\r\nIf we risked more often, we would win more money.\r\nWe would live in Australia if we had more money.\r\nIf I had risked a year ago, I would have won a lot of money.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=18M6gkWPQeNuRSvJkqr6Oo88BhbSq_k5O', NULL, NULL, '', 2, 656),
(550, NULL, 1, 'Boxing\r\nMisfortune\r\nPut effort\r\n', '', 'Describe what you see', 1, 'Make three sentences with the words:', 1, 'https://drive.google.com/uc?export=view&id=1_o_ZrOd_NA1UErM6IaeSDSRermkBdE6E', NULL, NULL, '', 1, 656),
(551, NULL, 1, 'Make a list of 10 rules on how to steal $1000000 from a bank and get away with murder without using the following words: \r\n\r\nÂ«maliciousÂ», Â«counterfeitÂ», Â«should/shouldn\'tÂ».\r\nWhat bank would you prefer to rob?\r\nHow many people are going to help you with that?\r\nWhat gadgets would be useful to make everything smooth and fast?\r\nWhat character traits should a perfect robber have?\r\nWhat kind of a vehicle would you pick for the robbery?\r\n', '', 'Let\'s have fun!', 5, 'Bank-robbing', 1, 'https://drive.google.com/uc?export=view&id=12Q7b5sK4KeJV4hJAYuk87E24DhoHlD3d', NULL, NULL, '', 5, 657),
(552, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/sLMc5OFnQRs', 4, 657),
(553, NULL, 1, ' Is English known to be the global business language in your country? What role does it play?\r\nWhat spheres of modern business are considered the most profitable? Why?\r\nIf you were asked about ways how to be prosperous in business what would you say?\r\nAre there any organizations in your country that offer a bailout for hard-up people?\r\nWhen and why might someone ask \"do you think Iâ€™m made of money\"?\r\nDo you find earning money more exciting than spending it? Why?	^\r\nWhat does \"money doesn\'t grow on trees\" mean? When can it be used?\r\nWhat would you advise a person that hasnâ€™t got enough money to get by?\r\nDo you agree with this idiom â€” \"A fool and his money are soon parted\"? Why?\r\nWould money avoid you if you donâ€™t know how to care for it? Why?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1XfMWbBlA0P1bcuvyQcIgPZHjRyLXxIqT', NULL, NULL, '', 3, 657),
(554, NULL, 1, 'If we had taken a loan last year we would have a car now.\r\nIf we had sold our car last week, we would go to work by bus now.\r\nI we hadnâ€™t gone to work by bus yesterday, we wouldnâ€™t be ill now.\r\nIf we were clever, we would have taken a loan last year.\r\nIf we didnâ€™t trust them, we wouldnâ€™t have lent them money last week.\r\nWould you have started learning English earlier if you could?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=14upwbicyeQo_ebl3KkicZB20xqpkS25Z', NULL, NULL, '', 2, 657),
(556, NULL, 1, 'In what way Charlie Mortdecai and Johnny Depp are closely connected with?\r\nDo you agree that the role of Mortdecai is the best one of Johnny Depp? Why?\r\nWhat are the advantages and disadvantages of being an unscrupulous art dealer and swindler?\r\nWho is more adventurous and enterprising Johnny or Charlie? Why do you think so?\r\nWhat five character traits should you have to be a profound trickster? And why?\r\nWhat do Mortdecai and Depp have in common? Why do you guess so?\r\nWhat ways could you suggest to pay off a crushing debt to the taxman being a bankrupt?\r\nWhat artwork do you think is so expensive that it can\'t be bought for anything in the world?\r\nDo you think the clothes style of Mortdecai is similar to tastes of Depp?\r\nDo you think there are any safe ways how to launder illegally acquired money? Why?\r\nHave you ever heard about \"Movember\"? Do you have any ideas what it means?\r\nWho do you think is cooler impressive the role or the actor? And why?\r\n\r\n', 'Movember is an annual event involving the growing of mustaches during the month of November to raise awareness of men\'s health issues, such as prostate cancer, testicular cancer and men\'s suicide', 'Let\'s have fun!', 5, 'Lies and tricks', 1, 'https://drive.google.com/uc?export=view&id=1xj-jIfEvp5FjlaFS6d8bYmbc4--cDC2W', NULL, NULL, '', 5, 658),
(557, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/XNu5ppFZbHo', 4, 658);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(555, NULL, 1, 'Brisk have brigadiers brandished broad bright blades, blunderbusses, and bludgeons balancing them badly.\r\n', '', 'Describe what you see', 1, 'Are you skilled enough to read this tongue twister?', 1, 'https://drive.google.com/uc?export=view&id=1BwNxtgTkDIhTzcu30HPnfYBBOn-juXLV', NULL, NULL, '', 1, 657),
(558, NULL, 1, ' Is customer service a part of a companyâ€™s culture? How is that beneficial to a company?\r\nIs the only place fortune comes before work in the dictionary?\r\nDoes it take long to squander a fortune away if you\'re not careful?\r\nWhy is it important to create a positive and well-rounded company culture?\r\nDo you agree that the best business strategy of ail is a satisfied customer? And why?\r\nWill the things you look at change, if you change the way you look at things?\r\nWhat difficulties could you face if you went into business on a shoestring budget?\r\nDoes success in business require three key points: training, discipline and hard work?\r\nWhat is much more important to heed the lessons of failure or to celebrate success?\r\nIf you make money your god, will it plague you like the devil? And why?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1V_JmEE5u-Y4rloxZedCQggvTalLBFBXy', NULL, NULL, '', 3, 658),
(559, NULL, 1, 'If we had taken a loan last year we would have a car now.\r\nIf we had sold our car last week, we would go to work by bus now.\r\nI we hadnâ€™t gone to work by bus yesterday, we wouldnâ€™t be ill now.\r\nIf we were clever, we would have taken a loan last year.\r\nIf we didnâ€™t trust them, we wouldnâ€™t have lent them money last week.\r\nWould you have started learning English earlier if you could?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=14upwbicyeQo_ebl3KkicZB20xqpkS25Z', NULL, NULL, '', 2, 658),
(585, NULL, 1, 'Use your imagination and complete the full story:\r\n\r\nOnce upon a time, there was a peasant who had a beautiful daughter.\r\nThe prince says to Bell: â€œweâ€™re going to be very happy together!â€\r\n', '', 'Describe what you see', 1, 'There are two sentences: the first one and the last one.', 0, '', NULL, NULL, '', 1, 663),
(584, NULL, 1, 'They were depicting that character yesterday.\r\nRealizing that he would become famous, he kept on telling his tales.\r\nI have just depicted everything that happened then.\r\nThey look quite shocked. So, why?\r\nI enjoy depicting different characters.\r\nSwimming is so pleasant.\r\nLook at those people swimming in the pool!\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 663),
(582, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 663),
(583, NULL, 1, ' Does reading give us some place to go when we have to stay where we are?\r\nDoes a good listener truly want to know the speaker? And why?\r\nAre humans prone to live life in their own little fairytale? Why do you think so?\r\nDo you think that dreams can help us solve problems?\r\nHave you ever read a book and then watched the movie? Which was better? Why?\r\nWhat images spring to mind when you hear the words \'science fiction?\r\nThere is also a distinction between science fiction and fantasy. What do you understand the distinction to be?\r\nDo you think Leonardo Da Vinci\'s drawings of helicopters and flying machines was science fiction of the 15th Century?\r\nIf you could develop just one special power which one would you choose? Why?\r\nStar Trek creator Gene Roddenberry said: \"Science fiction is a way of thinking, a way of logic that bypasses a lot of nonsense. It allows people to look directly at important subjects.\" Do you agree?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 663),
(581, NULL, 1, 'The rules: a student says a simple statement about what they have never done before starting with, â€œNever have I everâ€.  If a teacher at some point in their life has done that action then the student gets one point, if no â€“ the teacher gets it. Then it goes in circles. The first one to get 5 points wins.\r\n\r\nExample\r\nS: Never have I ever written poetry.\r\nT: I have.\r\nS: gets 1 point\r\nBe honest and enjoy getting to know each other! ', '', 'Let\'s have fun!', 5, 'Never have I everâ€¦', 0, '', NULL, NULL, '', 5, 663),
(580, NULL, 1, 'What do you like more: fish or meat? And why?\r\nWhat necessary vitamins does meat contain?\r\nDo you agree that eating raw fish is dangerous?\r\n', '', 'Describe what you see', 1, 'Choice', 0, '', NULL, NULL, '', 1, 662),
(579, NULL, 1, ' Do you really enjoy walking barefoot?\r\nItâ€™s no use crying over spilled milk.\r\nShe was happy about winning the competition.\r\nWe look forward to hearing from you.\r\nHe agreed to forgive me.\r\nIt is a real pleasure to work with you.\r\nWhy are they here? â€“ they came here to congratulate us.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 662),
(578, NULL, 1, 'What do you do to relax after stressful situations?\r\nDo you prefer playing games or doing stressful activities? Why?\r\nDo you think modern life is more stressful today than it used to be? Why?\r\nIn what ways are our mind and body connected?\r\nWhy do you think it is urgent for people to attend regular medical check-ups?\r\nDo you consider yourself a health-conscious person aware of pros and cons related\r\nWhat food are you obsessed with: salty, sour, spicy or sweet? Why?\r\nDo you always feel like a picture of health when you wake up in the morning?\r\nWhat health problems do you worry about most?\r\nShould tobacco companies be responsible for people\'s addiction to nicotine?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 662),
(577, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 662),
(575, NULL, 1, 'Music improves workout performance.\r\nWorking out sharpens your memory.\r\nExercising boosts self-confidence.\r\n', '', 'Describe what you see', 1, 'Read the facts below. Did you know that?', 1, 'https://drive.google.com/uc?export=view&id=1qZLVQxgsJ4B94RHgZcpTIwbX4_k00Rsv', NULL, NULL, '', 1, 661),
(576, NULL, 1, 'Comfort food\r\nCrash diet\r\nPart with\r\nWork out \r\nBroccoli\r\nComplain\r\nSweet tooth\r\nPigging out\r\ncupcake\r\n', '', 'Let\'s have fun!', 5, 'Make a catchy story about a famous successful actor using the following words.', 0, '', NULL, NULL, '', 5, 662),
(574, NULL, 1, 'Do you really enjoy walking barefoot?\r\nItâ€™s no use crying over spilled milk.\r\nShe was happy about winning the competition.\r\nWe look forward to hearing from you.\r\nHe agreed to forgive me.\r\nIt is a real pleasure to work with you.\r\nWhy are they here? â€“ they came here to congratulate us.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1LCP28zptCLQ-QcnQ28HiTRcZ12tw78k8', NULL, NULL, '', 2, 661),
(572, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/FS0ak_OTfIs', 4, 661),
(573, NULL, 1, ' Do you know any useful hacks on how to get rid of a dreadful hangover?\r\nWhat is easier: gaining or losing weight? Why?\r\nDo you think marijuana should be legal or illegal? Why?\r\nAre there any other things causing obesity except pigging out?\r\nWhat type of fiber is the best for losing weight? Why?\r\nDo you think protein is urgent in a steady diet? What is a good source for that?\r\nIs there any difference between \"soft\" drugs, like marijuana, and \"hard\", like crack?\r\nWhy do females tend to abuse alcohol and tobacco more than men?\r\nWhat is the difference between diet and a healthy diet?\r\nHave you ever had to fight a pet peeve in your life? What was that?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1Y6OyaZJegvp7Cbf0fQsozYN7z8Brr5y_', NULL, NULL, '', 3, 661),
(571, NULL, 1, 'Does your tongue yearn for a fancy stuff? Are you a connoisseur when it comes to delicacies like caviar or are you more of a junk food fan? Find out if you\'re a guru of gastronomically delights.\r\nThe best drink to go with salmon is a glass of white wine. (Yes/No)\r\nIf you need to find a place to sleep, you wonâ€™t choose some ordinary motel. (Yes/No)\r\nYou aren\'t a person well known for your ability to haggle. (Yes/No)\r\nIf you\'re throwing a party the dress code is black and white. (Yes/No)\r\nOysters are a little gross, but something you\'d be willing to try. (Yes/No)\r\nDuring your lunch break at work, you would rather eat a cheese salad than a hot dog. (Yes/No)\r\nWhen you\'re organizing a formal dinner party you donâ€™t go just to one grocery. (Yes/No)\r\n\r\n', 'More \"Yes\" answers:\r\nWell, your tastes arenâ€™t just expensive, they\'re exquisite! Only the most divine ingredients make their way to your tongue. Not only do you know how to select a good wine, but you also know which wine goes superbly with every kind of meal. Good food and drink are central to your being and you likely use every kind of occasion as an excuse to whip out the corkscrew and crystal.\r\nMore \"No\" answers:\r\nGourmet? You mean those tiny portions of food served on a gigantic plate with a few sprigs of grass to decorate? No thanks â€” you donâ€™t need all that pretentious fuss. According to your score, you have simple tastes, not extravagant ones. This doesn\'t mean that you don\'t enjoy good food and drinks though, it simply means you don\'t have to go to five-star restaurants to enjoy it. You\'d rather spend your money elsewhere than splurge it all on food. Besides, who cares if you don\'t know the difference between a rose and blush wine?\r\n', 'Let\'s have fun!', 5, 'Gourmet inside', 1, 'https://drive.google.com/uc?export=view&id=1JGBCuF5Q9BuMPby5Gmr3G4VxWwffMT18', NULL, NULL, '', 5, 661),
(570, NULL, 1, 'The milk of a female hippopotamus is lavender.\r\nHoney never goes off, not after a year or hundred â€“ never.\r\nThere are ten times more bacteria than cells in the human body.\r\n', 'Answers:\r\nFalse (pink)\r\nTrue\r\ntrue\r\n', 'Describe what you see', 1, 'Are these facts true or false?', 1, 'https://drive.google.com/uc?export=view&id=1xjOw2g7v0xrRxmA4kOoqRP-owzOE_DNN', NULL, NULL, '', 1, 660),
(569, NULL, 1, ' I wish I were less moody.\r\nIf only I had chosen another job then.\r\nIf only they would stop talking about it.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1ZLVP_5gPKmNzcYa9WAK8hP4Qx5g7TYea', NULL, NULL, '', 2, 660),
(567, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/4NpG4F9yq00', 4, 660),
(568, NULL, 1, 'What behavior according to your point of view is not acceptable between beloved ones?\r\nIs behavior the mirror in which we can display our image? And why?\r\nHow do you understand an idiom \"A wolf in sheep\'s clothing\"?\r\nDo people become bad due to exceptional circumstances or their own choices?\r\nIs it acceptable for parents to scream at their kids in pub^:? Why?\r\nWhat would the world look like if everyone acted upon their feelings?\r\nHow can you describe a spiteful person?\r\nWhat is the reason of manic depression leading to periods of emotional ups and downs?\r\nIs it true \"your beliefs donâ€™t make you a better person, your behavior doesâ€?\r\nTell about a time when you handled a challenging situation.\r\n', '', 'Time to talk', 3, '', 1, NULL, NULL, NULL, '', 3, 660),
(566, NULL, 1, 'You are going to visit the world of the \"Vampire Diaries\". Are you ready?\r\nWho is going to accompany you on this bloody journey? Why?\r\nThere is a war between the rival clans of vampires. What weapons will you take?\r\nWould you prefer to learn diabolical spells and invocations? Why?\r\nWhat are the advantages and disadvantages of being a vampire?\r\nWould you become a vampire yourself if you fell in love with one?\r\nWhy do human beings always crave for immortal life?\r\nIf you were a vampire, would you rather drink the blood of people or animals? Why?\r\nDo you know in what way Vlad Tepes and Dracula are connected?\r\n', '', 'Let\'s have fun!', 5, 'Sweet blood', 1, 'https://drive.google.com/uc?export=view&id=15J6EEJeIXK15jmi_ZP7fCwrANPvvfZAT', NULL, NULL, '', 5, 660),
(564, NULL, 1, 'I wish I were less moody.\r\nIf only I had chosen another job then.\r\nIf only they would stop talking about it.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1ZLVP_5gPKmNzcYa9WAK8hP4Qx5g7TYea', NULL, NULL, '', 2, 659),
(565, NULL, 1, 'Describe the first fight you had as a child?\r\nWhat was the main reason for that fight?\r\nDid this experience make you belligerent?\r\n', '', 'Describe what you see', 1, 'Tell', 1, 'https://drive.google.com/uc?export=view&id=1VM94K3AMGjR8rGydHrzUklNrCySqkbkR', NULL, NULL, '', 1, 659),
(562, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/pXRviuL6vMY', 4, 659),
(563, NULL, 1, 'Why do some children seem naturally well-mannered while others seem ill-mannered?\r\nWhat in your opinion affects human beings\' bearing drastically? Can we stand up to it?\r\nWould you teach your kid to \"hit back\" at school if somebody hit him? Why?\r\nIn what way does mass media affect people? Does it make modem society better or worse?\r\nWhat would you do if you saw a parent spanking their child for acting up? Why?\r\nDo people prefer to behave differently with friends and family? Why?\r\nDo you treat people who are close to you better than strangers or vice versa? Why?\r\nDo you take everything to heart when someone calls you deceitful and misleading?\r\nDo you agree that wealthy people are more generous than poor? Why?\r\nWhat tips would you suggest a person who is facing an impolite behaviour? Why?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=16QLG85JSNvNfvuHfzshrnjjnjX5woWAZ', NULL, NULL, '', 3, 659),
(561, NULL, 1, 'Good traits of character;\r\nBad traits of character;\r\nFictional characters youâ€™d like to be friends with;\r\nQualities youâ€™d like to have;\r\nPastime activities.\r\n\r\n', '', 'Let\'s have fun!', 5, 'Name fiveâ€¦', 1, 'https://drive.google.com/uc?export=view&id=1JbTNOvxtq8v4hyTmQCjYTbphMuNNvCG2', NULL, NULL, '', 5, 659),
(560, NULL, 1, 'Who do you think enchants people with his charisma more?\r\nWhose business is much more profitable? Why do you think so?\r\nCan Bill Gates and Steve Jobs be considered men of genius?\r\n', '', 'Describe what you see', 1, 'Letâ€™s compare:', 1, 'https://drive.google.com/uc?export=view&id=1MVBaSzTgbpuYUXY9h71Y5sTp7p0A7MAe', NULL, NULL, '', 1, 658),
(641, NULL, 1, '-What\'s up?\r\n-Howdy!\r\n-Greetings!\r\n-Look who it is!\r\n-Good day!', 'What ways to say Hello,do you know?', 'Describe what you see', 5, 'What ways to say Hello,do you know?', 1, 'https://drive.google.com/uc?export=view&id=1SU4vPLxUwCuSIw7oV9xIKCZVC-BS6bbO', NULL, NULL, NULL, 1, 2),
(640, '', 1, '-My favourite food is...\r\n-My favourite music is...\r\n-My favourite day of the week is...\r\n-My favourite country is...\r\n-My favourite actor is...', 'Finish the statements.', 'Describe what you see', 1, 'Finish the statements.', 1, 'https://drive.google.com/uc?export=view&id=1-tU0GhuMiZpuYlXsMZJaxnTx8LbE7z30', 0x68747470733a2f2f7777772e62696e672e636f6d2f696d616765732f7365617263683f766965773d64657461696c563226636369643d2532624358557741776f2669643d4235333130304431333939324633453938413831383030383645453841433243443731464639313526746869643d4f49502e2d4358557741776f73734a37336e394842384c7a704148614538266d6564696175726c3d68747470732533612532662532666672656e6368746f6765746865722e636f6d25326677702d636f6e74656e7425326675706c6f61647325326632303138253266303825326673747564656e74732d736179696e672d68692e6a70672663646e75726c3d687474707325336125326625326674682e62696e672e636f6d2532667468253266696425326652663832356434633030633238623263323762646537663437303763326633613425336672696b25336446666b6631797973364734496741253236706964253364496d6752617726657870683d36363726657870773d39393926713d536179696e672b48656c6c6f2673696d69643d36303830313932303537323937363337383526636b3d46454533303945323634304444333832303930363643453341303930463237412673656c6563746564496e6465783d323526464f524d3d49525052535426616a6178686973743d3026616a6178736572703d30, NULL, NULL, 1, 101),
(643, NULL, 1, '-Flags of which countries do you see in the picture?\r\n-What do these countries have in common?\r\n-Which accent do you like more:American or British?\r\n-Which country do you want to visit more?', '', 'Let\'s have fun!', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1zGuf4nGcIh8j4KSnUZjh3mblQ-C49YjO', NULL, NULL, NULL, 5, 2),
(642, NULL, 1, '-What is your job?\r\n-Is your friend fine?\r\n-How do you spell your name?\r\n-How do you spell your surname?\r\n-How old is your friend?\r\n-What is your phone number?\r\n-What is your E-mail?\r\n-How do you spell your E-mail address?\r\n-Is your friend a teacher?\r\n\r\n', '', 'Time to talk.', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1qLhyNc9kolereuguJUeYwj9eaIo-BqjO', NULL, NULL, NULL, 3, 2),
(644, NULL, 1, '-Where do you work/study?\r\n-Can you spell your surname?And your E-mail address?\r\n-What country are you from?\r\n-Do you have a pet?If yes,what is its name?\r\n-Do you like travelling?\r\n-What makes you happy?\r\n-Do you have a hobby?', '', 'Time to Talk!', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1ar-EmLRLQMoM6DIDPE_aopwT6Lx411-1', NULL, NULL, NULL, 3, 101),
(646, NULL, 1, 'Listen and repeat!', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/46a032hCgAg?s?start=60&end=', 4, 101),
(645, NULL, 1, '-My phone number is 0662457132\r\n-I am 35 years old\r\n-My address is CMN 41 Marrakesh\r\n-The number of your order is 145 ', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1se_QSf6JSS2QHGM6LK6691cAUvxvXlRE', NULL, NULL, NULL, 2, 101),
(647, NULL, 1, '-My phone number is 0662457132\r\n-I am 35 years old\r\n-My address is CMN 41 Marrakesh\r\n-The number of your order is 145 ', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1se_QSf6JSS2QHGM6LK6691cAUvxvXlRE', 0x68747470733a2f2f64726976652e676f6f676c652e636f6d2f66696c652f642f315f616951356432536a7654547236723144486c41757055797141494e766a66362f70726576696577, NULL, NULL, 2, 2),
(649, NULL, 1, 'Hello from Jessica', '', 'Fill in the gaps', 1, 'Hi everyone! My name is......', 1, 'https://drive.google.com/uc?export=view&id=1b4U_krmRfVmxrZk3kFfZfb6IpNen2vNo', NULL, NULL, NULL, 4, 2),
(648, NULL, 1, '-Where will we go?\r\n-Will it be at a hotel or hostel?\r\n-Who will you go with?Why?\r\n-How many days would you like to spend there?\r\n-What places would you like to visit?\r\n-Will you take a lot of pictures or just enjoy the happy moments?', '', 'Let\'s have fun', 5, 'It\'s high time to have some rest! Let\'s go on a perfect holiday.What will it be like?', 1, 'https://drive.google.com/uc?export=view&id=1t-wCEnjP86iUZp8_A83Gn0xVV9mxIoJJ', NULL, NULL, NULL, 5, 101),
(651, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1uk0ONsSIjhP8E5RcRzKy0WX_Kn-BSWi0', NULL, NULL, NULL, 4, 5),
(650, NULL, 1, 'Name 5 for each.\r\nâ€¢	Canadians\r\nâ€¢	Chinese\r\nâ€¢	English\r\nâ€¢	Moroccans\r\nâ€¢	Germans\r\nâ€¢	Russians\r\nâ€¢	Japanese\r\n', '', 'Let\'s have fun!', 5, 'What typical things do you associate with these nations?', 1, 'https://drive.google.com/uc?export=view&id=1hII9gM0znei_xUoL19zV-t_ufEWJyzcn', NULL, NULL, NULL, 5, 5),
(652, NULL, 1, 'Is your teacher from England?\r\nAre you at home on holiday?\r\nAre you at work on Monday?\r\nWhen are you at home?\r\nDo you read a book? Is it interesting?\r\nIs China a big country?\r\nAre you Polish\r\nAre German people nice?\r\nIs your friend from Morocco?\r\nIs it a good idea to work on Sunday?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1igFCcUT7Ul5tbGkW12paQHcc2M8rEiDR', NULL, NULL, NULL, 3, 5),
(653, NULL, 1, '-I am English. \r\n-He is from Morocco. \r\n- We are Polish. \r\n-They are not German. \r\n- My friend is not from China.', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1cfvDkewF1hd_Zny4WLeQEoLuXwC9-5QY', NULL, NULL, NULL, 2, 5),
(654, NULL, 1, 'â€¢	I am from...\r\nâ€¢	I live in...\r\nâ€¢	My favourite country is...\r\nâ€¢	My favourite city is...\r\nâ€¢	My friend is from...\r\n', '', 'Describe what you see', 1, 'Finish the sentences', 1, 'https://drive.google.com/uc?export=view&id=1qgEdlNbaMujC4x4Ijlwbi6To03SL7Cm9', NULL, NULL, NULL, 1, 5),
(656, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/bRxgRzv7o3A', 4, 6),
(657, NULL, 1, '1.	How are you?\r\n2.	What country are you from?\r\n3.	Is your teacher fine?\r\n4.	Is your city big?\r\n5.	What is your email address?\r\n6.	Is your hobby interesting?\r\n7.	Is your friend old?\r\n8.     What is your favourite book?\r\n9.     Are you a student?\r\n10.   What is your favourite movie?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1_A8Bmmzo1Q4PgsAc8QE60liExm2rs3r/', NULL, NULL, NULL, 3, 6),
(655, NULL, 1, 'Monday\r\nOur\r\nRussian\r\nSpain\r\nJames Bond\r\nTitanic\r\nBulldog\r\nMilkshake\r\nTeenager\r\nflag\r\n', '', 'Let\'s have fun!', 5, 'Make up a catch story with the following words: ANos', 1, 'https://drive.google.com/uc?export=view&id=1oCJzsoLvus4pcxLJSjDZBq7VFNjL7ewY', NULL, NULL, NULL, 5, 6),
(660, NULL, 1, '\"Sesquipedalianism\' is a word which means that you like to use unusual words in conversation.\r\nHow many words can you make out of this word?\r\nYou have 2 minutes to do that. Then check the words with your teacher.\r\nThe loser has to say this as quickly as possible: A sailor went to the sea, to see what he could see, but all he could see was sea, sea, sea!\r\n', '', 'Let\'s have fun!', 5, 'How many you say ?', 1, 'https://drive.google.com/uc?export=view&id=1bglEy9XkbE9dN0tz6x84L0ajmkT0Hi68', NULL, NULL, '', 5, 7),
(661, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1yFpfHAA_9_vOIJodnq57D4p1miIxMzBj', NULL, NULL, '', 4, 7),
(658, NULL, 1, '-I am Moroccan. \r\n-He is from Italy. \r\n-we are Americans. \r\n-They are not German. \r\n-My friend is not from China. ', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=14si2tgSlonMtQ-0hz3el2vBMvuXRWfx9', NULL, NULL, '', 2, 6),
(659, NULL, 1, 'â€¢	Is your phone a product of Apple or Samsung?\r\nâ€¢	Which is better?\r\nâ€¢	Why?\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1VtCM0RWz0k_mScqTVZ9ReAEjeqlReTyY', NULL, NULL, NULL, 1, 6),
(665, NULL, 1, 'Personality test\r\nAre you energetic in the morning? Yes or no?\r\nYour walking is fast and energetic. Yes or no?\r\nWhen you talk to people, you cross your hands. Yes or no?\r\nWhen you are relaxed, you sit with hands crossed. Yes or no?\r\nIs red your favorite color? Yes or no?\r\nIn bed, you lie on your back. Yes or no?\r\nAt work or at school you try to sit far from people. Yes or no?\r\n', '', 'Let\'s have fun!', 5, 'Who are you?', 1, 'https://drive.google.com/uc?export=view&id=1WitBln9gi0rs77C8co98R-cIApPe2PgC', NULL, NULL, '', 5, 8),
(662, NULL, 1, 'Are you hard-working?\r\nIs work of an actress funny?\r\nIs it difficult to be a chief?\r\nAre people at your work young \r\nAre you happy?\r\nIs your friend single?\r\nIs a job of a computer programmer difficult\r\nAre you young or old?\r\nWhat famous actors are in your country?\r\nAre your friends funny?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1-33ozd2B-J7xCuD0vrO58xqGMbv0KFYx', NULL, NULL, '', 3, 7),
(664, NULL, 1, 'What do you think about the following quote:\r\nCooking is at once childâ€™s play and adult joy. And cooking done with core is an act of love. â€“ Graig Claiborne\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1-krnN1nIMQKRA9ukrob2hNJgMmio0Zzs', NULL, NULL, '', 1, 7),
(663, NULL, 1, 'Am I sad?\r\nIs he single? â€“ No, he is not.\r\nAre your friends funny? â€“ Yes, they are.\r\nAre they married\r\nIs his friend unemployed?\r\n', '', 'Study the information', 2, '', 1, NULL, NULL, NULL, '', 2, 7),
(667, NULL, 1, ' Are you sad when you get up early?\r\nAre you married or single?\r\nAre waiters and waitresses only young guys?\r\nAre old single people sad?\r\nIs it difficult to be a shop assistant?\r\nAre your parents retired?\r\nDo you think unemployed people are lazy?\r\nIs it a good thing to help old people?\r\nIs it true that it is warm in England?\r\nAre you a serious person?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1_ufoxGa-X837jy1gjzM9J_pJZFHwqhtT', NULL, NULL, '', 3, 8),
(669, NULL, 1, 'Ask me 5 questions about my friend.\r\nHeâ€™s just like the guy from the picture.\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1AtEsNurmKlJuZQYQ0CJCnvzPiwKAmZRa', NULL, NULL, '', 1, 8),
(670, NULL, 1, 'Two fathers and two sons walk into a candy store.\r\nThey each buy something for 50.50, but only spend 51.50.\r\nHow is that possible?\r\nDo you know any examples of riddles like this?\r\nIf so, tell them to your teacher.\r\n', '', 'Let\'s have fun!', 5, 'Prove that it\'s true.', 1, 'https://drive.google.com/uc?export=view&id=1ZJlM9pzlzVzPcJ7HmPpQDd5YSQ_X8DVx', NULL, NULL, '', 5, 9),
(666, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/a-qeFD0aWEg', 4, 8),
(668, NULL, 1, ' Am I sad?\r\nIs he single? â€“ No, he is not.\r\nAre your friends funny? â€“ Yes, they are.\r\nAre they married\r\nIs his friend unemployed?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1QbMpGQpgynZr64BIssFJDFTaCvCl1rGK', NULL, NULL, '', 2, 8),
(673, NULL, 1, 'He is a good friend.\r\nThey are both from big cities.\r\nTheir boys are very happy.\r\nMy friendsâ€™ parents are at work.\r\nIs he your motherâ€™s brother?\r\nThose boys are my friendâ€™s children.\r\nPeterâ€™s father is very kind.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1rva88C5Vl8SGKknSXzRGCo-MTjZ4hDrt', NULL, NULL, '', 2, 9),
(674, NULL, 1, 'What does this phrase mean: like father like son\r\nDo you agree? Why?\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1KNWvh86QK0PSOPUsBEmihnnwcBhQYv-p', NULL, NULL, '', 1, 9),
(675, NULL, 1, 'Who of your relatives will you take and why?\r\nWho is the first willing to go home? Why?\r\nWho is the last one to stay?\r\n', '', 'Let\'s have fun!', 5, 'You are going on a long boat trip around the world for 35 days. Talk about the list of things you take with you on the trip.', 1, 'https://drive.google.com/uc?export=view&id=1BNB2XZapFrE84uEh6J-QIHPHOHgNxsq1', NULL, NULL, '', 5, 10),
(671, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=15d6P2hN6UmFEAkrXG5txaRRJPPo1Pemv', NULL, NULL, '', 4, 9),
(672, NULL, 1, 'What is your mother\'s name?\r\nIs your mother kind?\r\nDo you have cousins?\r\nAre you angry when you are tired?\r\nIs it easy to be a good husband? Wife?\r\nAre your children small or big?\r\nAre your parents busy?\r\nAre your friends clever?\r\nWhy is it difficult to be teenagers\' parents?\r\nWhere do your relatives live?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1SIyY6EX_vrIH63fG0FGArlePWjtYFMZ2', NULL, NULL, '', 3, 9),
(678, NULL, 1, 'He is a good friend.\r\nThey are both from big cities.\r\nTheir boys are very happy.\r\nMy friendsâ€™ parents are at work.\r\nIs he your motherâ€™s brother?\r\nThose boys are my friendâ€™s children.\r\nPeterâ€™s father is very kind.\r\n', '', 'Study the information', 2, '', 1, NULL, NULL, NULL, '', 2, 10),
(676, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/DzlxG2B2neU', 4, 10),
(677, NULL, 0, '', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 10),
(681, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 11),
(680, NULL, 1, 'Is this the same picture or are they different?\r\nFind as many differences as possible there.\r\nWhat is the name of this tower?\r\nWhere is it?\r\nWhat do you know about it?\r\nIs it interesting to visit? Why?\r\n', '', 'Let\'s have fun!', 5, 'Active game', 0, '', NULL, NULL, '', 5, 11),
(679, NULL, 1, 'boy\r\nman\r\nfather\r\nfather-in-law\r\ngrandpa\r\nbrother\r\nbrother-in-law\r\n', '', 'Describe what you see', 1, 'What are the opposites for these words:', 1, 'https://drive.google.com/uc?export=view&id=1HpEnlsCFHJ426WLJa6VQHHH__jeYjJ4s', NULL, NULL, '', 1, 10),
(682, NULL, 1, 'Do you have any money in your purse?\r\nWhat is your favorite color of clothes?\r\nDo you always have some free time for your friends?\r\nDo you have an Arabic-English dictionary at home?\r\nDo you have any magazines?\r\nDo you have children?\r\nIs it easy for you to make friends?\r\nWhat is your favorite book?\r\nIs it easy to have a lot of friends?\r\nWhat are the colors of your country\'s flag?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 11),
(683, NULL, 1, 'I have a dictionary.\r\nWe have a newspaper.\r\nThey have some money.\r\nShe has a purse.\r\nYou have a lot of pictures.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 11),
(684, NULL, 1, 'What does it mean?.\r\nWhat letters are not pronounced?\r\n', 'Try to spell the word â€˜â€™strengthsâ€™â€™', 'Describe what you see', 1, 'Try to spell the word â€˜â€™strengthsâ€™â€™.', 0, '', NULL, NULL, '', 1, 11),
(685, NULL, 1, 'Never wash fruit before eating.\r\nDrink a lot of coffee for breakfast, lunch and dinner.\r\nEat a lot of cakes and you will be in a good mood.\r\nEat at least five eggs every day.\r\nEat some bread with any meal, for example with pasta.\r\n', '', 'Let\'s have fun!', 5, 'Do you agree with these phrases?', 1, 'https://drive.google.com/uc?export=view&id=1ZujKX4byMmIVM2HjDNAbx3XTZJAlCx8n', NULL, NULL, '', 5, 12),
(686, NULL, 0, '', '', 'Watch the video', 4, '', 1, NULL, NULL, NULL, '', 4, 12),
(687, NULL, 1, 'What do you usually read?\r\nWhat are your favorite books?\r\nDo you read newspapers?\r\nWhere do you get your news?\r\nDo you have a color that you don\'t like?\r\nDo you dream in color?\r\nWhat color is your bag?\r\nWhat time is it now?\r\nDo you have a lot of paperwork?\r\nDo you have anything the same as your teacher?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1GvMpakjX2Qpv8zG1o2TIeRQL75sqBuS2', NULL, NULL, '', 3, 12),
(688, NULL, 1, 'I have a dictionary.\r\nWe have a newspaper.\r\nThey have some money\r\nShe has a purse.\r\nYou have a lot of pictures.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1D3xr7HeHCo4WG-9YSe1rr-veBIllSaJ0', NULL, NULL, '', 2, 12),
(689, NULL, 1, 'What countries are in the picture?\r\nWhich do you choose?\r\nwhy?\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=12FxbpdLayEtJozgLAVRRSWceWpQS8etY', NULL, NULL, '', 1, 12),
(690, NULL, 1, 'Which is the best place to go â€“ mountains or the seaside?\r\nWhere do you go more often and why?\r\nWhere are the nearest mountains?\r\nWhere is the nearest seaside?\r\nWhere do most people in your country go and why?\r\nWhat other places are good for rest?\r\nWhere else would you go?\r\n', '', 'Let\'s have fun!', 4, 'Compare:', 1, 'https://drive.google.com/uc?export=view&id=1nTnN6MlS7t9IG0eFp_jeZ0qsjl5xHgjw', NULL, NULL, '', 5, 13),
(693, NULL, 1, 'I am totally right.\r\nShe was really hard-hearted then.\r\nWill they be wiser next time?\r\nHe is really polite all the time?\r\nWe were not so far yesterday.\r\n\r\nAre you a reliable person?-Yes, I am.\r\nWhy are they so reserved?\r\nShe will not be so chatty next time.\r\nWas it pleasant for them?\r\nHow long will he be honest with her?\r\n\r\n', '', 'Study the information', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1yA-2v2rYpHR44oMY1xKhbSvFy5Izp2m_', NULL, NULL, '', 2, 13),
(691, NULL, 1, '', '', 'Watch the video', 1, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/JGwWNGJdvx8', 4, 13),
(692, NULL, 1, 'How do you relax after work?\r\nDo you have any hobbies? Is there anything special about them?\r\nHow often do you have a vacation?\r\nWhat places would you do in those plates?\r\nWhere would you never go? Why?\r\nWould you like to try extreme sports?\r\nDo you have any vacation plans for this year? \r\n', '', 'Time to talk', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1X-wI8ouNRwdqTMerCdAJHsx6OrL4xBKi', NULL, NULL, '', 3, 13),
(697, NULL, 1, 'What do you think of solo traveling? Is it dangerous to travel alone?\r\nDo you like your trip to be fully organized by a travel agency?\r\nWhat do you think about backpacking?\r\nCan you imagine yourself to be a professional traveler?\r\nCan traveling be stressful?\r\nWhat is the most exotic destination that you are going to visit one day?\r\nWhat is the most dangerous place you are going to visit one day?\r\nAre you going to travel within your own country one day?\r\nWhich country can you recommend your parents to visit?\r\nIs it more interesting to live in another country?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 14),
(964, NULL, 1, 'Do you think a forest is a perfect place for these guys in the picture?\r\nWould you like to have some fun with these animals?\r\nWhat will you buy to a deer and a bear? And why?\r\nWhat can or can not you do in the wild?\r\nHow often do you spend time there?\r\nWhat is the best place in your city or town? And why?\r\nIs it better to hang around a city or have a picnic in a forest?\r\n', '', 'Let\'s have fun!', 5, 'Ideas:', 0, '', NULL, NULL, '', 5, 533),
(965, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 533),
(966, NULL, 1, 'Do you prefer city or country life? And why?\r\nShould you violate generally accepted rules?\r\nCan you boast of the roads in your country?\r\nWould you like to We in a skyscraper? And why?\r\nShould you observe etiquette in public places? And why?\r\nWhat\'s the best way to deal with traffic problems in a city?\r\nWhat\'s the best supermarket in your city? Do you visit it often?\r\nShould all people visit a church on Sunday? And why?\r\nDo you have to speak in a low voice in a museum? What for?\r\nShould you follow any orders no matter what it can cause?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 533),
(963, NULL, 1, 'How do you understand the following quote?\r\nâ€œA house is not a home unless it contains food and fire for the mind as well as the bodyâ€, Benjamin Franklin\r\n', '', 'Describe what you see', 1, 'Phrase:', 0, '', NULL, NULL, '', 1, 532),
(962, NULL, 1, 'Can this service help you?\r\nYou mustnâ€™t park your car on the sidewalk.\r\nThey should trust me.\r\n\r\n\r\n\r\n\r\nCould you repeat, please?\r\nIt may happen soon.\r\nYou should follow this rule.\r\nYou mustnâ€™t break the law.\r\nHe has to meet with him.\r\n\r\n\r\nBut you have to be at the dentist now!\r\nShe might study at school.\r\nShould I do it in the shop?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 532),
(959, NULL, 1, 'Describe what you see in the picture above.\r\nWhere can you eat sandwiches or hamburgers?\r\nAre you obsessed with fast food? And why?\r\nDo you often pig out on munchies? And why?\r\nWhat are the advantages of junk food?\r\nWhat are the disadvantages of junk food?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 532),
(960, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 532),
(961, NULL, 1, 'What are the benefits of visiting a theater?\r\nWhy is it better not to dress casually at the restaurant?\r\nIn what places can you not drink and smoke?\r\nWhat can you not do in the hospital? And why?\r\nShould all citizens always obey the laws?\r\nHow often did you visit the court? How was it?\r\nIf you want to eat cheap but tasty food where will you go?\r\nWhy must people be polite at the post office?\r\nWhat do you understand under the phrase: norms of behaviour?\r\nIs it romantic to go to the Oceanarium on a date?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 532),
(958, NULL, 1, 'What are your favourite sport activities?\r\nWhat is your favourite healthy food/ fast food?\r\nWhat parts of a human body do you find amazing?\r\nName something healthy and pleasant at the same time.\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 531),
(957, NULL, 1, 'You should lie down for a while.\r\nThey must prescribe some painkillers for you.\r\nMust I faint every time I see you?\r\nHe should not treat his patients with antibiotics.\r\nShould I injure him?\r\nShe must not operate on this boy.\r\nYou should not prescribe anything for him.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 531),
(956, NULL, 1, 'Do you sometimes take painkillers?\r\nDo you know people Me have overweight problems?\r\nHave you tried to be on a diet?\r\nDo you know how to give first aid?\r\nIs being a doctor the hardest job?\r\nDo you have friends who are obsessed with healthy lifestyle?\r\nShould people convince others to live healthier?\r\nWhat are the main health problems nowadays?\r\nDoes your country have a good healthcare?\r\nDo you know people who never get sick?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 531),
(955, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 531),
(954, NULL, 1, 'What is healthy?\r\nTalk about the advantages and disadvantages of:\r\nWine\r\nBurgers\r\nRiding a bicycle\r\nBeing deaf or blind\r\nBeing a doctor\r\nBeing a human\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 531),
(953, NULL, 1, 'What can you do with a crutch?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 530),
(952, NULL, 1, 'You should lie down for a while.\r\nThey must prescribe some painkillers for you.\r\nMust I faint every time I see you?\r\nHe should not treat his patients with antibiotics.\r\nShould I injure him?\r\nShe must not operate on this boy.\r\nYou should not prescribe anything for him.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 530),
(951, NULL, 1, ' Do you think a lot about your health?\r\nDo you often visit a doctor?\r\nHow often do you get sick?\r\nDid you have a fracture?\r\nDid you faint?\r\nIs it ok to feel din./ sometimes?\r\nShould young people take care of their health?\r\nIs smoking or drinking alcohol bad?\r\nDo you sometimes feel that the human body is very breakable?\r\nDo you know people who go to the doctor with every graze or bruise?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 530),
(950, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 530),
(949, NULL, 1, 'What do you see in the picture? Describe it.\r\nDo you know any cuttingâ€¢edge devices in the sphere of medicine? If so, tell about them.\r\nIn your opinion, will we be able to cure diseases that are now considered incurable in the near future? If so, which ones?\r\nWhat modem technologies can be implemented in the medicine in the nearest future? For example, how can 3D printers be used?\r\nDo you think that doctors could be replaced by robots in any ways or in whole someday? Explain your opinion.\r\nWhat advancement in the medicine would you really like to have in the next 10 years? Why?\r\nDo you think that doctors will have better work conditions in the future or the opposite? Why?\r\nWhat spheres of medicine could develop rapidly in the next 50 years? Why?\r\nDo you think that people will be able to transfer their consciousness into the digital form and thus gain some sort of immortality?\r\nWhich of the modem achievements can help us live longer now? How?\r\n', '', 'Let\'s have fun!', 5, 'Answer the following questions:', 0, '', NULL, NULL, '', 5, 530),
(948, NULL, 1, 'I have a new dog, help me choose the name for it!\r\n', '', 'Describe what you see', 1, 'Explain:', 0, '', NULL, NULL, '', 1, 529),
(947, NULL, 1, ' You may boost your product price soon.\r\nThey might not promote their idea.\r\nHe may not edit his article.\r\nShe may not have enough strength to resist a disease.\r\nMy mood might boost a little tomorrow.\r\nThe situation is dangerous, but he may survive.\r\nYou might evaluate everything from one viewpoint, but it is not true.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 529),
(945, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 529),
(946, NULL, 1, 'Which type of supplies is the most important?\r\nWhat types of green energy do you know?\r\nIs it important to safeguard the environment? Why?\r\nDo you believe that humanity will be able to build underwater cities in the future?\r\nWhat can we do to protect animal species?\r\nWhy do we need to upgrade the technologies used in the factories?\r\nHow can the rays of the Sun be good or harmful?\r\nWhat can people do to promote green energy and resist large oil and gas corporations?\r\nHow can gadgets be more user-friendly for elderly people?\r\nHow is technology useful for elderly people?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 529),
(944, NULL, 1, 'Read the reviews and guess what are they about\r\n\r\nI own a BLIP. It is the fastest BLIP that I have ever owned! The SUP is reliable and I feel very safe. It is nice to have a place to park and charge at the Mall - for free! It is nice to get in the SUP in the morning and see a new feature waiting to download - for free! I required three \"fixes- to the BUP that they managed to repair over the Internet, while I was sleeping... I\'m so happy to not need visits to a dealer. So user-friendly! This is my new obsession and now I promote it to everyone! I would recommend this BLIP to everyone.\r\nThere are lighter business BLIPS and systems with more processing power, but this BLIP offers the best balance between portability and usability on the market today. Whether you\'re a corporate IT manager, a worker bee in a cubicle or just an individual who needs to get work done at home or school, you\'ll benefit a great deal from this 14-inch BLIP\'s best-in-class keyboard, a wide array of ports and 17-plus hours of battery life.\r\nThis BLIP has two advantages: its DSLR-like design and 30x optical zoom. The image quality is good, but comparable to a smartphone. About that loom ... no iPhone will ever have a 30x optical zoomrtild smart BUPs are still very expensive. The BLIF\'s 5250 launch price is modest, all things considered, and we cald see parents bringing this to a child\'s soccer game or school play. The zoom will reach the stage even from the back row of the auditorium. Its design and weight make the BUP comfortable for holding and shooting for an extended time, and the buttons are all easy to access and press.\r\nThe BLIP tells the story of how the characters meet and fall in love, although it isn\'t some lovey-dovey story. Whilst it isn\'t laughing out loud funny, it is witty and thoughtful. The author makes you connect with Hazel and Augustus, and the BLIP really opens your eyes to the struggle of living with a disease. Hazel\'s relationship viith her parents is heartbreaking but extremely touching. It is a sad BLIP and it may make some tearful, but it is also a BLIP of joy and appreciation of life.\r\nWe stayed at the BLIP for 2 nights a few days before Christmas 2010 and it was everything I hoped it would be. Itâ€™s well located off the main square and the main Christmas markers and room we paid for (the attic loft deluxe) was probably the BLIP room Iâ€™ve ever stayed in. The overall dÃ©cor and feel of the BLIP were great and it served as an excellent base to explore base to explore Prague at Christmas time.\r\n\r\n\r\n', 'Keys\r\nTesla car\r\nLaptop\r\nCamera\r\nBook\r\nhotel', 'Let\'s have fun!', 5, 'Blip game:', 0, '', NULL, NULL, '', 5, 529),
(943, NULL, 1, 'Clock\r\nCastle\r\nFire\r\nMonster\r\nMoon\r\n', '', 'Describe what you see', 1, 'What may happen here? Invent a story using words:', 0, '', NULL, NULL, '', 1, 528),
(942, NULL, 1, 'you may boost your product price soon.\r\nThey might not promote their idea.\r\nHe may not edit his article.\r\nShe may not have enough strength to resist a disease.\r\nMy mood might boost a little tomorrow.\r\nThe situation is dangerous, but he may survive.\r\nYou might evaluate everything from one viewpoint, but it is not true.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 528),
(940, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 528),
(941, NULL, 1, 'What can you do better than other people?\r\nDo you think we can believe in the predictions of Nostradamus?\r\nWhat types of obsessions can people have?\r\nHow can we evaluate one\'s success?\r\nWhat may happen if we measure everyone\'s success only by money?\r\nWhat contribution is more important for humanity, technological or cultural?\r\nHow can we provide access to education for children all over the world?\r\nWhat could we do to promote environmental protection among people?\r\nWhat can a single person do to protect the environment?\r\nCould you name 3 things that may boost the popularity of reusable water bottles?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 528),
(938, NULL, 1, 'â€œthis is the real secret of life â€“ to be completely engaged with what you are doing in the here  and now. And instead of calling it work, realize it is playâ€ â€“ Alan Watts\r\n', '', 'Describe what you see', 1, 'Do you agree with the quote:', 0, '', NULL, NULL, '', 1, 527),
(939, NULL, 1, 'Lies or statistics?\r\nSounds travels 15 times faster through steel than through the air.\r\nIt takes six months to build a Rolls Roysâ€¦ and 13 hours to build a Toyota.\r\nMost babies are born in June and January.\r\n63% of pet owners sleep with their pets.\r\n46% of violence on TV occurs in cartoons.\r\nHot water is fighter than cold.\r\n\r\n', 'Keys:\r\nStatistics\r\nStatistics\r\nLies (September and October)\r\nStatistics\r\nStatistics\r\nLies (cold water is lighter) \r\n', 'Let\'s have fun!', 5, 'Quiz:', 0, '', NULL, NULL, '', 5, 528),
(937, NULL, 1, 'I can apply for any job in this city.\r\nHe could not fire that employee yesterday.\r\nWe cannot overcome such difficulties.\r\nCould you quit your work last year?\r\nThey could not deal with this supplier then.\r\nHow can you stand out from all those people?\r\nI could apply for this job but I didnâ€™t do that.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 527),
(934, NULL, 1, 'Why can pandas be kung fu heroes? Use these words to explain: overestimate, quit, stand out.\r\nWhy do pandas eat a lot? Can the kung fu panda quit eating?\r\nIs the kung fu panda unusual? How does this panda stand out?\r\nCan pandas do kung fu? Why does the panda have exercises?\r\nWould you like to be a hero like kung fu panda?\r\n', '', 'Let\'s have fun!', 5, 'Ideas:', 0, '', NULL, NULL, '', 5, 527),
(935, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 527),
(936, NULL, 1, 'Can you get any job if you are self-disciplined?\r\nCan you quit the job you don\'t like?\r\nWhat do you prefer, to have a shift work or flexible hours?\r\nwhat qualities should a person have to stand out?\r\nCan a psychologist help you to overcome your problems?\r\nWhen can you overestimate your knowledge?\r\nHow can a person get a promotion?\r\nWhen can a person have a sick leave?\r\nCould you work as a salesperson?\r\nIs it difficult to work as a vet?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 527),
(933, NULL, 1, 'With letter A\r\nWith letter C\r\nWith letter E\r\n\r\nExplain three words.\r\n', '', 'Describe what you see', 1, 'Names as many words that start:', 0, '', NULL, NULL, '', 1, 526),
(932, NULL, 1, 'I can apply for any job in this city.\r\nHe could not fire that employee yesterday.\r\nWe cannot overcome such difficulties.\r\nCould you quit your work last year?\r\nThey could not deal with this supplier then.\r\nHow can you stand out from all those people?\r\nI could apply for this job but I didnâ€™t do that.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 526),
(930, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 526),
(931, NULL, 1, 'Can you apply for any job in your city?\r\nDoes an insurance agent work flexible hours?\r\nWhat knowledge should a person have to become a good judge?\r\nWho is your favorite fashion designer? Why?\r\nWhat ambitions do you have?\r\nCan a director fire an employee if he doesn\'t accomplish the whole task?\r\nCan an accountant deal with selling goods?\r\nWho can negotiate with foreign clients?\r\nwhere can people earn a lot of money?\r\nCan you solve serious problems by yourself?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 526),
(929, NULL, 1, 'Describe the picture:\r\n       - Who are these people?\r\n       -How are they dressed?\r\n       -Where do you think they are?\r\n       -What are they doing?\r\n       -How do they feel?\r\n\r\nDo your colleagues and you sometimes have fun at work? If so, what do you do?\r\nWhy is it important to have fun at work once in a while?\r\nWhat ways to entertain yourself at the office do you know? Name at least 5.\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 526),
(928, NULL, 1, 'Give an example of a good magazine. Why do you think so?\r\nGive an example of a striking article heading. Why do think so?\r\nGive an example of a great TV presenter. Why do you think so?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 525);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(926, NULL, 1, 'Is it difficult to be a public person? Would you like to be one?\r\nDo you switch channels during commercials?\r\nDo mass media have a great impact on you?\r\nDo you have a favorite TV presenter? Who is it?\r\nDo you read any newspapers or magazines in English?\r\nDo you like watching videos of onâ€¢air bloopers? Can you retail some of them?\r\nDo striking headings attract your attention?\r\nWhat is the book with the most interesting plot?\r\nDo you always defend your point of view?\r\nDo you follow celebrity news in tabloids?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 525),
(927, NULL, 1, 'I was listening to crime news at that moment.\r\nI listened to crime news and then went to bed.\r\nWhile I was listening to crime news, she called me.\r\nI switched the channel 5 minutes ago.\r\nI was switching the channels all evening yesterday.\r\n\r\n\r\nWhen did you read that magazine?\r\nWhy were you reading that magazine from 10 am till midnight yesterday?\r\nShe used to watch game shows when she was a schoolgirl.\r\nWhile she was watching a game show her mother came home.\r\nThey saw a presenter and switched a TV set off.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 525),
(925, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 525),
(924, NULL, 1, 'The best and the worst news presenter.\r\nThe most striking and the most trivial movie plot.\r\nThe best and the worst magazine for women/men.\r\nThe most exciting and the most boring N show.\r\nThe funniest and the saddest blooper happened onair.\r\nThe first and the last article you read in English.\r\nThe most expected and the most unexpected recent news.\r\nThe most and the least influential TV channel.\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 525),
(923, NULL, 1, 'Start: I was flipping through a magazine and saw an interesting heading.\r\nFinish: that was a very amusing article.\r\n', '', 'Describe what you see', 1, 'Keep talking about', 0, '', NULL, NULL, '', 1, 524),
(922, NULL, 1, 'I was listening to crime news at that moment.\r\nI listened to crime news and then went to bed.\r\nWhile I was listening to crime news, she called me.\r\nI switched the channel 5 minutes ago.\r\nI was switching the channels all evening yesterday.\r\n\r\n\r\nWhen did you read that magazine?\r\nWhy were you reading that magazine from 10 am till midnight yesterday?\r\nShe used to watch game shows when she was a schoolgirl.\r\nWhile she was watching a game show her mother came home.\r\nThey saw a presenter and switched a TV set off.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 524),
(920, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 524),
(921, NULL, 1, 'Do you find commercials amusing or annoying?\r\nDo you watch cookery shows? If yes, do you try cooking the dishes shown there?\r\nWould you like to take part in a game show?\r\nDo you always read all the articles in newspapers and magazines or just flip through?\r\nWhat is the strangest gossip you\'ve ever heard?\r\nIs it important to keep up with the latest news?\r\nHow many TV channels do you have? How many of them do you watch?\r\nWhat is the best way to get information and news: television, newspapers, and magazines or the Internet?\r\nDo you easily believe all the gossips you hear?\r\nHave you ever placed your advertisements in newspapers or on the intemet?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 524),
(918, NULL, 1, 'Do you enjoy watching films in the cinema?\r\nDo you enjoy reading books?\r\nWhat do you find more interesting films or books?\r\nWhy?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 523),
(919, NULL, 1, 'What animals do you see in the picture?\r\nHow many monkeys do you see there?\r\nWhat are these animals doing?\r\nWhy do you think they are doing it?\r\nWhere does the action take place?\r\nWhat kind of product does this commercial advertise?\r\nDo you find this ad funny?\r\nDo you know any other creative ads with animals?\r\nHave you ever tried banana flavored milk? If so, did you like it?\r\n\r\n', '', 'Let\'s have fun!', 5, 'Have a look at this amusing ad and answer the questions:', 0, '', NULL, NULL, '', 5, 524),
(917, NULL, 1, ' I was acting all day yesterday.\r\nWere you filming that scene from 1 to 6 pm last Saturday?\r\nWhat were they recording at that time?\r\nHe was not rehearsing when I noticed him.\r\nShe was pretending to work all day yesterday.\r\nThey were not praising this actor at that moment.\r\nMy friend was recording his song when I called him.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 523),
(915, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 523),
(916, NULL, 1, ' What film genre is your favorite?\r\nWhat is your favorite film?\r\nWhat horror films did you watch?\r\nDo you like horror films?\r\nWhat science fiction films did you watch?\r\nDo you like science fiction films?\r\nWhat was the most shocking film that you watched in your life? \r\nIs it better to watch a film in original version with subtitles or dubbed?\r\nDo you know good documentaries?\r\nWhat is better silent films or films of today?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 523),
(914, NULL, 1, 'Try to convince him/her to invest in your idea. Make the story with the following words:\r\nhorror film\r\nmakeâ€¢up\r\npretend\r\nrecord\r\nscript\r\nshocking\r\nWhat is this film about?\r\nDescribe the main character.\r\nDescribe his goals.\r\nWho is the antagonist (evil character) in this film?\r\nWhat is the main conflict?\r\nHow does your film end?\r\n', '', 'Let\'s have fun!', 5, 'Sitgame:\r\nYou are a scriptwriter. You need to present your film idea to a producer. You know that the film producer invests his money into horror comedies. ', 0, '', NULL, NULL, '', 5, 523),
(913, NULL, 1, 'Here are some interesting facts about its name:\r\nAccording to the Oxford English Dictionary, the adjective la-la dates back to 7300 and it means \"so-so, not as good as it might be, poor.\r\nThe verb to la-la\" dates back to 1906 meaning. \"To sing or say the syllable la repeatedly, especially in place of the words or notes of a tune.\"\r\nThe expression \"La-La Land\" dates back only to 1979 when it either referred to Los Angeles (LA) or meant a state out of touch with reality.\r\n\r\nHave you watched this movie? If so, what do you think of it?\r\n', '', 'Describe what you see', 1, 'Have you ever wondered why La La land is called so?', 0, '', NULL, NULL, '', 1, 522),
(912, NULL, 1, 'I was acting all day yesterday.\r\nWere you filming that scene from 1 to 6 pm last Saturday?\r\nWhat were they recording at that time?\r\nHe was not rehearsing when I noticed him.\r\nShe was pretending to work all day yesterday.\r\nThey were not praising this actor at that moment.\r\nMy friend was recording his song when I called him.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 522),
(910, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 522),
(911, NULL, 1, 'Do you know any crime story?\r\nwhat do you think of crime stories?\r\nWhat is your favorite film character?\r\nWhich do you like more action movies or comedies?\r\nDo you remember any gripping films?\r\nWhat is the last film you saw?\r\nWhat film star would you like to meet one day?\r\nWhat is the most boring film genre?\r\nIs it important to you to watch films which were awarded?\r\nwhat are close-up scenes in films usually for?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 522),
(909, NULL, 1, 'Personality test\r\nYour friend is in trouble on the battlefield, are you going to save him? Yes or No?\r\nYour weapon in a battle is two swords. Yes or No?\r\nYour friend yells at you, and you did nothing wrong. Your start a fight. Yes or No?\r\nYour hair colour is black. Yes or No?\r\nYour commander orders you to retreat on the field of battle and you agree. Yes or No?\r\nAn evil commander asks you to join him on his quest of taking over the world. Yes or No?\r\n\r\n', 'More â€œYesâ€ answers. You are Prince Caspian from the â€œChronicles of Narniaâ€! You are a Narnian King who escaped an assassination attempt by your evil Uncle Miraz.\r\nMore â€œNoâ€ answers. You are Legolas Greenleaf from â€œLord of the Ringsâ€! You are an Elf whoâ€™s quiet, but loyal and an awesome fighter!', 'Let\'s have fun!', 5, 'Quiz', 0, '', NULL, NULL, '', 5, 522),
(833, NULL, 1, 'Ask me about personal traits a fire-fighter should have.\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=18o8CJDwtqzCETrjPtBwGbL32IsYIWBJF', NULL, NULL, '', 1, 41),
(832, NULL, 1, ' I am a journalist.\r\nHe is not friendly.\r\nThese guys are really friendly.\r\n\r\n\r\nDo you have any tea? â€“ Yes, I do.\r\nShe does not have many tomatoes.\r\nDo you have much work?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1RyVAYQVK5r3Ke6eQ-byQgTK3MZoZf4gP', NULL, NULL, '', 2, 41),
(831, NULL, 1, ' Do you like your work?\r\nWhat character traits does a perfect friend have?\r\nWhat qualities do you like in yourself?\r\nWhat qualities do you hate in yourself?\r\nWhat spheres do you have knowledge in?\r\nAre all musicians too easy-going?\r\nWhat people are boring in your opinion?\r\nAre you a tolerant person?\r\nIs it difficult to work as a nurse? Why?\r\nDo you have any police officers among your friends?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1rMUGWs6Hhrzv6A9wmdt0Bnwrp89OU2Lg', NULL, NULL, '', 3, 41),
(830, NULL, 1, 'Do you have a favorite singer or a band?\r\nWhat genre of music is your favorite one?\r\nWho do you think this guy is?\r\nHow often does your singer or your band perform?\r\nAre they (band) or is he/she famous?\r\nWhat style of music do they (or he/she) like(s)?\r\nHave you ever been to the concert of your favorite singer (band)?\r\nDoes he/she have a family?\r\n', '', 'Let\'s have fun!', 5, 'Favorite Music', 1, 'https://drive.google.com/uc?export=view&id=140cHKYd2G7h52InbbpPYHal3cZKyR_bF', NULL, NULL, '', 5, 41),
(829, NULL, 1, 'Name 5 words that describe a perfect flatmate.\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1U7j4nUjJYHhImiB5bPjLiS1RqQmv6-gu', NULL, NULL, '', 1, 40),
(828, NULL, 1, 'I am a journalist.\r\nHe is not friendly.\r\nThese guys are really friendly.\r\n\r\n\r\nDo you have any tea? â€“ Yes, I do.\r\nShe does not have many tomatoes.\r\nDo you have much work?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1cQaWpowTi73tHr6zSSy3Elkgx83jf8Gy', NULL, NULL, '', 2, 40),
(826, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/evWBRJxngXY', 4, 40),
(827, NULL, 1, ' Are you a confident person?\r\nWhere do you work/study?\r\nDo you spend much time at work/University?\r\nWhat motivates you to work well?\r\nAre you friendly?\r\nHow much time do you spend with your friends?\r\nAre your friends easy-going guys?\r\nDo you know any talented people? Who are they?\r\nDo you have any experience in computer science?\r\nWhat kind of person are you?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1f9SomunQwim89Gc0zp6jwPlBKXdcCyrE', NULL, NULL, '', 3, 40),
(825, NULL, 1, 'Which picture do you like the most? Why?\r\nChoose picture(s) that represent you.\r\nWhy do you think so?\r\nWhat are your main interests?\r\nWhat else could you do to relax?\r\n', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=1HGl7axkCywgPzAMG4GW6ByrIn_QhX-Hc', NULL, NULL, '', 5, 40),
(824, NULL, 1, 'Girl \r\nLike\r\nPiano\r\nPlay\r\nOften\r\n\r\n', '', 'Describe what you see', 1, 'Make a story using these words\r\n', 1, 'https://drive.google.com/uc?export=view&id=10iYYHCX_c0ELi1aHLXgxio3eHFy55mCS', NULL, NULL, '', 1, 39),
(823, NULL, 1, ' I do not like him.\r\nShe does not listen to her mother.\r\nWe do not usually dance with them.\r\nHe does not chat with me every day.\r\n\r\n\r\nDo you sometimes swim with her?\r\nDoes your chief ride a horse? â€“ No, he does not.\r\nDo they play this game every week? â€“ Yes, they do.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1qIiww5v0pnot-gCPxFAbzjm5hwz60UMP', NULL, NULL, '', 2, 39),
(821, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/hoyhPZDp3dE', 4, 39),
(822, NULL, 1, ' What do you usually do on holidays?\r\nWhat kind of music do you listen to?\r\nWhat musical instrument do you play?\r\nDoes anyone among your friends play the piano?\r\nWhat is your mom% favorite leisure activity?\r\nDo you think modern people have enough free time?\r\nDo you go to the theatre often?\r\nIs tennis a national sport in your country?\r\nWhy do people take yoga classes?\r\nDo you skate with your friends or alone? And why?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=18JS7fvHZ51nui-PEbIggRWkJr4FwltNt', NULL, NULL, '', 3, 39),
(820, NULL, 1, 'When was basketball first played?\r\nWhich nation invented chess?\r\nWhat year were the first modern Olympics held in Athens?\r\nWhich football player holds the record for the highest transfer figure in history?\r\nWhich country has won the Rugby World Cup the most amount of times?\r\nWhich male tennis player won Wimbledon five years consecutively from 2003.2007?\r\nWhich F1 driver holds the record for the most amount of races won?\r\nWhich swimmer holds the record for the most amount of wins?\r\nWho holds the 100m running record?\r\nWhich country did ballet originate in?\r\n', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=1rAFitcWjgb7w6u38hb4FcXn7WoZq8mJn', NULL, NULL, '', 5, 39),
(818, NULL, 1, 'I do not like him.\r\nShe does not listen to her mother.\r\nWe do not usually dance with them.\r\nHe does not chat with me every day.\r\n\r\n\r\nDo you sometimes swim with her?\r\nDoes your chief ride a horse? â€“ No, he does not.\r\nDo they play this game every week? â€“ Yes, they do.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1cXGNM8upTWCltQ76dzcMvSsPTG4Ou9Hn', NULL, NULL, '', 2, 38),
(819, NULL, 1, 'Do you know the answer to this riddle?\r\nThe eight of us go forth, not back to protect our king frim a foeâ€™s attack. What are we?\r\nDo you like playing chess?\r\nHow often do you do it?\r\n\r\n', 'Answer: pawns', 'Describe what you see', 1, 'Answer the questions below:', 1, 'https://drive.google.com/uc?export=view&id=12Ae1B_HuE-jH-cUx8EhXshBb1j_HhMJF', NULL, NULL, '', 1, 38),
(816, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/6NHkCRgmbUI', 4, 38),
(817, NULL, 1, 'What is your favorite kind of sport?\r\nHow do you usually spend your weekend?\r\nWhat do you like more: cinema or theater? Why?\r\nHow do you usually spend your breaks at work / at school?\r\nDoes your hobby bring you any money?\r\nWhat activities do you hate?\r\nHow do you usually spend time with your friends?\r\nDo you prefer riding a bicycle or driving a car? Why?\r\nWhat music do you like to listen to?\r\nWhat kinds of sports are the most popular in your country?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1VdSFfhEKoAU52gHxsspJMCRnVZ9LkUlK', NULL, NULL, '', 3, 38),
(813, NULL, 1, ' - I always sleep a lot. \r\n-You clean every day. \r\n-He usually cooks well. \r\n-We seldom wake up late. \r\n-They never relax at home. \r\n-We often watch movies. \r\n-My friend usually wakes up early.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=16jNzFDDnT8j_rW4hL6eawKWrMjTozSVr', NULL, NULL, '', 2, 37),
(814, NULL, 1, 'I hate to get up early becauseâ€¦\r\nI donâ€™t eat chocolate becauseâ€¦\r\nI like going shopping becauseâ€¦\r\nI play football becauseâ€¦\r\n', '', 'Describe what you see', 1, 'Explain why you do the following:', 1, 'https://drive.google.com/uc?export=view&id=1x8NjYOmnhcpLO36ciHo7W_I2t-gyau-y', NULL, NULL, '', 1, 37),
(815, NULL, 1, 'Bobby Bumhole bought a bat\r\nBobby Bumhole bought a ball\r\nWith his bar, Bob banged the ball\r\nBanged it bump against the wall\r\nBut so boldly Bobby banged it\r\nThat he burst his rubber ball.\r\n\"Boor cried Bobby Bumhole\r\nBad luck ball\r\nBad luck Bobby, bad luck ball\r\nNow to drown his many troubles\r\nBobby Bumhole\'s blowing bubbles.\r\n', '', 'Let\'s have fun!', 5, 'Simon says: \"Read this faster than me!\"', 1, '', NULL, NULL, 'https://drive.google.com/file/d/1ilHEavK-g_KRQT2nTagCGbJshb2mqYui/view?usp=sharing', 5, 38),
(811, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/tPDSjoCFd9k', 4, 37),
(812, NULL, 1, 'Do you like winter?\r\nDo you wake up early?\r\nWhat do you prefer: reading books or watching TV?\r\nDo you like to take a shower?\r\nDo you study or relax at the weekend?\r\nDo you wash up?\r\nWhat do you like to do in spring?\r\nDo you like to sleep a lot?\r\nWhat time do you start your work?\r\nWhat season is the best for you?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1X04Sms5CIkluXG8kfDE35QDfBO4U01pl', NULL, NULL, '', 3, 37),
(809, NULL, 1, 'Is the man in the picture strong?\r\nDoes the man in the picture think about the weather?\r\nWhat is the weather in this picture?\r\nIs the man dressed rationally?\r\nWhat else could the man wear?\r\n', '', 'Describe what you see', 1, '', 1, NULL, NULL, NULL, '', 1, 36),
(810, NULL, 1, 'Sleep\r\nWatch\r\nRelax\r\nWake up\r\nTake a shower\r\nGo to bed\r\nComb\r\nFor example:\r\nI go to blip every day. My blib is not far. I like my blip and the salary. The word blip is work.\r\n', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=1Mo5LLCwVPbJTLKY9fJ3tPAl3jQ49CHTV', NULL, NULL, '', 5, 37),
(806, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 36),
(807, NULL, 1, 'Do you usually trust the weather forecast?\r\nCan you predict what the weather will be like tomorrow?\r\nWhat is the coldest temperature that you remember in your region?\r\nWhat is the hottest temperature that you remember in your region?\r\nWhat is the most extreme weather that you remember in your region?\r\nWhere will you spend your next summer?\r\nDo you like when it rains or when it snows?\r\nWhat is your favorite season? Why?\r\nDo you like to have four seasons?\r\nWhich is the most beautiful season?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1oJd6C6y_sZaFal2hyCRYshgzsNf9s0IR', NULL, NULL, '', 3, 36),
(808, NULL, 1, 'I will be brave next time.\r\nIt will be sunny next week.\r\nWe will not be modest at the next lesson.\r\nWill it be foggy tomorrow? â€“ No, it will not.\r\nHe will not be stubborn next week.\r\nWill it be warm next weekend? â€“ Yes, it will.\r\nMy friend will be mysterious next time.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=18zOJ-Ow5CnF0QsbugVMBxfG5oL8ErqGs', NULL, NULL, '', 2, 36),
(801, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 35),
(802, NULL, 0, '', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 35),
(803, NULL, 1, 'koooolk\r\nsjnsnjs\r\nsdnhids\r\no', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 35),
(804, NULL, 0, '', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 35),
(805, NULL, 1, 'Weather forecast\r\nWet\r\nDetermined\r\nRational\r\nStubborn\r\n(Now try to tell it as if you are a host of a local TV-channel.)\r\n', '', 'Let\'s have fun!', 5, 'Sitgame\r\nMake a story with these pictures using the following words.', 1, 'https://drive.google.com/uc?export=view&id=1HSLBR9F9DZ5cRcyoXTmjD-HkEsCgvCfT', NULL, NULL, '', 5, 36),
(799, NULL, 1, 'Do you use an old but memorable cell phone or a new modern smartphone?\r\nWhich is better?\r\nWhy?\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1_CBb1oSOaNwwZ-dWa5WOrTXUtdDLVf0x', NULL, NULL, '', 1, 34),
(800, NULL, 0, '', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 35),
(798, NULL, 1, 'My laptop is lighter than yours.\r\nYour phone was slimmer than mine.\r\nThis application is more useful than that one.\r\nThat software was slowest of all.\r\nThis gadget is the most expensive of all.\r\nYour computer was more modern than mine.\r\nIs that printer the cheapest of all?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1xCIUC5qLlVVTnl0BF0_II7mPhLmPeyYo', NULL, NULL, '', 2, 34),
(796, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/1h3SS4XWxWg', 4, 34),
(797, NULL, 1, 'What is better - a keyboard or a touchscreen?\r\nDo you have a laptop or a PC?\r\nDoes every successful person have modern gadgets?\r\nDo you use out-of-date gadgets?\r\nDo you prefer listening to music in headphones or speakers?\r\nAre you an active social networks user?\r\nWhat social networks do you use?\r\nIs the size of your laptop / smartphone / tablet screen important to you?\r\nDo you prefer cheap gadgets or brand ones?\r\nCan you imagine your life without gadgets?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1R6tb1pH3Lqztqy_pMtqfRTmrwaGkSX4t', NULL, NULL, '', 3, 34),
(794, NULL, 1, 'when I want to listen to music I always use myâ€¦\r\nmy favourite computer games areâ€¦\r\nmy â€¦ always helps me stay in touch.\r\nI canâ€™t imagine my life without such gadgets as â€¦\r\nThese applications make my life easier â€¦\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1-l4dh6-01sjaDt_7oeIWK4J2BfvAYsu4', NULL, NULL, '', 1, 33),
(795, NULL, 1, '1)Why is it exclusive to have a â€¦\r\n    -MacBook Air\r\n    -Iphone S13\r\n    -A tablet with the keyboar\r\n    -Nokia 3310\r\n    -Blackberry\r\n    -A Linux operating system?\r\n2)What would you use?\r\n3)What would you never use?\r\n4)Do you know people who have these things?\r\n5)Is it important to you to have exclusive gadgets?\r\n', '', 'Let\'s have fun!', 5, 'Compare', 1, '', NULL, NULL, 'https://www.youtube.com/embed/1h3SS4XWxWg', 5, 34),
(793, NULL, 1, 'My laptop is lighter than yours.\r\nYour phone was slimmer than mine.\r\nThis application is more useful than that one.\r\nThat software was slowest of all.\r\nThis gadget is the most expensive of all.\r\nYour computer was more modern than mine.\r\nIs that printer the cheapest of all?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=10_dR2dd5sefB65i6iQN_AB0t-GDqiZo8', NULL, NULL, '', 2, 33),
(791, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1KXTQY_s38iD49Cl3aBL-5MCgjdD7j7Gx', NULL, NULL, '', 4, 33),
(792, NULL, 1, 'Is a desktop faster than a laptop?\r\nDo you prefer to use a digital camera or a mobile phone to take photos?\r\nWhat is more exciting - to watch a movie on a large screen at home or to go to the cinema?\r\nWhat is more useful - headphones or a printer?\r\nDo your parents use any gadgets? Which ones?\r\nWhat software do you usually use on your laptop?\r\nIs !Pod more attractive than gadgets of other brands?\r\nDo you use many applications on your smartphone?\r\nWhat do you do when your computer works slower than usually?\r\nDo you believe that gadgets of not so famous brands are even better?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1a0y16p4p-MA1CcNSjdYwwDGEpqLt-Yl7', NULL, NULL, '', 3, 33),
(790, NULL, 1, 'The first cell phones weighed ...\r\nWhat was written in the first text message ever sent?\r\nOver sixty percent of iPhone users say that they would rather ... than give up their precious phone.\r\nThe most popular category of smartphone apps is ...\r\neasy sells an item every ... via a smartphone.\r\nFacebook was created by...\r\nIn Japan, 90% of the phones are waterproof because...\r\n\r\n', '', 'Let\'s have fun!', 5, 'Quiz', 1, 'https://drive.google.com/uc?export=view&id=11PYHUvdRjvc8gCw_WtYNHUhZSKn8EOT0', NULL, NULL, '', 5, 33),
(788, NULL, 1, 'Was he famous 10 years ago? - No, he was not.\r\nWere they ordinary people? - No, they were not\r\nWas it surprising yesterday? - Yes, it was. â€”\r\nWas she great last Monday? - Yes, she was. \r\nWere they famous last year? - Yes, they were.\r\n\r\n\r\n\r\nWere you born in 1984? â€“ Yes, I was..\r\nI was born on 17 June.\r\nWere they there at 5 in the evening?\r\nWas he at home in May?\r\nWere your friends at the hotel at night?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1D1Fn89fQ-XaVowMFPC6kDRTWgjb_MtdK', NULL, NULL, '', 2, 32),
(789, NULL, 1, 'I have a birthday gift for you.\r\nAsk me 5 questions about it using Present Simple tense.\r\n', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=14asEeCAfyLlpAy1ZK_NQ6_b1LMuLmJh8', NULL, NULL, '', 1, 32),
(787, NULL, 1, 'How do you imagine a good leader?\r\nDo you like politicians? Why?\r\nIs it important to be popular? Why?\r\nHow often do you go to the parties?\r\nAre you a lucky person?\r\nIs it more important to be rich or lucky?\r\nWhat type of presents do you like to get?\r\nDo you like to give or to get presents more?\r\nWhat was the most surprising birthday present for you?\r\nHow do you imagine a perfect wedding?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1_A8Bmmzo1Q4PgsAc8QE60liExm2rs3-r', NULL, NULL, '', 3, 32),
(786, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/r-X9bJ4KMCA', 4, 32),
(784, NULL, 1, 'Please help us name all the most important holiday of the year.', '', 'Describe what you see', 1, '', 1, 'https://drive.google.com/uc?export=view&id=1-L5fI2iN0tE1piKp6Y73D_1o0bi7BNw-', NULL, NULL, '', 1, 31),
(785, NULL, 1, 'Chocolate egg\r\nSurprise\r\nFavourite\r\nLucky\r\nWish\r\nHappy\r\nGreat\r\nPopular\r\nFriends\r\nmemories\r\n', '', 'Let\'s have fun!', 5, 'You got a present for your birthday. What is inside? How do you feel about it?', 1, NULL, NULL, NULL, '', 5, 32),
(781, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1wwuSNgTghQxbSCETAfD4Je5NwrISunxP', NULL, NULL, '', 4, 31),
(782, NULL, 1, 'When were you last time at a wedding ceremony?\r\nWho was your favorite writer when you were a child?\r\nWhere were you last Christmas?\r\nDo you like giving presents?\r\nWere you with a friend on your last birthday?\r\nDo you make a wish on Christmas or on your birthday?\r\nWere you worried during your last exam?\r\nIs it a good thing to help poor people?\r\nWhen were you last time at a concert of a famous composer?\r\nWhat movies were popular last year? Do you remember?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1BRVinpLMgaT2dJ-CqLgXuVga1FlRyUb1', NULL, NULL, '', 3, 31),
(783, NULL, 1, 'Was he famous 10 years ago? - No, he was not.\r\nWere they ordinary people? - No, they were not\r\nWas it surprising yesterday? - Yes, it was. â€”\r\nWas she great last Monday? - Yes, she was. \r\nWere they famous last year? - Yes, they were.\r\n\r\nWere you born in 1984? â€“ Yes, I was..\r\nI was born on 17 June.\r\nWere they there at 5 in the evening?\r\nWas he at home in May?\r\nWere your friends at the hotel at night?\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1qAlZu_iNkNqx1S1aWo4gb_YkIofO3AHK', NULL, NULL, '', 2, 31),
(780, NULL, 1, 'Who are the ladies in the picture? Is it the same person or no?\r\nWhy were these mosaics made?\r\nHow old is the lady on the left?\r\nWhat do you know about her?\r\nWhy do people like her?', '', 'Let\'s have fun!', 5, 'Compare', 1, 'https://drive.google.com/uc?export=view&id=1Q9lDW8I72LjTnIQMMflF7uDDmMZc_uJW', NULL, NULL, '', 5, 31),
(778, NULL, 1, 'I was merry yesterday. \r\nShe was surprised yesterday.\r\nHe was not upset last Saturday. \r\nWe were not shocked 2 days ago. \r\nThey were not embarrassed yesterday. \r\nMy friend was scared last time. \r\nYou were not surprised yesterday.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1hPhyVE_FAGcaSAEkheAK_pVFZO5jkYis', NULL, NULL, '', 2, 30),
(779, NULL, 1, 'Was it your friend who scared you?\r\nDo you have any phobia? Are you a brave person in general?\r\nAre you afraid of the darkness?\r\n', '', 'Describe what you see', 1, 'Tell about the last time you were scared:', 1, 'https://drive.google.com/uc?export=view&id=1WCkwJpD_IYT0BneIo-HXCeOkELXip5b8', NULL, NULL, '', 1, 30),
(777, NULL, 1, 'When was the last time you were really shocked?\r\nDo you remember your first date?\r\nWhat are your worst memories from high school?\r\nWhat is your most vivid childhood memory?\r\nDo you remember everything that happened in your life?\r\nWhat do you feel when you go to the supermarket?\r\nTell about the last time you visited a restaurant with your family.\r\nWhat always makes you feel relaxed?\r\nAre you scared of crowded places?\r\nDid you have a dream that made you cry?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1o7Yq0L5KFczMp9v5V0s1L3GyuxcI9q9b', NULL, NULL, '', 3, 30),
(776, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/78bAU2HxvWM', 4, 30),
(774, NULL, 1, 'Confused\r\nExcited\r\ndisappointed\r\n', '', 'Describe what you see', 1, 'Tell about the last time you were:', 1, 'https://drive.google.com/uc?export=view&id=1uq4TF7dPqrwSIrk6yWvnqo8iiIYLvUHc', NULL, NULL, '', 1, 29),
(775, NULL, 1, 'Spider man, scared, shocked, chicken, Santa Claus, football, Superman, relaxed, rude, jazz\r\nAct the word out without speaking\r\nMake your teacher guess what the word is.\r\n', '', 'Let\'s have fun!', 5, 'Choose a word from the list below:', 1, 'https://drive.google.com/uc?export=view&id=14wpvTBQZrpp_ZgNYAK2hD-SeObl_dM5f', NULL, NULL, '', 5, 30),
(773, NULL, 1, 'I was merry yesterday.\r\nShe was surprised yesterday.\r\nHe was not upset last Saturday.\r\nWe were not shocked 2 days ago.\r\nThey were not embarrassed yesterday. \r\nMy friend was scared last time.\r\nYou were not surprised yesterday.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1HeAek8PkecJfS5hlu4WDSIgKjjbBqtFb', NULL, NULL, '', 2, 29),
(772, NULL, 1, 'Do you like birthday parties?\r\nTell about the last time you were surprised.\r\nAre you worried about your friends when they don\'t answer the messages?\r\nDo you prefer to talk to lively or calm people?\r\nWhat do you feel when you look at your child photos?\r\nWhen was the last time you were upset because of bad weather?\r\nDo you feel confused in a new situation or with new people?\r\nWhat make you feel proud?\r\nTell about the last time you were pleased with your work or project.\r\nAre you upset when you forget to do something?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1CpwDuCQvp5CKPVvzH_KysreV8eNk2OIL', NULL, NULL, '', 3, 29),
(770, NULL, 1, 'Here are 5 words: excited, crazy, party, Marrakesh, merry.', '', 'Let\'s have fun!', 5, 'Make a story using these words.\r\nSay â€˜â€™blipâ€™â€™ instead of these words.\r\nMake your teacher find them out.', 1, 'https://drive.google.com/uc?export=view&id=13w2elc_WYvx5goZ__22QS-k05-z0RVxm', NULL, NULL, '', 5, 29),
(771, NULL, 0, '', '', 'Watch the video', 4, '', 1, 'https://drive.google.com/uc?export=view&id=1dR0pVfhcOA9GTXRp6jdqgNvcLEj3R83S', NULL, NULL, '', 4, 29),
(768, NULL, 1, '- I always sleep a lot. \r\n-You clean every day. \r\n-He usually cooks well. \r\n-We seldom wake up late. \r\n-They never relax at home. \r\n-We often watch movies. \r\n-My friend usually wakes up early.\r\n', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1L-fpFNhzRi3Qc40A7O5yM9Qm7nSCpKMZ', NULL, NULL, '', 2, 28),
(769, NULL, 1, 'Leaves turn golden-brown in ...\r\nIn this season I can gather mushrooms in the ...\r\nIt often ... in autumn.\r\n... are covered with golden leaves.\r\n... fly to the warm places in autumn.\r\n', '', 'Describe what you see', 1, 'Complete the sentences:', 1, 'https://drive.google.com/uc?export=view&id=1gRMPXeVovVlrd79r8tAWz6OlZzTb3F9k', NULL, NULL, '', 1, 28),
(766, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/L31ExXwlsVc', 4, 28),
(767, NULL, 1, 'Do you usually get up early or late?\r\nWhat do you usually do after you get up?\r\nHow do you relax after your working day?\r\nDo you like to spend your weekends at home or outside?\r\nHow do you usually spend your breaks at office/school?\r\nWhat is your favorite season? Why?\r\nWhat housework do you usually do?\r\nAt what time do you usually go to bed?\r\nHow many times per day do you usually eat?\r\nDo you schedule your day?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=12tuYxw1qyNrpXKNshda95ChaRLxvMKwC', NULL, NULL, '', 3, 28),
(765, NULL, 1, 'Is it good to have a busy working day? Why?\r\nDescribe your busy working day.\r\nHow often do you have a relaxing day?\r\nHow do you spend it?\r\nWho do you spend it with?\r\nWhich is better: a relaxing day or a busy day? Why?\r\nWhen is a  busy day better and why?\r\n', '', 'Let\'s have fun!', 5, 'Busy Bee', 1, 'https://drive.google.com/uc?export=view&id=1kPDHKUXSwELHep1GMoTct5ze4x37TIUY', NULL, NULL, '', 5, 28),
(760, NULL, 1, 'Who do you think the people in the picture are?\r\nHow many people can you see there?\r\nAre they in a flat or in a house?\r\nDo they have any pets?\r\nFind as many differences as you can.\r\n', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=1wCMNP-jjh8T_cL_ndmJ_zY9z4BRPk7e0', NULL, NULL, '', 5, 27),
(761, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/DHEOF_rcND8', 4, 27),
(762, NULL, 1, 'What is your dream house?\r\nWhat unusual houses do you know?\r\nWhat rooms do you have?\r\nWhat does \"Home\" mean to you?\r\nWhat do you like - a city or a village?\r\nWhat do you like - a shower or a bath?\r\nIs private space important to you?\r\nWhat do you have in your kitchen?\r\nDo you like gardens?\r\nDo you like to decorate your flat/apartment?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1EtaHTz78MdnOf5DLv44hIsu5zjkFZvgM', NULL, NULL, '', 3, 27),
(763, NULL, 1, '-There is a chair in the room.\r\n-There is not any furniture in the house.\r\n-There are a lot of shelves on the wall.\r\n-Is there a sink in the kitchen?\r\n-Are there any tables in the house? - Yes, there are.\r\n-Is there any furniture in the house? - No, there is not.\r\n- Is there an armchair in the bedroom?', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1FSqPSvlLpbyPYuXF-hc2lqW1sWWUeDuP', NULL, NULL, '', 2, 27),
(764, NULL, 1, 'My home is not a place, it is people.\r\nCan you translate it into your language? Do you agree with it?\r\nAccording to this quote, where is your home?\r\n', '', 'Describe what you see', 1, 'Read this phrase:', 1, 'https://drive.google.com/uc?export=view&id=1bZy2smRgKU8NTst4b-5y3ZA0sDLQoE-i', NULL, NULL, '', 1, 27),
(758, NULL, 1, '- There is a chair in the room.\r\n-There is not any furniture in the house.\r\n-There are a lot of shelves on the wall.\r\n-Is there a sink in the kitchen?\r\n-Are there any tables in the house - Yes, there are.\r\n-Is there any furniture in the house? - No, there is not.\r\n- Is there an armchair in the bedroom?', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1OKmPckhZD0XXF7DK1fbAZQCRi-soCt_Y', NULL, NULL, '', 2, 26),
(759, NULL, 1, 'A sick sad mouse sits in the slightly fancy house.\r\n', '', 'Describe what you see', 1, 'Read the tongue twister as fast as you can. Can you translate it?', 1, 'https://drive.google.com/uc?export=view&id=1_fyHiHtt2WCfgSysEWxMK7raY-D84xrH', NULL, NULL, '', 1, 26),
(757, NULL, 1, 'Do you prefer living in a flat or in a private house? Why?\r\nHow often do you clean up your room?\r\nWhat wall color must there be in your room to make you feel comfortable in it?\r\nDo you believe that there are some methods to attract good luck to the house? Which ones do you know?\r\nDescribe the room of your best friend.\r\nDescribe your classroom/office.\r\nIs there anything you want to change in your room or house? What?\r\nDo you like your flat/house or do you want to move to another one?\r\nWhat is located near your house?\r\nAre there many people who live with you at your home? Who are they?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=13UygB3KaRHMn9GZd95xbW1Tld7SpOnmB', NULL, NULL, '', 3, 26),
(756, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 26),
(753, NULL, 1, 'I do not have an apple.\r\nShe does not have any bread. \r\nWe do not have any sugar.\r\nDo they have an orange?\r\nDo you have much salt? - Yes, we do.', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1AAD0Xg551jCUkiJscfC9uHpNrDftBNme', NULL, NULL, '', 2, 25),
(754, NULL, 1, 'Vegetables\r\nFruit\r\ndrink\r\n', '', 'Describe what you see', 1, 'Explain these words:', 1, 'https://drive.google.com/uc?export=view&id=1Fz6lj0xVTYCr7h5zuI1WfpVC1KOYxXGR', NULL, NULL, '', 1, 25),
(755, NULL, 1, 'What objects can you see in these pictures?\r\nWhich ones do you have in your flat or a house?\r\nWhich ones do you like the most & the least?\r\nWould you like to buy any of them?\r\nName all the objects for a kitchen.\r\nName all the objects for a bedroom.\r\nName all the objects for a living room.\r\n', '', 'Let\'s have fun!', 5, '', 1, 'https://drive.google.com/uc?export=view&id=1aKjpP6qWkeOlAPjr9fkWYq56-6PS1UIK', NULL, NULL, '', 5, 26),
(751, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/aKbIilKwJwg', 4, 25),
(752, NULL, 1, ' Do you like junk food?\r\nAre you a vegetarian?\r\nDo you usually have a big breakfast?\r\nDo you have dinner at least 4 hours before going to sleep?\r\nWhat drinks do you like?\r\nWhat snacks do you usually have?\r\nWhat do you like more: meat or vegetables?\r\nDo you often have something new for dinner?\r\nAre you happy when you have tasty food?\r\nWhat food do you want to have for breakfast?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1rio_N447nOzWOiwU_Ztl1g5EDMcGY7mt', NULL, NULL, '', 3, 25),
(748, NULL, 1, 'I do not have an apple.\r\nShe does not have any bread.  \r\nWe do not have any sugar.\r\n Do they have an orange?\r\n Do you have much salt? - Yes, we do.', '', 'Study the information', 2, '', 1, 'https://drive.google.com/uc?export=view&id=1TK_1o9EHZcQ94uIJyoe1U31tzeMd_bLP', NULL, NULL, '', 2, 24),
(749, NULL, 1, 'Never wash fruit before eating.\r\nDrink a lot of coffee for breakfast, lunch and dinner.\r\nEat a lot of cakes and you will be in a good mood.\r\nEat at least five eggs every day.\r\nEat some bread with any meal, for example with pasta.\r\n', '', 'Describe what you see', 1, 'Do you agree with these phrases?', 1, 'https://drive.google.com/uc?export=view&id=1wf7XyW8Ad3W7cTXV8plSYYMNlnXaZCGX', NULL, NULL, '', 1, 24),
(750, NULL, 1, 'The ancient Inca Indians used potatoes to measure time.\r\nThe word tomato comes from the Aztec word. It means \"fat water or \"fat thing\'.\r\nThere are about 300 different types of tea.\r\nLemons have more sugar than strawberries.\r\nPears had the nickname \"butter fruit\" in the 1700s because of their soft, buttery texture.\r\nChocolate was once used as currency.\r\nMcDonald\'s sells 75 hamburgers every second of every day.\r\nCucumber is made up of 96% water.\r\nAlmonds are actually a seed not a nut as we know it.\r\nDon\'t drop your pearls in vinegar â€” they\'ll melt.\r\n', '', 'Let\'s have fun!', 5, 'True or false? Try to guess and then check the answers below.', 1, 'https://drive.google.com/uc?export=view&id=12sht2OuojWWTGJwe1Im65LvpW3PR3VqS', NULL, NULL, '', 5, 25),
(747, NULL, 1, 'Is there any food you can\'t stand?\r\nWhat is the tastiest food for you?\r\nDo you prefer eating in restaurants or cooking on your own?\r\nAre you good at cooking?\r\nWhat dishes do you like to cook?\r\nHow many times per day do you usually eat?\r\nWhat kind of food is more important for you: healthy or tasty?\r\nWhat food is both healthy and tasty at the same time?\r\nWhat food would you recommend for those who are on a diet?\r\nThe cuisine of what country do you prefer?\r\n', '', 'Time to talk', 3, '', 1, 'https://drive.google.com/uc?export=view&id=1TUg8mcxzmbStjHBL9Y9wL4RjU9tfZT_i', NULL, NULL, '', 3, 24),
(746, NULL, 0, '', '', 'Watch the video', 4, '', 1, '', NULL, NULL, 'https://www.youtube.com/embed/pFzpDhyN0CY', 4, 24),
(744, NULL, 1, 'Make up 5 sentences about what your parents used to do for you when you were a kid.\r\nWhat are the best things each parent can give to their children?\r\nWould you like to become a child again for one day?\r\n', '', 'Describe what you see', 1, 'Do the following task:', 0, '', NULL, NULL, '', 1, 23),
(745, NULL, 1, 'What do you see in the picture?\r\nWhat is your favorite food?\r\nWhat is the least favorite food?\r\nWhat is in your fridge?\r\nWhat berries / fruit / vegetables can you see?\r\nWhat is your favorite breakfast?\r\n', '', 'Let\'s have fun!', 5, 'Talking about food ...', 1, 'https://drive.google.com/uc?export=view&id=1eD832PEZkubpJ2AVRKUEW_yt8dvd662I', NULL, NULL, '', 5, 24),
(743, NULL, 1, 'I used to look after my younger brother.\r\nHe used to go out with Mary when he was 17.\r\nWe didnâ€™t use to bring them up.\r\nDid you use to grow up fast? â€“Yes, I did.\r\nShe didnâ€™t use to fall in love with her classmates.\r\nThey used to enter her room without knocking.\r\nWhom did you use to go out with 2 years ago?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 23),
(741, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 23),
(742, NULL, 1, 'Did you dream about growing up faster when you were a child?\r\nWhat did you want to do as an adult?\r\nwas there anyone you looked up to in your childhood?\r\nDo you go out with your workmates in your free time?\r\nDo you plan to work when you retire?\r\nDo you think that military service is obligatory for men?\r\nHave you ever looked after a toddler? Did you find it difficult?\r\nWhat problems do the modern teenagers have?\r\nWhat problems did they use to have 20 years ago?\r\nWhat stage of life would you love to live once again? Why?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 23),
(739, NULL, 1, 'Tell about your very first day at school.\r\nHow old were you?\r\nDo you remember what your teacher said?\r\nDo you remember your classmates?\r\n', '', 'Describe what you see', 1, 'Tell:', 0, '', NULL, NULL, '', 1, 22),
(740, NULL, 1, 'a doctor\r\na bodyguard\r\na farmer\r\na physicist\r\na mechanic\r\nWho would you choose and why?\r\n', '', 'Let\'s have fun!', 5, 'You are going to a space mission to another planet, and you can take one more person with you. You can choose:', 0, '', NULL, NULL, '', 5, 23),
(738, NULL, 1, 'I used to look after my younger brother.\r\nHe used to go out with Mary when he was 17.\r\nWe didnâ€™t use to bring them up.\r\nDid you use to grow up fast? â€“Yes, I did.\r\nShe didnâ€™t use to fall in love with her classmates.\r\nThey used to enter her room without knocking.\r\nWhom did you use to go out with 2 years ago?\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 22),
(736, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 22),
(737, NULL, 1, 'Do you keep in touch with your first love?\r\nDo you think that the generation gap got bigger in the last 50 years? Why?\r\nDo you think it will get even bigger in the future? Why?\r\nWhich part of life is the best, childhood, adolescence or adulthood?\r\nDo you think that getting married is important? Why?\r\nDo you fall in love easily?\r\nAt what age is it better to have children?\r\nWhat is the first memory you have of your childhood?\r\nWhat do you remember about your school years?\r\nHow do you imagine yourself as an elderly person?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 22),
(733, NULL, 1, 'They argued seriously a month ago.\r\nWhy did you adopt such a difficult child then?\r\nShe forbade categorically calling her 2 years ago.\r\nI swore it yesterday and Iâ€™ll keep my word.\r\nThey didnâ€™t admit it to themselves last year.\r\nDid you deserve her love 10 years ago? â€“Yes, I did.\r\nMy friends adopted this boy legally a week ago.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 21),
(734, NULL, 1, 'Do you know these people?\r\nWhom would you like to have as a relative?\r\nWhy?\r\n', '', 'Describe what you see', 1, 'The choice:', 0, '', NULL, NULL, '', 1, 21),
(735, NULL, 1, 'being a newborn\r\nbeing a toddler\r\nbeing a kid\r\nbeing an adolescent\r\nbeing an adult\r\nbeing a senior\r\nfalling in love\r\ngetting married\r\ngetting divorced\r\nhaving/not having kids\r\n', '', 'Let\'s have fun!', 5, 'Good or bad?\r\nTell about the pros and cons of (name at least 3 for each):', 0, '', NULL, NULL, '', 5, 22),
(732, NULL, 1, 'What are the things you are grateful for in your life?\r\nHow can you define a decent person?\r\nWhat can make a family close-knit,\r\nDo you know a lot about your bloodline and ancestors?\r\nWhat is more important in a relationship: passion or respect?\r\nDo you agree that everyone deserves to be loved?\r\nAre misunderstandings between different generations inevitable?\r\nDo you consider volunteering in orphanages?\r\nDo you often imagine yourself a bride/groom?\r\nWhom do you consider your soulmate?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 21),
(731, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 21),
(730, NULL, 1, 'What do they have in common?\r\nDo you know these people?\r\nWhat are they famous for?\r\nDo you know anything about their personal life?\r\nHow many adopted children do they have?\r\nDo you know any other celebrities who adopted children?\r\nDo you know any ordinary people who adopted children?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 21),
(728, NULL, 1, 'They argued seriously a month ago.\r\nWhy did you adopt such a difficult child then?\r\nShe forbade categorically calling her 2 years ago.\r\nI swore it yesterday and Iâ€™ll keep my word.\r\nThey didnâ€™t admit it to themselves last year.\r\nDid you deserve her love 10 years ago? â€“Yes, I did.\r\nMy friends adopted this boy legally a week ago.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 20),
(729, NULL, 1, 'Mary Mac\'s mothers making Mary Mac merry me.\r\nMy motherâ€™s making me marry Mary Mac.\r\nWill I always be so merry when Mary\'s taking care of me?\r\nWill I always be so merry when I marry Mary Mac?\r\nElizabeth\'s birthday is on the third Thursday of this month.\r\nAnn and Andy\'s anniversary is in April.\r\nI have got a date at a quarter to eight, Iâ€™ll see you at the gate, so don\'t be late.\r\n', '', 'Describe what you see', 1, 'Tongue Twisters', 0, '', NULL, NULL, '', 1, 20),
(726, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 20),
(727, NULL, 1, 'Do you give any advice about relationships to others?\r\nWhat do you do when you miss somebody?\r\nWhat does a perfect relationship look like?\r\nDo you believe in soulmates?\r\nS. Where do you want to travel on your honeymoon?\r\nHow do you usually resolve misunderstandings?\r\nDo you often argue with your relatives? What are the reasons?\r\nWhat is the best way to say sorry?\r\nWhat do you think about child adoption?\r\nHow to build a positive relationship with a foster-son or daughter?', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 20),
(725, NULL, 1, 'ancestor (grandparents, bloodline, long ago)\r\nbride (groom, wedding, get married)\r\ncompetitor (competition, game, win)\r\nadopt (orphanage, adoption, birth parents)\r\ndecent (good, nice, kind)\r\n', '', 'Let\'s have fun!', 5, 'Give definitions without using the words in brackets.', 0, '', NULL, NULL, '', 5, 20),
(723, NULL, 1, 'It will probably motivate them to find a solution.\r\nI am going to stretch my muscles a little.\r\nHe is going to the gym in an hour.\r\nWe are going to work out hard.\r\nPerhaps, this medicine will prevent the spread of disease.\r\nAre they going to keep to a diet?\r\nIt wonâ€™t help them to keep fit.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 19),
(724, NULL, 1, 'Think about the things that can be HEALTHY?\r\nMention at least five things.\r\nIs it common knowledge or your personal opinion?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 19),
(721, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 19),
(722, NULL, 1, 'What do you do to prevent chronic diseases?\r\nDo you feel satisfied after hard training or after having kept the diet?\r\nWhat are the most suitable ways to keep fit at work?\r\nDo you monitor your weight?\r\nIs it possible to resist flu and cold in the wintertime?\r\nDo you stretch your muscles before or after training?\r\nIs walking good for your wellness?\r\nDo you think it is effective to work out a personal training plan?\r\nDo you know people who suffer from chronic diseases?\r\nIs it good to be watchful and to take care of your relatives health?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 19),
(719, NULL, 1, 'This time I want to spend my holidays in a healthy and active way. Wish me something encouraging!', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 18);
INSERT INTO `section` (`id`, `code`, `content`, `contenu`, `indication_prof`, `libelle`, `numero_order`, `questions`, `url`, `url_image`, `url_image2`, `url_image3`, `url_video`, `categorie_section`, `cours`) VALUES
(720, NULL, 1, 'Can anyone look healthier than a sports player? Probably, not. Be sure you know some facts about one of the most famous and rich football players. David Beckham\'s quiz - stain and enjoy.\r\nDavid Beckham has ... children.\r\nDavid makes hit ads for ... underwear.\r\nBeckham has more than ... tattoos.\r\nBeckham suffers from a psychological disease when everything needs to ...\r\nDavid is in FIFA\'s list of ... Worlds greatest players.\r\n\r\n', 'Keys:\r\n4\r\nH and m\r\n204\r\nBe strictly organised\r\n100\r\n', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 19),
(718, NULL, 1, 'It will probably motivate them to find a solution.\r\nI am going to stretch my muscles a little.\r\nHe is going to the gym in an hour.\r\nWe are going to work out hard.\r\nPerhaps, this medicine will prevent the spread of disease.\r\nAre they going to keep to a diet?\r\nIt wonâ€™t help them to keep fit.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 18),
(715, NULL, 1, '\r\n-Imagine your first day at work and you come wearing your favorite trainers. No one told you they had a dress code. And here\'s your boss coming!\r\n-Imagine you have tasty homemade cookies for lunch at work	seat next to your colleague and you totally forget she was keeping a diet!\r\n-Oh, no ... You spilled your morning coffee on a brand new suit ... The meeting is in just five minutes.\r\n-You borrowed a book about healthy lifestyle and forgot to give it back. You remembered about it only when you met a friend whom you owe the book to three months after.\r\n-You organized a party but you were not aware that some of the guests were strict vegetarians. The only thing to eat is salami pizza and maybe bbq...', '', 'Let\'s have fun!', 5, 'Some awkward situations you need to explain ... So ... lights on!', 0, '', NULL, NULL, '', 5, 18),
(716, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 18),
(717, NULL, 1, 'Are you starting any training program anytime soon?\r\nHow to motivate yourself to live a healthy lifestyle?\r\nWhat do you think about smoking?\r\nHow can you give up smoking?\r\nWhat do you think about a healthy dose of alcohol?\r\nDo you think that it is trendy to live a healthy lifestyle?\r\nCan stress be a part of a healthy lifestyle?\r\nHow can you reduce stress?\r\nAre you going on a diet anytime soon?\r\nHow many hours of sleep do you usually need?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 18),
(713, NULL, 1, 'I think this island will disappear soon.\r\nThere is no water. I will bring some.\r\nWatch out! People are going to destroy their planet.\r\nI am sure it wonâ€™t damage the river much.\r\nPlants will recycle domestic waste.\r\nWe are not going to contaminate the soil.\r\nDo you hear? They are going to cut down that forest.\r\n\r\n\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 17),
(714, NULL, 1, 'Whatâ€™s happening to forests in the world?\r\nWhat happens when we remove forests?\r\nWhat can we do to protect forests?\r\n', '', 'Describe what you see', 1, 'Answer the following questions:', 0, '', NULL, NULL, '', 1, 17),
(711, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 17),
(712, NULL, 1, 'What is the difference between ecology and environment?\r\nHow can you describe the state of our environment nowadays?\r\nWill it be better or worse in the next few years?\r\nWhat do you know about the greenhouse effect?\r\nDo you take part in making our environment better? How?\r\nDo you know people who do a lot to save our environment?\r\nDo you prefer to ride a bicycle or to drive a car?\r\nIs overpopulation a problem?\r\nDo you use alternative sources of energy or know people who use tern?\r\nAre you optimistic or pessimistic about the future of our planet?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 17),
(710, NULL, 1, 'What 5 items would you put in the spaceship capsule to tell aliens about our planet?Explain your choice.\r\nWhat would you show as the most magnificent thing?\r\nWhat would you show as the most horrible thing?\r\nHow can you show that you love your planet?\r\nWhat would you put to tell about human species?\r\nWhat would you put to tell about the fire and the air?\r\n', '', 'Let\'s have fun!', 5, 'Compare:', 0, '', NULL, NULL, '', 5, 17),
(709, NULL, 1, 'what do you see in the picture?\r\nHow does it help make the environment better?\r\nWhat other ways to save the environment do you know?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 16),
(706, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 16),
(707, NULL, 1, 'Do you think cars shouldn\'t be allowed in the city centers?\r\nwhat can be recycled?\r\nHow can people protect the environment in their everyday lives?\r\nWhat do you think about waste sorting?\r\nWhat types of pollution do you know?\r\nCan people change their behavior and become more environmentally friendly?\r\nWhy is it important to be environmentally friendly?\r\nHow often are environmental problems discussed in your community?\r\nWhat environmental problem is mostly discussed in media?\r\nIs it interesting to discuss environmental problems?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 16),
(708, NULL, 1, 'I think this island will disappear soon.\r\nThere is no water. I will bring some.\r\nWatch out! People are going to destroy their planet.\r\nI am sure it wonâ€™t damage the river much.\r\nPlants will recycle domestic waste.\r\nWe are not going to contaminate the soil.\r\nDo you hear? They are going to cut down that forest.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 16),
(705, NULL, 1, 'What do you see in the picture?\r\nWhat is going to happen?\r\nDo the dinosaurs seem happy about it?\r\nWhen you were a child, did you want to meet a real dinosaur?\r\nDo you know anything about the Ice age?\r\nDo you think that something like that may happen to our planet again?\r\n', '', 'Let\'s have fun!', 5, '', 0, '', NULL, NULL, '', 5, 16),
(704, NULL, 1, 'How do I keep my private things safe on a trip?\r\nWhat can I do in case of illness abroad?\r\nWhere should I go if I lose my way?\r\nWhen should I book a hotel?\r\nWhat kind of transport should I choose?\r\n', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 15),
(703, NULL, 1, ' I am going to book a guest house. Do you mind?\r\nWe are reaching the bay in an hour.\r\nHe is catching the train to Paris in 10 minutes. Here is his ticket.\r\nI am not leaving today. I donâ€™t have tickets.\r\nWe are going to pack a suitcase tonight.\r\nI am not going to stay at a hotel.\r\nMy friend is meeting me tomorrow at 8 a.m.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 15),
(702, NULL, 1, 'What places are you going to visit in summer?\r\nDo you usually pack big suitcases for your journey?\r\nWhy is it necessary to book a hotel in advance?\r\nWhat islands would you like to visit?\r\nWhat is the most convenient place to stay on a trip?\r\nWhy is it so important to have an insurance?\r\nIs it comfortable to stay in a sleeping bag?\r\nWhat are you going to do next week?\r\nWhat kind of transport do you prefer, a plane or a train?\r\nWill you keep on reaching goals in your life?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 15),
(699, NULL, 1, 'Don\'t book a hotel before going on a trip. It is always possible to find something cheaper just at the place.\r\nPack all your things and equipment into bright and expensive bags. Let all people think that you are rich.\r\nTake only cash on your trip. Don\'t use credit cards.\r\nTell your neighbours about the place of your destination. It is so interesting!\r\nPut your money, passport and tickets to the bottom of your backpack so nobody can steal them.\r\n', '', 'Describe what you see', 1, 'Do you agree with these tips?', 0, '', NULL, NULL, '', 1, 14),
(700, NULL, 1, 'In advance\r\nInsurance\r\nIsland\r\nJourney\r\nKeep on\r\nPlane\r\nreach\r\n\r\n', '', 'Let\'s have fun!', 5, 'Give definitions to the following words:\r\n', 0, '', NULL, NULL, '', 5, 15),
(701, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 15),
(698, NULL, 1, 'I am going to book a guest house. Do you mind?\r\nWe are reaching the bay in an hour.\r\nHe is catching the train to Paris in 10 minutes. Here is his ticket.\r\nI am not leaving today. I donâ€™t have tickets.\r\nWe are going to pack a suitcase tonight.\r\nI am not going to stay at a hotel.\r\nMy friend is meeting me tomorrow at 8 a.m.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 14),
(694, NULL, 1, 'Do you work remotely or at the office? Have you tried both ways?\r\nWhich is better â€“ working remotely or at the office? Name 3 reasons for thinking this or that way?\r\nDo you think you will change your future way of working\r\n', '', 'Describe what you see', 5, 'Way of working', 1, 'https://drive.google.com/uc?export=view&id=1vlLj0E9l_WhHLLroqB5PMPLlsfofKjHg', NULL, NULL, '', 1, 13),
(695, NULL, 1, 'In series two of The Island, the men manage to make fire using a lens from some glasses. As well as heat, which of elements is vital to creating fire?\r\nHow long can a person live without water?\r\nwhat should be your priority in a survival situation?\r\nHow long can a man live without food?\r\nIf you are lost in a jungle, what\'s your best chance of getting out?\r\nwhat\'s the most important thing you should do before you head out into the wild?\r\nIn a desert where are you most likely to find water?\r\n\r\n\r\n', 'Keys:\r\nFuel\r\n3 days\r\nShelter\r\nAbout a week\r\nFollow a stream or a river\r\nTell someone where you are going\r\nAt the bottom of a  canyon', 'Let\'s have fun!', 5, 'Quiz', 0, '', NULL, NULL, '', 5, 14),
(696, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 14),
(586, NULL, 1, 'Jane Eyre is the story of a young, orphaned girl that lives with her aunt and cousins (the Reeds) at Gateshead Hall. Like all nineteenth-century orphans, her situation pretty much sucks. Mrs. Reed hates Jane and allows her son John to torment the girl.\r\nMr. Earnshaw, a Yorkshire Farmer, and the owner of Wuthering Heights brings home an orphan from Liverpool. The boy is named Heathdlff and is raised with the Earnshaw children, Hindley and Catherine. Catherine loves Heathdiff, but Hindley hates him because Heathdiff has replaced Hindley in Mr. Earnshaw\'s affection.\r\n\r\nAnswer the following questions:\r\nWhat is more touching: \"Jane Eyre\" or \"Wuthering Heights\"? Why?\r\nIs the area of the story dealing with the main character particularly heart-rending?\r\nWhy is this romantic work considered to be the most powerful and self-assured one?\r\nWhich character in your opinion is much more versatile: Jane or Catherine? Why?\r\nWill this haunting piece of literature ever be forgotten? How do you think?\r\nIs the tragedy the elusive sense of happiness that haunts the pages and seems to slip by?\r\nIs it a story showing that love will force you to do anything to protect the one you care about?\r\nWhich author do you think is more talented: Charlotte Bronte or Emily Bronte? Why?\r\nWill it reduce you to tears if you\'ve never been emotionally drained after finishing a book? \r\nDo the words of this wonderful novelist echo deeply within the reader\'s heart? And why?\r\n', '', 'Let\'s have fun!', 5, 'The story', 0, '', NULL, NULL, '', 5, 664),
(587, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 664),
(588, NULL, 1, 'Do you think it\'s OK to tell a white lie?\r\nWere you read or told bedtime stories when you were a child?\r\nDoes to be a hero mean being the author of your own myth? And why?\r\nAre you good at making up stories?\r\nCan you tell jokes in English? Do you like English humor?\r\nDo you prefer to read real-life or fiction stories?\r\nIs everything you\'ve ever wanted on the other side of fear? And why?\r\nWill those who think it\'s permissible to tell white lies grow color-blind soon? Why?\r\nDo you agree that fairy tales are only for children?\r\nIf you had to write a book, what would it be about?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 664),
(589, NULL, 1, 'They were depicting that character yesterday.\r\nRealizing that he would become famous, he kept on telling his tales.\r\nI have just depicted everything that happened then.\r\nThey look quite shocked. So, why?\r\nI enjoy depicting different characters.\r\nSwimming is so pleasant.\r\nLook at those people swimming in the pool!\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 664),
(590, NULL, 1, 'Was this event hilarious enough to make you laugh to tears?\r\nDid this kind of experience make your existence brighter? \r\n', '', 'Describe what you see', 1, 'Tell about an amusing incident that occurred in your real life.', 0, '', NULL, NULL, '', 1, 664),
(591, NULL, 1, 'The only rule is that you can not give the actual answer to the question (if you know it)! You must create the most entertaining and original answer you can think of. The more outside-the-box you get, the better!\r\n\r\nQuestions:\r\n1 What is good?\r\nWhat is true love?\r\nWhy is the sky blue?\r\nWhat makes you you?\r\nWhich came first: chicken or egg?\r\n', '', 'Let\'s have fun!', 5, 'Tough questions.', 0, '', NULL, NULL, '', 5, 665),
(592, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 665),
(593, NULL, 1, ' Should you ever beg for something you can earn?\r\nCould you give an example of a fluke that happened to you?\r\nIs failure an opportunity to begin again, only this time more wisely? Why?\r\nDoes wickedness of the few make the calamity of many? Why?\r\nWinning once can be a fluke and winning twice proves you are the best. What do you think about that?\r\nWhy is indifference believed to be the dead weight of history?\r\nHave you ever noticed that people who don\'t believe in God believe in the evil eye?\r\nDo you agree that an accident won\'t arrive with a bell on its neck? Why?\r\nWould many troubles be avoided if we opened our hearts more?\r\nWhat is the most precious boon to humanity in your opinion?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 665),
(594, NULL, 1, 'I want you to meet with my friends.\r\nWe canâ€™t let him come without an invitation.\r\nI hate her to visit us!\r\nI know her to have graduated from the university three years ago.\r\nI saw him piling up the papers.\r\nI saw him pile up the papers.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 665),
(595, NULL, 1, 'Name five words that start with letter B.\r\n', '', 'Describe what you see', 1, 'Puzzle', 0, '', NULL, NULL, '', 1, 665),
(596, NULL, 1, 'Answer the questions written below:\r\n\r\nWhy does someone believe that there are 4 billion stars, but check when they say the paint is still wet?\r\nWhy does mineral water that has trickled through mountains for centuries have a use by date?\r\nIf a person owns a piece of land, do they own it all the way down to the center of the earth?\r\nYou can be overwhelmed and underwhelmed, but why can\'t you be simply whelmed?\r\nIf an orange is orange, why isn\'t a lime called \"a green\" or a lemon called \"a yellow\"?\r\nIf electricity comes from electrons, does morality come from morons?\r\nIf a word is misspelled in the dictionary, how would we ever know?\r\nWhy is there a light in the fridge but not in the freezer?\r\n', '', 'Let\'s have fun!', 5, 'Wonder and amazement', 0, '', NULL, NULL, '', 5, 666),
(597, NULL, 0, '', '', 'Watch the video', 4, '', 0, '', NULL, NULL, '', 4, 666),
(598, NULL, 1, ' Do we ail have enough strength to endure misfortunes of others? Why?\r\nHow could you interpret this quote: \"Rest is for the weary, sleep is for the dead\"?\r\nIs there no accident but purpose that we haven\'t understood yet?\r\nIf you have to beg someone to be in your life, does that mean they don\'t belong there?\r\nDo you agree that \"failure is a bruise, not a tattoo\"? Why?\r\nHow can you prepare yourself for an accident?\r\nHow do you understand the following phrase: \"Trouble never comes alone\"?\r\nDo you believe in bad luck?\r\nWhy is experience always said to be the only source of knowledge?\r\nWhen do you think you will overcome your fear of the future?\r\n', '', 'Time to talk', 3, '', 0, '', NULL, NULL, '', 3, 666),
(599, NULL, 1, 'I have met my friend lately.\r\nI want you to meet with my friends.\r\nI saw him pile up the papers.\r\nWe canâ€™t let him come without an invitation.\r\nI hate her to visit us!\r\nI know her to have graduated from the university three years ago.\r\nI saw him piling up the papers.\r\nI saw him pile up the papers.\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 666),
(600, NULL, 1, 'Tell me about the greatest fluke youâ€™ve ever had. \r\nWhen you have problems are you quick at solving them or does it take you some time to think of a solution?', '', 'Describe what you see', 1, '', 0, '', NULL, NULL, '', 1, 666),
(601, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 667),
(602, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 667),
(603, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 667),
(604, NULL, 1, 'she is said to adorn the hall and she is known to be seen by nobody.\r\nShe is said to be adorning the hall now.\r\nShe is said to have adorned the hall.\r\nShe is said to be adorning the hall.\r\nShe is expected to adorn the hall.\r\nShe seems to have adorned the hall.\r\nShe is likely to adorn the hall every year.\r\n\r\n', '', 'Study the information', 2, '', 0, '', NULL, NULL, '', 2, 667),
(605, NULL, 1, 'Skin care\r\nRejuvenate\r\nFragrance\r\nAdorn\r\nmassage\r\n', '', 'Describe what you see', 1, 'Make a catchy story with the help of these words:', 0, '', NULL, NULL, '', 1, 667),
(606, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 668),
(607, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 668),
(608, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 668),
(609, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 668),
(610, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 668),
(611, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 669),
(612, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 669),
(613, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 669),
(614, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 669),
(615, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 669),
(616, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 670),
(617, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 670),
(618, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 670),
(619, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 670),
(620, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 670),
(621, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 671),
(622, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 671),
(623, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 671),
(624, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 671),
(625, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 671),
(626, NULL, 1, '-	Our project has just been approved. Wow!\r\n-	By what moment will those words have been said tomorrow?\r\n-	After it had been stated, everything when wrong.\r\n', '', 'Study the information', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1adezuJ8HWfjW-81XPMaWYRLrSvgVLlSy', NULL, NULL, '', 1951, 641),
(627, NULL, 1, '-	At this very moment these words are being said.\r\n-	At the same moment yesterday the same words were being said.\r\n-	And tomorrow at the same time the same words will be said.\r\n', '', 'Study the information', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1tDBe258EpSR6MedK9j-nCn6GlxfzNlfn', NULL, NULL, '', 1952, 641),
(628, NULL, 1, 'Our project has just been approved. Wow!\r\nBy what moment will those words have been said tomorrow?\r\nAfter it had been stated, everything when wrong.\r\n\r\n\r\n\r\n', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1adezuJ8HWfjW-81XPMaWYRLrSvgVLlSy', NULL, NULL, '', 1951, 642),
(629, NULL, 1, 'fnfnnffn\r\nfjfjfjf\r\nfnffffff', '', 'nnnnnn', 5, '', 0, '', NULL, NULL, '', 1951, 627),
(630, NULL, 0, 'hhhhh\r\nrrrhhrbrbhrhbr\r\nngggggg', '', 'mima', 6, '', 0, '', NULL, NULL, '', 1952, 632),
(631, NULL, 1, 'At this very moment these words are being said.\r\nAt the same moment yesterday the same words were being said.\r\nAnd tomorrow at the same time the same words will be said.', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1tDBe258EpSR6MedK9j-nCn6GlxfzNlfn', NULL, NULL, '', 1952, 642),
(632, NULL, 1, 'The last hope had been already lost by August.\r\nThey were totally dirty yesterday evening because they had been repairing their motorbike.\r\nParents came late yesterday. Children had already fallen asleep.', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1uYKJR9qt4g8bu-5c5fHb77f-RC6hhvlv', NULL, NULL, '', 1951, 643),
(633, NULL, 1, 'The last hope had been already lost by August.\r\nThey were totally dirty yesterday evening because they had been repairing their motorbike.\r\nParents came late yesterday. Children had already fallen asleep.\r\n', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1uYKJR9qt4g8bu-5c5fHb77f-RC6hhvlv', NULL, NULL, '', 1951, 644),
(634, NULL, 1, 'We are starting a new project tomorrow.\r\nTheir train arrives at 6 p.m.\r\nOh, no! I am late for my train! Iâ€™ll take a taxi.\r\nI am going to change my work.\r\n', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1BJ38v5AHS8M4CuxIAdWtjj1Jrg4uxl_f', NULL, NULL, '', 1951, 651),
(635, NULL, 1, 'We are starting a new project tomorrow.\r\nTheir train arrives at 6 p.m.\r\nOh, no! I am late for my train! Iâ€™ll take a taxi.\r\nI am going to change my work.\r\n', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1BJ38v5AHS8M4CuxIAdWtjj1Jrg4uxl_f', NULL, NULL, '', 1951, 652),
(636, NULL, 1, 'Iâ€™d prefer to watch a movie in French today.\r\nWhat would you rather do today?\r\nWe would prefer not to work tomorrow.\r\nIâ€™d rather you paid more attention to grammar rules.\r\n', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1JT_XaqsNimyghAM_3r5trIm6lmtkTPRp', NULL, NULL, '', 1951, 659),
(637, NULL, 1, 'Iâ€™d prefer to watch a movie in French today.\r\nWhat would you rather do today?\r\nWe would prefer not to work tomorrow.\r\nIâ€™d rather you paid more attention to grammar rules.\r\n', '', '', 0, '', 1, 'https://drive.google.com/uc?export=view&id=1JT_XaqsNimyghAM_3r5trIm6lmtkTPRp', NULL, NULL, '', 1951, 660),
(638, NULL, 1, '- Kylie steeped in her science deeply, didnâ€™t she?\r\n\r\n- Your children often mess around, donâ€™t they?\r\n- You were not really able to memorize all those words, were you?', '', '', 0, '', 0, '', NULL, NULL, '', 1951, 599),
(639, NULL, 1, '- Kylie steeped in her science deeply, didnâ€™t she?\r\n- Your children often mess around, donâ€™t they?\r\n- You were not really able to memorize all those words, were you?', '', '', 0, '', 0, '', NULL, NULL, '', 1951, 600),
(2002, NULL, 0, NULL, NULL, 'Describe what you see', 1, NULL, 0, NULL, NULL, NULL, NULL, 1, 2001),
(2003, NULL, 0, NULL, NULL, 'Study the information', 2, NULL, 0, NULL, NULL, NULL, NULL, 2, 2001),
(2004, NULL, 0, NULL, NULL, 'Time to talk', 3, NULL, 0, NULL, NULL, NULL, NULL, 3, 2001),
(2005, NULL, 0, NULL, NULL, 'Watch the video', 4, NULL, 0, NULL, NULL, NULL, NULL, 4, 2001),
(2006, NULL, 0, NULL, NULL, 'Let\'s have fun!', 5, NULL, 0, NULL, NULL, NULL, NULL, 5, 2001),
(2007, NULL, 0, NULL, NULL, 'Study the information', 6, NULL, 0, NULL, NULL, NULL, NULL, 1951, 2001),
(2008, NULL, 0, NULL, NULL, 'Study the information', 7, NULL, 0, NULL, NULL, NULL, NULL, 1952, 2001),
(2009, NULL, 0, NULL, NULL, 'Vocabulary', 8, NULL, 0, NULL, NULL, NULL, NULL, 6, 2001);

-- --------------------------------------------------------

--
-- Table structure for table `section_item`
--

CREATE TABLE `section_item` (
  `id` bigint(20) NOT NULL,
  `example` varchar(255) DEFAULT NULL,
  `explanation` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `translation` varchar(255) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `section_item_synonyms`
--

CREATE TABLE `section_item_synonyms` (
  `section_item_id` bigint(20) NOT NULL,
  `synonyms` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `session_cours`
--

CREATE TABLE `session_cours` (
  `id` bigint(20) NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `etudiant` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `payer` varchar(255) DEFAULT NULL,
  `totalheure` int(11) NOT NULL,
  `cours` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `session_cours`
--

INSERT INTO `session_cours` (`id`, `date_fin`, `etudiant`, `prof`, `reference`, `payer`, `totalheure`, `cours`) VALUES
(2, '2021-06-29 14:30:00', 5, 3, 'c5', 'true', 0, NULL),
(1497, '2021-06-29 17:30:00', 5, 4, 'C3', 'true', 0, NULL),
(4488, '2021-11-08 21:27:42', 20, 3, 'QVIrYr', '0', 1, 566),
(4490, '2021-11-08 21:40:29', 20, 3, 'm7LOhK', '0', 1, 567),
(4493, '2021-11-08 21:43:45', 20, 3, 'HsgHCF', '0', 7, 101),
(4495, '2021-11-10 14:50:09', 22, 3, '8UVJcC', '0', 3, 101),
(4497, '2021-11-10 14:51:11', 20, 3, '2TbbiP', '0', 1, 2),
(4499, '2021-11-10 14:59:32', 21, 3, 'ySzBxD', '0', 8, 566),
(4501, '2021-11-10 15:05:52', 21, 3, 'bSu9UT', '0', 1, 599),
(4511, '2021-11-19 12:53:51', 20, 4, 'wLX8Sz', '0', 46, 101),
(4513, '2021-11-19 14:22:01', 22, 3, 'VXIfK5', '0', 6, 2),
(4515, '2021-11-19 20:11:45', 20, 4, 'fwUV71', '0', 9, 2),
(4520, '2021-11-20 21:19:52', 23, 4, 'nHM2Qo', '0', 1, 101),
(4522, '2021-11-20 21:27:05', 23, 4, 'mcxkas', '0', 1, 2),
(4546, '2021-11-24 18:44:31', 24, 3, 'caisBN', '0', 1, 101),
(4557, '2021-11-30 20:42:45', 26, 3, 'Ydz4Nb', '0', 3, 566),
(4568, '2021-12-01 17:40:03', 27, 4, 'JKI3SZ', '0', 1, 2),
(4572, '2021-12-01 17:47:49', 28, 3, '8IweTp', '0', 1, 2),
(4579, '2021-12-01 18:39:32', 30, 3, 'SqXlyp', '0', 1, 2),
(4586, '2021-12-01 19:29:33', 31, 3, 'TQp72D', '0', 1, 566);

-- --------------------------------------------------------

--
-- Table structure for table `super_categorie_section`
--

CREATE TABLE `super_categorie_section` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `super_categorie_section`
--

INSERT INTO `super_categorie_section` (`id`, `code`, `libelle`) VALUES
(159, 'Obligatory', 'Obligatory'),
(160, 'Additional', 'Additional');

-- --------------------------------------------------------

--
-- Table structure for table `tranche_horaire_prof`
--

CREATE TABLE `tranche_horaire_prof` (
  `id` bigint(20) NOT NULL,
  `horaire` datetime DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `type_de_question`
--

CREATE TABLE `type_de_question` (
  `id` bigint(20) NOT NULL,
  `lib` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_de_question`
--

INSERT INTO `type_de_question` (`id`, `lib`, `ref`) VALUES
(1, 'Choix unique', 't1'),
(2, 'Choix multiple', 't2'),
(3, 'input', 't3'),
(4, 'Correct the mistake', 't4'),
(5, 'On/Off', 't5'),
(6, 'Write the correct form', 't6');

-- --------------------------------------------------------

--
-- Table structure for table `type_home_work`
--

CREATE TABLE `type_home_work` (
  `id` bigint(20) NOT NULL,
  `lib` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `account_non_expired` bit(1) NOT NULL,
  `account_non_locked` bit(1) NOT NULL,
  `addresse` varchar(255) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `credentials_non_expired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `etat_etudiant_schedule` bigint(20) DEFAULT NULL,
  `parcours` bigint(20) DEFAULT NULL,
  `prof` bigint(20) DEFAULT NULL,
  `categorie_prof` bigint(20) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `group_option` varchar(255) DEFAULT NULL,
  `teacher_locality` varchar(255) DEFAULT NULL,
  `groupe_etude` bigint(20) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `date_naissance` datetime DEFAULT NULL,
  `level_max` bigint(20) DEFAULT NULL,
  `level_min` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`dtype`, `id`, `account_non_expired`, `account_non_locked`, `addresse`, `age`, `credentials_non_expired`, `enabled`, `image`, `nom`, `numero`, `password`, `prenom`, `username`, `ville`, `ref`, `etat_etudiant_schedule`, `parcours`, `prof`, `categorie_prof`, `role`, `group_option`, `teacher_locality`, `groupe_etude`, `country`, `date_naissance`, `level_max`, `level_min`) VALUES
('Admin', 1, b'1', b'1', 'marrakech', 23, b'1', b'1', 'http://localhost:8036/user/image/admin@gmail.com/admin@gmail.com.jpg', 'Elmoudene', '0605120314', '$2a$10$VW1CnG0HpYa5eiGikTlzQOWjAjwjA/ZptHA09uD.LlBE/HWc3YiqC', 'Youssef', 'admin@gmail.com', 'marrakech', NULL, NULL, NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 3, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/teacher@gmail.com/teacher@gmail.com.jpg', 'teacher', '0605120314', '$2a$10$xpy0yulabuTwf8ikJM8j5eM337f81aETiLSRSHsvPaHhDqyUh6bDm', 'teacher', 'teacher@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, 'TEACHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Prof', 4, b'1', b'1', 'Marrakech', 30, b'1', b'1', 'http://localhost:8036/user/image/prof@gmail.com/prof@gmail.com.jpg', 'prof', '0613203310', '$2a$10$I7o4zmXgcErHbiX91EPcW.rc2WPlecYuryGmfarBpHL/ZNyQDBRza', 'prof', 'prof@gmail.com', NULL, NULL, NULL, NULL, NULL, 1, 'TEACHER', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Admin', 7, b'1', b'1', 'Marrakech', 22, b'1', b'1', 'http://localhost:8036/user/image/zouani@gmail.com/zouani@gmail.com.jpg', 'Zouani', '0760102030', '$2a$10$G6z1mCKHaDMLUZv9RiK1/OwjvXfK4tnNm/DMA.Wsm7KEadi4GL/Ua', 'Younes', 'zouani@gmail.com', 'Marrakech', NULL, NULL, 5, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Admin', 9, b'1', b'1', '', 33, b'1', b'1', 'http://localhost:8036/user/image/profile/ahmed@gmail.com', 'amine', NULL, '$2a$10$9knjI8X01RKpgxgquqov..SS.o2KO4/wfDsV0oyuKfTiBV1h6nat2', 'ahmed', 'ahmed@gmail.com', 'marrakech', NULL, NULL, NULL, NULL, NULL, 'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 31, b'1', b'1', '', 24, b'1', b'1', 'http://localhost:8036/user/image/profile/zouhir@gmail.com', 'Zouhir', NULL, '$2a$10$IALJLp/ztOwiJXOWKUSgvehDRiHYxB37SDP8kMjlYjHNx8lU8qI3G', 'Zouhir', 'zouhir@gmail.com', 'Demnate', NULL, NULL, 6, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 14, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/farid@gmail.com', 'Farid', '0605120212', '$2a$10$P574lgbFf8gRTFQbTdv5ceKOkPVR/k9CuadgNjJ3ngliruQfG5Zcy', 'Soulaimane', 'farid@gmail.com', NULL, NULL, NULL, 5, NULL, NULL, 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 16, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/oumam@gmail.com', 'oumam', '0605120212', '$2a$10$Rrc2xinIeviYykr.0eEr4.XophNjT6m3vUj5cgnKDX0oNzqPH/upG', 'oumam', 'oumam@gmail.com', NULL, NULL, NULL, 6, NULL, NULL, 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 19, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/latifa@gmail.com', 'latifa', '06051202165', '$2a$10$gzMnpo1CzJ.RujMI90s7LeyHSW/9v68VE8znr.Z.JpftFD0PihG7.', 'latifa', 'latifa@gmail.com', NULL, NULL, NULL, 5, NULL, NULL, 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 20, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/hicham@gmail.com', 'hicham', '06051202165', '$2a$10$8N5urV.VTun.iikmxUlBQe6osQ8bEcIGSfLj2d7f8XbLuXuVI7zyO', 'hicham', 'hicham@gmail.com', NULL, NULL, 1, 5, 4, NULL, 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 21, b'1', b'1', 'qu saada', 22, b'1', b'1', 'http://localhost:8036/user/image/profile/aziz@gmail.com', 'Aziz', '06051202165', '$2a$10$s8xVzU9POmxogIOW2yJAKuE9JIsIwAXvdEpZuAOx6TqIalCvnQ62O', 'Aziz', 'aziz@gmail.com', 'marrakech', NULL, 1, 5, 4, NULL, 'STUDENT', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('Etudiant', 22, b'1', b'1', 'Qu saada', 15, b'1', b'1', 'http://localhost:8036/user/image/aicha@gmail.com/aicha@gmail.com.jpg', 'Aicha', '0760102030', '$2a$10$nFjjnXBtq429B3cfHm1DvuEOPRZvGJxGHvTiQLJYa3D0oFyVDggNS', 'Aicha', 'aicha@gmail.com', 'marrakech', NULL, 1, 5, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 23, b'1', b'1', 'Qu azilal', 23, b'1', b'1', 'http://localhost:8036/user/image/profile/ali2@gamil.com', 'Ali', '06051202165', '$2a$10$IsVaEsuXj8JBxbk3A38NNuEjNBoTAKDhKrcfMr4MURWoH4zmR3VN6', 'Ali', 'ali2@gamil.com', 'Casablanca', NULL, 1, 5, 4, NULL, 'STUDENT', NULL, 'non-native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 24, b'1', b'1', 'Marrakech', 23, b'1', b'1', 'http://localhost:8036/user/image/profile/mohemad@gmail.com', 'mohemad', '0605120314', '$2a$10$i0BlA7q.1P.djV6eNwy/NeVyFPNTRVb35/dqDs18HghMgoP.GIlqG', 'Mohemad', 'mohemad@gmail.com', 'Marrakech', NULL, NULL, 5, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 25, b'1', b'1', '', 23, b'1', b'1', 'http://localhost:8036/user/image/profile/saad@gmail.com', 'saad', '0605120314', '$2a$10$HW0BJWeruB9eEf/ZtiEx4uujH86E4gCyUzE8wAy.SDP9wa6kScwJ.', 'Saad', 'saad@gmail.com', NULL, NULL, 1, 5, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 26, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/elmoudene.ysf@gmail.com', 'anas', '0605120314', '$2a$10$FC1NX96EIdOVr90FeF6HLuffgU7aD.VllnHx2aQoVA65i0m08EcUK', 'anas', 'elmoudene.ysf@gmail.com', NULL, NULL, 2, 6, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 27, b'1', b'1', 'Qu saada', 23, b'1', b'1', 'http://localhost:8036/user/image/profile/charaf@gmail.com', 'charaf', '075030214', '$2a$10$WGui.FW7fnBhC0OlavM89OQRhR2UI1pknR2ZTp.rmb07KPXYhc7C2', 'Charaf', 'charaf@gmail.com', 'Marrakech', NULL, NULL, 5, 4, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 28, b'1', b'1', NULL, 23, b'1', b'1', 'http://localhost:8036/user/image/aya@gmail.com/aya@gmail.com.jpg', 'aya', '0730213040', '$2a$10$mgeXHKTfZFxvJKF/m2.tquHmTARN4pOepldVQW5c84Rha82aYyDkS', 'aya', 'aya@gmail.com', NULL, NULL, NULL, 5, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 30, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/fatima@gmail.com', 'Fatima', NULL, '$2a$10$na7TVhTlTCyVAkgxfv4WhepsaCf4AgA0AIgBUOB2k7DkUyDDjFiWu', 'Fatima', 'fatima@gmail.com', NULL, NULL, NULL, 5, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 32, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/wissal@gmail.com', 'Wissal', NULL, '$2a$10$jzizZlxVRSqG25X58EeJ6OZhsQBTjM9UqJyDxpd8QG5nzsnHqAVOO', 'Wissal', 'wissal@gmail.com', NULL, NULL, NULL, 601, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 33, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/naim@gmail.com', 'Naim', NULL, '$2a$10$8G.FN2jjMbEzH6skZs25YOl62Zwo6UQffBNAu36VnDUKoVci7CNVu', 'Naim', 'naim@gmail.com', NULL, NULL, 1, 601, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 34, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/etudiant10@gmail.com', 'etudiant10', NULL, '$2a$10$9MOeJv6mK6rrjK6b5olw9Ovk5bXBmG5V/E.9Lgbh3cwNeAGOZ7rgC', 'etudiant10', 'etudiant10@gmail.com', NULL, NULL, NULL, 7, NULL, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 35, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/student33@gmail.com', 'student33', NULL, '$2a$10$qlgTjJhBpGJA3QrG0QbUnu8O6RtM.asZv.zSHg/xYnFjK61rkEH.W', 'Student33', 'student33@gmail.com', NULL, NULL, NULL, 5, 3, NULL, 'STUDENT', NULL, 'native', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 36, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/student130@gmail.com', '130', NULL, '$2a$10$Nqx7pNPHkB.t6pOesdjUSutvfazJTQGpUmTsp84rU3GMR63TLQBTa', '130', 'student130@gmail.com', NULL, NULL, NULL, 5, 3, NULL, 'STUDENT', NULL, ' ', NULL, NULL, NULL, NULL, NULL),
('Etudiant', 38, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/wissam@gmail.com', 'Wisam', NULL, '$2a$10$MFKsFqY5diPUb8QOmPPuNeajSTLkyOTb19Dt7XGnhsE1jNLbngHs.', 'Wisam', 'wissam@gmail.com', NULL, NULL, NULL, 5, 3, NULL, 'STUDENT', NULL, 'native', 4608, NULL, NULL, NULL, NULL),
('Etudiant', 40, b'1', b'1', NULL, 0, b'1', b'1', 'http://localhost:8036/user/image/profile/haytam@gmail.com', 'Haytam', NULL, '$2a$10$Zvw0.jxYwO1MLq0azXKfOeiw4gEflJ5mvNHuyi.1n6oFMyBsc8Duu', 'Haytam', 'haytam@gmail.com', NULL, NULL, NULL, 5, NULL, NULL, 'STUDENT', NULL, 'native', 4598, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_authorities`
--

CREATE TABLE `user_authorities` (
  `user_id` bigint(20) NOT NULL,
  `authorities` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_authorities`
--

INSERT INTO `user_authorities` (`user_id`, `authorities`) VALUES
(1, 1),
(3, 2),
(4, 2),
(6, 1),
(7, 1),
(9, 1),
(10, 2),
(13, 3),
(14, 3),
(16, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(38, 3),
(40, 3);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary`
--

CREATE TABLE `vocabulary` (
  `id` bigint(20) NOT NULL,
  `exemple` varchar(255) DEFAULT NULL,
  `explication` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `numero` bigint(20) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `word` varchar(255) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL,
  `vocabulary_quiz` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `exemple`, `explication`, `image`, `libelle`, `numero`, `ref`, `result`, `word`, `section`, `vocabulary_quiz`) VALUES
(2013, 'The Tridge, Margaret Bridge, and Zanesville Y-Bridge are examples.', 'A bridge is a structure to cross an open space or gap. Bridges are mostly made for crossing rivers, valleys, or roads.', 'https://www.fujifilm.com/products/digital_cameras/x/fujifilm_x70/sample_images/img/index/ff_x70_001.JPG', 'Vocabulary', 1, NULL, 'pont', 'Bridge', 2009, NULL),
(2019, 'sky', 'sky', 'https://static0.makeuseofimages.com/wordpress/wp-content/uploads/2020/11/sky.jpg', 'Vocabulary', 2, NULL, 'ciel', 'sky', 2009, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vocabulary_quiz`
--

CREATE TABLE `vocabulary_quiz` (
  `id` bigint(20) NOT NULL,
  `date_debut` datetime DEFAULT NULL,
  `date_fin` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `ref` varchar(255) DEFAULT NULL,
  `section` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendrier_prof`
--
ALTER TABLE `calendrier_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKi7so9yqiiin2dlgsh4nmnc88n` (`etudiant`),
  ADD KEY `FK8t1h13u371f1lu6gnv1l9iwsc` (`prof`);

--
-- Indexes for table `categorie_prof`
--
ALTER TABLE `categorie_prof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorie_section`
--
ALTER TABLE `categorie_section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs2i33uovvd4y3woabq8sfjlgp` (`super_categorie_section`);

--
-- Indexes for table `centre`
--
ALTER TABLE `centre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_room`
--
ALTER TABLE `class_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcaf904devcnotnvh5b0mmwfun` (`responsable`);

--
-- Indexes for table `cours`
--
ALTER TABLE `cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKahy5hm3ry3u7lcli8yji618jg` (`parcours`);

--
-- Indexes for table `dictionary`
--
ALTER TABLE `dictionary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4tms350luhuxoebryvy10088q` (`etudiant`);

--
-- Indexes for table `etat_etudiant`
--
ALTER TABLE `etat_etudiant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etat_etudiant_schedule`
--
ALTER TABLE `etat_etudiant_schedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etat_inscription`
--
ALTER TABLE `etat_inscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `etudiant_class_room`
--
ALTER TABLE `etudiant_class_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK54fsex3niw1r6bkcyt1n675vb` (`class_room`),
  ADD KEY `FK3d01nrrqxw5wm8c4d91kwm3fb` (`etudiant`);

--
-- Indexes for table `etudiant_cours`
--
ALTER TABLE `etudiant_cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc3f41b9y8g7crpqi2c4v06qp4` (`cours`),
  ADD KEY `FK914gqjxacm4pywn3da2of1kew` (`etudiant`),
  ADD KEY `FK63au66ino6khx80t1cbu5chqy` (`prof`);

--
-- Indexes for table `etudiant_review`
--
ALTER TABLE `etudiant_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdr0kyfl32jlc1iaqyr23u0i04` (`cours`),
  ADD KEY `FK1a7o7vd2y5kcdcvhelbdmoqvs` (`etudiant`),
  ADD KEY `FKqppviphuugup0nt7w8n67epw2` (`prof`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKg74sm2isnspfjl2gpl40i1gso` (`faq_type`);

--
-- Indexes for table `faq_etudiant`
--
ALTER TABLE `faq_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK9q2pk1kj9ncii9ksxebjv7wb1` (`admin`),
  ADD KEY `FKbo9jbg90km8ilunjh2owo0ftr` (`etudiant`),
  ADD KEY `FK8jxblth3byvxeklwfkrmrtx1o` (`faq_type`);

--
-- Indexes for table `faq_prof`
--
ALTER TABLE `faq_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKif8a5hka3kb6bnhnhawtpib3d` (`admin`),
  ADD KEY `FKm826cdt7e3vuigwi2auwrgr2o` (`faq_type`),
  ADD KEY `FKjatrpp704ja5i48wu9keri7fk` (`prof`);

--
-- Indexes for table `faq_type`
--
ALTER TABLE `faq_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupe_etude`
--
ALTER TABLE `groupe_etude`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groupe_etude_detail`
--
ALTER TABLE `groupe_etude_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKkve19cdexl4uu1fvmlaptd4ho` (`groupe_etude`),
  ADD KEY `FKp4012piwlltdrdhm0mc0hsgcm` (`groupe_etudiant`);

--
-- Indexes for table `groupe_etudiant`
--
ALTER TABLE `groupe_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKf19chs324x9ei6t5rm3epx4cq` (`groupe_etude`),
  ADD KEY `FKhqi2kse6ips4np4365vovd3r6` (`parcours`);

--
-- Indexes for table `groupe_etudiant_detail`
--
ALTER TABLE `groupe_etudiant_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs3jgcu7ocfotdmdm0iamn6b0w` (`etudiant`),
  ADD KEY `FKr8x72lnitvm5qj1x0l5jyugbt` (`groupe_etudiant`);

--
-- Indexes for table `home_work`
--
ALTER TABLE `home_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKcumnorf9lmo9dls3sx83lx0ym` (`quiz`),
  ADD KEY `FKt0vvpipyv4uyy0iib2igtluuv` (`section`),
  ADD KEY `FKmfqby0657lm6a6mcjqj2149o1` (`type_home_work`);

--
-- Indexes for table `home_work_etudiant`
--
ALTER TABLE `home_work_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2rvrlfpgnlfvb80gh6hors0ve` (`home_wok`),
  ADD KEY `FKnnqkm6ntbixa3aj84nebt2k86` (`etudiant`),
  ADD KEY `FKr3i0bsg73lrefi35ywk6valqw` (`home_work`);

--
-- Indexes for table `home_work_question`
--
ALTER TABLE `home_work_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKq21dmbn2sge5l9nern356f6fi` (`home_work`),
  ADD KEY `FKtk8sx20ndjo2oddts9s16wubj` (`type_de_question`);

--
-- Indexes for table `howe_workqstreponse`
--
ALTER TABLE `howe_workqstreponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm6dp275n2n10d128khqj8mcn5` (`home_work_question`);

--
-- Indexes for table `inscription`
--
ALTER TABLE `inscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnrowvydlyvqhipcre6ib7ayg0` (`etat_inscription`),
  ADD KEY `FKalko793fl1gm06kwq53w1gynu` (`etudiant`),
  ADD KEY `FK1ha9gsbcjddy1otsy6djjg7iv` (`parcours`),
  ADD KEY `FKgovb2g7e2rj9l65r7wn940ncw` (`prof`),
  ADD KEY `FK27d0kprttulm0sukspipm7ptk` (`groupe_etude`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhsbxwhclxrtftfpmcb21g8l2a` (`prof`),
  ADD KEY `FKshgp14m0mgprb8yi2ckjtamhx` (`etudiant`);

--
-- Indexes for table `parcours`
--
ALTER TABLE `parcours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKiyl2cn0u3q67h7vfulrvjjp24` (`centre`);

--
-- Indexes for table `prof_review`
--
ALTER TABLE `prof_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKfgik1c9q13hbh95xxqxt6kytu` (`cours`),
  ADD KEY `FKtf5bipf3qksucegqg0lqjsjds` (`etudiant`),
  ADD KEY `FK2f9sfmlmyngxsqvgbrc201g4k` (`prof`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKn7rkdf65fl89m8jx2c174tdbk` (`quiz`),
  ADD KEY `FKt7dwbi0jnjsaligwd3c0sbvqw` (`home_work`),
  ADD KEY `FKp3btkmc3gy8byspbfyqn08ubb` (`type_de_question`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKlrxqh2l9ipwscnak06wbhbwvu` (`section`);

--
-- Indexes for table `quiz_class_room`
--
ALTER TABLE `quiz_class_room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbvd99dd8xgp1yh553tmqlf94f` (`class_room`),
  ADD KEY `FK1w7emn2oarcj5ps0ake025npf` (`quiz`);

--
-- Indexes for table `quiz_etudiant`
--
ALTER TABLE `quiz_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpbr7k0knoncjes50viijtt9wq` (`etudiant`),
  ADD KEY `FKi9bv4k6mvrn2a0gjv0aeo4oy8` (`quiz`);

--
-- Indexes for table `recommend_teacher`
--
ALTER TABLE `recommend_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs38jquidtn7mfy7lvunewsddq` (`prof`);

--
-- Indexes for table `reponse`
--
ALTER TABLE `reponse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqww17yrx5cgjbcu747lgre8ci` (`question`);

--
-- Indexes for table `reponse_etudiant`
--
ALTER TABLE `reponse_etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK611oipslqc88pa7j7yqqmf72u` (`question`),
  ADD KEY `FKrcx0v612xf6xx6wsml9mco2h3` (`quiz_etudiant`),
  ADD KEY `FK4hf80to4ievjjdq3bmfgdwxw9` (`reponse`);

--
-- Indexes for table `reponse_etudiant_home_work`
--
ALTER TABLE `reponse_etudiant_home_work`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnnjmqei727y0u1rivh1daltwb` (`home_work_etudiant`),
  ADD KEY `FKpu3oek5ey5wxyj6iqapie40vp` (`reponse`),
  ADD KEY `FKih7kkvtaxfxfnx8kn2nxpp8y6` (`question`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_vo`
--
ALTER TABLE `salary_vo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjab35b3k9y8sb3vx9iguqc4sl` (`prof`);

--
-- Indexes for table `schdedule_vo`
--
ALTER TABLE `schdedule_vo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKh6f0l379d8ux2nftdbu9cptgv` (`prof`);

--
-- Indexes for table `schedule_prof`
--
ALTER TABLE `schedule_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK33a7ip3jqbafu5joohmdklatc` (`cours`),
  ADD KEY `FK63y8jx726vtsw7oi7li4psr06` (`groupe_etudiant`),
  ADD KEY `FKnpixsixxies6sowxahl3ehaxu` (`prof`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4l9km6jtwxu2k6xvs9emco4nj` (`categorie_section`),
  ADD KEY `FKfosokbccblq4mj9g6mo2ktknw` (`cours`);

--
-- Indexes for table `section_item`
--
ALTER TABLE `section_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKplpthekfwb2ydh5ljftao632l` (`section`);

--
-- Indexes for table `section_item_synonyms`
--
ALTER TABLE `section_item_synonyms`
  ADD KEY `FKh7l5k0kf5o5klbittn1ilijnh` (`section_item_id`);

--
-- Indexes for table `session_cours`
--
ALTER TABLE `session_cours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmkxekot9u9gjl0ec71uehdmf9` (`etudiant`),
  ADD KEY `FK2wowlrciejqyofh6c1nrs830` (`prof`),
  ADD KEY `FKp2v3kulrxoryk626tr1n07v6n` (`cours`);

--
-- Indexes for table `super_categorie_section`
--
ALTER TABLE `super_categorie_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tranche_horaire_prof`
--
ALTER TABLE `tranche_horaire_prof`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgfj4fgstpvqmyeycqgrax2t3p` (`prof`);

--
-- Indexes for table `type_de_question`
--
ALTER TABLE `type_de_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_home_work`
--
ALTER TABLE `type_home_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKox5wi0gtjrgo3p55k09ox4u1b` (`etat_etudiant_schedule`),
  ADD KEY `FKimfpxj5uy18qyitn193rnpj3v` (`parcours`),
  ADD KEY `FKko8co8fj33bvbw3ms5364vmn3` (`prof`),
  ADD KEY `FKb1foe1690lcirh75bvap2lg3h` (`categorie_prof`),
  ADD KEY `FKc8bby2o7jdjj7pacpfpo2bj6r` (`groupe_etude`),
  ADD KEY `FK5ipus6t3o9ypd7kampo69elmu` (`level_max`),
  ADD KEY `FKher9dxxtkws9oy0n0uw9swvk9` (`level_min`);

--
-- Indexes for table `user_authorities`
--
ALTER TABLE `user_authorities`
  ADD KEY `FKbale5oulw5a18g5b5xqy1f6c6` (`authorities`),
  ADD KEY `FKmj13d0mnuj4cd8b6htotbf9mm` (`user_id`);

--
-- Indexes for table `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6jwsmbypn2jrlpro721bt3yv7` (`section`),
  ADD KEY `FKt0sehlna8nvvfd84w80tswuuu` (`vocabulary_quiz`);

--
-- Indexes for table `vocabulary_quiz`
--
ALTER TABLE `vocabulary_quiz`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKauyg1dqpr4evs5iylq9rf8j7h` (`section`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `parcours`
--
ALTER TABLE `parcours`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2022;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13506;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
