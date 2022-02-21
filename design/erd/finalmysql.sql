CREATE TABLE `Comment` (
  `Comment_ID` <type>,
  `Body` <type>,
  `Time` <type>,
  `User_UserName` <type>
);

CREATE TABLE `User` (
  `User_ID` <type>,
  `Image` <type>,
  `FirstName` <type>,
  `LastName` <type>,
  `UserName` <type>,
  `Email` <type>,
  `Password` <type>,
  `GoogleAccount` <type>,
  `City` <type>,
  `State` <type>,
  `AboutMe` <type>,
  `QuestionStat` <type>,
  `AnswerStat` <type>
);

CREATE TABLE `Answer` (
  `Answer_ID` <type>,
  `Body` <type>,
  `Time` <type>,
  `UpVote` <type>,
  `DownVote` <type>,
  `User_UserName` <type>,
  `User_Image` <type>
);

CREATE TABLE `Post` (
  `Post_ID` <type>,
  `Title` <type>,
  `Body` <type>,
  `Time` <type>,
  `UpVote` <type>,
  `DownVote` <type>,
  `User_UserName` <type>,
  `User_Image` <type>
);

