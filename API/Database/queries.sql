CREATE TABLE Museum
(
museum_id INT NOT NULL,
museum_name CHAR(100) NOT NULL,
museum_description CHAR(500) NOT NULL,
museum_location CHAR(50) NOT NULL,
museum_gps CHAR(50) NOT NULL,
PRIMARY KEY (museum_id)
);

CREATE TABLE Multimedia
( 
mmedia_id INT NOT NULL,
media_name CHAR(100) NOT NULL,
media_format CHAR(10) NOT NULL,
media_size INT NOT NULL,
media_address CHAR(200) NOT NULL,
PRIMARY KEY (mmedia_id)
);

CREATE TABLE Museum_Multimedia
(
museum_id INT NOT NULL,
mmedia_id INT NOT NULL,
FOREIGN KEY (museum_id) REFERENCES Museum (museum_id),
FOREIGN KEY (mmedia_id) REFERENCES Multimedia (mmedia_id)
);

CREATE TABLE Section
(
sc_id INT NOT NULL, 
sc_name CHAR(100) NOT NULL,
sc_description CHAR(500) NOT NULL,
numofexhibit INT NOT NULL,
museum_id INT NOT NULL,
PRIMARY KEY (sc_id),
FOREIGN KEY (museum_id) REFERENCES Museum (museum_id)
);

CREATE TABLE Exhibit
(
ex_id INT NOT NULL, 
ex_description CHAR(500) NOT NULL,
sc_id INT NOT NULL,
PRIMARY KEY (ex_id),
FOREIGN KEY (sc_id) REFERENCES Section (sc_id)
); 

CREATE TABLE Category
(
cat_id INT NOT NULL,
cat_name CHAR(100) NOT NULL,
cat_description CHAR(500) NOT NULL,
cat_numofitems INT NOT NULL
PRIMARY KEY (cat_id)
);

CREATE TABLE Item
(
item_id INT NOT NULL,
item_name CHAR(100) NOT NULL,
item_description CHAR(500) NOT NULL,
item_display BIT NOT NULL,
item_data CHAR(500) NOT NULL, --TIMESTAMP Needs to be added
ex_id INT NOT NULL,
PRIMARY KEY (item_id),
FOREIGN KEY (ex_id) REFERENCES Exhibit (ex_id)
);

CREATE TABLE Section_Multimedia
(
sc_id INT NOT NULL,
mmedia_id INT NOT NULL
FOREIGN KEY (sc_id) REFERENCES Section (sc_id),
FOREIGN KEY (mmedia_id) REFERENCES Multimedia (mmedia_id)
);

CREATE TABLE Exhibit_Multimedia
(
ex_id INT NOT NULL,
mmedia_id INT NOT NULL
FOREIGN KEY (ex_id) REFERENCES Exhibit (ex_id),
FOREIGN KEY (mmedia_id) REFERENCES Multimedia (mmedia_id)
);

CREATE TABLE Item_Multimedia
(
item_id INT NOT NULL,
mmedia_id INT NOT NULL,
FOREIGN KEY (item_id) REFERENCES Item (item_id),
FOREIGN KEY (mmedia_id) REFERENCES Multimedia (mmedia_id)
);

CREATE TABLE Bluetooth
(
bt_id INT NOT NULL,
bt_name VARCHAR(100) NOT NULL,
ex_id INT NOT NULL,
PRIMARY KEY (bt_id),
FOREIGN KEY (ex_id) REFERENCES Exhibit (ex_id)
);

CREATE TABLE Category_Item
(
cat_id INT NOT NULL,
item_id INT NOT NULL,
FOREIGN KEY (cat_id) REFERENCES Category (cat_id),
FOREIGN KEY (item_id) REFERENCES Item (item_id)
);

--Different Museums and Photos w/ connection
INSERT INTO Museum Values(1, 'Paul W. Bryant Museum', 'The University of Alabama', 'Tuscaloosa', 'GPS1');
INSERT INTO Multimedia Values(001, 'BryantMuseum.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/BryantMuseum.png');
INSERT INTO Museum_Multimedia Values(1, 001);
INSERT INTO Museum Values(2, 'Gorgas House Museum', 'The University of Alabama', 'Tuscaloosa', 'GPS2');
INSERT INTO Multimedia Values(002, 'GorgasHouse.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/GorgasHouse.png');
INSERT INTO Museum_Multimedia Values(2, 002);
INSERT INTO Museum Values(3, 'Alabama Sports Hall Of Fame', 'The University of Alabama', 'Tuscaloosa', 'GPS3');
INSERT INTO Multimedia Values(003, 'AlabamaSportsHallOfFame.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/AlabamaSportsHallOfFame.jpg');
INSERT INTO Museum_Multimedia Values(3, 003);
INSERT INTO Museum Values(4, 'Moudville Archaeological Park', 'Moundville State Park', 'Moundville', 'GPS4');
INSERT INTO Multimedia Values(004, 'Moundville.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Moundville.png');
INSERT INTO Museum_Multimedia Values(4, 004);
INSERT INTO Museum Values(5, 'Alabama Museum of Natural History', 'The University of Alabama', 'Tuscaloosa', 'GPS5');
INSERT INTO Multimedia Values(005, 'HistoryMuseum.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/HistoryMuseum.jpg');
INSERT INTO Museum_Multimedia Values(5, 005);





