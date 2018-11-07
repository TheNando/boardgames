require 'squib'

deck = Squib.csv file: '../data/batteries.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'batteries.yml', width: '2.5in', height: '3.5in' do
  background color: '#ffffff'

  png file: './assets/battery.png', layout: :BatteryIcon
  text str: deck['Name'], layout: :Title

  png range: 5..14, file: './assets/energy.png', layout: :EnergyIcon
  text str: deck['Cost'], layout: :EnergyCost

  png file: './assets/big-battery.png', layout: :BigBattery

  text str: 'Capacity:', layout: :CapacityLabel
  text str: deck['Capacity'], layout: :Capacity

  text str: 'At the start of the round:', layout: :PassiveLabel
  text str: deck['Passive'], layout: :Passive

  text str: 'Activate:', layout: :ActivateLabel
  text str: deck['Activate'], layout: :Activate

  # save format: :png, prefix: 'batteries_'
  save_pdf file: 'batteries_sheet.pdf'
end
