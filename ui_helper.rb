module UiHelper
  def dummy_image(width, height, background=nil, text=nil)
    background = background ? "/#{background}" : ""
    text = text ? "/#{text}" : ""
    content_tag :img, nil, alt: "", "data-src" => "/placeholder/#{width}x#{height}#{background}#{text}"
  end

  def lorem_paragraphs(num = 3)
    num = around(num) if num.is_a?(Range)
    Faker::Lorem.paragraphs(num).map{|text| content_tag(:p, text)}.join.html_safe
  end

  def lorem_words(num)
    num = around(num) if num.is_a?(Range)
    Faker::Lorem.words(num).join(' ').html_safe
  end

  def around(range)
    range.to_a.sample
  end

  def sometimes(num=3)
    if num == around(1..num)
      yield
    end
  end

  def lorem_phone(format = "(###) ###-####")
    format.gsub(/#/) { rand(9) + 1 }
  end

  def lorem_number(length = 3)
    (1..length).map { rand(10) }.join
  end

  def lorem_date(format = "m/d/Y")
    year = (rand * 2).ceil + Time.now.year - 2
    month = (rand * 12).ceil
    day = (rand * 31).ceil
    format.gsub(/[mdY]/, "m" => month, "d" => day, "Y" => year)
  end

  def styled_file(field_name)
    content_tag(:div, "#{content_tag(:input, "", { type: "file", name: field_name, id: field_name.parameterize("_") })}browse &hellip;".html_safe, class: "file")
  end

  def destination_hotel_list(num = 2000)
    hotels = []
    num.times do |i|
      hotel = {
        :name => lorem_words(1..3),
        :id => i,
        :location => "#{Faker::Address.city}, #{Faker::AddressUS.state_abbr}",
        :img => "/assets/img_placeholder_hotel.png"
      }
      hotels << hotel
    end
    hotels
  end

  def times
    times = []
    time = Time.new("+00:00")
    48.times do
      times << time.strftime("%l:%M %P")
      time += 60 * 30
    end
    times
  end

end
