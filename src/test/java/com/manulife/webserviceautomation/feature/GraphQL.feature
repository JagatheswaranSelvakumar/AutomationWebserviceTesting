Feature: GraphQL test script

  Background: 
    * url 'http://localhost:4000/graphql?'

  Scenario: get all users and then get the first user by id
    #Given request read('classpath:request.json')
    Given request read('../input/request.json')
    When method post
    Then status 200
    And match response == {"data":{"course":{"title":"Node.js, Express & MongoDB Dev to Deployment","author":"Brad Traversy","description":"Learn by example building & deploying real-world Node.js applications from absolute scratch","topic":"Node.js","url":"https://codingthesmartway.com/courses/nodejs-express-mongodb/"}}}
