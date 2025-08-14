# Overview

The goal is to produce an executive summary or high-level overview of the
currently in progress and recently completed work. The target audience is an
executive IT manager.

## Gathering Jira details

- Use the `list_boards` mcp tool to find the board id of the scrum board for
  the "EC" project. Set `the project_key_or_id` param to the project name.
- With the board id from the previous step, use the `get_sprints_by_name` mcp
  tool with the `state` param set to "active" to find the name and sprint id
  of the current sprint.
- Now use the `search_issues` mcp tool with some suitable JQL to list all the
  issues in the current sprint. (There might be 40 or 50, so set the
  `max_results` param to say 100 to make sure we get them all.)
- Once you have the issue list it should be enough data to produce the report.
  Pay attention to the summary and the description fields particularly. You
  could also use the `get_jira` tool to fetch more Jira details, (but I think
  currently it won't give you any additional data that isn't in the
  `search_issues` response).

## Producing the report content

For all the issues, group them into 3 or 4 categories. A category might be a
large project with multiple related stories, or it might be something like
"bug fixes", "quality improvements", "toil reduction" for example.

Once you have picked out the categories, then write a sentence or two
summarizing the work done or in progress for each category. You can link
specific Jiras inline in the sentences, but don't use bullet points.

Note that you don't have to include every Jira. It's fine if less interesting
Jiras are not mentioned at all.

## Creating the output

I want the report to be written to a timestamped markdown file in the current
directory. Let's use a `date +'%Y%m%d-%H%M%S'` style date format and call the
file "$timestamp-wrap.md".

For each Jira mentioned, the Jira key should be clickable. Use a standard
Markdown link like this: `[EC-1234](https://issues.redhat.com/browse/EC-1234)`.
