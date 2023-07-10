<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again! Now go create something AMAZING! :D
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/RentInform/BE-Rent-Inform">
    <img src="images/philadelphia_004_1276_pano_up.jpg" alt="Logo" width="900" height="315">
  </a>

<h3 align="center">RentInform</h3>

  <p align="center">
    Welcome to the back end repository for RentInform! <br /> RentInform is a web application built for the Turing School of Software and Design's Mod 3 Consultancy project. Read more about project requirements: https://backend.turing.edu/module3/projects/consultancy/
    <br />
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#testing">Testing</a></li>
    <li><a href="#dbdesign">DB Design</a></li>
    <li><a href="#endpoints">Endpoints</a></li>
    <li><a href="#tech">Technical Solutions</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

RentInform is a civic data tool designed to help prospective Philadelphia renters gather information about potential new homes, avoid financial and health hazards, and make informed renting decisions to best meet their household's needs.

The back end application is an API built with the Rails framework. It exposes 5 RESTful endpoints and is responsible for recieving JSON requests, querying the internal database (certified rental properties), consuming external APIs, and formatting JSON responses to send data to the front end application.

- [Production Website](https://rent-inform-36792dcf8db2.herokuapp.com/)
- [Backend Service](https://sheltered-harbor-92742.herokuapp.com/)
  - To reach endpoint append `/api/v0/search?street='123-main-street'&zip='12345'` to the URL linked above
  - See more endpoints [here](https://github.com/RentInform/BE-Rent-Inform)
- Github repositories:
  * Front End: [![Github][Github]][project-fe-gh-url]
  * Back End: [![Github][Github]][project-be-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With:

* [![Ruby][Ruby]][Ruby-url]
* [![Rails][Rails]][Rails-url]
* [![PostgreSQL][Postgres]][Postgres-url]
* [![Redis][Redis]][Redis-url]
* [![CircleCI][CircleCI]][CircleCI-url]
* [![Heroku][Heroku]][Heroku-url]

RentInform's back end application uses these integrations:
* [WalkScore Professional](https://www.walkscore.com/professional/api.php)
* [Amadeus Safe Place API](https://developers.amadeus.com/self-service/category/covid-19-and-travel-safety/api-doc/safe-place)
* [TomTom Geocoding API](https://developer.tomtom.com/geocoding-api/documentation/geocode)
* [MapQuest API](https://developer.mapquest.com/documentation/static-map-api/v5)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To demo RentInform on your local machine, follow these steps: 

### Back End Repository

1. Get a free WalkScore API Key [here](https://www.walkscore.com/professional/api-sign-up.php)
2. Register for a Self-Service API for a production environment [here](https://developers.amadeus.com/self-service/category/covid-19-and-travel-safety/api-doc/safe-place)
3. Get a free TomTom Geocoding API Key [here](https://developer.tomtom.com/geocoding-api/documentation/geocode)
4. Get a free MapQuest API Key [here](https://developer.mapquest.com/documentation/)
5. Clone this repo `git@github.com:RentInform/BE-Rent-Inform.git`
6. Navigate to the local repository: `cd BE-Rent-Inform`
7. Run: `bundle install`
8. Run: `rails db:{create,migrate}`
9. Run: `bundle exec figaro install`
10. Add `TOMTOM_API_KEY`, `WALK_SCORE_API_KEY`, `AMADEUS_CLIENT_SECRET`, and `AMADEUS_CLIENT_ID` to `config/application.yml` file
11. To populate development database:
  * Run: `redis-server` to start Redis server
  * Run: `bundle exec sidekiq -q default`
  * If you wish to view the Sidekiq dashboard:
    * Run: `rails s`
    * Route: `http://localhost:3000/sidekiq/`
  * Run: `rake property_import`
    * To verify the job is completed, check `rails c` for `Property.count` ~= 100k
11. Run: `rails s` to start Rails server
12. Visit: http://localhost:3000/  


### Front End Repository
1. Clone the front end [here](https://github.com/RentInform/Rent-Inform-FE)
2. Follow instuctions in the front end repo `README`

### Prerequisites
- Ruby Version 3.1.1
- Rails Version 7.0.5

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Testing -->
## Testing
 
`bundle exec rspec` will run the entire test suite. *All tests are passing at time of writing.*

The team tested happy paths, sad paths, and edge cases when needed. Error responses were added where applicable. 


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DBDesign -->
## DB Design
 
 <img src="https://user-images.githubusercontent.com/120869196/244580222-8ad41554-134f-4111-b48b-51cdb11aa065.png" alt="Schema" width="100%">
 
<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Endpoints

<details>
<summary>GET <code>/api/v0/search?street="&zip="</code></summary>
<br>
  <code>{
    "data": {
      "type": "property",
      "id": "1",
      "attributes": {
          "street": "123 Main Street",
          "city": "Philadelphia",
          "state": "PA"
          "zip": "19148"
      }
    }
  }</code>
</details>
<br>
<details>
<summary>GET <code>/api/v0/user_properties?user_id=''</code></summary>
<br>
  <code>{
    "data": [
             { "type": "property",
               "id": "1",
               "attributes": { 
                   "street": "123 Main Street",
                   "city": "Philadelphia",
                   "state": "PA",
                   "zip": "19148"
               }
             },
             { "type": "property",
               "id": "2",
               "attributes": { 
                   "street": "123 Main Street",
                   "city": "Philadelphia",
                   "state": "PA",
                   "zip": "19148"
               }
             },
             { "type": "property",
               "id": "3",
               "attributes": {
                   "street": "123 Main Street",
                   "city": "Philadelphia",
                   "state": "PA",
                   "zip": "19148"
               }
             },
             ...
            ] 
    }</code>
</details>
<br>
<details>
<summary>GET <code>/api/v0/user_properties?user_id=''&property_id=''</code></summary>
<br>
  <code>{
  "data": {
    "type": "property",
    "id": "1",
    "attributes": {
        "street": "123 Main Street",
        "city": "Philadelphia",
        "state": "PA"
        "zip": "19148"
        "walk_score": "89",
        "transit_score": "57",
        "bike_score": "23",
        "safety_score": "99"
        "lat": "39.5",
        "lon": "-79.0",
        "parks": {
            "park_1_name": "Spruce Street Harbor Park",
            "park_1_street": "South Christopher Columbus Boulevard",
            "park_2_name": "I-95 Park",
            "park_2_street": "South Front Street",
            "park_3_name": "Welcome Park",
            "park_3_street":"South 2nd Street" 
        }
    }
  }
}</code>
</details>
<br>
<details>
<summary>POST <code>/api/v0/user_property=?user_id=''&property_id=''</code></summary>
<br>
  <code>{
    data: {
    "type": "user_property",
    "id": "1",
    "attributes": {
        "user_id": "12345",
        "property_id": "98765"
    }
    }</code>
</details>
<br>
<details>
<summary>DELETE <code>/api/v0/user_property=?user_id=''&property_id=''</code></summary>
<br>
<code>{

  }</code>
</details>
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- Technical Solutions -->
## Technical Solutions

As part of the Consultancy project requirements, the RentInform team challenged ourselves to implement three stretch technologies during the two-week design and development process. We selected these technologies based on the challenges we anticipated facing while building out our MVP, and adjusted our choices to reflect our individual and team learning goals as well as blockers that came up during the course of working on the project.

### Background Workers
* <b>Challenge:</b> The available data on certification of rental compliance was only available in a CSV format, the number of entries in the list was very large (500K+), and the data needed significant de-duplication and normalization to be able to successfully query by address.
* <b>Solution:</b> We used the Rails Active Job framework, Sidekiq, and Redis to declare and run a job to read in the CSV file, sanitize the data, and populate our back end Postgres database with Property records. While our first draft job worked in development, we exceeded the memory limit of our Heroku deployment when we ran the job in production. To address this, we broke the single job into three smaller jobs with a single responsibility each, and also split our CSV file so that the most memory-intensive portion of the task was completed in batches. A future extension might include adding jobs to periodically download a new CSV from the City of Philadelphia’s website and a job to handle breaking the large CSV into multiple smaller parts for faster processing.

### Observability
* <b>Challenge:</b> Once our application was deployed, we did not have a good way to measure response times, track performance, or analyze how the app was working in production beyond reviewing errors and logs.
* <b>Solution:</b> We researched popular observability platforms with free access tiers, including Honeybadger and New Relic. We decided on New Relic for this project because it offered an easy-to-read metrics dashboard with information on page response and loading times.  We configured New Relic for both our front end and back end repositories, and ran some experiments interacting with our application to help us determine where best to utilize caching.

### Caching
* <b>Challenge:</b> Two of the API endpoints that expose data for the front end of our application rely on both database queries and external API calls, and were running slowly (10-15+ seconds per call) when first deployed. This delay resulted in a less-than-ideal experience for our users.
* <b>Solution:</b> After interacting with our application running live and reviewing data from New Relic, we realized that the endpoints for searching properties and getting more details for a property were running slowest, and were good candidates for low-level caching since they contained information that was not likely to change quickly (addresses and scores). We used the `Rails.cache` syntax and some [helpful documentation](https://www.honeybadger.io/blog/rails-low-level-caching/) to cache these requests in the front end service object that handles the call to the back end API, and noticed immediate improvements in response times. We decided not to implement caching for other API calls that would change frequently, such as the request to get all saved properties for a specific user.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

Additional features, functionality, and potential refactors:
* Add more background jobs to download and split CSVs automatically every 1-3 months
* Cache external API calls to improve performance
* Consume additional APIs to gather data for implementation of new front end features
* Improve search to match on zipcode and/or lat & lon coordinates
  * Allow a visitor to search properties with different queries
* Additional back end database validations

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

* Caroline Peri: [![Linkedin][linkedin]][caroline-li-url] [![Github][Github]][caroline-gh-url]
* Grace Joh: [![Linkedin][linkedin]][grace-li-url] [![Github][Github]][grace-gh-url]
* Logan Cole: [![Linkedin][linkedin]][logan-li-url] [![Github][Github]][logan-gh-url]
* Stephen McPhee: [![Linkedin][linkedin]][stephen-li-url] [![Github][Github]][stephen-gh-url]

<b>Special Thanks:</b> Jamison Ordway, our instructor and project manager

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Background Workers Lesson - Github](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module3/archive/lessons/background_workers.md)
* [Background Workers Lesson](https://backend.turing.edu/module3/slides/background_workers)
* [Banner Image - Philly Skyline](https://www.skylinescenes.com/products/philadelphia-skyline-panorama-2-2-2)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/RentInform/BE-Rent-Inform.svg?style=for-the-badge
[contributors-url]: https://github.com/RentInform/BE-Rent-Inform/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/RentInform/BE-Rent-Inform.svg?style=for-the-badge
[forks-url]: https://github.com/RentInform/BE-Rent-Inform/network/members
[stars-shield]: https://img.shields.io/github/stars/RentInform/BE-Rent-Inform.svg?style=for-the-badge
[stars-url]: https://github.com/RentInform/BE-Rent-Inform/stargazers
[issues-shield]: https://img.shields.io/github/issues/RentInform/BE-Rent-Inform.svg?style=for-the-badge
[issues-url]: https://github.com/RentInform/BE-Rent-Inform/issues
[license-shield]: https://img.shields.io/github/license/RentInform/BE-Rent-Inform.svg?style=for-the-badge
[license-url]: https://github.com/RentInform/BE-Rent-Inform/blob/main/LICENSE.txt
[linkedin]: https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white
[caroline-li-url]: https://www.linkedin.com/in/carolineperi/
[grace-li-url]: https://www.linkedin.com/in/graceehjoh/
[logan-li-url]: https://www.linkedin.com/in/logan-cole-ab2179188/
[stephen-li-url]: https://www.linkedin.com/in/smcphee19/
[product-screenshot]: images/screenshot.png
[Ruby]: https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white
[Ruby-url]: https://www.ruby-lang.org/en/
[Rails]: https://img.shields.io/badge/Ruby_on_Rails-CC0000?style=for-the-badge&logo=ruby-on-rails&logoColor=white
[Rails-url]: https://rubyonrails.org/
[Tailwind]: https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white
[Tailwind-url]: https://tailwindcss.com/
[Postgres]: https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white
[Postgres-url]: https://www.postgresql.org/
[Redis]:  	https://img.shields.io/badge/redis-%23DD0031.svg?&style=for-the-badge&logo=redis&logoColor=white
[Redis-url]: https://redis.io
[CircleCI]: https://img.shields.io/badge/circleci-343434?style=for-the-badge&logo=circleci&logoColor=white
[CircleCI-url]: https://circleci.com/
[Heroku]: https://img.shields.io/badge/Heroku-430098?style=for-the-badge&logo=heroku&logoColor=white
[Heroku-url]: https://devcenter.heroku.com/articles/getting-started-with-rails7
[Github]: https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white
[project-fe-gh-url]: https://github.com/RentInform/Rent-Inform-FE
[project-be-gh-url]: https://github.com/RentInform/BE-Rent-Inform
[caroline-gh-url]: https://github.com/cariperi
[grace-gh-url]: https://github.com/grace-joh
[logan-gh-url]: https://github.com/exasperlnc
[stephen-gh-url]: https://github.com/SMcPhee19

<!-- * [Video Presentation]()    <div>
    <video src=“our-video-url” controls width=”340" height=”260">
    </video>
   </div> -->
