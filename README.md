# cmsi486project
## 1.0 - Preliminary Database Design
###   1.1 - Project description, database engine used, potential users, maybe some other stuff
  A Postgres database of all the comments on the popular social media platform Reddit. We can use the information in the database to make inferences and analysis on cultural movements and trends. For example, we can see popular public opinion on various topics, like linking comments that had positive connotation words such as like, love, great, etc, and comments that had negative connotation words like bad, terrible, hate, etc.  with another word to see public reception to that subject within the different communities on reddit. Potential users would be advertisers, sociologists, or anyone that would possibly want information about contemporary internet culture and therefore people.
###   1.2 - Data description, generally what type of data will be stored
  The data will be coming from a dataset of reddit comments. “The dataset is ~1.7 billion JSON objects complete with the comment, score, author, subreddit, position in comment tree and other fields that are available through Reddit's API.” You can find the source of the database here: https://www.reddit.com/r/datasets/comments/3bxlg7/i_have_every_publicly_available_reddit_comment/
###   1.3 - At least five examples of the type of data your database will provide to the user
  We could return lots of different types of information with this data set, but these are some examples.
         1. Ratio of negative to positive comments on a subject
         2. Favorite words for different contexts and situations.
         3. Reception to different subjects across different demographics (ie subreddits)
         4. Find more information about demographics and users through cross-referencing results of different queries to find more sub-demographics.
         5. Analytics on the activity of different demographics of users
###   1.4 - A preliminary idea of the schema of the database including table descriptions and potential columns
  The first table is the comment table, and that contains our dataset. All of the columns from the original dataset we’re downloading will be kept for data retention. The next table is topics, which is the key words a user would search for in thread topics and comments. A separate table would be favorite words in different contexts, so it would contain the most frequently said words and phrases, and the threads they’re in. Users is another table, that contains the user’s name, and their comments, and some analytics on their most common subreddits and common phrases they used.
###   1.5 - A complete preliminary Entity-Relationship Diagram ERD for the database NOT hand-drawn, PLEASE!
  Here is rudimentary preliminary ERD:
  ![ERD Diagram](/erd-diagram.png)
