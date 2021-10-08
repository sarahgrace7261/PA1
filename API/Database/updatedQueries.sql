CREATE TABLE Museum
(
  MId INT NOT NULL AUTO_INCREMENT,
  MName VARCHAR(255) NOT NULL,
  MPictureLink VARCHAR(255) NOT NULL,
  PRIMARY KEY (MId)
);

CREATE TABLE Exhibit
(
  ExId INT NOT NULL AUTO_INCREMENT,
  ExName VARCHAR(255) NOT NULL,
  MediaLink VARCHAR(255) NOT NULL,
  Description VARCHAR(255) NOT NULL,
  ExPictureLink VARCHAR(255) NOT NULL,
  MId INT NOT NULL,
  PRIMARY KEY (ExId),
  FOREIGN KEY (MId) REFERENCES Museum(MId)
);

CREATE TABLE Beacon
(
  BId INT NOT NULL AUTO_INCREMENT,
  BName VARCHAR(255) NOT NULL,
  ExId INT NOT NULL,
  PRIMARY KEY (BId),
  FOREIGN KEY (ExId) REFERENCES Exhibit(ExId)
);

-- '1','Paul W. Bryant Museum','https://live.staticflickr.com/4508/37222566270_29211aaab6_h.jpg'
-- '2','Gorgas House Museum','https://gorgashouse.museums.ua.edu/wp-content/uploads/sites/3/2018/12/line_art-1024x510.jpg'
-- '3','Moudville Archaeological Park','https://moundville.museums.ua.edu/wp-content/uploads/sites/4/2018/01/1004109_SH_45_Moundville_Museum.jpg'
-- '4','Kera\'s Museum','https://image.shutterstock.com/image-photo/grasslands-great-plains-south-dakota-260nw-747280303.jpg'