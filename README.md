# comment-context-analysis
## 2.0 - Detailed Database Description
### 2.1 - Project description, database engine used, potential users, maybe some other stuff
A Postgres database of all the comments on the popular social media platform Reddit. We can use the information in the database to make inferences and analysis on cultural movements and trends. For example, we can see popular public opinion on various topics, like linking comments that had positive connotation words such as like, love, great, etc, and comments that had negative connotation words like bad, terrible, hate, etc. with another word to see public reception to that subject within the different communities on reddit. Potential users would be advertisers, sociologists, or anyone that would possibly want information about contemporary internet culture and therefore people.

### 2.2 - Data Dictionary, meaning a bullet list of the final tables/columns with a complete description of each
Comments Table:

| Column Name | Data Type | Constraint | Example | Description |
| ----------- | --------- | ---------- | ------- | ----------- |
| id | char(7) | Primary Key | "cnasd6x" | The reddit-assigned id associated with the comment. |
| gilded | smallint | | 0 | The amount of times the comment has been gilded. |
| ups | smallint | | 3 | The number of up votes the comment has. |
| subreddit_id | text | | "t5_2s30g" | The reddit-assigned id associated with the subreddit the comment is found in. |
| edited | boolean | | FALSE | Whether or not the comment has been edited since the initial post. |
| controversiality | integer | | 0 | Not sure... |
| parent_id | text | | "t1_cnapn0k" | The reddit-assigned id of the parent comment of this comment. |
| body | text | | "I can't agree with passing the blame, but I'm glad to hear it's at least helping ..." | The body of the comment. |
| created_utc | integer | | 1420070668 | The date and time created. |
| downs | integer | | 0 | The number of down votes the comment has. |
| score | integer | | 3 | The difference of up votes and down votes. |
| username | text | Foreign Key | "TheDukeofEtown" | The name of the author of the comment. |
| distinguished | text | | "no" | Whether the user has any sort of significance in the subreddit (Moderator, Admin, OP). |
| score_hidden | boolean | | FALSE | Whether the comment's score is hidden on reddit.|

User Table:

| Column Name | Data Type | Constraint | Example | Description |
| ----------- | --------- | ---------- | ------- | ----------- |
| username | text | Primary Key | "TheDukeofEtown" | Name of the user. |
| favorite_word | text | Foreign Key | "democracy" | The user's favorite word. |
| user_uses | integer | | 17 | The number of times the user uses their favorite word. |
| comments_made | integer | | 7 | The number of comments made by the user in our dataset. |
| favorite_subreddit_id | text | Foreign Key | "t5_2s30g" | The id of user's favorite subreddit. |

Subreddit Table:

| Column Name | Data Type | Constraint | Example | Description |
| ----------- | --------- | ---------- | ------- | ----------- |
| subreddit_id | text | Primary Key | "t5_2s30g" | The id of the subreddit. |
| subreddit | text | | "AskMen" | The name of the subreddit. |
| favorite_word | text | Foreign Key | "democracy" | The favorite word used in the subreddit. |

Favorite Word Table:

| Column Name | Data Type | Constraint | Example | Description |
| ----------- | --------- | ---------- | ------- | ----------- |
| favorite_word | text | Primary Key | "democracy" | The favorite word. |
| uses | integer | | 4500 | The amount of times the word is used in the dataset. |
| most_used | text | Foreign Key | "t5_2s30g" | The id of the subreddit this word is used most in. |

### 2.3 - A complete finalized Entity-Relationship Diagram [ERD] for the database [NOT hand-drawn, PLEASE!]
![Alt text](/detailedERD.png?raw=true "ERD Diagram")
