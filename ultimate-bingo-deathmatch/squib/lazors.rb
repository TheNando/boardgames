require 'squib'

deck = Squib.csv file: '../data/lazors.csv'

Squib::Deck.new cards: deck['Name'].size, layout: 'lazors.yml', width: '2.5in', height: '3.5in' do

  # Background Image
  png file: './assets/lazor/Weapon-Background.png', layout: :Background

  # Card Type Icon
  png file: './assets/lazor.png', layout: :LazorIcon

  # Generate main card images array
  lazor_images = deck['Name'].map do |f|
    "./assets/lazor/#{f.to_s.tr_s(' ', '-')}.png"
  end

  # Main Card Image
  png file: lazor_images, layout: :BigLazor

  # Card Title
  text str: deck['Name'], layout: :Title2
  text str: deck['Name'], layout: :Title

  # Activation Text
  text range: 0..4, str: 'Activate', layout: :ActivateLabelLower
  text range: 0..4, str: deck['Activate'], layout: :ActivateDescriptionLower

  # Activation Text
  text range: 5..14, str: 'Activate', layout: :ActivateLabel
  text range: 5..14, str: deck['Activate'], layout: :ActivateDescription

  # Overcharge Text
  text range: 5..14, str: 'Overcharge', layout: :OverchargeLabel
  png range: 5..14, file: './assets/energy.png', layout: :OverchargeEnergy
  text range: 5..14, str: deck['Overcharge'], layout: :OverchargeDescription

  # save format: :png, prefix: 'lazors_'
  save_pdf file: 'lazors_sheet.pdf'
end
