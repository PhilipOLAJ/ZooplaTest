Feature: Search Properties For Sale
  As a customer
  I want the ability  to search for a property for sale
  so that i can purchase the property

  Scenario Outline:   Customer can search for properties for sale
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I  select "<MaxPrice>" from the Max price dropdown
    And I select "<Property>" from the Property type dropdown
    And I select "<Bed>" from Bedrooms dropdown
    And I click on Search button
    Then a list of "<PropertyType>" in "<Location>" are displayed

    Examples:
      | Location     | MinPrice    | MaxPrice       | Property  | Bed    | PropertyType |
      | Manchester   | £120,000    | £230,000       | Houses    | 3+     | Houses       |
      #| London       | £250,000    | £400,000       | Farm/Land | No min | Property     |
      #| Coventry     | £120,000    | £230,000       | Flats     | 3+     | Flats        |
      #| Birmingham   |             |                |           |        |              |


    @ignore
  Scenario Outline:   Customer cannot search for properties with missing values
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I  select "<MaxPrice>" from the Max price dropdown
    And I select "<Property>" from the Property type dropdown
    And I select "<Bed>" from Bedrooms dropdown
    And I click on Search button
    Then an error message is displayed

    Examples:
      | Location     | MinPrice    | MaxPrice       | Property  | Bed    | PropertyType |
      |              | £120,000    | £230,000       | Houses    | 3+     | Houses       |

      @ignore
  Scenario Outline:   Error page is displayed for invalid search
    Given I navigate to zoopla homepage
    When I enter a "<Location>" in the search text box
    And I select "<MinPrice>" from Min price dropdown
    And I  select "<MaxPrice>" from the Max price dropdown
    And I select "<Property>" from the Property type dropdown
    And I select "<Bed>" from Bedrooms dropdown
    And I click on Search button
    Then an error result page is displayed

    Examples:
      | Location     | MinPrice    | MaxPrice       | Property  | Bed    | PropertyType |
      | M39 1XC      | £120,000    | £230,000       | Houses    | 3+     | Houses       |
      | £££          | £250,000    | £400,000       | Farm/Land | No min | Property     |
      | 123          | £120,000    | £230,000       | Flats     | 3+     | Flats        |
      | 123          |             |                |           |        |              |