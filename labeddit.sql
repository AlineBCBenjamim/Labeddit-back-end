-- Active: 1679595578460@@127.0.0.1@3306

CREATE TABLE
    users(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL,
        created_at TEXT DEFAULT(DATETIME())
    );

INSERT INTO
    users(id, name, email, password, role)
VALUES (
        "u001",
        "Bárbara",
        "barbara@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "NORMAL"
    ), (
        "u002",
        "Naomy",
        "naomy@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "NORMAL"
    ), (
        "u003",
        "Paulinha",
        "paulinha@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "ADMIN"
    ), (
        "u004",
        "Filipe",
        "filipe@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "NORMAL"
    );

SELECT * FROM users;

CREATE TABLE
    posts (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        creator_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER DEFAULT(0),
        dislikes INTEGER DEFAULT(0),
        created_at TEXT DEFAULT(DATETIME()),
        updated_at TEXT DEFAULT(DATETIME()),
        FOREIGN KEY (creator_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO
    posts(id, creator_id, content)
VALUES ("p001", "u004", "Hello!"), (
        "p002",
        "u003",
        "Good Morning!"
    ), (
        "p003",
        "u001",
        "What's your name?"
    ), ("p004", "u002", "Bye!");

SELECT * FROM posts;

CREATE TABLE
    comments (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,        
        post_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER DEFAULT(0),
        dislikes INTEGER DEFAULT(0),
        created_at TEXT DEFAULT(DATETIME()),
        updated_at TEXT DEFAULT(DATETIME()),
        creator_id TEXT NOT NULL, 
        FOREIGN KEY (creator_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE
    likes_dislikes_posts (
        user_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE,
        UNIQUE (user_id, post_id)
    );

    CREATE TABLE
    likes_dislikes_comments (
        user_id TEXT NOT NULL,
        comment_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        like INTEGER NOT NULL,
        FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE ON UPDATE CASCADE,
        UNIQUE (user_id, comment_id, post_id)
    );

    SELECT * FROM comments;
    
    INSERT INTO comments (id, post_id, content, creator_id) VALUES
    ("c001", "p001", "I really like to eat strawberry!", "u001"),
    ("c002", "p002", "I like the little mermaid", "u002"), 
    ("c003", "p004", "I like disney", "u002"), 
    ("c004", "p003", "I like to eat pasta", "u003"), 
    ("c005", "p002", "I like to sleep", "u004"), 
    ("c006", "p001", "I like to play video games", "u003"); 