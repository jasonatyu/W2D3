require 'tdd'

RSpec.describe "Array methods" do 
  describe "Array#my_uniq" do 
    
    it "return self if array length is less than 2" do
      array1 = []
      array2 = [1]
      expect(array1.my_uniq).to eq(array1)
      expect(array2.my_uniq).to eq(array2)
    end
    it "should remove duplicate values for arrays greater than 1 in length" do 
      array1 = [1,2,1,3,3]
      expect(array1.my_uniq.length).to eq(3)
      expect(array1.my_uniq).to include(1,2,3)
    end
    it "should preserve the order in which they first appear in the array" do 
      arr = [4 , 2, 3, 4, 3, 8, 1, 8]
      expect(arr.my_uniq).to eq([4, 2, 3, 8, 1])
    end

  end

  describe "Array#two_sum" do 
    it "should find all pairs of positions where elements at those positions sum to 0" do 
      arr = [-1, 0, 2, -2, 1]
      expect(arr.two_sum).to include([2,3], [0,4])
    end
    it "should be sorted smallest to largest by first then second element index" do 
      arr = [-1, 0, 2, -2, 1]
      expect(arr.two_sum).to eq([[0, 4], [2, 3]])
    end
    it "should return empty array if array.length is zero" do 
      arr = []
      expect(arr.two_sum).to eq([])
    end
  end
  
  describe "Array#my_transpose" do 
    it "should swap row and col indices for every element in matrix" do   
      matrix = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]]
      ans = [
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ]
      expect(matrix.my_transpose).to eq(ans)
    end
    it "return self if given empty array" do  
      arr = [[], []]   
      expect(arr.my_transpose).to eq(arr)
    end
  end

  describe "Array#stock_picker" do 
    it "return the most profitable pair of days" do  
      arr = [4,1,7,2,5,3,7]
      expect(arr.stock_picker).to eq([1,2])
    end
    it "return a buy day that is before a sell day" do 
      arr = [2,3,4]
      expect(arr.stock_picker[0]).to be < arr.stock_picker[1]
    end
  end

end