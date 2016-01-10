require 'spec_helper'
require 'fileutils'
require 'erubis'
require 'kilza'
require 'coveralls'
Coveralls.wear!

describe "Kilza" do
  before(:context) do
    @res_path = File.join(File.dirname(__FILE__), "..", "spec", "res")
    @json_path = File.join(@res_path, "test.json")
    @json_string = File.read(@json_path)
  end

  describe 'test objc' do
    it 'lists all classes' do
      @objc = Kilza::Objc.new(@json_string)
      @objc.classes('Base').each { |c|
        c.sources.each{ |s|
          test_source = File.read(File.join(@res_path, s.file_name))
          eruby = Erubis::Eruby.new(test_source)
          expect(eruby.result).to eq(s.source)
        }
      }
    end
  end

  describe 'test java' do
    it 'lists all classes' do
      @java = Kilza::Java.new(@json_string)
      @java.classes('Base').each { |c|
        c.sources.each{ |s|
          test_source = File.read(File.join(@res_path, s.file_name))
          eruby = Erubis::Eruby.new(test_source)
          expect(eruby.result).to eq(s.source)
        }
      }
    end
  end
end
