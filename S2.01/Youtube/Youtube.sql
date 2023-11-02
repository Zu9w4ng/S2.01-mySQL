CREATE TABLE `CHANNEL` (
  `channel_id` int PRIMARY KEY,
  `name` varchar(255),
  `description` varchar(255),
  `creation_time` timestamp,
  `user` int
);

CREATE TABLE `USER` (
  `user_id` int PRIMARY KEY,
  `email` varchar(255),
  `password` varchar(255),
  `username` varchar(255),
  `birthdate` date,
  `sex` char,
  `country` varchar(255),
  `postal_code` int
);

CREATE TABLE `VIDEO` (
  `video_id` int PRIMARY KEY,
  `title` varchar(255),
  `description` varchar(255),
  `size` float,
  `duration` float,
  `thumbnail` binary,
  `reproductions` int,
  `likes` int,
  `dislikes` int,
  `upload_time` timestamp,
  `status` varchar(255),
  `user` int
);

CREATE TABLE `TAG` (
  `tag_id` int PRIMARY KEY,
  `tag_name` varchar(255)
);

CREATE TABLE `VIDEOTAGS` (
  `tag` int,
  `video` int,
  PRIMARY KEY (`tag`, `video`)
);

CREATE TABLE `PLAYLIST` (
  `playlist_id` int,
  `video` int,
  `user` int,
  PRIMARY KEY (`playlist_id`, `video`)
);

CREATE TABLE `LIKESDISLIKES_VIDEO` (
  `user` int,
  `video` int,
  `rating` varchar(255),
  PRIMARY KEY (`user`, `video`)
);

CREATE TABLE `COMMENT` (
  `comment_id` int PRIMARY KEY,
  `video` int,
  `user` int
);

CREATE TABLE `LIKESDISLIKES_COMMENT` (
  `user` int,
  `comment` int,
  `rating` varchar(255),
  PRIMARY KEY (`user`, `comment`)
);

ALTER TABLE `CHANNEL` ADD FOREIGN KEY (`user`) REFERENCES `USER` (`user_id`);

ALTER TABLE `VIDEO` ADD FOREIGN KEY (`user`) REFERENCES `USER` (`user_id`);

ALTER TABLE `VIDEOTAGS` ADD FOREIGN KEY (`tag`) REFERENCES `TAG` (`tag_id`);

ALTER TABLE `VIDEOTAGS` ADD FOREIGN KEY (`video`) REFERENCES `VIDEO` (`video_id`);

ALTER TABLE `PLAYLIST` ADD FOREIGN KEY (`video`) REFERENCES `VIDEO` (`video_id`);

ALTER TABLE `PLAYLIST` ADD FOREIGN KEY (`user`) REFERENCES `USER` (`user_id`);

ALTER TABLE `LIKESDISLIKES_VIDEO` ADD FOREIGN KEY (`user`) REFERENCES `USER` (`user_id`);

ALTER TABLE `LIKESDISLIKES_VIDEO` ADD FOREIGN KEY (`video`) REFERENCES `VIDEO` (`video_id`);

ALTER TABLE `COMMENT` ADD FOREIGN KEY (`video`) REFERENCES `VIDEO` (`video_id`);

ALTER TABLE `COMMENT` ADD FOREIGN KEY (`user`) REFERENCES `USER` (`user_id`);

ALTER TABLE `LIKESDISLIKES_COMMENT` ADD FOREIGN KEY (`user`) REFERENCES `USER` (`user_id`);

ALTER TABLE `LIKESDISLIKES_COMMENT` ADD FOREIGN KEY (`comment`) REFERENCES `COMMENT` (`comment_id`);