--Bryant Museum Section
INSERT INTO Section Values(1, 'Hall of Honor', 'Left Side', '1', 1);
INSERT INTO Section Values(2, 'The Tide Through Time', 'Right Side', '1', 1);
INSERT INTO Section Values(3, 'Coach Bryants Office', 'Back Left Corner', '1', 1);
INSERT INTO Section Values(4, 'Crimson Tide Moments from Broadcast Booth', 'Back Center', '1', 1);
INSERT INTO Section Values(5, 'The Crystal Hat', 'Back Right Corner', '1', 1);
INSERT INTO Section Values(9, 'Popcorn Machine', 'Break Room', '1', 1);
--Bryant Museum Exhibit
INSERT INTO Exhibit Values(1, 'In line with Coach Bryants original concept, the Museums first exhibit is the Hall of Honor. Surrounded by the team photos of each of his teams is a large bust of the legendary coach, Paul W. "Bear" Bryant. Blair Buswell of Utah sculpted this artwork that serves as a fitting introduction to the museums visitors.', 1);
INSERT INTO Exhibit Values(2, 'Beginning with the first team in 1892 through the present day - the exhibits chronicle the history and tradition of the Crimson Tide. The history story is told through the people, places and events that laid the foundation that todays team stands upon.', 2);
INSERT INTO Exhibit Values(3, 'Former players speak often about the awe they felt visiting Coach Bryants office. A glimpse of that experience is available for the museums guests.', 3);
INSERT INTO Exhibit Values(4, 'In the days before television the radio was the best way for Tide fans to be close to the action even from hundreds of miles away. The broadcast crew became a valued part of the Tide family. This exhibit pays tribute to the broadcasters.', 4);
INSERT INTO Exhibit Values(5, 'A Waterford crystal replica of Coach Bryants houndstooth hat was created by internationally acclaimed sculptor Miraslav Havel and presented by the Waterford Crystal Company of Ireland and the Bromberg Company of Birmingham.', 5);
--iPopcorn X Pro
INSERT INTO Exhibit Values(7, 'The MIS Popcorn Popper', 9); 
--Photos for Bryant Museum Section and Exhibit w/ connection
INSERT INTO Multimedia Values(006, 'BrownPaulBryant.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/BrownPaulBryant.jpg');
INSERT INTO Section_Multimedia Values(1, 006);
INSERT INTO Exhibit_Multimedia Values(1, 006);
INSERT INTO Multimedia Values(007, 'BryantPlayers.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/BryantsPlayers.jpg');
INSERT INTO Section_Multimedia Values(2, 007);
INSERT INTO Exhibit_Multimedia Values(2, 007);
INSERT INTO Multimedia Values(008, 'BryantOffice.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/BryantOffice.jpg');
INSERT INTO Section_Multimedia Values(3, 008);
INSERT INTO Exhibit_Multimedia Values(3, 008);
INSERT INTO Multimedia Values(009, 'Broadcasters.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Broadcasters.jpg');
INSERT INTO Section_Multimedia Values(4, 009);
INSERT INTO Exhibit_Multimedia Values(4, 009);
INSERT INTO Multimedia Values(010, 'CrystalHat.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/CrystalHat.jpg');
INSERT INTO Section_Multimedia Values(5, 010);
INSERT INTO Exhibit_Multimedia Values(5, 010);
INSERT INTO Multimedia Values(011, 'ipopcornXpro.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/ipopcornXpro.JPG');
INSERT INTO Section_Multimedia Values(9, 011);
INSERT INTO Exhibit_Multimedia Values(7, 011);
--Bryant Museum Items
--ex hall of honor w/ connection
INSERT INTO Item Values(001, 'Alabama Football Uniform', 'This uniform was worn by Monroe Laner in 1906.', 1, '3:55PM November 12th', 1);
INSERT INTO Multimedia Values(018, 'Monroe.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Monroe.jpg');
INSERT INTO Item_Multimedia Values(001, 018);
INSERT INTO Item Values(002, 'A typical uniform item from the early period', 'This sweater was worn by Samuel Byron Slone from Lebanon, Alabama in 1896.', 1, '3:56PM November 12th', 1);
INSERT INTO Multimedia Values(019, 'Sweater.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Sweater.jpg');
INSERT INTO Item_Multimedia Values(002, 019);
INSERT INTO Item Values(003, 'Game Ball', 'Alabamas first victory against Auburn in 1894', 1, '3:57PM November 12th', 1);
INSERT INTO Multimedia Values(020, 'gameall.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/gameball.jpg');
INSERT INTO Item_Multimedia Values(003, 020);
--ex the tide through time w/ connection
INSERT INTO Item Values(004, '"A" Club All Southern Trophy', 'The trophy was donated by the "A" Club in 1929', 1, '3:56PM November 12th', 2);
INSERT INTO Multimedia Values(021, 'aclub.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/aclub.jpg');
INSERT INTO Item_Multimedia Values(004, 021);
INSERT INTO Item Values(005, 'Pasadena Tournament of Roses', 'Wallace Wade (Brown, Alabama, Duke) August 2, 1990', 1, '3:57PM November 12th', 2);
INSERT INTO Multimedia Values(022, 'wallacewade.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/wallacewade.jpg');
INSERT INTO Item_Multimedia Values(005, 022);
INSERT INTO Item Values(006, 'Pasadena Tournament of Roses', 'DixieHowell and Don Hutson (Alabama) August 12, 1993', 1, '3:58PM November 12th', 2);
INSERT INTO Multimedia Values(023, 'dixie.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/dixie.jpg');
INSERT INTO Item_Multimedia Values(006, 023);
INSERT INTO Item Values(007, 'Orange Bowl', 'Alabama 61 Syracuse 6 (1953)', 1, '3:59PM November 12th', 2);
INSERT INTO Multimedia Values(024, 'orange.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/orange.jpg');
INSERT INTO Item_Multimedia Values(007, 024);
INSERT INTO Item Values(008, 'Southeastern Conference Player of the Year', 'Steve Sloan (1965)', 1, '4:00PM November 12th', 2);
INSERT INTO Multimedia Values(025, 'southeastern.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/southeastern.jpg');
INSERT INTO Item_Multimedia Values(008, 025);
INSERT INTO Item Values(009, 'The Bluebonnet Bowl', 'Alabama 3 Texas 3 (Houston Texas DEC. 17, 1960', 1, '4:00PM November 12th', 2);
INSERT INTO Multimedia Values(026, 'blue.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/blue.jpg');
INSERT INTO Item_Multimedia Values(009, 026);
INSERT INTO Item Values(010, 'Southeatern Conference Champions', '1973', 1, '4:00PM November 12th', 2);
INSERT INTO Multimedia Values(027, 'south1973.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/south1973.jpg');
INSERT INTO Item_Multimedia Values(010, 027);
INSERT INTO Item Values(011, 'Sun Bowl Champions', 'December 24, 1983', 1, '4:01PM November 12th', 2);
INSERT INTO Multimedia Values(028, 'sun.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/sun.jpg');
INSERT INTO Item_Multimedia Values(011, 028);
INSERT INTO Item Values(012, 'Aloha Bowl Champions', 'Hawaii December 28, 1985', 1, '4:02PM November 12th', 2);
INSERT INTO Multimedia Values(029, 'aloha.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/aloha.jpg');
INSERT INTO Item_Multimedia Values(012, 029);
INSERT INTO Item Values(013, 'Ray Perkins', '1983-1986', 1, '4:04PM November 12th', 2);
INSERT INTO Multimedia Values(030, 'ray.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/ray.jpg');
INSERT INTO Item_Multimedia Values(013, 030);
INSERT INTO Item Values(014, 'Bill Curry', '1987-1989', 1, '4:04PM November 12th', 2);
INSERT INTO Multimedia Values(031, 'bill.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/bill.jpg');
INSERT INTO Item_Multimedia Values(014, 031);
INSERT INTO Item Values(015, 'Gene Stallings', '1990-1996', 1, '4:05PM November 12th', 2);
INSERT INTO Multimedia Values(032, 'gene.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/gene.jpg');
INSERT INTO Item_Multimedia Values(015, 032);
INSERT INTO Item Values(016, 'Mike Dubose', '1997-2000', 1, '4:06PM November 12th', 2);
INSERT INTO Multimedia Values(033, 'mike.png', 'png' ,'', 'https://museumcontent.blob.core.windows.net/museumapp/mike.jpg');
INSERT INTO Item_Multimedia Values(016, 033);
INSERT INTO Item Values(017, 'Dennis Franchione', '2001-2002', 1, '4:08PM November 12th', 2);
INSERT INTO Multimedia Values(034, 'dennis.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/dennis.jpg');
INSERT INTO Item_Multimedia Values(017, 034);
INSERT INTO Item Values(018, 'Mike Shula', '2003-2006', 1, '4:08PM November 12th', 2);
INSERT INTO Multimedia Values(035, 'mikes.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/mikes.jpg');
INSERT INTO Item_Multimedia Values(018, 035);
INSERT INTO Item Values(019, 'Nick Saban', '2007-Present', 1, '4:09PM November 12th', 2);
INSERT INTO Multimedia Values(036, 'nick.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/nick.jpg');
INSERT INTO Item_Multimedia Values(019, 036);
INSERT INTO Item Values(020, 'Big Al', 'Mascot Elephant', 1, '4:10PM November 12th', 2);
INSERT INTO Multimedia Values(037, 'bigal.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/bigal.jpg');
INSERT INTO Item_Multimedia Values(020, 037);
--ex coach bryants office w/ connection
INSERT INTO Item Values(021, 'Bear Bryants Office', 'Replica of Alabmas legendary coach Paul W. "Bear" Bryant  office', 1, '4:12PM November 12th', 3);
INSERT INTO Multimedia Values(038, 'BryantOffice.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/BryantOffice.jpg');
INSERT INTO Item_Multimedia Values(021, 038);
INSERT INTO Item Values(022, 'United States Navy Dress Uniform', 'Worn by Paul W. Bryant from 1942-1945', 1, '4:13PM November 12th', 3);
INSERT INTO Multimedia Values(039, 'navy.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/navy.jpg');
INSERT INTO Item_Multimedia Values(022, 039);
INSERT INTO Item Values(023, 'The "Bear" Bryant Show', 'The show was a weekly coaches show that served as a weekly recap of the Alabama Crimson Tide football teams previous days game.', 1, '4:14PM November 12th', 3);  
INSERT INTO Multimedia Values(040, 'show.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/show.jpg');
INSERT INTO Item_Multimedia Values(023, 040);
--ex crimson tide moments from broadcast booth w/ connection
INSERT INTO Item Values(024, 'Zipp Newman', 'Sports Editor/Birmingham News', 1, '4:15PM November 12th', 4);
INSERT INTO Item_Multimedia Values(024, 041);
INSERT INTO Item Values(025, 'Bob Phillips', 'Sports Editor/Birmingham Post-Herald', 1, '4:16PM November 12th', 4);
INSERT INTO Item_Multimedia Values(025, 041);
INSERT INTO Item Values(026, 'Benny Marshall', 'Sports Editor/Birminham News', 1, '4:17PM November 12th', 4);
INSERT INTO Item_Multimedia Values(026, 041);
INSERT INTO Item Values(027, 'Sam Adams', 'Sports Editor/Alabama Journal', 1, '4:19PM November 12th', 4);
INSERT INTO Item_Multimedia Values(027, 041);
INSERT INTO Multimedia Values(041, 'editors.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/editors.jpg');    --This image is the same for Item_id 024-027
INSERT INTO Item Values(028, 'Mel Allen', 'Announcer', 1, '4:20PM November 12th', 4);
INSERT INTO Item_Multimedia Values(028, 042);
INSERT INTO Item Values(029, 'Leland Childs', 'Announcer', 1, '4:20PM November 12th', 4);
INSERT INTO Item_Multimedia Values(029, 042);
INSERT INTO Item Values(030, 'Frank Bruce', 'Announcer', 1, '4:22PM November 12th', 4);
INSERT INTO Item_Multimedia Values(030, 042);
INSERT INTO Item Values(031, 'Dave Overton', 'Announcer', 1, '4:22PM November 12th', 4);
INSERT INTO Item_Multimedia Values(031, 042);
INSERT INTO Item Values(032, 'Gabby Bell', 'Announcer', 1, '4:23PM November 12th', 4);
INSERT INTO Item_Multimedia Values(032, 042);
INSERT INTO Item Values(033, 'Charley Zeanah', 'Announcer', 1, '4:25PM November 12th', 4);
INSERT INTO Item_Multimedia Values(033, 042);
INSERT INTO Item Values(034, 'Maury Farrell', 'Announcer', 1, '4:25PM November 12th', 4);
INSERT INTO Item_Multimedia Values(034, 042);
INSERT INTO Item Values(035, 'Dick Reid', 'Announcer', 1, '4:26PM November 12th', 4);
INSERT INTO Item_Multimedia Values(035, 042);
INSERT INTO Item Values(036, 'John Forney', 'Announcer', 1, '4:27PM November 12th', 4);
INSERT INTO Item_Multimedia Values(036, 042);
INSERT INTO Item Values(037, 'Paul Kennedy', 'Announcer', 1, '4:28PM November 12th', 4);
INSERT INTO Item_Multimedia Values(037, 042);
INSERT INTO Item Values(038, 'Bert Bank', 'Producer', 1, '4:29PM November 12th', 4);
INSERT INTO Item_Multimedia Values(038, 042);
INSERT INTO Item Values(039, 'Stan Siegal', 'Color Analyst', 1, '4:30PM November 12th', 4);
INSERT INTO Item_Multimedia Values(039, 042);
INSERT INTO Item Values(040, 'Doug Layton', 'Color Analyst', 1, '4:30PM November 12th', 4);
INSERT INTO Item_Multimedia Values(040, 042);
INSERT INTO Item Values(041, 'Jerry Duncan', 'Color Analyst', 1, '4:31PM November 12th', 4);
INSERT INTO Item_Multimedia Values(041, 042);
INSERT INTO Item Values(042, 'Tom Roberts', 'Color Analyst', 1, '4:31PM November 12th', 4);
INSERT INTO Item_Multimedia Values(042, 042);
INSERT INTO Item Values(043, 'Eli Gold', 'Announcer', 1, '4:32PM November 12th', 4);
INSERT INTO Item_Multimedia Values(043, 042);
INSERT INTO Item Values(044, 'Kenny Stabler', 'Color Analyst', 1, '4:33PM November 12th', 4);
INSERT INTO Item_Multimedia Values(044, 042);
INSERT INTO Multimedia Values(042, 'announcers.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/announcers.jpg');            --This image is the same for Item_id 028-044
--ex the crystal hat w/ connection
INSERT INTO Item Values(045, 'The Crystal Hat', 'Presented to the University at the Alabama-Temple game, November 15, 1986.', 1, '4:40PM November 12th', 5);
INSERT INTO Multimedia Values(043, 'realhat.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/realhat.jpg');
INSERT INTO Item_Multimedia Values(045, 043);
--ex popcorn w/ connection
INSERT INTO Item Values(083, 'Popcorn', 'MIS Popper', 1, '3:11PM November 13th', 7);
INSERT INTO Multimedia Values(057, 'ipopcornXpro.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/ipopcornXpro.JPG');
INSERT INTO Item_Multimedia Values(083, 057);







