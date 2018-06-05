-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: businesses
-- ------------------------------------------------------
-- Server version	5.7.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Database: `cs340_barryj`
--

-- --------------------------------------------------------

--
-- Table structure for table `Consoles`
--

DROP TABLE IF EXISTS `Consoles`;
CREATE TABLE `Consoles` (
  `console` varchar(20) NOT NULL,
  `gameID` int(11) NOT NULL,
  `releaseDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Consoles`
--

INSERT INTO `Consoles` (`console`, `gameID`, `releaseDate`) VALUES
('Game Boy Advance', 11, '2001-09-10'),
('Game Boy Advance', 12, '2003-03-17'),
('GameCube', 1, '2003-02-18'),
('GameCube', 4, '2001-12-02'),
('GameCube', 10, '2002-08-26'),
('Microsoft Windows', 2, '2012-08-28'),
('Nintendo 3DS', 13, '2016-11-18'),
('Nintendo 3DS', 14, '2011-12-04'),
('Nintendo 64', 1, '1998-11-23'),
('Nintendo 64', 9, '1996-09-26'),
('Nintendo Switch', 8, '2017-10-27'),
('OS X', 2, '2012-08-28'),
('PlayStation 2', 3, '2008-11-18'),
('PlayStation 3', 3, '2008-12-09'),
('Wii', 3, '2008-11-18'),
('Wii', 4, '2009-03-09'),
('Wii U', 4, '2016-09-29'),
('Xbox 360', 3, '2008-11-20'),
('Xbox 360', 5, '2007-09-25'),
('Xbox 360', 6, '2012-11-06'),
('Xbox One', 6, '2012-11-06'),
('Xbox One', 7, '2015-10-27');

-- --------------------------------------------------------

--
-- Table structure for table `CriticReview`
--

DROP TABLE IF EXISTS `CriticReview`;
CREATE TABLE `CriticReview` (
  `url` varchar(200) NOT NULL,
  `gameID` int(11) NOT NULL,
  `websiteName` varchar(50) NOT NULL,
  `authorName` varchar(20) NOT NULL,
  `score` int(11) NOT NULL,
  `reviewContent` text NOT NULL,
  `datePosted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `CriticReview`
--

INSERT INTO `CriticReview` (`url`, `gameID`, `websiteName`, `authorName`, `score`, `reviewContent`, `datePosted`) VALUES
('http://www.ign.com/articles/1996/09/26/super-mario-64', 9, 'IGN', 'Doug Perry', 98, 'Nintendo 64\'s early flagship title demonstrates the power of the hardware as well as the creative genius of Miyamoto and team. Not only does the game obliterate every platformer before it in terms of visual finesse, it plays just as well if not infinitely better than previous 2D incarnations of the Mario franchise. 3D worlds are huge and cleverly laid-out so that there\'s never a dull moment. Secrets play a huge part of the experience, recapturing the classic gameplay style of the series. In fact, this game is exactly as one might hope it would be: Mario in 3D. More freedom, more space, more options, better graphics, improved and elaborated control schemes -- it\'s all there. Possibly the greatest videogame achievement ever. Don\'t rent. Buy.', '1996-09-25'),
('http://www.ign.com/articles/1998/11/26/the-legend-of-zelda-ocarina-of-time-review', 1, 'IGN', 'Peer Schneider', 96, 'A break-through title from Nintendo that deserves all the hype and praise it\'s gotten. The limited gold edition is just the icing on the cake. My highest possible recommendation.', '1998-11-25'),
('http://www.ign.com/articles/2001/09/10/advance-wars', 11, 'IGN', 'Craig Harris', 99, 'Advance Wars is as brilliant as they come on the Game Boy Advance. The game isn\'t this action-packed button-mashing thumb-buster on the system, but Advance Wars is incredibly intense and amazingly addictive...especially when you learn every little nuance of the game design. Single player mode is a challenge in itself, but when you get another player (or three) into the battlefield, that\'s when you see just how versatile the game design really is. The learning curve has been addressed with a well-designed and integrated tutorial mode that must be completed in order to gain access to the rest of the game.\r\n\r\nI hesitated giving this game a perfect 10, and decided to knock a single tenth of a point simply due to a problem in the link cable mode. Since it\'s turn-based, the players who are not involved sit and watch the player in charge making his move -- it would have been extremely helpful to add a function to let these players check on their troops during the move...especially when enemy forces are moving into their territory. In single player mode, the computer AI moves so fast that you wouldn\'t have much time to check your stats anyway...but when you\'re sitting idle after a turn, your mind should be working strategically, and to not have the ability to see your troops\' status is a bit annoying.\r\n\r\nBut that\'s really the only true complaint I can make about the game.\r\n\r\nAdvance Wars is an absolutely brilliant design, and a title that absolutely deserves a place in your Game Boy Advance collection. It will be amazing to see this series continue in the states, simply because the design is near perfect as it is. What could they possibly do to the game to make it better? ', '2001-09-01'),
('http://www.ign.com/articles/2001/12/03/pikmin', 4, 'IGN', 'Fran Mirabella III', 91, 'Pikmin is one of the most refreshing games to come out of Nintendo in a while. It\'s really great to see the company take a chance and try to conjure up a whole new franchise. Equally great is the gameplay style which blends exploration, puzzle solving, and intelligent boss fights.', '2001-12-03'),
('http://www.ign.com/articles/2002/08/22/super-mario-sunshine', 10, 'IGN', 'Fran Mirabella III', 94, 'This is my favorite single-player GameCube title to date. It\'s completely captivating from the start, and I can\'t rave enough about the tight controls. It just feels right. However, I am quite disappointed by the vacation theme and Nintendo\'s stubborness to pay attention to presentation. The story and character design especially is poorly executed. I think Nintendo finds making Peach into a total ditz and Mario into a fat goon amusing, but it feels pretty lame for those of us with some intelligence. If Nintendo truly didn\'t care about the story, then it shouldn\'t have even bothered to offer up the poorly done, compressed FMV sequences.\r\n\r\nAt the end of the day, though, Super Mario Sunshine is about gameplay. Its depth easily passes by all of the problems with presentation, sound, and visuals. If Super Mario 64 is one of your favorite games, then I\'m confident Super Mario Sunshine will be added to that list.\r\n\r\nGamers looking for a good adventure cannot go wrong. ', '2002-08-22'),
('http://www.ign.com/articles/2003/03/17/pokemon-ruby-version', 12, 'IGN', 'Craig Harris', 95, 'It doesn\'t matter what I say in this review, as Pokemon for the Game Boy Advance will, without a doubt, be a massive success. In fact, if you\'re reading this, I\'m willing to bet that either A) you already intend on picking up a copy, or B) you\'ve already picked up a copy of the game. I will have no problem going on record as saying that the GBA version of Pokemon will be the top-selling videogame released in 2003...for all systems. There\'s no doubt here that this game will sell like gangbusters.\r\n\r\nBut regardless of the fact that a Pokemon game is pretty much a license to print money, this is one of the most involved RPG titles released, and one hell of a ride on the Game Boy Advance. Nintendo took an already great design and made it better on the GBA, and while it\'s a bit more than a little disappointing to see a lack of focus in the graphics department, it\'s the sheer amount of \"stuff\" in the product that makes Pokemon for the Game Boy Advance a really, really great game. The adventure is incredibly long and involving, and even when the quest is over, the game isn\'t; players can still train and collect Pokemon to complete their collection, as well as take part in many multiplayer features through link cable networking.', '2003-03-17'),
('http://www.ign.com/articles/2007/09/25/halo-3-collectors-edition-review', 5, 'IGN', 'Hilary Goldstein ', 95, 'The campaign, which is very good, is Halo 3\'s weakest point. It doesn\'t capture the cavalier spirit of the original Halo, but you\'ll still have fun playing through it. There\'s no first-person shooter on 360 that can equal Halo 3\'s blend of cinematic action, adrenaline-pumping shootouts, and male- (and female)-bonding gameplay. Look beyond the gameplay and you have a rich feature set unlike anything ever delivered in a videogame. The Forge and the replay functionality raise the bar for console shooters so high, it may never be surpassed this generation. There will be plenty of aspects for fans to nitpick, but it\'s hard to argue against Halo 3 as the most complete game available on any console.', '2007-09-25'),
('http://www.ign.com/articles/2008/11/19/sonic-unleashed-review-3', 3, 'IGN', 'Matt Cassamasina', 72, 'As far as I\'m concerned, these stages are so well crafted, in fact, that die-hard Hedgehog fans can probably justify purchasing the title for the sunlit selection alone. Just resign yourself to trudging through the nighttime stages as penance for the daylight ones. Come on -- if you\'re a Sonic fan, you should be used to sacrifice and suffering by now, anyway.', '2008-11-18'),
('http://www.ign.com/articles/2011/11/29/mario-kart-7-review', 14, 'IGN', 'Audrey Drake', 90, 'Mario Kart 7 marks yet another return to Nintendo&#Array;s kart-racing franchise. Though the character roster should have been larger, and a cheap blue shell can still screw up an otherwise perfect race, MK7 still offers enough innovation to keep this old formula feeling fresh. With memorable new tracks, well implemented gyro controls, the triumphant return of coins and a handful of new modes, Mario Kart 7 is full of win. The game also marks a huge leap forward for Nintendo\'s approach to online multiplayer, providing an experience that surpasses any of the company&#Array;s other games to date. Overall it&#Array;s a well-polished experience that fans of the kart-racing genre - or of the Mushroom Kingdom - should not hesitate to pick up.', '2011-11-29'),
('http://www.ign.com/articles/2012/11/01/halo-4-review', 6, 'IGN', 'Ryan McCaffrey ', 98, 'Amazingly, Halo 4 is not only a success, but a bar-raising triumph for the entire first-person shooter genre. And just how new developer 343 Industries has done it will surprise, delight, and excite you. After soaking in the new game, I am beyond thrilled to be so in love with Halo again, more than I’ve been since Halo 2. Halo 4 is a masterstroke everyone can and should celebrate, and its two guaranteed sequels instantly make the next-generation Xbox a must-own system, with Halo 5 its most anticipated title. Halo has been rebuilt. It has been redefined. And it has been reinvigorated. The Xbox’s original king has returned to his rightful place on the throne.', '2012-11-01'),
('http://www.ign.com/articles/2015/10/26/halo-5-guardians-review', 7, 'IGN', 'Brian Albert', 90, 'In almost every way, Halo 5: Guardians is bigger than the already large and excellent games that came before it. Developer 343 Industries has engineered the strongest combat Halo has ever seen, with tons of excellent weapons, varied maps, an expansive and intense new multiplayer mode joining a host of returning greats, and some game-changing new mobility. At the same time, Guardians repeats Halo 4’s mistake of telling a story that can’t stand on its own without Halo’s expanded universe. This hurts, but doesn’t ruin, its otherwise impressive cooperative campaign. In its 14 years, Halo has never felt so good to play. An updated arsenal and great new mobility mechanics give both campaign and multiplayer and modern touch without sacrificing Halo’s classic feel. It fails to introduce its new Spartan characters in a meaningful way, and the story does make some odd logical leaps, but it’s still fast, beautiful, and fun – especially with four-player co-op. Guardians’ multiplayer harkens back to the Halo 2 glory days with tons of balanced maps and fun modes, and the tactical new Warzone mode absolutely steals the show.', '2015-10-26'),
('http://www.ign.com/articles/2016/11/15/pokemon-sun-and-moon-review', 13, 'IGN', 'Kallie Plagge', 90, 'After 20 years of slow but steady evolution, Pokemon gets a bit of a reinvention in Sun and Moon. An engrossing and rich new region makes the Alola journey — along with all the changes Sun and Moon make to the existing formula — enjoyable throughout the main adventure, and small interface and variety of upgrades along the way make a few of the things that stayed the same feel better than before. ', '2016-11-15'),
('http://www.ign.com/articles/2017/10/26/super-mario-odyssey-review', 8, 'IGN', 'Ryan McCaffrey', 100, 'I literally applauded as the end credits rolled on Super Mario Odyssey. I’d spent the last 15 hours with a giant grin on my face, and somehow the climax put the perfect surprising and delightful exclamation point on the plumber’s latest adventure. This is another brilliant redefinition of the very platforming genre he helped popularize 30 years ago.\r\n\r\nAnd best of all, even with the story complete, Odyssey has so much more fun to offer.\r\n\r\nMario’s games have been around for almost as long as game consoles have been a thing, but thankfully, he’s always evolving. We rarely get the same Mario twice. Super Mario Odyssey delivers on that ongoing promise of originality and innovation: It distills the venerable series’ joyful, irreverent world and characters and best-in-class platforming action, and introduces a steady stream of new and unexpected mechanics. It’s all spun together into a generational masterpiece.', '2017-10-26'),
('http://www.tentonhammer.com/articles/guild-wars-2-review', 2, 'Ten Ton Hammer', 'Karen Hertzberg', 94, 'When ArenaNet first released its MMO Manifesto we knew they were aiming for something revolutionary with Guild Wars 2. What we got is the first worthy successor to World of Warcraft.', '2012-08-28'),
('https://countzeroor.wordpress.com/2010/05/10/where-i-read-electronic-gaming-monthly-issue-113/', 1, 'Electronic Gaming Monthly', 'N/A', 100, 'An epic adventure that is among the best N64 games. [Jan 2004, p.189]', '2004-01-01'),
('https://web.archive.org/web/20000915231653/http://www.gamingmaxx.com/reviews/n64/lozeldmh.htm', 1, 'Gaming Maxx', 'Marques Hicks', 100, 'Legend of Zelda Ocarina of Time for the Nintendo 64 is nothing but pure 100% fun, challenging, and lengthy. Nintendo has put blood, sweat, and hours of hours of thinking. No more overhead 2D lands to explore, but now 3D-ish & interactive surfaces ranging from water, lava pits, to the sunny hot sand. There is no exception, that this 64-bit version contains HUGE bosses & some unexpected mini bosses. With a puzzling concept that will leave you puzzled for hours. ', '2000-09-14'),
('https://www.gamespot.com/reviews/pikmin-review/1900-2830241/', 4, 'GameSpot', 'Ricardo Torres', 86, 'Pikmin is likely to surprise gamers who have become comfortable with Nintendo\'s recent image as a cute factory. Nintendo\'s recent hits, most notably Pokémon, have ventured deep into \"cute and cuddly\" territory, but the company actually used to have a slightly dark streak, as evidenced by the Metroid games. With Pikmin, it looks as though Nintendo has managed to create a successful marriage of the two disparate elements. One part dark struggle for survival and one part cute fairy tale, Pikmin is an engaging game with the twisted charm found in a good Tim Burton movie. \r\nPikmin\'s story will put you in the role of the bald and bulbous-nosed Captain Olimar. After an asteroid hits his ship, the Dolphin, he\'s forced to crash-land on a strange planet. Assessing the damage, he realizes he\'s stuck--unless he recovers the pieces of his ship that broke off during the crash. To make matters worse, his space suit\'s life support will fail after 30 days. However, just when it looks like he\'ll be pulling a Tom Hanks in Cast Away without the happy ending, he stumbles upon some native life that may just save the day. Sprouts dispensed from a large onionlike creature yield small creatures that Olimar dubs \"Pikmin\" after a carrot from his homeworld. These little fellows seem quite taken with Olimar and do his bidding without question. His unlikely helpers in tow, Olimar sets out to rebuild his ship and get off the planet before his time runs out', '2001-12-05'),
('https://www.gamespot.com/reviews/sonic-unleashed-review/1900-6202926/', 3, 'GameSpot', 'Tom Mc Shea', 60, 'Every new Sonic release carries a hope that Sega\'s blue hedgehog will be able to regain the form that made him a star in the early \'90s. And most every venture into the third dimension has resulted in various degrees of failure. Sonic Unleashed was supposed to provide the unrelenting speed fans have been clamoring for, and it does finally offer a healthy dose of turbo-charged levels to burn through. Unfortunately, even with Sonic\'s trademark speed finally on full display, Unleashed lacks one very important element: fun. The imprecise platforming, absentminded camera, and poor level design make Sonic\'s levels an unplayable mess, while his baffling transformation into lumbering werehog comes with a whole new slew of problems. Put simply, there is no reason to play Sonic Unleashed. ', '2009-01-08');

--
-- Triggers `CriticReview`
--
DELIMITER $$
CREATE TRIGGER `calcCriticScoreAdd` AFTER INSERT ON `CriticReview` FOR EACH ROW BEGIN
UPDATE Games set overallCriticScore = ( 
    SELECT AVG(score) 
    from CriticReview 
    WHERE new.gameID = gameID
	) WHERE new.gameID = gameID; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calcCriticScoreDelete` AFTER DELETE ON `CriticReview` FOR EACH ROW BEGIN
UPDATE Games set overallCriticScore = ( 
    SELECT AVG(score) 
    from CriticReview 
    WHERE old.gameID = gameID
	) WHERE old.gameID = gameID; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calcCriticScoreUpdate` AFTER UPDATE ON `CriticReview` FOR EACH ROW BEGIN
UPDATE Games set overallCriticScore = ( 
    SELECT AVG(score) 
    from CriticReview 
    WHERE old.gameID = gameID
	) WHERE old.gameID = gameID; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Games`
--

DROP TABLE IF EXISTS `Games`;
CREATE TABLE `Games` (
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `gameName` varchar(40) NOT NULL,
  `esrb` varchar(5) NOT NULL,
  `description` text NOT NULL,
  `overallCriticScore` int(3) NOT NULL,
  `overallUserScore` int(3) NOT NULL,
  `imageURL` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=`;

--
-- Dumping data for table `Games`
--

DROP TABLE IF EXISTS `Games`;
INSERT INTO `Games` (`gameID`, `gameName`, `esrb`, `description`, `overallCriticScore`, `overallUserScore`, `imageURL`) VALUES
(1, 'The Legend of Zelda: Ocarina of Time', 'E', 'As a young boy, Link is tricked by Ganondorf, the King of the Gerudo Thieves. The evil human uses Link to gain access to the Sacred Realm, where he places his tainted hands on Triforce and transforms the beautiful Hyrulean landscape into a barren wasteland. Link is determined to fix the problems he helped to create, so with the help of Rauru he travels through time gathering the powers of the Seven Sages. [Nintendo]', 99, 52, 'https://i.imgur.com/me2KBMH.png'),
(2, 'Guild Wars 2', 'T', 'Guild Wars 2 draws from the game mechanics that made the original Guild Wars one of the most popular online games and adds a fully persistent world. Like its predecessors, Guild Wars 2 does not have a subscription fee. Guild Wars Eye of the North provides a Hall of Monuments where players\' accomplishments are memorialized and eventually inherited by their Guild Wars 2 characters, unlocking exclusive items and bonuses in Guild Wars 2. [NCSoft]', 94, 58, 'https://i.imgur.com/v2qFKiy.png'),
(3, 'Sonic Unleashed', 'E10+', 'Having been broken apart by the evil Dr. Eggman, it\'s up to Sonic to put the pieces of the world back together again by retrieving the power of the chaos emeralds! In doing so, Sonic finds himself in a race against time and faced with an unusual situation that challenge hims in ways never before seen. Both day and night play different, yet important, roles in Sonic\'s newest quest... as the sun sets, a new adventure awakens. By completing a wide variety of action-packed stages, spanning the seven broken continents of the world, gamers unleash Sonic’s amazing abilities to save the world, and himself! In addition to running at high speeds, which is highlighted in four new speed mechanics, combat fighting now becomes possible. New combat, movement, functional abilities and platforming are introduced to offer increased depth and variety. Sonic Unleashed offers a re-defined experience for fans and newcomers of the franchise alike by combing picturesque & detailed scenery, an expansive world with multiple paths to choose from and dynamic viewpoints for an immersive and renewed gaming atmosphere. Along with seamless 3D to classic 2D camera transitions, the game is built on a powerful, new proprietary \"Hedgehog Engine,\" which introduces impressive lighting abilities and new technology tailor made for Sonic’s new speed capabilities. [Sega]', 66, 59, 'https://i.imgur.com/3COEDyx.jpg'),
(4, 'Pikmin', 'E', 'Pikmin may be small and plantlike, but they can be a space traveler\'s best friend. Stranded on an unknown planet, Captain Olimar must enlist the help of these native Pikmin to rebuild his spaceship before the life-support system runs out. In the meantime, you\'ll have to fend off attackers and solve various puzzles. To produce additional multicolored Pikmin you must defeat enemies and carry them back to the Pikmin nests called onions. But beware--watching giant predators gobble your Pikmin might make you angrier than you\'d expect. [Nintendo]', 89, 53, 'https://i.imgur.com/cXddype.jpg'),
(5, 'Halo 3', 'M', 'Halo 3 is the third game in the Halo Trilogy and provides the thrilling conclusion to the events begun in \"Halo: Combat Evolved.\" Halo 3 picks up where \"Halo 2\" left off. The Master Chief is returning to Earth to finish the fight. The Covenant occupation of Earth has uncovered a massive and ancient object beneath the African sands - an object who\'s secrets have yet to be revealed. Earth\'s forces are battered and beaten. The Master Chief\'s AI companion Cortana is still trapped in the clutches of the Gravemind - a horrifying Flood intelligence, and a civil war is raging in the heart of the Covenant. This is how the world ends... [Bungie]', 96, 89, 'https://i.imgur.com/TmNg5K3.jpg'),
(6, 'Halo 4', 'M', 'Master Chief returns in Halo 4, part of a new trilogy in the colossal Halo universe.\r\n\r\nSet almost five years after the events of Halo 3, Halo 4 takes the series in a new direction and sets the stage for an epic new sci-fi saga, in which the Master Chief returns to confront his destiny and face an ancient evil that threatens the fate of the entire universe. Halo 4 also introduces a new multiplayer offering, called Halo Infinity Multiplayer, that builds off of the Halo franchise\'s rich multiplayer history. The hub of the Halo 4 multiplayer experience is the UNSC Infinity – the largest starship in the UNSC fleet that serves as the center of your Spartan career. Here you’ll build your custom Spartan-IV supersoldier, and progress your multiplayer career across all Halo 4 competitive and cooperative game modes. [IGN]', 98, 99, 'https://i.imgur.com/hAJt0qC.jpg'),
(7, 'Halo 5: Guardians', 'T', '343 Industries continues the legendary first-person shooter series with Halo 5: Guardians -- the first Halo title for the Xbox One gaming platform. Halo 5 featuresthe most ambitious campaign and multiplayer experience in franchise history, all running at 60 frames per second on dedicated servers.\r\n\r\nA mysterious and unstoppable force threatens the galaxy, the Master Chief is missing and his loyalty questioned. Experience the most dramatic Halo story to date through the eyes of the Master Chief and Blue Team, and Spartan Locke and Fireteam Osiris – in a 4-player cooperative epic that spans three worlds. Challenge friends and rivals in new multiplayer modes: Warzone (massive 24-player battles featuring AI enemies and allies,) and Arena (pure 4-vs-4 competitive combat.) [IGN]', 90, 100, 'https://i.imgur.com/ENI25VE.jpg'),
(8, 'Super Mario Odyssey', 'E10+', 'Join Mario on a massive, globe-trotting 3D adventure and use his incredible new abilities to collect Moons so you can power up your airship, the Odyssey, and rescue Princess Peach from Bowser\'s wedding plans! This sandbox-style 3D Mario adventure is packed with secrets and surprises, and with Mario\'s new moves like cap throw, cap jump, and capture, you\'ll have fun and exciting gameplay experiences unlike anything you\'ve enjoyed in a Mario game before. Get ready to be whisked away to strange and amazing places far from the Mushroom Kingdom! [IGN]', 100, 66, 'https://i.imgur.com/7CoVB9O.jpg'),
(9, 'Super Mario 64', 'E', 'Designer Shigeru Miyamoto\'s Mario sequel is considered by many to be one of the greatest videogames of all time. The title successfully proved that the famously polished, tried-and-true 2D play mechanics of the Super Mario Bros. series could be translated to 3D and, indeed, even in some cases improved upon. It also simultaneously helped define 3D gaming as a whole and pushed Nintendo\'s plumber mascot even further into the spotlight as one of the most recognizable figures in the games industry. Mario explores Princess Peach\'s castle and hunts for stars in a variety of differently themed stages. The platformer remains, even by today\'s harsh standards, a true masterpiece. [IGN]', 92, 52, 'https://i.imgur.com/8cUewic.jpg'),
(10, 'Super Mario Sunshine', 'E', 'Mario makes his debut on the Nintendo GameCube with Super Mario Sunshine. On a vacation away from the Mushroom Kingdom, Mario finds himself in a messy situation on the island of Delphino, where a Mario look alike has been causing all kinds of trouble. Explore huge 3D environments that range from a lush waterfall paradise, to an exciting amusement park complete with a rollercoaster you can ride. Mario makes use of a new water pack, which allows him to hover, launch, and rocket around levels, as well as spray enemies with. Mario has never had so many cool new moves, or looked so good in 3D. [IGN]', 94, 71, 'https://i.imgur.com/adDwclj.jpg'),
(11, 'Advance Wars', 'E', 'Just because this battle fits in the palm of your hand doesn\'t mean the stakes are small. On the contrary, this all-or-nothing fight will have you accessing guns, grenades, launchers, and weaponry of all sorts. Players assume command of an army that\'s out to reclaim a world that\'s been broken up by warring factions. The battle map is essentially a grid, and moving units is like moving chess pieces on a board -- each of the units can move a specific amount of spaces within this grid, and can only attack at a certain distance from specific enemies. Advance Wars features more than 115 maps, a map editor, head-to-head play via link cable, and an easy-to-understand tutorial mode for beginners. [IGN]', 99, 95, 'https://i.imgur.com/N7Bv8uo.jpg'),
(12, 'Pokemon Ruby', 'E', 'Nintendo\'s mega-popular monster-battling RPG is back with Pokemon Ruby and Pokemon Sapphire for the Game Boy Advance. These new Pokemon quests take players on a journey through Hoenn, where they can train, battle, trade and earn badges with a new set of Pokemon. Ruby and Sapphire offer over 100 new Pokemon, and completely overhauled graphics, thanks to the power of the Game Boy Advance. A new two-on-two battle system raises the level of strategy and excitement, as a single player can simultaneously battle two Pokemon. Multiplayer options have also been expanded as two players can battle against each other with two Pokemon each, as well as a new four-player battle mode. [IGN]', 95, 95, 'https://i.imgur.com/R6uF933.jpg'),
(13, 'Pokemon Sun', 'E', 'In the Pokémon Sun and Pokémon Moon games, embark on an adventure as a Pokémon Trainer and catch, battle and trade all-new Pokémon on the tropical islands of the Alola Region. Engage in intense battles, and unleash new powerful moves. Discover and interact with Pokémon while training and connecting with your Pokémon to become the Pokémon Champion! [IGN]', 90, 43, 'https://i.imgur.com/1uBmPLu.jpg'),
(14, 'Mario Kart 7', 'E', 'The seventh installment of the fan-favorite Mario Kart franchise brings Mushroom Kingdom racing fun into glorious 3D. For the first time, drivers explore new competitive kart possibilities, such as soaring through the skies or plunging to the depths of the sea. New courses, strategic new abilities and customizable karts bring the racing excitement to new heights. ', 90, 98, 'https://i.imgur.com/5LZGAUv.png');

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
CREATE TABLE `Genre` (
  `genre` varchar(20) NOT NULL,
  `gameID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`genre`, `gameID`) VALUES
('Action', 1),
('Action', 3),
('Adventure', 1),
('Adventure', 3),
('Beat \'Em Up', 3),
('FPS', 5),
('FPS', 6),
('FPS', 7),
('MMORPG', 2),
('Platformer', 3),
('Platformer', 8),
('Platformer', 9),
('Platformer', 10),
('Racing', 14),
('RTS', 4),
('Turn-Based RPG', 12),
('Turn-Based RPG', 13),
('Turn-Based Strategy', 11);

-- --------------------------------------------------------

--
-- Table structure for table `UserReview`
--

DROP TABLE IF EXISTS `UserReview`;
CREATE TABLE `UserReview` (
  `username` varchar(10) NOT NULL,
  `gameID` int(11) NOT NULL,
  `reviewContent` text NOT NULL,
  `score` int(11) NOT NULL,
  `datePosted` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserReview`
--

INSERT INTO `UserReview` (`username`, `gameID`, `reviewContent`, `score`, `datePosted`) VALUES
('barryj', 1, 'Easily the worst game of all time. Complete trash.', 0, '2017-11-03'),
('barryj', 2, 'Pretty good. Only played it for a few hundred hours. ', 80, '2017-11-03'),
('barryj', 3, 'It\'s okay.', 100, '2017-11-03'),
('barryj', 4, 'This game has just the right amount of water, which is quite difficult to nail down in games like this.', 100, '2017-11-16'),
('bobbyHill', 2, 'Not enough Propane', 50, '2017-12-03'),
('cesi', 1, 'bad', 10, '2017-12-06'),
('cesi', 3, 'Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Sonic Soinc ', 67, '2017-12-03'),
('cesi', 10, 'its great', 99, '2017-12-04'),
('fernanen', 1, 'Ganandorf will charge up energy balls and throw them at you. Hit them with the sword until it hits him, hit him with a light arrow, then run in and slash him... You\'re welcome. ', 50, '2017-11-08'),
('fernanen', 4, 'looked like the Pikmin were in a drought -Not enough water.', 70, '2017-11-08'),
('james', 10, 'Just the right amount of paint.', 100, '2017-12-06'),
('luoja', 1, 'Best game of all time.', 100, '2017-11-03'),
('luoja', 3, 'Perfect game. Flawless. Great graphics. New big thing. Kinda sucks, though.', 40, '2017-11-16'),
('luoja', 4, 'Too much water.', 80, '2017-11-03'),
('luoja', 5, 'Game of the year for 2017.', 77, '2017-11-16'),
('luoja', 6, 'Halo 3 was better. Loses points for Xbox One.', 99, '2017-11-16'),
('luoja', 7, 'Microsoft sucks. Ruined Halo', 100, '2017-11-16'),
('luoja', 8, 'No more plumber. Make Pokemon great again', 0, '2017-11-16'),
('luoja', 9, 'This game is OLD', 52, '2017-11-16'),
('luoja', 10, 'Mario is overrated.', 15, '2017-11-16'),
('luoja', 11, 'Perfect game. Worth the $500 I spent on it.', 100, '2017-11-16'),
('luoja', 12, 'Played and replayed the game too many times. I don\'t even remember if I enjoyed it anymore.', 95, '2017-11-16'),
('luoja', 13, 'Pokemon is garbage. ', 5, '2017-11-16'),
('Mario', 1, '34563453453', 12, '2017-12-03'),
('Mario', 2, 'Good game', 100, '2017-12-06'),
('Mario', 4, 'remind me of goombas ', 3, '2017-12-03'),
('Mario', 5, 'good game', 100, '2017-12-06'),
('Mario', 8, 'Worst game of all time. There isn\'t even a toilet plunger included with the game.', 99, '2017-11-20'),
('Mario', 14, 'WHERE ARE THE TOILET PLUNGERS???', 98, '2017-11-20'),
('shiek', 1, 'This game is the best! ', 100, '2017-11-09'),
('testacc', 2, 'Cool', 1, '2017-12-06'),
('testacc', 8, 'Love it baby.', 100, '2017-12-06'),
('testacc', 11, 'Played it. Pretty fun.', 90, '2017-12-06'),
('testacc', 13, 'Too bright. Shoulda bought moon.', 80, '2017-12-06'),
('timp', 1, 'Garbage. It\'s a crime for a game this bad to exist', 90, '2017-11-16'),
('timp', 3, 'Best game I\'ve ever played, but there\'s too much water.', 30, '2017-11-16'),
('timp', 4, 'Wheres the water????', 10, '2017-11-16');

--
-- Triggers `UserReview`
--
DELIMITER $$
CREATE TRIGGER `calcUserScoreAdd` AFTER INSERT ON `UserReview` FOR EACH ROW BEGIN
UPDATE Games set overallUserScore = ( 
    SELECT AVG(score) 
    from UserReview 
    WHERE new.gameID = gameID
	) WHERE new.gameID = gameID; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calcUserScoreDelete` AFTER DELETE ON `UserReview` FOR EACH ROW BEGIN
UPDATE Games set overallUserScore = ( 
    SELECT AVG(score) 
    from UserReview 
    WHERE old.gameID = gameID
	) WHERE old.gameID = gameID; 
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `calcUserScoreUpdate` AFTER UPDATE ON `UserReview` FOR EACH ROW BEGIN
UPDATE Games set overallUserScore = ( 
    SELECT AVG(score) 
    from UserReview 
    WHERE old.gameID = gameID
	) WHERE old.gameID = gameID; 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Consoles`
--
ALTER TABLE `Consoles`
  ADD PRIMARY KEY (`console`,`gameID`),
  ADD KEY `Game ID` (`gameID`);

--
-- Indexes for table `CriticReview`
--
ALTER TABLE `CriticReview`
  ADD PRIMARY KEY (`url`),
  ADD KEY `gameID` (`gameID`);

--
-- Indexes for table `Games`
--
ALTER TABLE `Games`
  ADD PRIMARY KEY (`gameID`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`genre`,`gameID`),
  ADD KEY `gameID` (`gameID`);

--
-- Indexes for table `UserReview`
--
ALTER TABLE `UserReview`
  ADD PRIMARY KEY (`username`,`gameID`),
  ADD KEY `gameID` (`gameID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Consoles`
--
ALTER TABLE `Consoles`
  ADD CONSTRAINT `Game ID` FOREIGN KEY (`gameID`) REFERENCES `Games` (`gameID`) ON DELETE CASCADE;

--
-- Constraints for table `CriticReview`
--
ALTER TABLE `CriticReview`
  ADD CONSTRAINT `CriticReview_ibfk_1` FOREIGN KEY (`gameID`) REFERENCES `Games` (`gameID`) ON DELETE CASCADE;

--
-- Constraints for table `Genre`
--
ALTER TABLE `Genre`
  ADD CONSTRAINT `Genre_ibfk_1` FOREIGN KEY (`gameID`) REFERENCES `Games` (`gameID`) ON DELETE CASCADE;

--
-- Constraints for table `UserReview`
--
ALTER TABLE `UserReview`
  ADD CONSTRAINT `UserReview_ibfk_2` FOREIGN KEY (`gameID`) REFERENCES `Games` (`gameID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
