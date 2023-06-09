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
  <a href="https://github.com/RentInform/Rent-Inform-BE">
    <img src="images/philadelphia_004_1276_pano_up.jpg" alt="Logo" width="900" height="315">
  </a>

<h3 align="center">RentInform</h3>

  <p align="center">
    This is the Back End for our RentInform application. RentInform is the Consultancy group project from Turing School of Software and Design's mod three backend program. Read more: https://backend.turing.edu/module3/projects/consultancy/
    <br />
    <a href="https://github.com/RentInform/Rent-Inform-BE"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/RentInform/Rent-Inform-BE">View Demo</a>
    ·
    <a href="https://github.com/RentInform/Rent-Inform-BE/issues">Report Bug</a>
    ·
    <a href="https://github.com/RentInform/Rent-Inform-BE/issues">Request Feature</a>
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

RentInform is a civic data tool designed to help prospective Philadelphia renters gather information about potential new homes, avoid financial or health hazards, and make informed renting decisions to best meet their household's needs.

The backend of this app does. . . 

- [Produciton Website](https://mysterious-escarpment-07313.herokuapp.com/)
- [Backend Service](https://sheltered-harbor-92742.herokuapp.com/)
  - To reach endpoint append `/api/v0/search?street='123-main-street'&zip='12345'`
  - See more endpoints [here](https://github.com/RentInform/Rent-Inform-BE)
- Github repositories:
  * Front End: [![Github][Github]][project-fe-gh-url]
  * Back End: [![Github][Github]][project-be-gh-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Ruby][Ruby]][Ruby-url]
* [![Rails][Rails]][Rails-url]
* [![PostgreSQL][Postgres]][Postgres-url]
* [![Redis][Redis]][Redis-url]
* [![CircleCI][CircleCI]][CircleCI-url]
* [![Heroku][Heroku]][Heroku-url]

RentInfrom BE uses these integrations:
* [WalkScore Professional](https://www.walkscore.com/professional/api.php)
* [Amadeus Safe Place API](https://developers.amadeus.com/self-service/category/covid-19-and-travel-safety/api-doc/safe-place)
* [TomTom Geocoding API](https://developer.tomtom.com/geocoding-api/documentation/geocode)


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To demo this on your local machine follow these steps: 

### Backend Repository

1. Get a free WalkScore API Key [here](https://www.walkscore.com/professional/api-sign-up.php)
2. Register for a Self-Service API for a production environment [here](https://developers.amadeus.com/self-service/category/covid-19-and-travel-safety/api-doc/safe-place)
3. Get a free TomTom Geocoding API Key [here](https://developer.tomtom.com/geocoding-api/documentation/geocode)
4. Clone this repo `git@github.com:RentInform/Rent-Inform-FE.git`
5. Navigate to the local repository: `cd Rent-Infrom-FE`
6. Run: `bundle install`
7. Run: `rails db:{create,migrate}`
8. Run: `bundle exec figaro install`
9. Add `TOMTOM_API_KEY`, `WALK_SCORE_API_KEY`, `AMADEUS_CLIENT_SECRET`, and `AMADEUS_CLIENT_ID` in `config/application.yml` file
10. Populate development Database:
  * Run: `redis-server` to start Redis server
  * Run: `bundle exec sidekiq -q default`
  * If you wish to view the sidekiq dashborad:
    * Run: `rails s`
    * Route: `http://localhost:3000/sidekiq/`
  * Run: `rake property_import`
    * To verify the job is completed, check `rails c` for `Property.count` ~= 100k
11. Run: `rails s` to start rails server
12. Visit: http://localhost:5000/  


### Frontend Repository
1. clone the frontend [here](https://github.com/RentInform/Rent-Inform-FE)
2. Follow instuctions in the frontend repo `README`

### Prequisites
- Ruby Version 3.1.1
- Rails Version 7.0.5


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- Testing -->
## Testing
 
`bundle exec rspec` will run the entire test suite. *All tests passing at time of writing.*

- Also considered: Happy path, sad path, and edge cases were tested. Error messages were added where applicable.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DB Design -->
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
          "walk_score": "89",
          "transit_score": "57",
          "bike_score": "23",
          "safety_score": "99"
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


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

Additional features, functionality, and potential refactors:
* Add background jobs to download and split CSVs automatically
* Cache external API calls
* Consume additional APIs to gather data to implement new frontend features
* Improve search to match on zipcode and/or lat & lon
  * Allow a visitor to search properties
* Additional backend database validations

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- TESTING -->


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

Special Thanks: Jamison Ordway our instructor and project manager


<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Background Workers Lesson - Github](https://github.com/turingschool/backend-curriculum-site/blob/gh-pages/module3/archive/lessons/background_workers.md)
* [Background Workers Lesson](https://backend.turing.edu/module3/slides/background_workers)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/RentInform/Rent-Inform-BE.svg?style=for-the-badge
[contributors-url]: https://github.com/RentInform/Rent-Inform-BE/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/RentInform/Rent-Inform-BE.svg?style=for-the-badge
[forks-url]: https://github.com/RentInform/Rent-Inform-BE/network/members
[stars-shield]: https://img.shields.io/github/stars/RentInform/Rent-Inform-BE.svg?style=for-the-badge
[stars-url]: https://github.com/RentInform/Rent-Inform-BE/stargazers
[issues-shield]: https://img.shields.io/github/issues/RentInform/Rent-Inform-BE.svg?style=for-the-badge
[issues-url]: https://github.com/RentInform/Rent-Inform-BE/issues
[license-shield]: https://img.shields.io/github/license/RentInform/Rent-Inform-BE.svg?style=for-the-badge
[license-url]: https://github.com/RentInform/Rent-Inform-BE/blob/main/LICENSE.txt
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
[project-be-gh-url]: https://github.com/RentInform/Rent-Inform-BE
[caroline-gh-url]: https://github.com/cariperi
[grace-gh-url]: https://github.com/grace-joh
[logan-gh-url]: https://github.com/exasperlnc
[stephen-gh-url]: https://github.com/SMcPhee19
