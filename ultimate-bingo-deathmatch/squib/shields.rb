require 'squib'

deck = Squib.csv file: '../data/shields.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'shields.yml', width: '2.5in', height: '3.5in' do

  # Background Image
  png file: './assets/shield/Shield-Background.png', layout: :Background

  # Card Type Icon
  png file: './assets/shield/shield.png', layout: :ShieldIcon

  # # Generate main card images array
  # lazor_images = deck['Name'].map do |f|
  #   "./assets/lazor/#{f.to_s.tr_s(' ', '-')}.png"
  # end

  # Main Card Image
  png file: './assets/shield/big-shield.png', layout: :BigShield

  # Card Title
  text str: deck['Name'], layout: :Title2
  text str: deck['Name'], layout: :Title

   # Tier
  text str: deck['Tier'], layout: :Tier2
  text range: 0..4, str: deck['Tier'], layout: :Tier, color: '#9dcb51'
  text range: 5..10, str: deck['Tier'], layout: :Tier, color: '#24bfc4'
  text range: 11..14, str: deck['Tier'], layout: :Tier, color: '#c593c5'

  # Activation Text
  text range: 0..4, str: 'Activate', layout: :ActivateLabelLower
  text(range: 0..4, str: deck['Activate'], layout: :ActivateDescriptionLower) do |embed|
    embed.png key: ':damage:', file: './assets/damage.png', layout: :DamageIcon
  end

  text range: 5..14, str: 'Activate', layout: :ActivateLabel
  text(range: 5..14, str: deck['Activate'], layout: :ActivateDescription) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
    embed.png key: ':damage:', file: './assets/damage.png', layout: :DamageIcon
  end

  # Overcharge Text
  text range: 5..14, str: 'Overcharge', layout: :OverchargeLabel
  text(range: 5..14, str: deck['Overcharge'], layout: :OverchargeDescription) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
    embed.png key: ':damage:', file: './assets/damage.png', layout: :DamageIcon
  end

  # save format: :png, prefix: 'shields_'
  save_pdf file: 'shields_sheet_wip.pdf'
end
