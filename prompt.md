# Overview

The goal is to produce an executive summary or high-level overview of work
currently being worked on by my team. The target audience is an executive IT
manager.

## Gathering Jira details

- Use the `list_boards` mcp tool to find the board id of the scrum board for
  the "EC" project. Set `the project_key_or_id` param to the project name.
- With the board id from the previous step, use the `get_sprints_by_name`
  mcp tool with the `state` param set to "active" to find the name and sprint
  id of the current sprint.
- Now use the `search_issues` mcp tool with some suitable JQL to list all the
  issues in the current sprint. (There might be 40 or 50, so set the `max_results`
  param to say 100 to make sure we get them all.)
- Once you have the issue list it should be enough data to produce the report. Pay
  attention to the summary and the description fields and I guess also the status.
  You could also use the `get_jira` tool to fetch more Jira details, (but I think
  currently it won't give you any additional data that isn't in the `search_issues`
  response.

## Producing the report content

There should be an executive summary paragraph at the top. It should not
mention any Jiras directly, but it should summarize overall themes and trends.
Focus on the delivered value and business impact. Talk about high level themes
and trends where possible, e.g. "Foo was a key focus" rather than listing
three or four specific Jiras related to "Foo".

## Creating the output

I want the report to be written to a date-stamped markdown formatted file in
the current directory. Let's use a YYYYMMDD style date format and call the file
"YYYYMMDD-report.md" I guess if the file exists, let's insert a build number
number to it the .md extension rather than overwrite it.
