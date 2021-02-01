Feature: Visit and Action Scenarios

    Background: Visit The Internet Homepage
        Given client visit "/"

    @validate-title
    Scenario: Validate page title
        Then client must see title "The Internet"

    @validate-endpoint
    Scenario: Validate endpoint each click link text
        When client click link text "<link_text>"
        Then client must see endpoint "<endpoint>"
        Examples:
            | link_text           | endpoint              |
            | A/B Testing         | /abtest               |
            | Add/Remove Elements | /add_remove_elements/ |
            | Basic Auth          | /basic_auth           |
            | Broken Images       | /broken_images        |

    @auth_login
    Scenario: Form authentication
        When When client click link text "Form Authentication"
        Then client fill in "{ENV:USERNAME}" on element "username"
        Then client fill in "{ENV:PASSWORD}" on element "password"
        Then client click button "Login"
        Then client must see text "Your username is invalid!"
        