--Gorgas House Section and Photos w/connection
INSERT INTO Section Values(6, 'Insdie the Gorgas House', 'Interior', '13', 2);
INSERT INTO Multimedia Values(012, 'GorgasHouse.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/GorgasHouse.png');
INSERT INTO Section_Multimedia Values(6, 012);
--Gorgas House Exhibit and Photos w/ connection
INSERT INTO Exhibit Values(6, 'The exhibit preserves and interprets the Gorgas family legacy and their home’s significance to the history of The University of Alabama. As the first campus building, the Gorgas House Museum provides a connection between the original campus of 1831 and that of today.', 6);
INSERT INTO Multimedia Values(017, 'gorgashousehall.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/gorgashousehall.jpg');
INSERT INTO Exhibit_Multimedia Values(6, 017);
--Gorgas House Items and Photos w/ connection
INSERT INTO Item Values(046, 'Parents of Josiah Gorgas', 'Joseph Gorgas (1770-1841) and Sophia Atkinson (1778-1849), married in 1817', 1, '11:56AM November 8th', 6);
INSERT INTO Multimedia Values(044, 'parents.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/parents.PNG');
INSERT INTO Item_Multimedia Values(046, 044);
INSERT INTO Item Values(047, 'Souvenir tray of Bienville Square', 'Amelia Gorgas’s father, John Gayle had a home in Mobile, Alabama', 1, '11:59AM November 8th', 6);
INSERT INTO Multimedia Values(045, 'tray.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/tray.PNG');
INSERT INTO Item_Multimedia Values(047, 045);
INSERT INTO Item Values(048, 'Powder Box', 'The item is from Limoges, France, early 20th century', 1, '12:15PM November 8th', 6);
INSERT INTO Multimedia Values(046, 'box.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/box.PNG');
INSERT INTO Item_Multimedia Values(048, 046);
INSERT INTO Item Values(049, 'Child’s chair, circa 1860', 'Chair was given as a gift to William Crawford Gorgas from the Confederate Secretary of State George Randolph', 1, '12:17PM November 8th', 6);
INSERT INTO Multimedia Values(047, 'childchair.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/childchair.PNG');
INSERT INTO Item_Multimedia Values(049, 047);
INSERT INTO Item Values(050, 'Photograph of Amelia Elizabeth Bayne', 'She is the niece of Josiah and Amelia Gorgas', 1, '12:22PM November 8th', 6);
INSERT INTO Multimedia Values(048, 'niece.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/niece.PNG');
INSERT INTO Item_Multimedia Values(050, 048);
INSERT INTO Item Values(051, 'Nails made at the Brierfield Iron Works in Bibb County, Alabama', 'The Iron Works was started and run by Josiah Gorgas at the end of the Civil War', 1, '12:23PM November 8th', 6);
INSERT INTO Multimedia Values(049, 'nails.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/nail.PNG');
INSERT INTO Item_Multimedia Values(051, 049);
INSERT INTO Item Values(052, 'Cruet Set', 'James Dixon & Sons; Sheffield, England', 1, '12:25PM November 8th', 6);
INSERT INTO Multimedia Values(050, 'set.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/set.PNG');
INSERT INTO Item_Multimedia Values(052, 050);
INSERT INTO Item Values(053, 'Stereoscopic Viewer Card Set of the University of the South and Vicinity; Sewanee, Tennessee', 'Josiah Gorgas was employed at the University of the South from 1872-1878; working his was up to the position of Vice Chancellor. In 1878, he accepted the Presidency of the University of Alabama.', 1, '12:27PM November 8th', 6);
INSERT INTO Multimedia Values(051, 'cardset.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/cardset.PNG');
INSERT INTO Item_Multimedia Values(053, 051);
INSERT INTO Item Values(054, 'Loving Cup Award', 'The award was presented to Amelia Gorgas on May 29th, 1905 from the alumni of University of Alabama. It was the first loving cup presented by the University of Alabama.', 1, '12:31PM November 8th', 6);
INSERT INTO Multimedia Values(052, 'award.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/award.PNG');
INSERT INTO Item_Multimedia Values(054, 052);
INSERT INTO Item Values(055, 'Perfume Set', 'No collections information', 1, '12:35PM November 8th', 6);
INSERT INTO Multimedia Values(053, 'perfume.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/perfume.PNG');
INSERT INTO Item_Multimedia Values(055, 053);
INSERT INTO Item Values(056, 'Common Prayer Book', 'Ratified by the Episcopalian Church on October 16th, 1789', 1, '12:35PM November 8th', 6);
INSERT INTO Multimedia Values(054, 'book.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/book.PNG');
INSERT INTO Item_Multimedia Values(056, 054);
INSERT INTO Item Values(057, 'Water Color', 'Located in West Point, New York, circa 1841. Painted and gifted to Josiah Gorgas from a fellow West Point classmate.', 1, '12:46PM November 8th', 6);
INSERT INTO Multimedia Values(055, 'watercolor.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/watercolor.PNG');
INSERT INTO Item_Multimedia Values(057, 055);
INSERT INTO Item Values(058, 'Senate desk; Tuscaloosa, Alabama', 'Tuscaloosa, Alabama was the capitol of the state from 1826-1846. When they relocated the capitol to Montgomery, some of the furnishings were given to the University of Alabama.', 1, '12:47PM November 8th', 6);
INSERT INTO Multimedia Values(056, 'desk.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/desk.PNG');
INSERT INTO Item_Multimedia Values(058, 056);








