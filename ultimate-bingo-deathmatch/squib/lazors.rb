require 'squib'

deck = Squib.csv file: '../lazors.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'lazors.yml', width: '2.5in', height: '3.5in' do
  background color: '#ffffff'

  png file: './assets/lazor.png', layout: :LazorIcon
  text str: deck['Name'], layout: :Title

  png range: 5..14, file: './assets/energy.png', layout: :EnergyIcon
  text str: deck['Cost'], layout: :EnergyCost

  png file: './assets/big-lazor.png', layout: :BigLazor

  text str: 'Activate:', layout: :ActivateLabel
  png file: './assets/energy.png', layout: :ActivateEnergy
  text str: deck['Cost_A'], layout: :ActivateCost
  text str: deck['Activate'], layout: :ActivateDescription

  text range: 5..14, str: 'Overcharge:', layout: :OverchargeLabel
  png range: 5..14, file: './assets/energy.png', layout: :OverchargeEnergy
  text range: 5..14, str: deck['Cost_O'], layout: :OverchargeCost
  text range: 5..14, str: deck['Overcharge'], layout: :OverchargeDescription

  save format: :png, prefix: 'lazors_'
end
