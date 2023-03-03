-- Active: 1677871325828@@127.0.0.1@3306

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
        "author"
    ), (
        "u002",
        "Naomy",
        "naomy@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "author"
    ), (
        "u003",
        "Paulinha",
        "paulinha@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "admin"
    ), (
        "u004",
        "Filipe",
        "filipe@labenu.com",
        "$2a$12$CIHI6habJCFvlzVeoKpZq.k2DVqfaBYVewqlDgHcLPUROCkaRkPcq",
        "author"
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
        creator_id TEXT NOT NULL,
        post_id TEXT NOT NULL,
        content TEXT NOT NULL,
        likes INTEGER DEFAULT(0),
        dislikes INTEGER DEFAULT(0),
        created_at TEXT DEFAULT(DATETIME()),
        updated_at TEXT DEFAULT(DATETIME()),
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