DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS parentOrgs;

CREATE TABLE parentOrgs (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR UNIQUE NOT NULL,
  logo VARCHAR,
  description VARCHAR DEFAULT "", 
  skills VARCHAR []
);

CREATE TABLE projects (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  lfxProjectId VARCHAR UNIQUE NOT NULL, 
  name VARCHAR UNIQUE NOT NULL, 
  industry VARCHAR [], 
  description VARCHAR DEFAULT '',
  skills VARCHAR [], 
  programYear INTEGER NOT NULL, 
  programTerm VARCHAR NOT NULL,
  repository VARCHAR NOT NULL,
  website VARCHAR NOT NULL,
  amountRaised FLOAT NOT NULL DEFAULT 0,
  organizationId INTEGER NOT NULL, 
  CONSTRAINT fk_organizationId
    FOREIGN KEY (organizationId) 
	  REFERENCES parentOrgs(id)
    ON DELETE CASCADE
);
