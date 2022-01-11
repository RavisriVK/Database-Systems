# Database-Systems

This project was done under Prof. Sreenivasa Kumar as part of the Introduction to Database Systems Course.

This repository contains a description of a database we (Ravisri Valluri, Vineeth Kada, Suneet Iyer, Hakesh Darapaneni, Vineet Dhandharia) created to represent a sample video sharing platform, and a sample implementation using SQL.

The description included explains the database system - it includes an ER diagram, a relational schema diagram, and a written description of the entities and relationships. Please refer to this for a detailed understanding!

The sample implementation you see was developed by the team - the queries are individual.
The sample queries I wrote include:
* Find the most prolific creators - the users whose channels contain the most content by duration
* Obtain the list of all possible videos that might be suggested as a result of watching a particular video
* For each channel, find out how many under-30 users subscribe to it
* Find the videos which belongs to a playlist not curated by the channel which created it
* Find the channels which are managed by at least one non-owner, but not by the owner himself
* For each location, find out how many users older than 60 years have viewed vidoes created in that location

In order to test the queries, follow these steps on the terminal (macOS) after installing mysql:
* sudo /usr/local/mysql/support-files/mysql.server start
* mysql youtube_platform -p'[password]' -u root < Implementation_and_Queries.sql
* sudo /usr/local/mysql/support-files/mysql.server stop

After the second step, you should see the results of the query/queries you have chosen to include.