--Sports Hall of Fame Section and Photos w/ connection
INSERT INTO Section Values(8, 'ASHOF Inductees', 'Main', '27', 3);
INSERT INTO Multimedia Values(013, 'ASHOFbuilding.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/ASHOFbuilding.jpg');
INSERT INTO Section_Multimedia Values(8, 013);
--Sports Hall of Fame Exhibit and Photos w/ connection
INSERT INTO Exhibit Values(8, 'Year 1969', 8);
INSERT INTO Multimedia Values(082, 'Year1969.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Year1969.png');
INSERT INTO Exhibit_Multimedia Values(8, 082);
INSERT INTO Exhibit Values(9, 'Year 1970', 8);
INSERT INTO Multimedia Values(083, 'year1970.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/year1970.png');
INSERT INTO Exhibit_Multimedia Values(9, 083);
INSERT INTO Exhibit Values(10, 'Year 1971', 8);
INSERT INTO Multimedia Values(084, '1971.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/1971.png');
INSERT INTO Exhibit_Multimedia Values(10, 084);
--Sports Hall of Fame Items abd Photos w/ connection
--year 1969 w/ connection
INSERT INTO Item Values(059, 'Year 1969', 'Joe Louis', 1, '1:13PM November 11th', 8);
INSERT INTO Multimedia Values(058, 'joelouis-1.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/joelouis-1.jpg');
INSERT INTO Item_Multimedia Values(059, 058);
INSERT INTO Item Values(060, 'Year 1969', 'Johnny Mack Brown', 1, '1:14PM November 11th', 8);
INSERT INTO Multimedia Values(059, 'johnnymackbrown-1.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/johnnymackbrown-1.jpg');
INSERT INTO Item_Multimedia Values(060, 059);
INSERT INTO Item Values(061, 'Year 1969', 'Paul "Bear" Bryant', 1, '1:14PM November 11th', 8);
INSERT INTO Multimedia Values(060, 'bearbyant-1.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/bearbryant-1.jpg');
INSERT INTO Item_Multimedia Values(061, 060);
INSERT INTO Item Values(062, 'Year 1969', 'Mike Donahue', 1, '1:15PM November 11th', 8);
INSERT INTO Multimedia Values(061, 'mikedonahue-1.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/mikedonahue-1.jpg');
INSERT INTO Item_Multimedia Values(062, 061);
INSERT INTO Item Values(063, 'Year 1969', 'Jimmy Hitchcock', 1, '1:17PM November 11th', 8);
INSERT INTO Multimedia Values(062, 'jameshitchcock.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/jameshitchcock-1.jpg');
INSERT INTO Item_Multimedia Values(063, 062);
INSERT INTO Item Values(064, 'Year 1969', 'Don Hutson', 1, '1:17PM November 11th', 8);
INSERT INTO Multimedia Values(063, 'donaldhutson.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/donaldhutson-1.jpg');
INSERT INTO Item_Multimedia Values(064, 063);
INSERT INTO Item Values(065, 'Year 1969', 'Ralph "Shug" Jordan', 1, '1:18PM November 11th', 8);
INSERT INTO Multimedia Values(064, 'shugjordan.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/shugjordan-1.jpg');
INSERT INTO Item_Multimedia Values(065, 064);
INSERT INTO Item Values(066, 'Year 1969', 'Frank Thomas', 1, '1:18PM November 11th', 8);
INSERT INTO Multimedia Values(065, 'frankthomas.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/frankthomas.jpg');
INSERT INTO Item_Multimedia Values(066, 065);
--year 1970 w/ connection
INSERT INTO Item Values(067, 'Year 1970', 'Hank Crisp', 1, '1:20PM November 11th', 9);
INSERT INTO Multimedia Values(066, 'Hank-Gorham-Crisp.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Hank-Gorham-Crisp.jpeg');
INSERT INTO Item_Multimedia Values(067, 066);
INSERT INTO Item Values(068, 'Year 1970', 'John Heisman', 1, '1:20PM November 11th', 9);
INSERT INTO Multimedia Values(067, 'John-William-Heisman.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/John-William-Heisman.jpg');
INSERT INTO Item_Multimedia Values(068, 067);
INSERT INTO Item Values(069, 'Year 1970', 'Wilbur Hutsell', 1, '1:21PM November 11th', 9);
INSERT INTO Multimedia Values(068, 'Wilbur-H.-Hutsell.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Wilbur-H.-Hutsell.jpg');
INSERT INTO Item_Multimedia Values(069, 068);
INSERT INTO Item Values(070, 'Year 1970', 'Jesse Owens', 1, '1:21PM November 11th', 9);
INSERT INTO Multimedia Values(069, 'Jesse-Owens.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Jesse-Owens.jpg');
INSERT INTO Item_Multimedia Values(070, 069);
INSERT INTO Item Values(071, 'Year 1970', 'Joe Sewell', 1, '1:22PM November 11th', 9);
INSERT INTO Multimedia Values(070, 'joesewell.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/joesewell.jpeg');
INSERT INTO Item_Multimedia Values(071, 070);
INSERT INTO Item Values(072, 'Year 1970', 'Wallace Wade', 1, '1:24PM November 11th', 9);
INSERT INTO Multimedia Values(071, 'wallacewade.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/wallacewade.jpg');
INSERT INTO Item_Multimedia Values(072, 071);
INSERT INTO Item Values(073, 'Year 1970', 'Early Wynn', 1, '1:25PM November 11th', 9);
INSERT INTO Multimedia Values(072, 'Early-Wynn-JR.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Early-Wynn-JR.jpg');
INSERT INTO Item_Multimedia Values(073, 072);
INSERT INTO Item Values(074, 'Year 1970', 'William Van de Graaff', 1, '1:25PM November 11th', 9);
INSERT INTO Multimedia Values(073, 'William-T.-Van-De-Graaf.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/William-T.-Van-De-Graaf.jpg');
INSERT INTO Item_Multimedia Values(074, 073);
--year 1971 w/ connection
INSERT INTO Item Values(075, 'Year 1971', 'Bill Streit', 1, '1:26PM November 11th', 10);
INSERT INTO Multimedia Values(074, 'Charles-William-Streit-JR.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Charles-William-Streit-JR.jpg');
INSERT INTO Item_Multimedia Values(075, 074);
INSERT INTO Item Values(076, 'Year 1971', 'Ben Chapman', 1, '1:26PM November 11th', 10);
INSERT INTO Multimedia Values(075, 'William-Ben-Chapman.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/William-Ben-Chapman.png');
INSERT INTO Item_Multimedia Values(076, 075);
INSERT INTO Item Values(077, 'Year 1971', 'Harold "Red" Drew', 1, '1:27PM November 11th', 10);
INSERT INTO Multimedia Values(076, 'Harold-D-Drew.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Harold-D-Drew.png');
INSERT INTO Item_Multimedia Values(077, 076);
INSERT INTO Item Values(078, 'Year 1971', 'Howard Hill', 1, '1:27PM November 11th', 10);
INSERT INTO Multimedia Values(077, 'Howard-Hill.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Howard-Hill.jpg');
INSERT INTO Item_Multimedia Values(078, 077);
INSERT INTO Item Values(079, 'Year 1971', 'Dixie Howell', 1, '1:28PM November 11th', 10);
INSERT INTO Multimedia Values(078, 'Millard-F.-Howell.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Millard-F.-Howell.jpg');
INSERT INTO Item_Multimedia Values(079, 078);
INSERT INTO Item Values(080, 'Year 1971', 'T.K. "Tackhole" Lee', 1, '1:29PM November 11th', 10);
INSERT INTO Multimedia Values(079, 'TK_Lee.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/TK_Lee.jpg');
INSERT INTO Item_Multimedia Values(080, 079);
INSERT INTO Item Values(081, 'Year 1971', 'Sanders Russell', 1, '1:30PM November 11th', 10);
INSERT INTO Multimedia Values(080, 'sanders_russell.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/sanders_russell.jpg');
INSERT INTO Item_Multimedia Values(081, 080); 
INSERT INTO Item Values(082, 'Year 1971', 'Riggs Stephenson', 1, '1:31PM November 11th', 10);
INSERT INTO Multimedia Values(081, 'riggsstephenson.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/riggsstephenson1.jpg');
INSERT INTO Item_Multimedia Values(082, 081); 










