require 'sqlite3'
require 'singleton'


class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end



# Tables to Make into Classes

# 1. users (finished)
# 2. questions (fnished)
# 3. question_follows(finished) 
# 4. replies(WIP)
# 5 question_likes

class User
    attr_accessor :id, :lname, :fname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end
  
  def self.find_by_id(id)
    user = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) # user is stored in an array!
  end

  def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first) # user is stored in an array!
  end

  def initialize(options)
      @id = options['id']
      @fname = options['fname']
      @lname = options['lname']
  end
end


class Question
    attr_accessor :id, :title, :author_id, :body

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def initialize(options)
      @id = options['id']
      @title = options['title']
      @body = options['body']
      @author_id = options['author_id']
  end

  def find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless questions.length > 0

    questions.map { |question| Question.new(question) }
  end

  def find_by_title(title)
    question = QuestionsDatabase.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        title = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end
end

class QuestionFollow
    attr_accessor :id, :user_id, :question_id


    def self.find_by_id(id)
        q_follow = QuestionsDatabase.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            questions
          WHERE
            id = ?
        SQL
        return nil unless q_follow.length > 0
    
        QuestionFollow.new(q_follow.first)
      end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end

    def find_by_user_id(user_id)
        q_follows = QuestionsDatabase.instance.execute(<<-SQL, user_id)
          SELECT
            *
          FROM
            question_follows
          WHERE
            user_id = ?
        SQL
        return nil unless q_follows.length > 0
    
        q_follows.map { |q_follow| QuestionFollow.new(q_follow) }
    end

    def find_by_question_id(question_id)
        q_follows = QuestionsDatabase.instance.execute(<<-SQL, question_id)
          SELECT
            *
          FROM
            question_follows
          WHERE
            question_id = ?
        SQL
        return nil unless q_follows.length > 0
    
        q_follows.map { |q_follow| QuestionFollow.new(q_follow) }
    end
end

class Reply
    attr_accessor :id, :subject_id, :parent_id, :author_id, :body

    def self.find_by_id(id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, id)
          SELECT
            *
          FROM
            replies
          WHERE
            id = ?
        SQL
        return nil unless reply.length > 0
    
        Reply.new(reply.first)
    end
    
    def initialize(options)
        @id = options['id']
        @subject_id = options['subject_id']
        @parent_id = options['parent_id']
        @author_id = options['author_id']
        @body = options['body']
    end
    
    
end