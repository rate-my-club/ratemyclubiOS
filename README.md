
# README 

## 1. User Stories (Required and Optional)

**Required Must-have Stories**

 * Create an account
 * Login
 * Find their school
 * Add a club to the list of clubs
 * Find a specified club from list of clubs
 * Give the club a rating 
 
 
 
**Optional Nice-to-have Stories**

 * Leave a comment with the rating
 * Feed of best clubs on campus
 * Advanced search feature (by club topics)
 * Where my club meets map
 * User profiles

## 2. Screen Archetypes

 * Login or create an account
   * User can login
   * User can create an account
 * Search (for schools) 
   * User can search through a list of schools to find theirs
 * Feed (optional)
     * User can look at best rated clubs at school
 * Search (for clubs)
     * User can look for a club at their specified school
 * Detail
     * Club profile with past ratings and average rating
 * Creation
     * User can leave a rating/review of the club
 * Profile (optional)
     * Lists of users interests and past reviews and ratings
     * Can potentially see friends' ratings and network with them

## 3. Navigation

**Tab Navigation** (Tab to Screen)

 * Search (for clubs)
 * Feed
 * Profile
 * Settings

**Flow Navigation** (Screen to Screen)

 * Create an account
    * Login
 * Login 
     * Feed/Home Screen 
 * Home screen
   * Search (for clubs)
       * Detail (Club profile)
       * Creation of new rating entry
   * School feed
   * Profile
       * Can see own past ratings
   * Settings
     * Can customize app/change login method

## Wireframes
<img src="RateMyClubWireframe.jpg" width=600>


## Schema 
### Models
#### Login
   Third party login, so no data collected
   
#### Club Reviews
   
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | review        | String   | What a person says about a club|
   | author        | String   | Who said it|
   | rating        | Number   | Numerical Rating out of 5 of club|
   | date          | DateTime | When the review was left|
   


#### List of network requests by screen
   - Find Your College
    -(Read/GET) Grab list of colleges from ed.gov's College Scorecard API
    https://api.data.gov/ed/collegescorecard/v1/schools.json?&_fields=id,school.name,2016.student.size&2016.student.size__range=2000..&_sort=2016.student.size:desc&_per_page=100&_page=0&api_key=KZIaPo7v03IUNaIG7XrySMfHMVjhvjGTzEfC9qgp
    - We will populate a String array with each page's names, and have a variable (per_page) that increments to get all the names we want. (The data in the API is listed in sets of pages).
   - Make A Club
      - (Create/POST) Create a Club JSON object with it's name and properties 
   - Rate A Club
      - (Update/PUT) Take a user's rating and append it to the club's array### of ratings

#### Milestone #1 Assessment:
- After this week's sprint, we have been able to pull from our desired database(Used the Database of Accredited Postsecondary Institutions and Programs) and assign it to the sorted pickerview. We have also set up the basic layout of the first few screens working. We have not finished the entire layout of the app yet and therefore need to complete the remainder this week.
- For this next week, we will prioritize Backend Functionality and setting up our MongoDB backend. This includes collections for each school, clubs within each school, and reviews within clubs.


<img src='http://g.recordit.co/8Z4sgHKD2I.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


#### Milestone #2 Assesment:
- This week we tried to set up our back end. We got a fully functional MongoDB up but could not connect it with siwft. We tried using a third party driver called MongoKitten, but it would not install properly. This next week we will look to transisiton to something like Parse. Other than that, our structure for our backend is set, but if we cannot get MongoDB to sync with Swift then we will look for something else. We also made a little more progress on the layout. 

<img src='https://i.imgur.com/0i60Kwk.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />' 

![alt text](https://i.imgur.com/7nt8V84.png)

Added functionality for storing collections of schools including documents for each club containg the name, description, ratings, etc.

#### Milestone #3 Assesment:
-This week we were able to get our MongoDB backend to connected to our front end. We also worked a little more on our layout. We're behind, we know that. We have a lot to do but now that our backend is partially working we feel confident. We just have to add posting ability to it.

<img src='https://i.imgur.com/f0G2Aum.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />' 

#### Milestone #4 Assessment:
-Major headway was made this week. We got posting ability to our backend, and early next week will be finishing up posting ability to add a club and not just rate the ones there. While not fully implemnted, we also got authentication with google working and the code for it is on our "testing_branch" branch. Tomorrow, and leading up to demo day, we will be finishing up add club ability, add a name field to our tableview cells to see past ratings from other users, and will be finishing up the UI. While that may seem like a lot, the hardest part, getting complete backend functionality, is complete. We anticpate to have a completed app by demo day and are looking forward to presenting. 
Completed Stories:
 * [x]Create an account
 * [x]Login
 * [x]Find their school
 * [x]Give the club a rating 

Final things to finish:
 * Add a club to the list of clubs
 * Find a specified club from list of clubs
 * Create a club

<img src='https://i.imgur.com/XkCyuKZ.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />' 

#### Final Result
The project is for the most part done. While we couldn't add some other functionality we originally hoped for, the basic functionality works in full. You can add a club to a specified school's list of clubs. Search for clubs within that school. Rate clubs at that school and see what other people have rated them as and commented about them. A link to our walkthrough is below.

https://www.youtube.com/watch?v=05lQtFn_WgI

And a gif of the most recently updated version of the app:

<img src='https://i.imgur.com/7fbQQVs.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />' 
