Feature: test graphql end point

  Background: 
    * url 'http://localhost:4000' + '/graphql'

  # this live url should work if you want to try this on your own
  # * url 'https://graphql-pokemon.now.sh'
  Scenario: simple graphql request
    # note the use of text instead of def since this is NOT json
    Given text query =
      """
      query getSingleCourse($courseID: Int!) {
      course(id: $courseID) {
          title
          author
          description
          topic
          url
      }
      }
      """
    And def variables = { courseID: '2' }
    And request { query: '#(query)', variables: '#(variables)' }
    When method post
    Then status 200
    # pretty print the response
    * print 'response:', response
    # the '..' wildcard is useful for traversing deeply nested parts of the json
    #* def attacks = get[0] response..special
    #* match attacks contains { name: 'Thunderbolt', type: 'Electric', damage: 55 }
