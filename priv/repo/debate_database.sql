CREATE TABLE school(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	address TEXT NOT NULL,
	phone TEXT NOT NULL
);

CREATE TABLE debate_role(
	id SERIAL PRIMARY KEY,
	role TEXT NOT NULL
);

INSERT INTO debate_role(role) VALUES ('First speaker'), ('Second speaker'), ('Third speaker'), ('Reply speaker');

CREATE TABLE team(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	affiliationSchoolId INTEGER NOT NULL,
	firstMember INTEGER NOT NULL,
	secondMember INTEGER NOT NULL,
	thirdMember INTEGER NOT NULL
);

ALTER TABLE team
ADD CONSTRAINT fk_firstMember FOREIGN KEY (firstMember) REFERENCES users(id);

ALTER TABLE team
ADD CONSTRAINT fk_secondMember FOREIGN KEY (secondMember) REFERENCES users(id);

ALTER TABLE team
ADD CONSTRAINT fk_thirdMember FOREIGN KEY (thirdMember) REFERENCES users(id);


CREATE TABLE team_extra_members(
	id SERIAL PRIMARY KEY,
	teamId INTEGER NOT NULL,
	userId INTEGER NOT NULL
);

ALTER TABLE team_extra_members
ADD CONSTRAINT fk_teamId FOREIGN KEY (teamId) REFERENCES team(id);

ALTER TABLE team_extra_members
ADD CONSTRAINT fk_userId FOREIGN KEY (userId) REFERENCES users(id);


CREATE TABLE tournament(
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	host INTEGER NOT NULL,
	admin INTEGER NOT NULL
);

ALTER TABLE tournament
ADD CONSTRAINT fk_host FOREIGN KEY (host) REFERENCES school(id);

ALTER TABLE tournament
ADD CONSTRAINT fk_admin FOREIGN KEY (admin) REFERENCES users(id);

CREATE TABLE tournament_judges (
	id SERIAL PRIMARY KEY,
	tournamentId INTEGER NOT NULL,
	affiliationSchoolId INTEGER NOT NULL,
	userId INTEGER NOT NULL
);


ALTER TABLE tournament_judges
ADD CONSTRAINT fk_tournamentId FOREIGN KEY (tournamentId) REFERENCES tournament(id);

ALTER TABLE tournament_judges
ADD CONSTRAINT fk_affiliationSchoolId FOREIGN KEY (affiliationSchoolId) REFERENCES school(id);

ALTER TABLE tournament_judges
ADD CONSTRAINT fk_userId FOREIGN KEY (userId) REFERENCES users(id);


CREATE TABLE tournament_coaches (
	id SERIAL PRIMARY KEY,
	tournamentId INTEGER NOT NULL,
	affiliationSchoolId INTEGER NOT NULL,
	userId INTEGER NOT NULL
);


ALTER TABLE tournament_coaches
ADD CONSTRAINT fk_tournamentId FOREIGN KEY (tournamentId) REFERENCES tournament(id);

ALTER TABLE tournament_coaches
ADD CONSTRAINT fk_affiliationSchoolId FOREIGN KEY (affiliationSchoolId) REFERENCES school(id);

ALTER TABLE tournament_coaches
ADD CONSTRAINT fk_userId FOREIGN KEY (userId) REFERENCES users(id);


CREATE TABLE tournament_teams (
	id SERIAL PRIMARY KEY,
	tournamentId INTEGER NOT NULL,
	affiliationSchoolId INTEGER NOT NULL,
	teamId INTEGER NOT NULL
);


ALTER TABLE tournament_teams
ADD CONSTRAINT fk_tournamentId FOREIGN KEY (tournamentId) REFERENCES tournament(id);

ALTER TABLE tournament_teams
ADD CONSTRAINT fk_affiliationSchoolId FOREIGN KEY (affiliationSchoolId) REFERENCES school(id);

ALTER TABLE tournament_coaches
ADD CONSTRAINT fk_teamId FOREIGN KEY (teamId) REFERENCES team(id);


CREATE TABLE debate(
	id SERIAL PRIMARY KEY,
	propTeam INTEGER NOT NULL,
	oppTeam INTEGER NOT NULL,
	propScore INTEGER,
	oppScore INTEGER,
	tournamentId INTEGER NOT NULL
);

ALTER TABLE debate
ADD CONSTRAINT fk_propTeam FOREIGN KEY (propTeam) REFERENCES team(id);

ALTER TABLE debate
ADD CONSTRAINT fk_oppTeam FOREIGN KEY (oppTeam) REFERENCES team(id);

ALTER TABLE debate
ADD CONSTRAINT fk_tournamentId FOREIGN KEY (tournamentId) REFERENCES tournament(id);


CREATE TABLE debate_score(
	id SERIAL PRIMARY KEY,
	debater INTEGER NOT NULL,
	debateRole INTEGER NOT NULL,
	debate INTEGER NOT NULL,
	content INTEGER NOT NULL,
	strategy INTEGER NOT NULL,
	style INTEGER NOT NULL
);

ALTER TABLE debate_score
ADD CONSTRAINT fk_debater FOREIGN KEY (debater) REFERENCES users(id);

ALTER TABLE debate_score
ADD CONSTRAINT fk_debateRole FOREIGN KEY (debateRole) REFERENCES debate_role(id);

ALTER TABLE debate_score
ADD CONSTRAINT fk_debate FOREIGN KEY (debate) REFERENCES debate(id);

ALTER TABLE debate
ADD COLUMN motion TEXT NOT NULL;
