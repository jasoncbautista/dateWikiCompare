require 'nokogiri'
require 'open-uri'




def compareAgainstWikiData(sqorBirthDate, wikiURL)
    doc = Nokogiri::HTML(open(wikiURL, "User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9) AppleWebKit/537.71 (KHTML, like Gecko) Version/7.0 Safari/537.71"))
    statsString = doc.css(".vcard .bday")
    wikiBDay = statsString.text
    #wikiBDay = "1990-10-06"
    # get wiki link
    return sqorBirthDate == wikiBDay
end


def isBirthTHeSame(playerString)
    # playerString = '"Quincy,,,,Acy,,,,50904,,,,1990-10-06T00:00:00Z,,,,c863e2c3-c758-49b8-be35-ccac4131186c,,,,http://en.wikipedia.org/wiki/Quincy_Acy"'
    # Strip off the quotes
    playerString = playerString.gsub("\n", "")
    playerString = playerString[0, playerString.length-1]


    playerArray = playerString.split(",,,,")


    bornDate = playerArray[3]
    wikipediaLink= playerArray[5]

    bornDate = bornDate.split("T")[0]

    isTheSame =  compareAgainstWikiData(bornDate, wikipediaLink)

    p isTheSame

    if isTheSame
    else
        p playerString
    end
    isTheSame

end


# file  = File.open("NBA4.txt") or die "Unable to open file..."

lines= IO.readlines("NBA_999.txt")

# lines = file.each_line {|line|}



lines.each  do |line|
    isBirthTHeSame(line)
    sleep(5)
end





