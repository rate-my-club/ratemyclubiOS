
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
   
#### Picker View
   
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | schoolName    | String   | Name of school for user to select in picker view |
   


#### List of network requests by screen
   - Find Your College
    -(Read/GET) Grab list of colleges from ed.gov's College Scorecard API
    https://api.data.gov/ed/collegescorecard/v1/schools.json?&_fields=id,school.name,2016.student.size&2016.student.size__range=2000..&_sort=2016.student.size:desc&_per_page=100&_page=0&api_key=KZIaPo7v03IUNaIG7XrySMfHMVjhvjGTzEfC9qgp
   - We will populate a String array with each page's names, and have a variable (per_page) that increments to get all the names we want. (The data in the API is listed in sets of pages).
   - Make A Club
      - (Create/POST) Create a Club JSON object with it's name and properties 
   - Rate A Club
      - (Update/PUT) Take a user's rating and append it to the club's array of ratings

### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
