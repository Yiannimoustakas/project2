# Project 2

<https://solution-undefined.herokuapp.com/>

## Project Description

For our third project of wdi29, we were tasked with working on an end to end project in a groups of three. This was the first project where as a group, we had complete reigns to create whatever web application we were interested in. We had 1 week to complete this task.

## Solution Undefined: 

Our project is a coding challenge sandbox similar to the likes of Exorcism or Codewars. Users can create new challenges that are sent directly into ou rdatabase where other users can then complete the challenges directly within their browser. We felt this could become a useful application for the future generations of programmers who are keen to sharpen their skills in a number of short and sharp coding challenges.

Once logged in, the user is sent to their home page. On this page they have a number of ui options to choose from, such as creating new coding challenges, starting solutions for existing challenges and the ability to edit their user details.

To create a new challenge, a user must: 
- include a clear description of the challenge at hand
- include test pairs i.e. inputs and outputs. The inputs will be what the text editor runs when it is checking the users function. The output is an example of what the user would expect when the function is run.

Now in order for the coding challenges to work, we implemented our own text editor right into the browser. We used Codemirror as our text editor plug in, and it works seamlessly into the app. This may have been one of the most challenging details of the site. We need to check firstly that the user who created the challenge has provided the right type of test pairs. They must match the data type: array, string or integer. Once the user has matched all of the test pairs, they will earn themselves a score of 100. Until then the solution will be deemed as incopmplete.

## Project Features

- User authentication
- Built-in text editor, that checks the solution against all valid test pairs
- User comments and likes
- Random challenge generator

## Tech Used

- Ruby on Rails MVC
- Code Mirror text editor
- jQuery

## Known Bugs & Wishlist

- Grab coding challenges from Exorcism API.
- Challenge classes/playlists
- Grouping challenges into skill most utilised
