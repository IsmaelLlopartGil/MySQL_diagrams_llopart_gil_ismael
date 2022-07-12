use spotify;

insert into paypal_account (username) values ("username1");
insert into paypal_account (username) values ("username2");
insert into credit_card (number, pass_code) values ("5698 9878 5455 5455", "6831");
insert into credit_card (number, pass_code) values ("6987 5632 7885 0036", "3501");

insert into subscription (subscribed_at, date_of_renovation, way_to_pay, paypal_account_paypal_account_id) values ('2019-06-06', '2019-10-31', "paypal", 1);
insert into subscription (subscribed_at, date_of_renovation, way_to_pay, paypal_account_paypal_account_id) values ('2021-08-29', '2022-03-26', "paypal", 2);
insert into subscription (subscribed_at, date_of_renovation, way_to_pay, credit_card_credit_card_id) values ('2020-09-26', '2021-05-21', "card", 1);
insert into subscription (subscribed_at, date_of_renovation, way_to_pay, credit_card_credit_card_id) values ('2019-07-08', '2020-03-02', "card", 2);

insert into payment (date, order_number, total) values ("2022-01-16", "001", 20.50);
insert into payment (date, order_number, total) values ("2022-06-06", "002", 20.50);
insert into payment (date, order_number, total) values ("2022-03-18", "003", 20.50);
insert into payment (date, order_number, total) values ("2022-05-23", "004", 20.50);
insert into payment (date, order_number, total) values ("2022-06-23", "005", 20.50);

insert into payment_has_subscription values (1,1);
insert into payment_has_subscription values (2,2);
insert into payment_has_subscription values (3,3);
insert into payment_has_subscription values (4,4);
insert into payment_has_subscription values (5,4);

insert into user (email, password, user_name, date_of_birth, sex, country, postal_code) values ('ngregs0@toplist.cz', '3cNYDyp3', 'sbear0', '2019-09-22', 'Female', 'Malaysia', '13800');
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code) values ('jprint1@nba.com', 'zEIpoKkH4g', 'egower1', '2021-03-15', 'Male', 'Russia', '391448');
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code) values ('tpellamont2@wordpress.com', '4TZ7PCO6y', 'iposner2', '2022-05-02', 'Male', 'North Korea', 65897);
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code) values ('rtreece3@mapquest.com', 'sFjbwer', 'lgutowska3', '2019-09-08', 'Female', 'Ethiopia', 35987);
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code) values ('bdelouch4@blogger.com', '8MeDpTs', 'greiach4', '2021-01-30', 'Female', 'Thailand', '20150');
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code) values ('wconiam5@plala.or.jp', 'KO9FO0', 'xlax5', '2021-10-16', 'Male', 'Jordan', 21112);
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code, subscription_subscription_id) values ('jardling6@europa.eu', 'rGlM5gwCPHW', 'mkeitley6', '2020-10-17', 'Male', 'Uzbekistan', 498732, 1);
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code, subscription_subscription_id) values ('eklainer7@ca.gov', 'A7ZogF', 'gmeert7', '2020-07-25', 'Female', 'China', 697845, 2);
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code, subscription_subscription_id) values ('gpennyman8@phpbb.com', 'ZwZol955p1K', 'emarquiss8', '2020-08-03', 'Female', 'Kenya', 569877, 3);
insert into user (email, password, user_name, date_of_birth, sex, country, postal_code, subscription_subscription_id) values ('joldridge9@php.net', 'X8sSM5D', 'cskally9', '2020-08-10', 'Male', 'Uganda', 336986, 4);

insert into artist (name) values ("Avantasia");
insert into artist (name) values ("Hammerfall");
insert into artist (name) values ("Tom Waits");
insert into artist (name) values ("Eartha Kitt");

insert into similar_artist values (1,2);

insert into album (title, year, artist_artist_id) values ("The Metal Opera", "2001", 1);
insert into album (title, year, artist_artist_id) values ("Crimson thunder", "2002", 2);

insert into song (title, duration_seconds, number_of_plays, album_album_id) values ("Breaking Away", 270, 20000, 1);
insert into song (title, duration_seconds, number_of_plays, album_album_id) values ("The Tower", 320, 35000, 1);
insert into song (title, duration_seconds, number_of_plays, album_album_id) values ("Riders Of The Storm", 230, 15556, 2);
insert into song (title, duration_seconds, number_of_plays, album_album_id) values ("Crimson Thunder", 315, 150000, 2);

insert into followed_artist values (1, 5);
insert into followed_artist values (2, 8);

insert into user_likes_album values (5, 1);
insert into user_likes_album values (3, 2);

insert into user_likes_song values (1, 4);
insert into user_likes_song values (3, 3);

insert into playlist (created_at, status, user_user_id) values ("2022-6-15", "active", 5);
insert into playlist (created_at, status, user_user_id) values ("2022-6-23", "active", 6);

insert into shared_playlist values (1, 2);

insert into song_has_playlist values (1, 1, 5, "2022-07-01");
insert into song_has_playlist values (3, 1, 2, "2022-07-03");
insert into song_has_playlist values (2, 2, 6, "2022-07-08");
insert into song_has_playlist values (4, 2, 6, "2022-07-10");

