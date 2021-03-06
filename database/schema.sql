CREATE TABLE 'sensors' (
'id' INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
'name' TEXT DEFAULT 'New sensor',
'description' TEXT DEFAULT NULL,
'update_frequency' INTEGER DEFAULT 10, -- in deciseconds (*10ms)
'date_installed' INTEGER DEFAULT (strftime('%s','now'))
);

CREATE TABLE 'log' (
'id' INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
'timestamp' INTEGER DEFAULT (strftime('%s','now')),
'sensor' INTEGER DEFAULT NULL REFERENCES 'sensors' ('id'),
'value' REAL DEFAULT NULL,
'source_user' INTEGER DEFAULT NULL REFERENCES 'users' ('id')
);

CREATE TABLE 'users' (
'id' INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
'username' TEXT DEFAULT NULL UNIQUE,
'password_hash' TEXT DEFAULT NULL
);

CREATE TABLE 'user_permissions' (
'id' INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
'user_id' INTEGER DEFAULT NULL REFERENCES 'users' ('id'),
'permission_id' INTEGER DEFAULT NULL REFERENCES 'permissions' ('id'),
UNIQUE(user_id,permission_id)
);

CREATE TABLE 'permissions' (
'id' INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
'permission_name' INTEGER DEFAULT NULL UNIQUE
);

INSERT INTO 'users' ('username') VALUES ('SYSTEM');
INSERT INTO 'permissions' ('permission_name') VALUES ('MANAGE_PERMISSIONS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 1);
INSERT INTO 'permissions' ('permission_name') VALUES ('CREATE_USERS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 2);
INSERT INTO 'permissions' ('permission_name') VALUES ('DELETE_USERS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 3);
INSERT INTO 'permissions' ('permission_name') VALUES ('MANAGE_SENSORS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 4);
INSERT INTO 'permissions' ('permission_name') VALUES ('VIEW_LOGS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 5);
INSERT INTO 'permissions' ('permission_name') VALUES ('ADD_LOGS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 6);
INSERT INTO 'permissions' ('permission_name') VALUES ('EDIT_LOGS');
INSERT INTO 'user_permissions' ('user_id', 'permission_id') VALUES (1, 7);

INSERT INTO 'sensors' ('name', 'description') VALUES ('temperature', 'temperature of solution in degrees celsius');
INSERT INTO 'sensors' ('name', 'description') VALUES ('pH', 'pH of solution. reads 0-14 with 1dp accuracy.');
