require 'squib'

deck = Squib.csv file: '../data/batteries.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'batteries.yml', width: '2.5in', height: '3.5in' do

  # Background Image
  png file: './assets/battery/Battery-Background.png', layout: :Background

  # Card Type Icon
  png file: './assets/battery.png', layout: :BatteryIcon

  # Energy Cost Icon
  png range: 5..14, file: './assets/energy.png', layout: :EnergyIcon

  # Generate main card images array
  battery_images = deck['Name'].map do |f|
    "./assets/battery/#{f.to_s.tr_s(' ', '-')}.png"
  end

  # Main Card Image
  png file: battery_images, layout: :BigBattery

  # Card Title
  text str: deck['Name'], layout: :Title

  # Card Cost
  text str: deck['Cost'], layout: :EnergyCost

  # Battery Capacity
  text str: 'Capacity:', layout: :CapacityLabel
  text str: deck['Capacity'], layout: :Capacity

  # Battery Passive effect
  text str: 'At the start of the round:', layout: :PassiveLabel
  text str: deck['Passive'], layout: :Passive

  # Battery Active effect
  text str: 'Activate:', layout: :ActivateLabel
  text str: deck['Activate'], layout: :Activate

  # save format: :png, prefix: 'batteries_'
  save_pdf file: 'batteries_sheet.pdf'
end
