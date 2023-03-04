class Price_calculator
    def initialize(string)
        s= string.split(',')
        result = {}
        s.uniq.each{|element| result[element] = s.count(element)}
        @arr = result
        @original_price = {"milk"=> 3.97, "bread"=> 2.17, "apple"=> 0.89,"banana"=>0.99}
        @discount_price = {"milk"=>[5.00,2],"bread"=>[6.00,3]}
    end
    
    def calculat
        total_amount = 0
        saving_amount = 0
        puts "Item    Quantity    Price"
        puts '---------------------------'
        @arr.each do |product, value|
            
            print "#{product}          #{value}           "
            org_price = value*@original_price[product]
            dis_price = 0
            if @discount_price[product]
                pra = value.divmod(@discount_price[product][1])
                dis_price = pra[0]*@discount_price[product][0] + pra[1]*@original_price[product]
                print dis_price
                total_amount = total_amount + dis_price
                saving_price = org_price - dis_price
            else
                print org_price
                total_amount = total_amount + org_price
                saving_price = org_price - org_price
                
            end
            saving_amount =  saving_amount + saving_price
            
            puts ""
        end
        puts ""
        puts "Total Price: $#{total_amount.round(2)}"
		puts "You saved $#{saving_amount.round(2)} Today!"
    end
end
puts "Please Enter all the items purchased saperated by a comma"
string = gets.chomp()
s= Price_calculator.new(string)
s.calculat