--Moundville Park Section and Photos
INSERT INTO Section Values(10, 'Jones Archaeological Museum', 'Insdie', '1', 4);
INSERT INTO Multimedia Values(014, 'moundvillemuseum.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/moundvillemusum.jpg');
INSERT INTO Section_Multimedia Values(10, 014);
INSERT INTO Section Values(11, 'Natural Exhibits', 'Outside', '1', 4);
INSERT INTO Multimedia Values(015, 'mounds.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/mounds.jpg');
INSERT INTO Section_Multimedia Values(11, 015);
--Moundville Park Exhibit and Photos
INSERT INTO Exhibit Values(59, 'Lost Realsm of the Black Warrior', 10);
INSERT INTO Multimedia Values(085, 'blackwarrior.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/blackwarrior.jpg');
INSERT INTO Exhibit_Multimedia Values(59, 085);
INSERT INTO Exhibit Values(60, 'Mounds of Moundville', 11);
INSERT INTO Multimedia Values(086, 'moundsofMoundville.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/moundsofMoundville.jpg');
INSERT INTO Exhibit_Multimedia Values(60, 086);
--Moundville Museum items w/ connection
INSERT INTO Item Values(084, 'Anncient Artifacts', 'recreated scenes with life-like figures', 1, '3:40PM December 2nd', 59);
INSERT INTO Multimedia Values(087, 'moundvilleindian.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/mounvilleindian.jpg');
INSERT INTO Item_Multimedia Values(084, 087);
INSERT INTO Item Values(085, 'Mound', 'The mounds served as elevated platforms for civic and ceremonial structures and the homes of nobles.', 1, '3:40PM December 2nd', 60);
INSERT INTO Multimedia Values(088, 'mainmound.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/mainmound.jpg');
INSERT INTO Item_Multimedia Values(085, 088);







 --History Museum Section
