require 'squib'

deck = Squib.csv file: '../data/batteries.csv'

 Squib::Deck.new cards: deck['Name'].size, layout: 'batteries.yml', width: '2.5in', height: '3.5in' do

  # Background Image
  png file: './assets/battery/Battery-Background.png', layout: :Background

  # Card Type Icon
  png file: './assets/battery.png', layout: :BatteryIcon

  # Generate main card images array
  battery_images = deck['Name'].map do |f|
    "./assets/battery/#{f.to_s.tr_s(' ', '-')}.png"
  end

  # Main Card Image
  png file: battery_images, layout: :BigBattery

  # Card Title
  text str: deck['Name'], layout: :Title2
  text str: deck['Name'], layout: :Title

  # Tier
  text str: deck['Tier'], layout: :Tier2
  text range: 0..4, str: deck['Tier'], layout: :Tier, color: '#9dcb51'
  text range: 5..10, str: deck['Tier'], layout: :Tier, color: '#24bfc4'
  text range: 11..14, str: deck['Tier'], layout: :Tier, color: '#c593c5'

  # Battery Passive effect
  text range: 5..12, str: 'Passive', layout: :PassiveLabel
  text(range: 5..12, str: deck['Passive'], layout: :PassiveDescription) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
    embed.png key: ':damage:', file: './assets/damage.png', layout: :DamageIcon
  end

  text range: 13..14, str: 'Passive', layout: :PassiveLabelRaised
  text(range: 13..14, str: deck['Passive'], layout: :PassiveDescriptionRaised) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
  end

  # Activation Text
  text range: 0..4, str: 'Activate', layout: :ActivateLabelBasic
  text range: 0..4, str: deck['Activate'], markup: true, layout: :ActivateDescriptionBasic

  # Activation Text
  text range: 5..12, str: 'Activate', layout: :ActivateLabel
  text(range: 5..12, str: deck['Activate'], layout: :ActivateDescription) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
  end

  text range: 13..14, str: 'Activate', layout: :ActivateLabelRaised
  text(range: 13..14, str: deck['Activate'], layout: :ActivateDescriptionRaised) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
  end

  # Overcharge Bank
  ocs = deck['Capacity']
  0.upto(5).each do |n|
    range = ocs.each_index.select { |i| ocs[i] == n}
    n.times do |i|
      png file: './assets/oc-space.png', layout: :OCSpace, range: range,
          alpha: 0.9, x: 600 - (i * 140)
    end
  end

  # save format: :png, prefix: 'batteries_'
  save_pdf file: 'batteries_sheet_wip.pdf'
end
