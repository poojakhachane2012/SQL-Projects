show databases;
create database ex_4;
use ex_4; 

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    release_year INT,
    genre VARCHAR(50),
    director_id INT,
    foreign key (director_id) references directors(director_id)
);
INSERT INTO movies VALUES
(1, 'Space Odyssey', 2020, 'Sci-Fi', 1),
(2, 'The Great Escape', 2019, 'Action', 2),
(3, 'Romantic Fable', 2021, 'Romance', 3),
(4, 'Mystery of Time', 2022, 'Mystery', NULL),
(5, 'Comedy Nights', 2020, 'Comedy', 2),
(6, 'Historical Journey', 2018, 'History', NULL),
(7, 'Future Wars', 2022, 'Sci-Fi', 1),
(8, 'Nature Documented', 2021, 'Documentary', 4),
(9,'Top Gun',2018,'Drama & Action',1);
select * from movies;

CREATE TABLE directors (
    director_id INT PRIMARY KEY,
    name VARCHAR(255),
    birth_year INT,
    release_year INT,
    nationality VARCHAR(50)
);
INSERT INTO directors VALUES
(1, 'John Smith',1975, 2020, 'American'),
(2, NULL,1982, 2019, 'British'),
(3, 'Michael Brown',1968, 2021, 'Canadian'),
(4, 'Sophia Davis',1978, 2021, 'Australian'),
(5, 'Daniel Lee',1980, 2018, 'Korean');
select * from directors;

-- Q. List all movies along with their director names.
SELECT movies.title, directors.name
FROM movies
left JOIN directors
ON movies.director_id = directors.director_id;

-- Q. Find the titles of movies that do not have an associated director in the directors table.
select movies.title,directors.name
from movies left join directors
ON movies.director_id = directors.director_id
where directors.director_id is null;

-- Q. Display the names of directors who have directed more than one movie.
select directors.name
from movies join directors
ON movies.director_id = directors.director_id
group by directors.director_id
having count(movies.movie_id)>1;

-- Q. List all movies released after 2019 along with their directors’ nationalities.
select * from directors;
select * from movies;
select  movies.release_year,directors.nationality,movies.title
from movies join directors
ON movies.director_id = directors.director_id
having movies. release_year > 2019;

-- Q. Find the titles of movies along with their directors’ names, for movies that belong to the ‘Sci-Fi’ genre.
select movies.title,directors.name,movies.genre
from movies join directors
ON movies.director_id = directors.director_id
where movies.genre='Sci-Fi';

-- Q. List all directors who have made a ‘Comedy’ movie.
select directors.name , movies.title 
from movies join directors
ON movies.director_id = directors.director_id
where movies.genre = 'Comedy';

-- Q. Show the title and release year of movies directed by ‘Emily Johnson’.
select movies.title,movies.release_year,directors.name
from movies join directors
ON movies.director_id = directors.director_id
where directors.name ='Emily Johnson';

-- Q. Identify movies released before 2021 that do not have a director listed.
select movies.release_year,movies.title
from movies join directors
ON movies.director_id = directors.director_id
where  movies.release_year<2021;

-- Q. Display the count of movies each director has made, including directors who have not made any movies.
select count(movies.movie_id) , directors.name
from movies join directors
ON movies.director_id = directors.director_id
group by directors.name;

-- Q. List the movies and their genres directed by directors born after 1970.
select movies.title,directors.birth_year , movies.genre
from movies join directors
ON movies.director_id = directors.director_id
where directors.birth_year > 1970;

-- Q. Show the titles of movies along with the birth years of their directors.
select movies.title,directors.birth_year
from movies join directors
ON movies.director_id = directors.director_id;


-- Q. List the names of all directors and the number of ‘Action’ movies they have directed.
select directors.name , movies.genre
from movies join directors 
ON movies.director_id = directors.director_id
where movies.genre='action';

-- Q. Find the titles of movies directed by directors of ‘American’ nationality.
select movies.title ,directors.nationality
from movies join directors
ON movies.director_id = directors.director_id
where directors.nationality = 'american';

-- Q. Display the nationalities of directors who have directed movies released in 2020 or later.
select directors.nationality,movies.release_year,movies.title
from movies join directors
ON movies.director_id = directors.director_id
where movies.release_year >=2020;

-- Q. List all movies, including the director’s name, for those movies where the director’s last name is ‘Johnson’.
select movies.title , directors.name 
from movies right join directors
ON movies.director_id = directors.director_id
where directors.name like'%Johnson';

-- Q. List all movies by the same directors in descending order of release year.
select movies.title,directors.release_year
from movies join directors
ON movies.director_id = directors.director_id
order by directors.release_year desc;

-- Q. Find directors who have directed in more than one genre.
select directors.name,count(distinct movies.genre)as genre_count
from movies join directors
ON movies.director_id = directors.director_id
group by directors.name
having count(  distinct movies.genre)>1;

-- Q. Calculate the total number of movies each director has made, sorted by the most prolific.
select count(movies.movie_id) as movie_count ,directors.name
from movies join directors
ON movies.director_id = directors.director_id
group by directors.name
order by movie_count desc;

