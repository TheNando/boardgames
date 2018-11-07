require 'squib'

deck = Squib.csv file: '../data/shields.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'shields.yml', width: '2.5in', height: '3.5in' do
  background color: '#ffffff'

  png file: './assets/shield.png', layout: :ShieldIcon
  text str: deck['Name'], layout: :Title

  png range: 5..14, file: './assets/energy.png', layout: :EnergyIcon
  text str: deck['Cost'], layout: :EnergyCost

  png file: './assets/big-shield.png', layout: :BigShield

  text str: 'Activate:', layout: :ActivateLabel
  png file: './assets/energy.png', layout: :ActivateEnergy
  text str: deck['Cost_A'], layout: :ActivateCost
  text str: deck['Activate'], layout: :ActivateDescription

  text range: 5..14, str: 'Overcharge:', layout: :OverchargeLabel
  png range: 5..14, file: './assets/energy.png', layout: :OverchargeEnergy
  text range: 5..14, str: deck['Cost_O'], layout: :OverchargeCost
  text range: 5..14, str: deck['Overcharge'], layout: :OverchargeDescription

  # save format: :png, prefix: 'shields_'
  save_pdf file: 'shields_sheet.pdf'
end
