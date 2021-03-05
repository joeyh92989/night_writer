class ClassManager
  attr_reader :file1,
              :file2

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
   
    p "Created #{@file2} containing 256 characters"
  end
end