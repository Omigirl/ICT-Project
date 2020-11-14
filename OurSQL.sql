-- Firstly we created Tables without foreign key constraints. 

CREATE TABLE "location" (
  "loc_id" int PRIMARY KEY,
  "region" varchar(32),
  "city" varchar(32)
);

CREATE TABLE "moderators" (
  "mod_id" int PRIMARY KEY,
  "login" varchar(32),
  "password" varchar(32)
);

CREATE TABLE "paid_services" (
  "order_id" int PRIMARY KEY,
  "price" int,
  "mod_id" int,
  "isPremium" bool,
  "privilege" varchar(128)
);

CREATE TABLE "company" (
  "company_id" int PRIMARY KEY,
  "loc_id" int,
  "company_name" varchar(32)
);

CREATE TABLE "recruiter" (
  "recruiter_id" int PRIMARY KEY,
  "company_id" int
);

CREATE TABLE "job_type" (
  "type_id" int PRIMARY KEY,
  "job_name" varchar(255)
);

CREATE TABLE "vacancy" (
  "vacancy_id" int PRIMARY KEY,
  "type_id" int,
  "recruiter_id" int,
  "order_id" int,
  "seeker_id" int
);

CREATE TABLE "job_seeker" (
  "seeker_id" int PRIMARY KEY,
  "photo_id" int,
  "seeker_name" varchar(32)
);

CREATE TABLE "seeker_cv" (
  "cv_id" int PRIMARY KEY,
  "work_exp" int,
  "order_id" int,
  "seeker_id" int,
  "birth_date" date,
  "bachelor_degree" bool,
  "phd" bool,
  "email" varchar(50),
  "profile" varchar(255)
);

CREATE TABLE "seeker_photo" (
  "photo_id" int PRIMARY KEY,
  "url" varchar(32),
  "isVerified" bool
);

-- Then we added all foreign key constraints according to our buisness rules. 

ALTER TABLE "paid_services" ADD FOREIGN KEY ("mod_id") REFERENCES "moderators" ("mod_id");

ALTER TABLE "company" ADD FOREIGN KEY ("loc_id") REFERENCES "location" ("loc_id");

ALTER TABLE "recruiter" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("company_id");

ALTER TABLE "vacancy" ADD FOREIGN KEY ("type_id") REFERENCES "job_type" ("type_id");

ALTER TABLE "vacancy" ADD FOREIGN KEY ("recruiter_id") REFERENCES "recruiter" ("recruiter_id");

ALTER TABLE "vacancy" ADD FOREIGN KEY ("order_id") REFERENCES "paid_services" ("order_id");

ALTER TABLE "vacancy" ADD FOREIGN KEY ("seeker_id") REFERENCES "job_seeker" ("seeker_id");

ALTER TABLE "job_seeker" ADD FOREIGN KEY ("photo_id") REFERENCES "seeker_photo" ("photo_id");

ALTER TABLE "seeker_cv" ADD FOREIGN KEY ("order_id") REFERENCES "paid_services" ("order_id");

ALTER TABLE "seeker_cv" ADD FOREIGN KEY ("seeker_id") REFERENCES "job_seeker" ("seeker_id");
