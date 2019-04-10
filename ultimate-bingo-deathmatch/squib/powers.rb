require 'squib'

deck = Squib.csv file: '../data/powers.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'powers.yml', width: '2.5in', height: '3.5in' do
  # Background Image
  png file: './assets/power/Power-Background.png', layout: :Background

  # Card Type Icon
  png file: './assets/power/power.png', layout: :PowerIcon

  # # Generate main card images array
  # lazor_images = deck['Name'].map do |f|
  #   "./assets/lazor/#{f.to_s.tr_s(' ', '-')}.png"
  # end

  # Main Card Image
  png file: './assets/power/big-power.png', layout: :BigPower

  # Card Title
  text str: deck['Name'], layout: :Title2
  text str: deck['Name'], layout: :Title

   # Tier
  text str: deck['Tier'], layout: :Tier2
  text range: 0..11, str: deck['Tier'], layout: :Tier, color: '#24bfc4'
  text range: 12..17, str: deck['Tier'], layout: :Tier, color: '#c593c5'

  # Consume Text
  text range: 0..17, str: 'Consume', layout: :ActivateLabel
  text(range: 0..17, str: deck['Consume'], layout: :ActivateDescription) do |embed|
    embed.png key: ':energy:', file: './assets/energy.png', layout: :EnergyIcon
    embed.png key: ':damage:', file: './assets/damage.png', layout: :DamageIcon
  end

  # save format: :png, prefix: 'powers_'
  save_pdf file: 'powers_sheet_wip.pdf'
end
