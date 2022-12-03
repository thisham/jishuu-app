CREATE TABLE `users` (
  `id` varchar(36) not null primary key,
  `name` varchar(128) not null,
  `email` varchar(128) not null,
  `password` varchar(128) not null,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` datetime ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT (now()) COMMENT 'update time'
);

CREATE TABLE `terms` (
  `id` varchar(36) not null primary key,
  `user_id` varchar(36) not null not null,
  `title` varchar(128) not null,
  `locked_at` datetime DEFAULT null,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` datetime ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT (now()) COMMENT 'update time'
);

CREATE TABLE `courses` (
  `id` varchar(36) not null primary key,
  `user_id` varchar(36) not null,
  `term_id` varchar(128) not null,
  `title` varchar(128) not null,
  `description` text,
  `locked_at` datetime DEFAULT null,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` datetime ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT (now()) COMMENT 'update time'
);

CREATE TABLE `tasks` (
  `id` varchar(36) not null primary key,
  `course_id` varchar(36) not null,
  `title` varchar(128) not null,
  `description` text,
  `created_at` timestamp DEFAULT (now()),
  `updated_at` datetime ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT (now()) COMMENT 'update time'
);

CREATE TABLE `submissions` (
  `id` varchar(36) not null primary key,
  `user_id` varchar(36) not null,
  `task_id` varchar(36) not null,
  `title` varchar(128) not null,
  `description` text,
  `file_url` varchar(255),
  `created_at` timestamp DEFAULT (now()),
  `updated_at` datetime ON UPDATE CURRENT_TIMESTAMP NOT NULL DEFAULT (now()) COMMENT 'update time'
);

ALTER TABLE `submissions` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE primary key;

ALTER TABLE `submissions` ADD FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE primary key;

ALTER TABLE `courses` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE primary key;

ALTER TABLE `courses` ADD FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE primary key;

ALTER TABLE `terms` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE primary key;

ALTER TABLE `tasks` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE primary key;
