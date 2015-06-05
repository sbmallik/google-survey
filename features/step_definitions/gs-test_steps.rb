Given(/^I have cleared browser cookies$/) do
	browser = Capybara.current_session.driver.browser
	browser.manage.delete_all_cookies
end

Given(/^I am visiting a story asset in Rochester production site$/) do
	visit ui_url "http://www.democratandchronicle.com/story/money/business/2015/06/04/getinge-layoffs-henrietta/28465897/"
	wait_for_pageload
end

When(/^I complete the survey on the asset page$/) do
	within_frame('t402-prompt-iframe') do
		for i in 0..12
			if first('.t402-promo-title') != nil 
				puts "inside the survey free question"
				find('.t402-promo-nothanks').click
			elsif first('.t402-material-radio') != nil
				find('.t402-response.t402-material-radio', match: :first).click
			elsif first('.t402-multichoice-table.t402-multiselect') != nil
				find('.t402-response-check', match: :first).click
				find('.t402-open-multiselect-submit').click
			elsif first('.t402-open-input') != nil
				find('.t402-open-input').set('1')
				find('.t402-open-submit').click
			elsif first('.t402-ratings') != nil
				find('.t402-ratings-star', match: :first).click
			elsif first('.t402-thanks') != nil 
				puts "inside the thank you note"
				find('.t402-button').click
			else
				break
			end
		end
		puts "The value of the iterator: #{i}"
	end unless first('.t402-prompt-iframe-container').nil?
end

Then(/^The google survey disappears from the asset page$/) do
	expect(page).not_to have_selector(:id, 't402-prompt-iframe')
end

When(/^I close the firefly fly-out$/) do
	find('.util-bar-flyout-close-ribbon').click unless first('.util-bar-flyout-firefly.open').nil?
end

Then(/^The firefly fly-out closes$/) do
	expect(page).not_to have_css('.util-bar-flyout-firefly.open')
end
