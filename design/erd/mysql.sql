CREATE TABLE `User` (
  `user_id` <type>,
  `full_Name` <type>,
  `user_Name` <type>,
  `user_Email` <type>,
  `user_Identity` <type>,
  `user_Location` <type>,
  `user_AboutMe` <type>,
  `user_Upvotes` <type>,
  `user_Downvotes` <type>,
  `user_Age` <type>,
  `user_Image` <type>,
  `user_qAsked` <type>,
  `user_qAnswered` <type>,
  `post_Following` <type>
);

CREATE TABLE `Post` (
  `post_id` <type>,
  `user_id` <type>,
  `user_Name` <type>,
  `user_Post` <type>,
  `post_Time` <type>,
  `post_Category` <type>,
  `post_Body` <type>,
  `post_Rating` <type>,
  `user_Image` <type>
);

CREATE TABLE `Comment` (
  `comment_id` <type>,
  `user_id` <type>,
  `user_Name` <type>,
  `user_Post` <type>,
  `comment_Time` <type>,
  `comment_Body` <type>,
  `comment_Upvote` <type>,
  `comment_Downvote` <type>
);

