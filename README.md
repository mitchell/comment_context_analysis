# comment-context-analysis
## 2.0 - Detailed Database Description
### 2.1 - Project description
A Neo4j database of all the comments on the popular social media platform Reddit. A possible prototype database for Reddit to run on Neo4j. It can show the relationships between users, their comments, and subreddits. With this information we can infer demographic information about reddits users. For example we could see which subreddits have the same users post comments, and that would show the data analyst which communities overlap. This information would be useful for data analytics and advertisers, as well as sociologists etc. This project has the potential to be expanded to analyze the body of the comments, and view relationships of the actual content and words of each post.

## 2.2 Data Description
+ Comment
  - score: The total upvotes of a comment minus the total downvotes of a comment, it's returned as a number
  - stickied: True or False statement of if the comment is stickied
  - gilded: How many times a comment as received "reddit gold" from another user
  - edited: True or False statement on if the comment was edited or not
  - parent_id: ID of the parent comment to the current comment
  - retrieved_on: A UTC time of when this comment was archived in the dataset
  - id: The ID of this comment (Primary Key)
  - created_utc: A UTC time of when this comment was posted on reddit
  - body: The actual content of the comment

+ Author
  - name: The username of the poster of the comment (Primary Key)

+ Subreddit
  - Subreddit_name: The name of an individual subreddit (e.g. "AskReddit") (Primary Key)
  - Subreddit_id: The individual ID of a subreddit (We don't actually have to use this as the names are unique)



### 2.3 - A complete finalized Entity-Relationship Diagram [ERD] for the database [NOT hand-drawn PLEASE!]
![Alt text](/ERDdiagramfinal.png?raw=true "ERD Diagram")
