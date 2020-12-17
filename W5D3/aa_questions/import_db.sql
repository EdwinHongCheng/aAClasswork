PRAGMA foreign_keys = ON;


DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);


-- Join table
CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject_id INTEGER NOT NULL,
    parent_id INTEGER, -- "Top level" replies don't have any parent
    author_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (subject_id) REFERENCES questions(id),
    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    liked_question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (liked_question_id) REFERENCES questions(id)
);


-- Seeding our tables

INSERT INTO
    users (fname, lname)
VALUES
    ('Dmitrii', 'An'),
    ('Edwin', 'Cheng');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('HTML ZZZZ', 'Why are HTML project so boring?', 1),
    ('CSS TOO HARD', 'Why are CSS project so hard?', 2);

INSERT INTO
    question_follows (user_id, question_id)
VALUES
    (1, 1), -- User 1 following Question 1
    (1, 2), -- User 1 following Question 2
    (2, 2); -- User 2 following Question 2

INSERT INTO
    replies (subject_id, parent_id, author_id, body)
VALUES
    (1, NULL, 2, 'I know right? Puts me to sleep...'), -- User 2 (Edwin) replies to User 1's question
    (1, 1, 1, 'Guess we have to drink more Starbucks lol'); -- User 1 (Dmitrii) replies to User 2's reply to his question

INSERT INTO
    question_likes (user_id, liked_question_id)
VALUES
    (1, 2),
    (2, 1),
    (2, 2);



    