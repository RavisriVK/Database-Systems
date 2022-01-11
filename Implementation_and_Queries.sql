create database if not exists youtube_platform;
use youtube_platform;

DROP TABLE IF EXISTS Comment, Viewed, PhoneNumber, SubscribedTo, Manages, BelongsTo, Suggested, SupportedQualities, Video, Playlist, Channel,User;

DROP TABLE IF EXISTS User;
CREATE TABLE User (
  userMailID varchar(40) NOT NULL,
  FirstName varchar(40) DEFAULT NULL,
  LastName varchar(40) DEFAULT NULL,
  ProfilePic VarBinary(2048) default null,
  Age integer DEFAULT NULL,
  DOB date default null,
  PRIMARY KEY (userMailID)
) ;
INSERT INTO User VALUES
('tseries@gmail.com','Gulshan', 'Kumar', null, 40, '1983-07-11'),
('3blue1brown@gmail.com', 'Grant', 'Sanderson', null, 30, '1992-09-06'),
('hakeshd@hmail.com','Hakesh','Darapaneni',null,19, '2002-10-20'),
('vineethkada@hmail.com','Vineeth', 'kada', null, 19, '2002-01-29'),
('bostonravi@hmail.com','Ravi','Valluri',null,19, '2002-02-28'),
('bostonravi@gmail.com','Ravi','Valluri',null,19, '2002-02-28'),
('kdvineet@gmail.com','Vineet','Dhandharia', null,18, '2001-01-01'),
('suneeth@gmail.com','Suneeth','Iyer',null,19, '2002-01-01'),
('srinivas@gmail.com', 'Srinivas', 'Ramanujan', null, 80, '1900-01-01'),
('ravisastry@gmail.com', 'Ravi', 'Sastry', null, 80, '1900-01-01');

DROP TABLE IF EXISTS Channel;
CREATE TABLE Channel (
    channelID integer NOT NULL,
    creatorMailID varchar(40) NOT NULL,
    channelName varchar(40) DEFAULT NULL,
    channelLogo VarBinary(2048) default null, -- 2MB
    channelDescription varchar(100) DEFAULT NULL,
    creationDate date default null,
    totalVideoCount integer DEFAULT NULL,
    totalViewCount integer DEFAULT NULL,
    totalWatchTime integer DEFAULT NULL, -- seconds
    businessEnquiryEmail varchar(40) DEFAULT NULL,
    PRIMARY KEY(channelID, creatorMailID),
    FOREIGN KEY(creatorMailID) REFERENCES User(userMailID) ON DELETE CASCADE
    
);
INSERT INTO Channel VALUES
(7,'tseries@gmail.com', 'T-Series', null, 'T-Series believes in bringing world close together through its music.', '2006-03-13', 2, 1002000000, 4000000, 'tseries@gmail.com'),
(1,'3blue1brown@gmail.com', '3blue1brown', null, '3Blue1Brown, is some combination of math and entertainment, depending on your disposition.', '2015-03-04', 1, 10000, 10000, '3blue1brown@gmail.com'),
(1,'hakeshd@hmail.com','HakeshDarapaneni', null, 'Action','2020-11-11',10,83,28,'cs19b017@smail.com'),
(2,'vineethkada@hmail.com','Vineethkada',null,'Comedy','2019-11-10',38,10,84,'cs19b080@smail.com'),
(1,'bostonravi@hmail.com','computerScientist', null, 'Drama','2020-11-11',10,83,28,'cs19b081@smail.com'),
(1,'bostonravi@gmail.com','computerScientist', null, 'Drama','2020-11-11',10,83,28,'cs19b081@smail.com');

