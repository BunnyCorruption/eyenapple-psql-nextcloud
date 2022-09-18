CREATE TABLE "public.user" (
	"id" varchar(255) NOT NULL,
	"username" varchar(255) NOT NULL UNIQUE,
	"email" varchar(255) NOT NULL UNIQUE,
	"password" varchar(255) NOT NULL UNIQUE,
	"date" TIMESTAMP(255) NOT NULL,
	"admin_rights" BOOLEAN NOT NULL,
	CONSTRAINT "user_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.record_label" (
	"id" varchar(255) NOT NULL,
	"bio" varchar(255) UNIQUE,
	"bg_photo" varchar(255) UNIQUE,
	"name" varchar(255) NOT NULL UNIQUE,
	CONSTRAINT "record_label_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.artist" (
	"id" varchar(255) NOT NULL,
	"user_id" varchar(255),
	"bg_photo" varchar(255),
	"bio" varchar(255),
	"location" varchar(255),
	CONSTRAINT "artist_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.social_link" (
	"id" varchar(255) NOT NULL,
	"artist_id" varchar(255) NOT NULL,
	"link" varchar(255) NOT NULL,
	CONSTRAINT "social_link_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.record_label_artist" (
	"id" varchar(255) NOT NULL,
	"record_label_id" varchar(255) NOT NULL,
	"artist_id" varchar(255) NOT NULL,
	CONSTRAINT "record_label_artist_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.artist_media" (
	"id" varchar(255) NOT NULL,
	"artist_id" varchar(255) NOT NULL,
	"url" varchar(255) NOT NULL,
	"media_type" varchar(255) NOT NULL,
	CONSTRAINT "artist_media_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.calendar" (
	"id" varchar(255) NOT NULL,
	"event_datetime" TIMESTAMP NOT NULL,
	"event_region" varchar(255) NOT NULL,
	"event_name" varchar(255) NOT NULL,
	"event_address" varchar(255) NOT NULL,
	"event_zip" varchar(255) NOT NULL,
	"tickets_link" varchar(255) NOT NULL,
	"event_url" varchar(255),
	CONSTRAINT "calendar_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


CREATE TABLE "public.artist_calendar" (
	"id" varchar(255) NOT NULL,
	"artist_id" varchar(255) NOT NULL,
	"artist_id" varchar(255) NOT NULL,
	CONSTRAINT "artist_calendar_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);


ALTER TABLE "artist" ADD CONSTRAINT "artist_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("id");

ALTER TABLE "social_link" ADD CONSTRAINT "social_link_fk0" FOREIGN KEY ("artist_id") REFERENCES "artist"("id");

ALTER TABLE "record_label_artist" ADD CONSTRAINT "record_label_artist_fk0" FOREIGN KEY ("record_label_id") REFERENCES "record_label"("id");
ALTER TABLE "record_label_artist" ADD CONSTRAINT "record_label_artist_fk1" FOREIGN KEY ("artist_id") REFERENCES "artist"("id");

ALTER TABLE "artist_media" ADD CONSTRAINT "artist_media_fk0" FOREIGN KEY ("artist_id") REFERENCES "artist"("id");


ALTER TABLE "artist_calendar" ADD CONSTRAINT "artist_calendar_fk0" FOREIGN KEY ("artist_id") REFERENCES "artist"("id");
ALTER TABLE "artist_calendar" ADD CONSTRAINT "artist_calendar_fk1" FOREIGN KEY ("artist_id") REFERENCES "calendar"("id");