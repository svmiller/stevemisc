# Map Quiz Wrong Guesses Across Five Intro to IR Courses

This is a simple data set that records every wrong guess for map quiz
assignments I gave in my intro to IR class at Clemson University across
five semesters.

## Usage

``` r
map_quiz
```

## Format

A data frame with 1772 observations on the following 8 variables.

- `class`:

  an ordered factor of the semester in which the wrong guess was
  recorded by a student. Levels include "Spring 2018", "Fall 2018",
  "Spring 2019", "Fall 2019", and "Spring 2020."

- `students`:

  the number of students in the class taking the map quiz.

- `region`:

  the region map on which the country was located. Values include
  "Europe", "Africa", "Asia", "Latin America", and "MENA." "MENA" is
  short for "Middle East and North Africa."

- `country`:

  the country I asked the student to correctly identify

- `guess`:

  the country that was the actual state incorrectly guessed by the
  student

- `ccode1`:

  the Correlates of War state code for the state I wanted the student to
  identify in `country`.

- `ccode2`:

  the Correlates of War state code for the state that is the wrong guess
  for the state in `guess`

- `mindist`:

  the minimum distance (in kilometers) between `country` and `guess`

## Details

Students can always not make a guess and be wrong, which explains the
`NA`s in the data. Students were given five separate numbered maps and
prompted to identify 10 countries each on them. The maps never changed
across five semesters, nor did the prompts. Use these data as you see
fit. Obviously, FERPA considerations mean I can't share anything else of
potential value here.
