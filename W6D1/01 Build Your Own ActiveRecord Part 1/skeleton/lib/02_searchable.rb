# Phase II: Searchable - Finished All

require_relative 'db_connection'
require_relative '01_sql_object'

# Note: referenced Solution
module Searchable
  def where(params)
    where_line = params.keys.map { |key| "#{key} = ?" }.join(" AND ")

    results = DBConnection.execute(<<-SQL, *params.values)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL

    # using the helper method from Phase I
    parse_all(results)
  end
end

class SQLObject

  # Mixin Searchable here...
  extend Searchable
end
