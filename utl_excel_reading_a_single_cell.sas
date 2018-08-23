Excel reading a single cell

github
https://github.com/rogerjdeangelis/utl_excel_reading_a_single_cell

SAS Forum
https://communities.sas.com/t5/SAS-Programming/Importing-one-value-from-excel-into-SAS/m-p/489162


Problem
   Read just Alice's AGE (9999 in sheet below)


INPUT
=====

  d:/xls/utl_excel_reading_a_single_cell.xlsx

                                                              |  RULES
      +---------------------------------------------------+   |   +-----+
      |     A      |    B       |     C      |    D       |   |   |  C  |
      +---------------------------------------------------+   |   +-----+
   1  | NAME       |   SEX      |    AGE     |  HEIGHT    |   |   | AGE |
      +------------+------------+------------+------------+   |   +-----+
   2  | ALFRED     |    M       |    15      |    69      |   |   | 15  |
      +------------+------------+------------+------------+   |   +-----+
   3  | ALICE      |    F       |   9999     |    58      |   |   | 9999|  * read just this value
      +------------+------------+------------+------------+   |   +-----+
   4  | BARBARA    |    F       |    13      |    52      |   |   | 13  |
      +------------+------------+------------+------------+   |   +-----+

[CLASS]


EXAMPLE OUTPUT
--------------

 WORK.WANT total obs=1

   Obs     F1

    1     9999


PROCESS
=======


libname xel excel "d:/xls/utl_excel_reading_a_single_cell.xlsx" header=no;
data want;
  set xel."have$C3:C3"n;
run;quit;
libname xel clear;


OUTPUT
======

 WORK.WANT total obs=1

   Obs     F1

    1     9999


*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

libname xel "d:/xls/utl_excel_reading_a_single_cell.xlsx" ;

data xel.have;
  set sashelp.class (obs=4 drop=weight);
  if name="Alice" then age=9999;
run;quit;

libname xel clear;


* see process for solution;

