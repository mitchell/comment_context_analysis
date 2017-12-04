require 'json'
require 'neo4j-core'
require 'neo4j/core/cypher_session/adaptors/http'
require 'ruby-progressbar'

# create adaptor and session to Neo4j server
adaptor = Neo4j::Core::CypherSession::Adaptors::HTTP.new 'http://neo4j:polarbear@localhost:7474' # rubocop:disable Metrics/LineLength
session = Neo4j::Core::CypherSession.new adaptor

# read contents of file to file
file = File.read './first10000.json'

# unwind and load array of hashes hash-by-hash into query and run query
file_array = file.lines.collect { |line| JSON.parse line }
query_progress = ProgressBar.create(title: 'Load Queries', starting_at: 0,
                                    total: file_array.length)
to_query = <<QUERY
  UNWIND {json} as properties
  CREATE (c:Comment) SET c = properties
QUERY
file_array.each do |data|
  session.query to_query, json: data
  query_progress.increment
end
# session.query 'CREATE INDEX ON :Comment(id)'

other_progress = ProgressBar.create(title: 'Other Queries', starting_at: 0,
                                    total: 5)
# create Subreddits label and nodes
to_query = <<QUERY
  MATCH (c:Comment)
  MERGE (s:Subreddit {id: c.subreddit_id})
    ON CREATE SET s.name = c.subreddit, s.comment_count = 1
    ON MATCH SET s.comment_count = s.comment_count + 1
QUERY
session.query to_query
# session.query 'CREATE INDEX ON :Subreddit(name)'
other_progress.increment

# create relationship between posts with subreddits that match
to_query = <<QUERY
  MATCH (c:Comment)
  WITH c
  MATCH (s:Subreddit)
  WHERE c.subreddit_id = s.id
  CREATE (c)-[:POSTED_IN]->(s)
QUERY
session.query to_query
other_progress.increment
# remove overlapping properties with subreddits from comments
to_query = <<QUERY
  MATCH (c:Comment)
  REMOVE c.subreddit_id, c.subreddit
QUERY
session.query to_query
other_progress.increment

# create Author label, nodes, and relationships to comments
to_query = <<QUERY
  MATCH (c:Comment)
  MERGE (a:Author {name: c.author})
    ON CREATE SET a.comment_count = 1
    ON MATCH SET a.comment_count = a.comment_count + 1
  CREATE (a)-[:WROTE]->(c)
QUERY
session.query to_query
other_progress.increment
# session.query 'CREATE INDEX ON :Author(name)'

# remove overlapping properties with comments from authors
to_query = <<QUERY
  MATCH (c:Comment)
  REMOVE c.author
QUERY
session.query to_query
other_progress.increment
