Given('I am on the Metropolitan homepage') do
  visit 'https://www.metropolitan.org.uk'
end

Then('I should see options to find a home') do
  base = 'https://www.metropolitan.org.uk/'
  expected_links = [
   { url: base + 'find-a-home-with-metropolitan/rent-a-home/',
     text: 'Rent a home' },

    { url: base + 'find-a-home-with-metropolitan/buy-a-home/',
      text: 'Buy a home'},

    { url: base + 'find-a-home-with-metropolitan/swap-your-home/',
      text: 'Swap your home'},

    { url: base + 'find-a-home-with-metropolitan/sheltered-accommodation/',
      text: 'Sheltered accommodation'}
  ]

  within '.nav' do
    find('#menu-item-26103').trigger(:mouseover)
    sleep 1
    find_link('Find a home').trigger(:mouseover)

    expected_links.each do |link|
      expect(page).to have_link(link[:text], href: link[:url])
    end
  end
end

When('I look at information about buying a home') do
  click_link('Buy a home')
end

Then('I should see a link to private sales at Metropolitan') do
  sleep 1
  expect(page).to have_link(
    'metropolitansales.org.uk',
    href: 'https://www.metropolitansales.org.uk/'
  )
end

Then('I should see a link to the Midlands Voluntary Right to Buy Pilot') do
  expect(page).to have_link(
    'Midlands Voluntary Right to Buy Pilot',
    href: 'https://www.metropolitan.org.uk/find-a-home-with-metropolitan/buy-a-home/vrtb/'
  )
end

Then('I should see a link to shared ownership at SoResi') do
  expect(page).to have_css('a[href="http://www.soresi.co.uk/"] img')
end

Then('I should see contact details for SoResi') do
  expect(page).to have_link('soresi.co.uk', href: 'https://soresi.co.uk/')
  expect(page).to have_content(
    'email the SO Resi team or phone on 020 8607 0550'
  )
end

Then('I should see a video about SoResi') do
  expect(page).to have_css(
    'iframe[src="https://player.vimeo.com/video/232348485"]'
  )
end
