@uscp @google-survey
Feature: The google survey is enabled in several USCP sites. This is tested in Rochester, NY site where the survey is presented in the first metered asset to an anonymous user.

Background:
	Given I have cleared browser cookies

Scenario: Check whether google survey is present
	Given I am visiting a story asset in Rochester production site
	When I complete the survey on the asset page
	Then The google survey disappears from the asset page
	When I close the firefly fly-out 
	Then The firefly fly-out closes