drop table if exists Video;
create table Video (
    videoID integer not null,
    channelID integer not null,
    creatorMailID varchar(40) NOT NULL,
    title varchar(100) not null,
    thumbnail VarBinary(2048) default null, -- 2MB images
    uploadTime time default null, -- 00:00:00.0000000 to 23:59:59.9999999
    uploadDate date default null, -- 0001-01-01 to 9999-12-31
    uploadLocation varchar(40) default null,
    duration integer default null, -- seconds
    visibility varchar(40) default  'private',
    subtitles varchar(100) default 'No Subtitiles for this video',
    views integer default null,
    likes integer default null,
    dislikes integer default null,
    shares integer default null,
    likesVsDislikes decimal(5, 2) default null,
    watchTime integer default null, -- seconds
    avgWatchTime decimal default null, -- seconds
    primary key(videoID, channelID, creatorMailID),
    FOREIGN KEY(channelID, creatorMailID) REFERENCES Channel(channelID, creatorMailID) on delete CASCADE
);

INSERT INTO Video VALUES
(1, 7, 'tseries@gmail.com', 'Baahubali 2 - The Conclusion | Official Trailer (Hindi)', null, null, '2017-03-16', 'Mumbai', 144, 'public', null, 2000000, 743000, 61000, 100, 092.41, 120000000, 60),
(2, 7, 'tseries@gmail.com', 'Vaaste Song: Dhvani Bhanushali, Tanishk Bagchi', null, null, '2019-04-12', 'Mumbai', 240, 'public', null, 1278779884, 10000000, 837000, 1000000, 092.27, 1278779884, 1),
(1, 1, '3blue1brown@gmail.com', 'But what is a neural network? | Chapter 1, Deep learning', null, null, '2015-03-16', 'California', 1200, 'public', null, 9911910, 255000, 0, 50000, 100.00, 19911910, 2),
(1, 1, 'bostonravi@gmail.com', 'SNL: Dog Head Guy', NULL, NULL, NULL, 'Hyderabad', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, 'bostonravi@gmail.com', 'Brown Edge Cookie', NULL, NULL, NULL, 'Chennai', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, 'bostonravi@gmail.com', 'Best Desktop OS', NULL, NULL, NULL, 'Hyderabad', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(1,1,'hakeshd@hmail.com','EagleInSnakesShadow',NULL,NULL,NULL,'Guntur',NULL,'Public',NULL,10,39,1,98,NULL,NULL,NULL),
(2,1,'hakeshd@hmail.com','HallowenDay',NULL,NULL,NULL,'Guntur',NULL,'Public',NULL,11,29,1,98,NULL,NULL,NULL),
(3,1,'hakeshd@hmail.com','MissionImpossible',NULL,NULL,NULL,'Guntur',NULL,'Private',NULL,199,339,1,98,NULL,NULL,NULL),
(1,2,'vineethkada@hmail.com','ICPCtopper',NULL,NULL,NULL,'WestGodavari',NULL,'Public',NULL,120,39,1,98,NULL,NULL,NULL),
(2,2,'vineethkada@hmail.com','Rampage',NULL,NULL,NULL,'WestGodavari',NULL,'Public',NULL,1340,349,1,98,NULL,NULL,NULL),
(1,1,'bostonravi@hmail.com','CoffeeAndDonuts',NULL,NULL,NULL,'Hyderabad',NULL,'Public',NULL,1320,359,1,98,NULL,NULL,NULL);

DROP TABLE IF EXISTS Playlist;
CREATE TABLE Playlist (
    playlistID integer NOT NULL,
    curatedBy integer NOT NULL,
    creatorMailID varchar(40) NOT NULL,
    playlistName varchar(40) DEFAULT NULL,
    playlistVisibility varchar(40) DEFAULT NULL,
    creationDate date default null,
    PRIMARY KEY(playlistID, curatedBy, creatorMailID),
    FOREIGN KEY(curatedBy, creatorMailID) REFERENCES Channel(channelID, creatorMailID) ON DELETE CASCADE
);

INSERT INTO Playlist VALUES
(1, 1, 'bostonravi@gmail.com', 'Neat videos', NULL, NULL),
(1, 2, 'vineethkada@hmail.com', 'I recommend this', NULL, NULL);

DROP TABLE IF EXISTS BelongsTo;
CREATE TABLE BelongsTo (
    videoID integer NOT NULL,
    videoChannelID integer NOT NULL,
    videoCreatorMailID varchar(40) NOT NULL,
    playlistID integer NOT NULL,
    playlistChannelID integer NOT NULL,
    playlistCreatorMailID varchar(40) NOT NULL,
    PRIMARY KEY(videoID, videoChannelID, videoCreatorMailID, playlistID, playlistChannelID, playlistCreatorMailID),
    FOREIGN KEY (videoID, videoChannelID, videoCreatorMailID) REFERENCES Video(videoID, channelID,creatorMailID) ON DELETE CASCADE,
    FOREIGN KEY (playlistID, playlistChannelID, playlistCreatorMailID) REFERENCES Playlist(playlistID, curatedBy,creatorMailID) ON DELETE CASCADE
);
INSERT INTO BelongsTo VALUES
(1, 1, 'bostonravi@gmail.com', 1, 2, 'vineethkada@hmail.com');

DROP TABLE IF EXISTS PhoneNumber;
CREATE TABLE PhoneNumber (
    phoneNumber varchar(10) not null,
    userMailID varchar(40) NOT NULL,
    primary key(phoneNumber, userMailID),
    FOREIGN KEY (userMailID) REFERENCES User(userMailID) ON DELETE CASCADE
);

INSERT INTO PhoneNumber VALUES
('9826365726','suneeth@gmail.com'),
('9234964381','kdvineet@gmail.com'),
('8264726472','bostonravi@gmail.com'),
('7897462759','vineethkada@hmail.com'),
('8688477013','hakeshd@hmail.com');

drop table if exists Suggested;
create table Suggested (
    primaryVideo integer not null,
    pChannelID integer not null,
    pCreatorMailID varchar(40) NOT NULL,
    SuggestedVideo integer not null,
    sChannelID integer not null,
    sCreatorMailID varchar(40) NOT NULL,
    primary key(primaryVideo ,pChannelID, pCreatorMailID, SuggestedVideo, sChannelID, sCreatorMailID),
    foreign key(primaryVideo ,pChannelID, pCreatorMailID) REFERENCES Video(videoID, channelID, creatorMailID) on delete cascade,
    foreign key(SuggestedVideo, sChannelID, sCreatorMailID) REFERENCES Video(videoID, channelID, creatorMailID) on delete cascade
);

INSERT INTO Suggested VALUES
(1, 1, 'bostonravi@gmail.com', 2, 1, 'bostonravi@gmail.com'),
(2, 1, 'bostonravi@gmail.com', 3, 1, 'bostonravi@gmail.com'),
(1,2,'vineethkada@hmail.com',1,1,'hakeshd@hmail.com'),
(2,2,'vineethkada@hmail.com',3,1,'hakeshd@hmail.com'),
(1,1,'bostonravi@hmail.com',2,1,'hakeshd@hmail.com'),
(1,1,'hakeshd@hmail.com',2,2,'vineethkada@hmail.com'),
(1,1,'bostonravi@hmail.com',1,2,'vineethkada@hmail.com');
drop table if exists SubscribedTo;
create table SubscribedTo (
    subscriberMailID varchar(40) NOT NULL,
    channelID integer not null,
    creatorMailID varchar(40) NOT NULL,
    primary key(subscriberMailID ,channelID, creatorMailID),
    foreign key(channelID,creatorMailID) REFERENCES Channel(channelID, creatorMailID) on delete cascade
);

INSERT INTO SubscribedTo VALUES
('bostonravi@gmail.com', 1, 'bostonravi@gmail.com'),
('suneeth@gmail.com', 1, 'bostonravi@gmail.com'),
('bostonravi@gmail.com', 1, 'hakeshd@hmail.com'),
('hakeshd@hmail.com',2,'vineethkada@hmail.com'),
('vineethkada@hmail.com',2,'vineethkada@hmail.com'),
('bostonravi@hmail.com',1,'bostonravi@hmail.com'),
('bostonravi@hmail.com',1,'hakeshd@hmail.com');


DROP TABLE IF EXISTS Manages;
CREATE TABLE Manages (
    userMailID varchar(40) NOT NULL,
    channelID integer NOT NULL,
    creatorMailID varchar(40) NOT NULL,
    PRIMARY KEY(userMailID, channelID, creatorMailID),
    FOREIGN KEY(userMailID) REFERENCES User(userMailID) ON DELETE CASCADE,
    FOREIGN KEY(channelID, creatorMailID) REFERENCES Channel(channelID, creatorMailID) ON DELETE CASCADE
);

INSERT INTO Manages VALUES
('hakeshd@hmail.com',2,'vineethkada@hmail.com'),
('vineethkada@hmail.com',2,'vineethkada@hmail.com'),
('hakeshd@hmail.com',1,'bostonravi@hmail.com'),
('bostonravi@hmail.com',1,'hakeshd@hmail.com');

drop table if exists SupportedQualities;
create table SupportedQualities (
    Resolution varchar(40) NOT NULL,
    videoID integer not null,
    channelID integer not null,
    creatorMailID varchar(40) NOT NULL,
    primary key(Resolution, videoID, channelID, creatorMailID),
    foreign key(videoID, channelID, creatorMailID) REFERENCES Video(videoID, channelID, creatorMailID) on delete cascade
);

INSERT INTO SupportedQualities VALUES
('4K', 1, 7, 'tseries@gmail.com'),
('1080p', 1, 7, 'tseries@gmail.com'),
('720p', 1, 7, 'tseries@gmail.com'),
('4K', 2, 7, 'tseries@gmail.com'),
('1080p', 2, 7, 'tseries@gmail.com'),
('720p', 2, 7, 'tseries@gmail.com'),
('4K', 1, 1, '3blue1brown@gmail.com');

drop table if exists Viewed;
create table Viewed ( 
    creatorMailID varchar(40) NOT NULL,
    channelID integer not null, 
    videoID integer not null,
    viewerMailId varchar(40) not null, 
    liked integer default null, 
    disliked int default null, 
    share int default null, 
    primary key ( creatorMailID, channelID, videoID, viewerMailID ),
    foreign key (videoID, channelID, creatorMailID) references Video(videoID, channelID, creatorMailID) on delete cascade,
    foreign key (viewerMailID) references User(userMailID) on delete cascade
);
INSERT INTO Viewed VALUES
('bostonravi@gmail.com', 1, 1, 'ravisastry@gmail.com',1, 0, 1),
('bostonravi@gmail.com', 1, 2, 'ravisastry@gmail.com',1, 0, 1),
('bostonravi@gmail.com', 1, 3, 'ravisastry@gmail.com',1, 0, 1),
('bostonravi@gmail.com', 1, 1, 'srinivas@gmail.com',1, 0, 1),
('bostonravi@gmail.com', 1, 2, 'srinivas@gmail.com',1, 0, 1),
('bostonravi@gmail.com', 1, 3, 'srinivas@gmail.com',1, 0, 1),
('hakeshd@hmail.com',1,1,'vineethkada@hmail.com',1, 0, 1),
('hakeshd@hmail.com',1,1,'bostonravi@hmail.com',1, 0, 1),
('hakeshd@hmail.com',1,2,'vineethkada@hmail.com',1, 0, 1),
('hakeshd@hmail.com',1,2,'bostonravi@hmail.com',1, 0, 1),
('hakeshd@hmail.com',1,3,'vineethkada@hmail.com',1, 0, 1),
('hakeshd@hmail.com',1,3,'bostonravi@hmail.com',1, 0, 1);

drop table if exists Comment;
create table Comment(
    creatorMailID varchar(40) NOT NULL,
    channelID integer not null,
    videoID integer not null,
    userMailId varchar(40) not null,
    commentText varchar(200) not null,
    primary key (videoID, channelID, creatorMailID,userMailID),
    foreign key (videoID, channelID, creatorMailID,userMailID) references Viewed(videoID, channelID, creatorMailID,viewerMailID) on delete cascade
);

INSERT INTO Comment VALUES
('hakeshd@hmail.com',1,1,'vineethkada@hmail.com','Nice'),
('hakeshd@hmail.com',1,1,'bostonravi@hmail.com','Good'),
('hakeshd@hmail.com',1,2,'vineethkada@hmail.com','Bad'),
('hakeshd@hmail.com',1,3,'vineethkada@hmail.com','Worst');

-- Find the most prolific creators - the users whose channels contain the most content by duration
drop view if exists contentPerUser;
create view contentPerUser as
select u.FirstName as firstName, u.LastName as lastName, u.userMailId as emailAddress, sum(v.duration) as totalContent
from User as u, Channel as c, Video as v
where c.channelId=v.channelId and c.creatorMailId=v.creatorMailId and u.userMailId=c.creatorMailId
group by u.FirstName, u.LastName, u.userMailId
having totalContent>0;

select firstName, lastName, emailAddress, totalContent
from contentPerUser
where totalContent >= all(select totalContent from contentPerUser);

-- Obtain the list of all possible videos that might be suggested as a result of watching 'SNL: Dog Head Guy'
with recursive fpc as (
  select sg1.SuggestedVideo as SuggestedVideo, sg1.sChannelId as sChannelId, sg1.sCreatorMailId as sCreatorMailId
  from Suggested as sg1
  where exists(select * from Video as v where v.title='SNL: Dog Head Guy' and v.videoID=sg1.primaryVideo and v.channelID=sg1.pChannelID and v.creatorMailID=sg1.pCreatorMailID)
  union all
  select sg2.SuggestedVideo, sg2.sChannelID, sg2.sCreatorMailID
  from fpc join
       Suggested as sg2
       on fpc.SuggestedVideo=sg2.primaryVideo and fpc.sChannelId=sg2.pChannelID and fpc.sCreatorMailID=sg2.pCreatorMailID
)
select *
from fpc;

-- For each channel, find out how many under-30 users subscribe to it
drop view if exists millenials;
create view millenials as
select userMailID
from User
where Age<30;

select s.channelID, s.creatorMailID, count(s.subscriberMailID) as millenialSubscriberCount
from SubscribedTo as s
where s.subscriberMailID = any(select userMailID from millenials)
group by s.channelID, s.creatorMailID
having millenialSubscriberCount>0;

-- Find the videos which belongs to a playlist not curated by the channel which created it
select v.videoID, v.channelId, v.creatorMailId
from Video as v
where exists(
  select *
  from BelongsTo as b, Channel as c
  where v.videoId=b.videoId and v.channelId=b.videoChannelId and v.creatorMailId=b.videoCreatorMailId
  and b.playlistChannelId=c.channelId and b.playlistCreatorMailId=c.creatorMailId
  and not(v.channelId=c.channelId and v.creatorMailID=c.creatorMailID)
);

-- Find the channels which are managed by at least one non-owner, but not by the owner himself
select c.channelId, c.creatorMailID
from Channel as c
where exists(
  select *
  from Manages as m
  where m.channelId=c.channelId and m.creatorMailId=c.creatorMailId and m.userMailId<>c.creatorMailId
) and not exists(
  select *
  from Manages as m
  where m.channelId=c.channelId and m.creatorMailId=c.creatorMailId and m.userMailId=c.creatorMailId
);

-- For each location, find out how many users older than 60 years have viewed vidoes created in that location
select v.uploadLocation, count(u.userMailID) as olderAudienceSize
from Video as v, Viewed as vw, User as u
where v.videoId=vw.videoID and v.channelID=vw.channelID and v.creatorMailID=vw.creatorMailID
and vw.viewerMailID=u.userMailID and u.age>60
group by v.uploadLocation
having olderAudienceSize>0;