-- Q. Show all directors who have made both ‘Sci-Fi’ and ‘Action’ movies without listing the same director twice.
select movies.genre , directors.name
from movies join directors
ON movies.director_id = directors.director_id
where (movies.genre = ('Sci-Fi') or movies.genre = ('action')) limit 1;

-- Q. Identify the director who has worked with the most genres.
select count(directors.name), movies.genre
from movies join directors
ON movies.director_id = directors.director_id
group by movies.genre;

-- Q. Calculate the span of years each director has been active (from their first to their last movie).
select sum(movies.release_year) as span_of_year ,directors.name
from movies join directors
ON movies.director_id = directors.director_id
group by directors.name;

-- Q. List directors whose movies have never been in the ‘Documentary’ genre.
select movies.genre , directors.name
from movies join directors
ON movies.director_id = directors.director_id
where movies.genre!='Documentary';

-- Q. Find the year with the most diverse genres of movies released.
select movies.release_year , count(movies.genre) as num_genres
from movies
group by release_year
order by  num_genres;


-- Q. Show all movies released in the same year as ‘Space Odyssey’ but in a different genre.
select movies.release_year, movies.title, movies.genre
from movies
where movies.release_year = 2020 or  movies.genre;

select * from directors;
select * from movies;

CREATE TABLE Books (
    book_id INT,
    title VARCHAR(255),
    author VARCHAR(255),
    publication_year INT
);
INSERT INTO Books (book_id, title, author, publication_year) VALUES
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 1925),
(2, 'To Kill a Mockingbird', 'Harper Lee', 1960),
(3, '1984', 'George Orwell', 1949);
select * from Books;

CREATE TABLE Magazines (
    magazine_id INT,
    title VARCHAR(255),
    editor VARCHAR(255),
    publication_year INT
);
INSERT INTO Magazines (magazine_id, title, editor, publication_year) VALUES
(1, 'National Geographic', 'Susan Goldberg', 1888),
(2, 'The New Yorker', 'David Remnick', 1925),
(3, 'TIME', 'Edward Felsenthal', 1923);
select * from Magazines;

-- Q. List all titles from both books and magazines.
select Magazines.title,books.title
from books join magazines
on books.book_id = magazine_id;

-- Q. Find all unique publication years across both books and magazines.
SELECT publication_year
FROM books
UNION
SELECT publication_year
FROM magazines
ORDER BY publication_year;

-- Q. Create a list of all titles and their publication years from both tables.
select books.title,books.publication_year , magazines.title,magazines.publication_year
from books inner join magazines
on books.book_id = magazines.magazine_id;

-- Q. List all authors from the books and editors from the magazines as a single column named Author/Editor.
select books.author as Author_Editor
from books
union
select magazines.editor
from magazines;

-- Q. List all titles from books and magazines, including duplicates, and show where each title comes from in a new column called Source.
SELECT books.title AS title, 'Books' AS source
FROM books
UNION ALL
SELECT magazines.title AS title, 'Magazines' AS source
FROM magazines
ORDER BY title;

-- Q. List all titles from books and magazines that were published before 1950.
select books.title,magazines.title,books.publication_year,magazines.publication_year
from books join magazines
on books.book_id = magazines.magazine_id
having  books.publication_year<1950 or magazines.publication_year<1950;

-- Q. Combine titles and authors/editors into a single column for both books and magazines, separated by a dash (‘-‘).
SELECT CONCAT(books.title, ' - ', author) AS title_and_author
FROM books
UNION
SELECT CONCAT(magazines.title, ' - ', editor) AS title_and_author
FROM magazines
ORDER BY title_and_author;


-- Q. List all distinct publication years and the type of publication (book or magazine) for each year.
select distinct books.publication_year , 'book' as publication_type
from books 
union 
select distinct magazines.publication_year , 'Magazine' as publication_type
from magazines 
order by publication_year;


-- Q. Combine the titles from both books and magazines, but include a column indicating whether it’s a ‘Book’ or ‘Magazine’.
select books.title , 'its books'as title
from books
union
select magazines.title , 'its  magazines' as title
from  magazines;

-- Q. Create a list of all authors and editors, ensuring each name appears only once in the list.
select   distinct books.author
from books
union
select distinct magazines.editor
from  magazines;

-- Q. List all titles and their publication years where the publication year is a multiple of 10, distinguishing between books and magazines.
 SELECT title AS title, publication_year, 'Books'
FROM books
WHERE publication_year % 10 = 0
UNION ALL
SELECT title AS title, publication_year, 'Magazines'
FROM magazines
WHERE publication_year % 10 = 0
ORDER BY publication_year, title;

-- Q. List titles from both tables, sorted by publication year in descending order.
select books.title , books.publication_year
from books 
union 
select magazines.title,magazines.publication_year
from magazines
order by publication_year  desc;

-- Q. List all titles with the word ‘The’ in them, from both books and magazines.
select books.title 
from books 
where books.title like '%The%'
union all
select  magazines.title 
from magazines
where magazines.title like '%The%'
order by title;

-- Q. List titles from both books and magazines, excluding those with publication years in the 1920s
select books.title,magazines.title,books.publication_year,magazines.publication_year
from books join magazines
on books.book_id = magazines.magazine_id
having  books.publication_year=1920 or magazines.publication_year=1920;