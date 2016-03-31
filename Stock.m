classdef Stock < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ticker;
        price;
        previousPrice;
        percentChange;
    end
    
    methods
        function obj=Stock(ticker,price,previousPrice,percentChange)
            obj.ticker=ticker;
            obj.price=price;
            obj.previousPrice=previousPrice;
            obj.percentChange=percentChange;
        end
        %update stock info
        function setticker(obj,ticker)
            obj.ticker=ticker;
        end
        function setprice(obj,price)
            obj.price=price;
        end
        function setpreviousPrice (obj, previousPrice)
            obj.previousPrice=previousPrice;
        end
        function setpercentChange (obj,percentChange)
            obj.percentChange=percentChange;
        end
    end
   
end

