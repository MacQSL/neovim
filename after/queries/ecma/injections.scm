; extends

; knex.raw sql strings
(call_expression
  function: (member_expression
              (property_identifier) @method-name (#eq? @method-name "raw"))
  arguments: (arguments
              (template_string) @injection.content) (#set! injection.language "sql"))

; SQL template strings
(call_expression
  function: (identifier) @sql-template (#eq? @sql-template "SQL")
  arguments: (template_string) @injection.content(#set! injection.language "sql"))

; variables with 'sql'
(variable_declarator
  name: (identifier) @variable_name (#match? @variable_name "\w*sql\w*/i")
  value: (template_string) @injection.content (#set! injection.language "sql"))
