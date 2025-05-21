USE shopdb;

CREATE TABLE `board` (
	`boardId`	int	NOT NULL,
	`memberID`	varchar(8)	NOT NULL,
	`title`	varchar(100)	NULL,
	`content`	text	NULL
);

CREATE TABLE `members` (
	`memberID`	varchar(8)	NOT NULL,
	`name`	varchar(225)	NULL	COMMENT '회원이름은 한글기준으로 255 글자',
	`tel`	varchar(20)	NULL	COMMENT '연락처는 전화번호/ 집 번호 다 허용함'
);

ALTER TABLE `board` ADD CONSTRAINT `PK_BOARD` PRIMARY KEY (
	`boardId`,
	`memberID`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`memberID`
);

ALTER TABLE `board` ADD CONSTRAINT `FK_member_TO_board_1` FOREIGN KEY (
	`memberID`
)
REFERENCES `member` (
	`memberID`
);