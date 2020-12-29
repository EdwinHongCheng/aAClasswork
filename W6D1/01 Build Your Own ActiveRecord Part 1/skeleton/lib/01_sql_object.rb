# Phase I - Finished All
# Note: referenced Solution

require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  # Phase Ia: ::table_name and ::table_name=

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
  end


  # Phase Ib: Listing Columns

  def self.columns

    answer = []

    # using "@query ||= " to let it use prefetched data later on
    @query ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    # the 1st element of "query" should be:
    # an array with all column names as strings
    column_arr = @query[0]

    column_arr.each do |column_name|
      answer << column_name.to_sym
    end

    answer
  end


  # Phase Ic: Getters and Setters

  def attributes
    @attributes ||= {}

    @attributes
  end

  def self.finalize!

    self.columns.each do |column_symbol|

      # attr_reader - aka getter method
      define_method(column_symbol) do
        attributes[column_symbol]
      end

      #attr_writer - aka setter method
      define_method("#{column_symbol}=") do |val|
        attributes[column_symbol] = val
      end

    end

  end


  # Phase Id: #initialize

  def initialize(params = {})

    params.each do |key, val|
      symbol = key.to_sym

      # Note: self.class -> allows us to use self.class.columns
      if !self.class.columns.include?(symbol)
        raise "unknown attribute '#{key}'" 
      end

      self.send("#{symbol}=", val)
    end

  end


  # Phase Ie: ::all, ::parse_all
  
  def self.all

    results_arr = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
    SQL

    # uses the below helper method
    parsed_results = parse_all(results_arr)

    # this method returns an array of Ruby objects
    parsed_results
  end

  # converts an array of raw Hash objects (results) into:
  # -> an array of Ruby objects
  def self.parse_all(results)
    results.map { |result| self.new(result) }
  end


  # Phase If: ::find

  # Note: Very similar to self.all (see above)
  def self.find(id)

    result_arr = DBConnection.execute(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL

    # this method returns an array of a single Ruby object
    parsed_result = parse_all(result_arr)

    parsed_result[0]
  end


  # Phase Ig: #insert

  def attribute_values

    # this return an array of the corresponding values of each table column
    self.class.columns.map { |column_name| self.send(column_name) }
  end

  # referenced Solution
  def insert

    # using arr[1..-1] to avoid inserting id (the first column)
    columns = self.class.columns[1..-1]

    column_names = columns.map(&:to_s).join(", ")
    question_marks = (["?"] * columns.count).join(", ")

    # again, using arr[1..-1] to avoid inserting id (the first column)
    DBConnection.execute(<<-SQL, *attribute_values[1..-1])
      INSERT INTO
        #{self.class.table_name} (#{column_names})
      VALUES
        (#{question_marks})
    SQL

    # don't remember what this line does
    # from past material - might want to review
    self.id = DBConnection.last_insert_row_id
  end


  # Phase Ih: #update

  # referenced Solution
  def update
    set_line = self.class.columns.map { |attr| "#{attr} = ?" }.join(", ")

    # Note: uses the helper method: #attribute_values
    DBConnection.execute(<<-SQL, *attribute_values, id)
      UPDATE
        #{self.class.table_name}
      SET
        #{set_line}
      WHERE
        #{self.class.table_name}.id = ?
    SQL

  end


  # Phase Ii: #save

  def save
    if id.nil?
      insert
    else
      update
    end
  end

end
