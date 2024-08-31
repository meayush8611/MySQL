#to make it default database when we have multiple databases 
use moviesdb;

# * stands for all columns when you want to select specific columns you can simply write at the place of * followed by ,
select * from movies;
select title,imdb_rating from movies;
select * from movies where industry="bollywood";


#to know the count of the number of rows
#it is case insensitive like in bollywood or Bollywood ,both will work fine
select count(*) from movies where industry="Bollywood";


# to know the distinct number of options in single column 
#distinct values that are different from each other
select distinct industry from movies;


#to search specific keyword in the table 
# % is used for now matter whatever is before or after that specific keyword
#this is also called wild card searching
select * from movies where title like "%thor%";


#null values means a value is missing or unknown
#to find the null rows of specific column
select * from movies where studio="";


# Print all movie titles and release year for all Marvel Studios movies.
select title,release_year from movies where studio ="Marvel Studios";

# Print all movies that have Avenger in their name.
select * from movies where title like "%avenger%";

# Print the year when the movie "The Godfather" was released.
select release_year from movies where title ="The Godfather";

#Print all distinct movie studios in the Bollywood industry.
select distinct studio from movies where industry="bollywood";
#this is another method using subtable 
select 
distinct studio from
(select * from movies where industry ="bollywood") as boll_movies;
                        
#use of AND operator
select title,imdb_rating from movies where imdb_rating>6 and imdb_rating<8;
#using BETWEEN operator for the same result 
# this will includes 6 as well as 8 both
select title,imdb_rating from movies where imdb_rating between 6 and 8;


#use of or operator
#this method is little bit time consuming for to many specific fetchings
select * from movies where release_year =2022 or release_year=2019 or release_year=2018;
#another and better way to fetch the same result is :
select * from movies where release_year in (2022,2019,2018);
#we can use IN operator for string values also
select * from movies where studio in ("Marvel studios","Zee Studios");


# to escape from the null values easilyy
select * from movies where imdb_rating is NOT NULL;
#like i can see some null values in studio column to escape from these also we can use subtable method
select * from 
           (select * from movies where imdb_rating is NOT NUll) as escape_null
where studio is NOT NULL;






