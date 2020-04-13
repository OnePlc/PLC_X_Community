ALTER TABLE `bookmark` ADD `coords_lat`  VARCHAR (255) NOT NULL DEFAULT '' AFTER `label`,
ADD `coords_long`  VARCHAR (255) NOT NULL DEFAULT '' AFTER `label`,
ADD `description` TEXT NOT NULL DEFAULT '' AFTER `url`;