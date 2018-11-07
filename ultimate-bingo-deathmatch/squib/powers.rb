require 'squib'

deck = Squib.csv file: '../powers.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'powers.yml', width: '2.5in', height: '3.5in' do
  background color: '#ffffff'

  png file: './assets/power.png', layout: :PowerIcon
  text range: 0..3, str: deck['Name'], layout: :Title
  text range: 4..5, str: deck['Name'], layout: :SmallerTitle
  text range: 6..7, str: deck['Name'], layout: :Title
  text range: 8..9, str: deck['Name'], layout: :SmallTitle

  png file: './assets/energy.png', layout: :EnergyIcon
  text str: deck['Cost'], layout: :EnergyCost

  png file: './assets/big-power.png', layout: :BigPower

  text str: deck['Desc'], layout: :Description

  save format: :png, prefix: 'powers_'
end