INSERT INTO Section Values(12, 'Alabamas History', 'Left Side', '3', 5);
INSERT INTO Section_Multimedia Values(12, 016);
INSERT INTO Section Values(13, 'Natural Elements', 'Back Center', '16', 5);
INSERT INTO Section_Multimedia Values(13, 016);
INSERT INTO Multimedia Values(016, 'HistoryMuseumOverview', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/HistoryMuseumOverview.jpg');
--History Museum sections
INSERT INTO Exhibit Values(61, 'Eugene Allen Smith', 12);
INSERT INTO Multimedia Values(089, 'EugeneAllenSmith.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/EugeneAllenSmith.jpg');
INSERT INTO Exhibit_Multimedia Values(61, 089);
INSERT INTO Exhibit Values(62, 'Basilosaurus Cetoides', 12);
INSERT INTO Multimedia Values(090, 'Fossil.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Fossil.jpg');
INSERT INTO Exhibit_Multimedia Values(62, 090);
INSERT INTO Exhibit Values(63, 'In the Field', 12);
INSERT INTO Multimedia Values(091, 'InTheField.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/InTheField.jpg');
INSERT INTO Exhibit_Multimedia Values(63, 091);
INSERT INTO Exhibit Values(64, 'Native Elements', 13);
INSERT INTO Multimedia Values(092, 'NativeElements.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/NativeElements.jpg');
INSERT INTO Exhibit_Multimedia Values(64, 092);
INSERT INTO Exhibit Values(65, 'Oxides and Hydroxides', 13);
INSERT INTO Multimedia Values(093, 'OxidesAndHydroxides.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/OxidesAndHydroxides.jpg');
INSERT INTO Exhibit_Multimedia Values(65, 093);
INSERT INTO Exhibit Values(66, 'Halides', 13);
INSERT INTO Multimedia Values(094, 'Halides.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Halides.jpg');
INSERT INTO Exhibit_Multimedia Values(66, 094);
INSERT INTO Exhibit Values(67, 'Carbonates', 13);
INSERT INTO Multimedia Values(095, 'Carbonates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Carbonates.jpg');
INSERT INTO Exhibit_Multimedia Values(67, 095);
INSERT INTO Exhibit Values(68, 'Nitrates, Borates and Iodates', 13);
INSERT INTO Multimedia Values(096, 'NitratesBoratesAndIodates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/NitratesBoratesAndIodates.jpg');
INSERT INTO Exhibit_Multimedia Values(68, 096);
INSERT INTO Exhibit Values(69, 'Sulfates and Sulfosalts', 13);
INSERT INTO Multimedia Values(097, 'SulfatesAndSulfosalts.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/SulfatesAndSulfosalts.jpg');
INSERT INTO Exhibit_Multimedia Values(69, 097);
INSERT INTO Exhibit Values(70, 'Phosphates and Arsenates', 13);
INSERT INTO Multimedia Values(098, 'PhosphatesAndArsenates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/PhosphatesAndArsenates.jpg');
INSERT INTO Exhibit_Multimedia Values(70, 098);
INSERT INTO Exhibit Values(71, 'Nesosilicates', 13);
INSERT INTO Multimedia Values(099, 'Nesosilicates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Nesosilicates.jpg');
INSERT INTO Exhibit_Multimedia Values(71, 099);
INSERT INTO Exhibit Values(72, 'Sorosilicates', 13);
INSERT INTO Multimedia Values(100, 'Sorosilicates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Sorosilicates.jpg');
INSERT INTO Exhibit_Multimedia Values(72, 100);
INSERT INTO Exhibit Values(73, 'Cyclosilicates', 13);
INSERT INTO Multimedia Values(101, 'Cyclosilicates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Cyclosilicates.jpg');
INSERT INTO Exhibit_Multimedia Values(73, 101);
INSERT INTO Exhibit Values(74, 'Inosilicates', 13);
INSERT INTO Multimedia Values(102, 'Inosilicates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Inosilicates.jpg');
INSERT INTO Exhibit_Multimedia Values(74, 102);
INSERT INTO Exhibit Values(75, 'Phyllosilicates', 13);
INSERT INTO Multimedia Values(103, 'Phyllosilicates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Phyllosilicates.jpg');
INSERT INTO Exhibit_Multimedia Values(75, 103);
INSERT INTO Exhibit Values(76, 'Tectosilicates', 13);
INSERT INTO Multimedia Values(104, 'Tectosilicates.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Tectosilicates.jpg');
INSERT INTO Exhibit_Multimedia Values(76, 104);
INSERT INTO Exhibit Values(77, 'Metamorphic Rocks', 13);
INSERT INTO Multimedia Values(105, 'MetamorphicRocks.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/MetamorphicRocks.jpg');
INSERT INTO Exhibit_Multimedia Values(77, 105);
INSERT INTO Exhibit Values(78, 'Igneous', 13);
INSERT INTO Multimedia Values(106, 'IgneousRocks.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/igneousRocks.jpg');
INSERT INTO Exhibit_Multimedia Values(78, 106);
INSERT INTO Exhibit Values(79, 'Sedimentary', 13);
INSERT INTO Multimedia Values(107, 'SedimentaryRocks.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/SedimentaryRocks.jpg');
INSERT INTO Exhibit_Multimedia Values(79, 107);
--Items w/ connection to image
INSERT INTO Item Values(086, 'Eugene Allen Smith Office', 'Eugene Allen Smith was the State Geologist of Alabama for more than half a century and was instrumental in the discovery, mapping, and development of the states natural resources.', 1, '9:57am December 5th', 61);
INSERT INTO Multimedia Values(108, 'EASoffice.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/EASoffice.jpg');
INSERT INTO Item_Multimedia Values(086, 108);
INSERT INTO Item Values(087, 'Alabamas State Fossil', 'Basilosaurus cetoides is an extinct species of whale that swam in the shallow seas along Alabama coast in the late Eocene Epoch (34 to 40 million years ago).', 1, '12:13am December 5th', 62);
INSERT INTO Multimedia Values(109, 'dino.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/dino.jpg');
INSERT INTO Item_Multimedia Values(087, 109);
INSERT INTO Item Values(088, 'The Field Camp', 'The Studebaker Wagon Works of South Bend, Indiana Manufactured Dr. Smiths wagon in 1873.', 1, '12:17pm December 5th', 63);
INSERT INTO Multimedia Values(110, 'IntheFielditem.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/IntheFielditem.jpg');
INSERT INTO Item_Multimedia Values(088, 110);
INSERT INTO Item Values(089, 'Native Copper', 'Cu G2008.0001.00222', 1, '12:17pm December 5th', 64); 
INSERT INTO Multimedia Values(111, 'NativeCopper.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/NativeCopper.jpg');
INSERT INTO Item_Multimedia Values(089, 111);
INSERT INTO Item Values(090, 'Goethite', 'FeO(OH)', 1, '12:18pm December 5th', 65);
INSERT INTO Multimedia Values(112, 'Goethite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Goethite.jpg');
INSERT INTO Item_Multimedia Values(090, 112);
INSERT INTO Item Values(091, 'Fluorite', 'CaF2 G2008.0001.01705', 1, '12:19pm December 5th', 66);
INSERT INTO Multimedia Values(113, 'Fluorite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Fluorite.jpg');
INSERT INTO Item_Multimedia Values(091, 113);
INSERT INTO Item Values(092, 'Malachite', 'Cu2CO3(OH)2 G2009.1.01670', 1, '12:20pm December 5th', 67);
INSERT INTO Multimedia Values(114, 'Malachite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Malachite.jpg');
INSERT INTO Item_Multimedia Values(092, 114);
INSERT INTO Item Values(093, 'Cuprite', 'Cu2O G2008.0001.011575', 1, '12:21pm December 5th', 68);
INSERT INTO Multimedia Values(115, 'Cuprite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Cuprite.jpg');
INSERT INTO Item_Multimedia Values(093, 115);
INSERT INTO Item Values(094, 'Gypsum', '"Desert Rose" CaSO4 2H2O G2011.0001.001', 1, '12:22pm December 5th', 69);
INSERT INTO Multimedia Values(116, 'Gypsum.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Gypsum.jpg');
INSERT INTO Item_Multimedia Values(094, 116);
INSERT INTO Item Values(095, 'Wavellite', 'Ai3(PO4)2(OH)35H2O G2008.0001.01662', 1, '12:23pm December 5th', 70);
INSERT INTO Multimedia Values(117, 'Wavellite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Wavellite.jpg');
INSERT INTO Item_Multimedia Values(095, 117);
INSERT INTO Item Values(096, 'Kyanite', 'Ai2Sio5 G2008.0001.01704', 1, '12:24pm December 5th', 71); 
INSERT INTO Multimedia Values(118, 'Kyanite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Kyanite.jpg');
INSERT INTO Item_Multimedia Values(096, 118);
INSERT INTO Item Values(097, 'Hemimorphite', 'Zn4(Si2O7)(OH)2H2O G2008.0001.01773', 1, '12:25pm December 5th', 72); 
INSERT INTO Multimedia Values(119, 'Hemimorphite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Hemimorphite.jpg');
INSERT INTO Item_Multimedia Values(097, 119);
INSERT INTO Item Values(098, 'Tourmaline', '(Na,Ca)(Mg,Li,Al,Fe2+)3Al6(BO3)3Si6O18(OH)4 G2008.1.01700', 1, '12:26pm December 5th', 73);
INSERT INTO Multimedia Values(120, 'Tourmaline.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Tourmaline.jpg');
INSERT INTO Item_Multimedia Values(098, 120);
INSERT INTO Item Values(099, 'Wollastonite', 'CaSiO3 G2008.0001.01728', 1, '12:27pm December 5th', 74); 
INSERT INTO Multimedia Values(121, 'Wollastonite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Wollastonite.jpg');
INSERT INTO Item_Multimedia Values(099, 121);
INSERT INTO Item Values(100, 'Kaolinite', 'A12Si2O5(OH)4 G2008.0001.01724', 1, '12:27pm December 5th', 75); 
INSERT INTO Multimedia Values(122, 'Kaolinite.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Kaolinite.jpg');
INSERT INTO Item_Multimedia Values(100, 122);
INSERT INTO Item Values(101, 'Microcline', 'KA1Si3O8 G2008.0001.01632/KA1Si3o8 g2008.0001.01592', 1, '12:27pm December 5th', 76);
INSERT INTO Multimedia Values(124, 'Microcline.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Microcline.jpg');
INSERT INTO Item_Multimedia Values(101, 124);
INSERT INTO Item Values(102, 'Marble', 'Teaching Collection', 1, '12:27pm December 5th', 77);
INSERT INTO Multimedia Values(123, 'Marble.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Marble.jpg');
INSERT INTO Item_Multimedia Values(102, 123);
INSERT INTO Item Values(103, 'Pumice', 'Teaching Collection', 1, '12:27pm December 5th', 78);
INSERT INTO Multimedia Values(125, 'Pumice.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Pumice.jpg');
INSERT INTO Item_Multimedia Values(103, 125);
INSERT INTO Item Values(104, 'Sandstone', 'G2008.001.01791', 1, '12:28pm December 5th', 79);
INSERT INTO Multimedia Values(126, 'Sandstone.png', 'png', '', 'https://museumcontent.blob.core.windows.net/museumapp/Sandstone.jpg');
INSERT INTO Item_Multimedia Values(104, 126);




--Bluetooth Table
INSERT INTO Bluetooth Values(1, 'BT-ES', 1);
INSERT INTO Bluetooth Values(2, 'BT-WS', 2);
INSERT INTO Bluetooth Values(3, 'BT-SS', 3);
INSERT INTO Bluetooth Values(4, 'BT-NS', 4);
INSERT INTO Bluetooth Values(5, 'BT-ES', 5);
INSERT INTO Bluetooth Values(6, 'iPopcorn X Pro', 7);


--Bryant Museum
INSERT INTO Category Values(01, 'Team Category', 'ES', '7');
INSERT INTO Category Values(02, 'History Category', 'WS', '9');
INSERT INTO Category Values(03, 'Office Category', 'SS', '12');
INSERT INTO Category Values(04, 'Moments Category', 'NS', '15');
INSERT INTO Category Values(05, 'Crystal Hat Category', 'ES', '5');
--not executed
INSERT INTO Category_Item Values(03, 003);
INSERT INTO Category_Item Values(05, 005);