require 'test_helper'

class TestFileSorter < MiniTest::Test

  def setup
    # Create an unsorted hash
    @sample_data = { 
      "b" => { "bravo" => true, "zulu" => false, "charlie" => true }, 
      "c" => { "alpha" => true }, 
      "a" => { "zulu" => false, "charlie" => true, "bravo" => true },
    }
  end
  
  def test_unsorted_file_gets_sorted
    # Write the unsorted hash to a temporary YAML file to test
    test_file = "/tmp/guard-yamlsort-test.yml"
    File.open(test_file, "w") do |f|
      f.write YAML.dump(@sample_data)
    end

    # Make sure the file was written properly is unsorted
    unsortedYAML = File.open(test_file, "r") do |file|
      YAML.load(file)
    end

    assert_equal ["b", "c", "a"], unsortedYAML.keys

    # Create a new FileSorter that loads and writes yaml 
    Guard::Yamlsort::FileSorter.new(test_file)
       
    # Test sorted YAML
    sortedYAML = File.open(test_file, "r") do |file|
      YAML.load(file)
    end
    
    assert_equal ["a", "b", "c"], sortedYAML.keys
  end
  
  def test_unsorted_file_gets_sorted_and_retains_header_comments
    # Write some comments and sample data to a temporary YAML file to test
    test_file = "/tmp/guard-yamlsort-test-comments.yml"
    File.open(test_file, "w") do |f|
      f.write "# this is a comment\n"
      f.write "# so is this\n"
      f.write YAML.dump(@sample_data)
    end
      
    Guard::Yamlsort::FileSorter.new(test_file)
    fs = File.open(test_file, "r") { |file| file.read }
   
    lines = fs.split("\n")
    
    assert_equal "#", lines[0][0], "1st comment not written"
    assert_equal "#", lines[1][0], "2nd comment not written"
  end

  protected
  def test_path(name)
    File.join(Dir.pwd, "test", name)
  end

end
